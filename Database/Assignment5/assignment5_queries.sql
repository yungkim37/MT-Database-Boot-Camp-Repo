--Author: Yung Shik Kim

--Theses are queries for Assignment 5

--1. Write a query to return a “report” of all users and their roles
SELECT UserName, RoleName FROM Users
JOIN Roles ON (Users.RoleId = Roles.Id)

--2. Write a query to return all classes and the count of guests that hold those classes
SELECT ClassName, COUNT(ClassName) AS ClassCount FROM Classes
JOIN Levels ON (Levels.ClassId = Classes.Id)
GROUP BY ClassName

--3. Write a query that returns all guests ordered by name (ascending) and their classes
--and corresponding levels. Add a column that labels them 
--beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)
SELECT GuestName, ClassName, GuestLevel,
(CASE WHEN GuestLevel >= 1 AND GuestLevel <= 5
	  THEN 'Beginner'
	  WHEN GuestLevel > 5 AND GuestLevel <= 10
	  THEN 'Intermediate'
	  WHEN GuestLevel > 10
	  THEN 'Expert'
	  ELSE 'Invalid'
END) AS LevelGrouping
FROM Guests
JOIN Levels ON (Levels.GuestId = Guests.Id)
JOIN Classes ON (Classes.Id = Levels.ClassId)
ORDER BY GuestName ASC

--4. Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
IF OBJECT_ID (N'dbo.getGrouping', N'FN') IS NOT NULL  
    DROP FUNCTION getGrouping;
GO 
CREATE FUNCTION dbo.getGrouping(@level INT)
RETURNS VARCHAR(25)
AS   
BEGIN
    DECLARE @ret VARCHAR(25);
    IF (@level >= 1 AND @level <= 5)   
        SET @ret = 'Beginner'; 
	ELSE IF (@level > 5 AND @level <= 10)
		SET @ret = 'Intermediate';
	ELSE IF (@level > 10)
		SET @ret = 'Expert';
	ELSE
		SET @ret = 'Invalid';
    RETURN @ret;  
END;

SELECT dbo.getGrouping(1);
SELECT dbo.getGrouping(7);
SELECT dbo.getGrouping(15);

--5. Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern they belong to
IF OBJECT_ID (N'dbo.getOpenRooms', N'IF') IS NOT NULL  
    DROP FUNCTION getOpenRooms;
GO 
CREATE FUNCTION dbo.getOpenRooms(@day DATETIME)  
RETURNS TABLE  
AS  
RETURN
(
	SELECT r.Id, r.TavernId FROM Rooms r
	JOIN RoomStays rs ON (rs.RoomId = r.Id)
	WHERE rs.StayDate != @day
		  AND
		  r.RoomStatusId = 1
); 

SELECT * FROM dbo.getOpenRooms('2020-03-07');

--6. Modify the same function from 5 to instead return a report of prices in a range (min and max prices) 
-- - Return Rooms and their taverns based on price inputs
IF OBJECT_ID (N'dbo.getOpenRoomsByPrice', N'IF') IS NOT NULL  
    DROP FUNCTION getOpenRoomsByPrice;
GO 
CREATE FUNCTION dbo.getOpenRoomsByPrice(@min MONEY, @max MONEY)  
RETURNS TABLE 
AS  
RETURN
(
	SELECT DISTINCT r.Id, r.TavernId, rs.RoomRate FROM Rooms r
	JOIN RoomStays rs ON (rs.RoomId = r.Id)
	JOIN Taverns t ON (t.Id = r.TavernId)
	WHERE rs.RoomRate >= @min 
	  AND rs.RoomRate <= @max
	  AND r.RoomStatusId = 1
);

SELECT * FROM dbo.getOpenRoomsByPrice('40.00','100.00');

--7. Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than)
--   the cheapest room by a penny - thereby making the new room the cheapest one

-- the command is within transaction so it does not mess with current tables
--creating the room first in another tavern
BEGIN TRANSACTION
INSERT INTO Rooms (RoomStatusId,TavernId) 
VALUES(1,
(SELECT TOP 1 (t.TavernId + 1) FROM dbo.getOpenRoomsByPrice('40.00','100.00') AS t));
SELECT * FROM Rooms
--adding the price to that room so it is the cheapest given the min price from dbo.getOpenRoomsByPrice
INSERT INTO RoomStays (RoomId, RoomRate)
VALUES(
(SELECT TOP 1 Id FROM Rooms
ORDER BY Id DESC),
(SELECT TOP 1 (t.RoomRate - '0.01') FROM dbo.getOpenRoomsByPrice('40.00','100.00') AS t
ORDER BY t.RoomRate ASC))
SELECT * FROM RoomStays
ROLLBACK TRANSACTION
