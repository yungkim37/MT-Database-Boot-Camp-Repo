--Author: Yung Shik Kim

--These are the SELECT queries for Assignment 3

--script that creates the SELECT CREATE query (Class 3 lab)
SELECT COALESCE(COLUMN_DEFAULT,COLUMN_DEFAULT,COLUMN_DEFAULT,CONCAT('CREATE TABLE ',TABLE_NAME, '('))
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns' AND ORDINAL_POSITION=1
UNION ALL
SELECT CONCAT(COLUMN_NAME, ' ', DATA_TYPE,CHARACTER_MAXIMUM_LENGTH,',')
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns' AND ORDINAL_POSITION=1
UNION ALL
SELECT CONCAT(COLUMN_NAME, ' ', DATA_TYPE,CONCAT('(',CHARACTER_MAXIMUM_LENGTH,')'),',')
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns' AND DATA_TYPE='varchar'
UNION ALL
SELECT CONCAT(COLUMN_NAME, ' ', DATA_TYPE,CHARACTER_MAXIMUM_LENGTH,',')
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns' AND DATA_TYPE <> 'varchar' AND ORDINAL_POSITION <> 1
UNION ALL
SELECT DISTINCT COALESCE(COLUMN_DEFAULT,COLUMN_DEFAULT,COLUMN_DEFAULT,');')
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns'

-- Below are select queries to be run against the database

--A query that returns guests with a birthday before 2000
SELECT Birthday FROM Guests
WHERE Birthday < '2000-01-01'

--A query that return rooms that cost more than 100 gold a night
SELECT Rooms.Id FROM Rooms 
JOIN RoomStays ON (Rooms.Id = RoomStays.RoomId)
WHERE RoomRate > '100.00'

--A query that returns UNIQUE guest names. 
SELECT DISTINCT GuestName FROM Guests

--A query that returns all guests ordered by name (ascending)
SELECT GuestName FROM Guests
ORDER BY GuestName ASC

--A query that returns the top 10 highest price sales
SELECT TOP 10 Price FROM Sales
ORDER BY Price DESC

--A query to return all the values stored in all Lookup Tables
SELECT * FROM Taverns
FULL OUTER JOIN Locations ON (Taverns.LocationId = Locations.Id)
FULL OUTER JOIN Users ON (Taverns.OwnerId = Users.Id)
FULL OUTER JOIN Roles ON (Users.RoleId = Roles.Id)
FULL OUTER JOIN Inventories ON (Inventories.TavernId = Taverns.Id)
FULL OUTER JOIN Supplies ON (Inventories.SupplyId = Supplies.Id)
FULL OUTER JOIN ReceivedInventories ON (ReceivedInventories.SupplyId = Supplies.Id)
FULL OUTER JOIN Sales ON (Sales.TavernId = Taverns.Id)
FULL OUTER JOIN SupplySales ON (SupplySales.SalesId = Sales.Id)
FULL OUTER JOIN ServiceLists ON (Sales.ServiceNameId = ServiceLists.Id)
FULL OUTER JOIN TavernServices ON (TavernServices.ServiceNameId = ServiceLists.Id)
FULL OUTER JOIN ServiceStatus ON (TavernServices.StatusId = ServiceStatus.Id)
FULL OUTER JOIN Guests ON (Sales.GuestId = Guests.Id)
FULL OUTER JOIN GuestStatus ON (Guests.GuestStatusId = GuestStatus.Id)
FULL OUTER JOIN Levels ON (Levels.GuestId = Levels.GuestId)
FULL OUTER JOIN Classes ON (Levels.ClassId = Classes.Id)
FULL OUTER JOIN Rooms ON (Rooms.TavernId = Taverns.Id)
FULL OUTER JOIN RoomStatus ON (Rooms.RoomStatusId = RoomStatus.Id)
FULL OUTER JOIN RoomStays ON (RoomStays.RoomId = RoomStays.Id)

--A query that returns Guest Classes with Levels table and generates a new column with a label for their level grouping (lvl 1-10, 10-20, etc.)
SELECT *,
(CASE WHEN GuestLevel <= 10
	  THEN 'Lvl 1-10'
      WHEN GuestLevel > 10 AND GuestLevel <= 20
	  THEN 'Lvl 11-20'
	  WHEN GuestLevel > 20 AND GuestLevel <= 30
	  THEN 'Lvl 21-30'
	  WHEN GuestLevel > 30 AND GuestLevel <= 40
	  THEN 'Lvl 31-40'
	  WHEN GuestLevel > 40 AND GuestLevel <= 50
	  THEN 'Lvl 41-50'
	  WHEN GuestLevel > 50 AND GuestLevel <= 60
	  THEN 'Lvl 51-60'
	  WHEN GuestLevel > 60 AND GuestLevel <= 70
	  THEN 'Lvl 61-70'
	  WHEN GuestLevel > 70 AND GuestLevel <= 80
	  THEN 'Lvl 71-80'
	  WHEN GuestLevel > 80 AND GuestLevel <= 90
	  THEN 'Lvl 81-90'
	  WHEN GuestLevel > 90 AND GuestLevel <= 100
	  THEN 'Lvl 91-100'
	  WHEN GuestLevel > 100
	  THEN 'Lvl 100+'
	  ELSE 'Invalid'
END) AS LevelGrouping
	 FROM Levels

--Inserting statuses of one table into another table using SELECT
--Using the TRANSACT tool so data in the original tables aren't messed up
BEGIN TRANSACTION
INSERT INTO Classes
SELECT RoomStatus.StatusName FROM RoomStatus
SELECT * FROM Classes
ROLLBACK TRANSACTION

BEGIN TRANSACTION
INSERT INTO RoomStatus
SELECT Classes.ClassName FROM Classes
SELECT * FROM RoomStatus
ROLLBACK TRANSACTION

BEGIN TRANSACTION
INSERT INTO ServiceLists
SELECT RoomStatus.StatusName FROM RoomStatus
SELECT * FROM ServiceLists
ROLLBACK TRANSACTION

BEGIN TRANSACTION
INSERT INTO ServiceLists
SELECT Classes.ClassName FROM Classes
SELECT * FROM ServiceLists
ROLLBACK TRANSACTION

BEGIN TRANSACTION
INSERT INTO Classes
SELECT ServiceLists.ServiceName FROM ServiceLists
SELECT * FROM Classes
ROLLBACK TRANSACTION
