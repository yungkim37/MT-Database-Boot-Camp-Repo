--Student: Yung Shik Kim

--These are queries for Assignment 4

--1. Write a query to return users who have admin (or owner) roles
SELECT UserName FROM Users
JOIN Roles ON (Users.RoleId = Roles.Id)
WHERE RoleName LIKE '%Admin%';

--2. Write a query to return users who have admin roles and information about their taverns
SELECT UserName, TavernName FROM Users
JOIN Taverns ON (Users.Id = Taverns.OwnerId)
WHERE RoleId = 1;

--3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels (Lab 4)
SELECT Guests.GuestName,
	   Classes.ClassName,
	   Levels.GuestLevel FROM Guests
JOIN Levels ON (Guests.Id = Levels.GuestId)
JOIN Classes ON (Levels.ClassId = Classes.Id)
ORDER BY Guests.GuestName ASC;

--4. Write a query that returns the top 10 sales in terms of sales price and what the services were
SELECT TOP 10 Sales.Price, 
		      ServiceLists.ServiceName FROM Sales
JOIN ServiceLists ON (Sales.ServiceNameId = ServiceLists.Id)
ORDER BY Sales.Price DESC;

--5. Write a query that returns guests with 2 or more classes
SELECT Guests.GuestName FROM Guests
JOIN Levels ON (Guests.Id = Levels.GuestId)
GROUP BY Guests.GuestName, Levels.GuestId
HAVING COUNT(Levels.GuestId) >= 2

--6. Write a query that returns guests with 2 or more classes with levels higher than 5
SELECT Guests.GuestName FROM Guests
JOIN Levels ON (Guests.Id = Levels.GuestId)
WHERE Levels.GuestLevel > 5
GROUP BY Guests.GuestName, Levels.GuestId
HAVING COUNT(Levels.GuestId) >= 2

--7. Write a query that returns guests with ONLY their highest level class
SELECT Guests.GuestName, 
	   Classes.ClassName,
	   Levels.GuestLevel FROM Guests
JOIN Levels ON Guests.Id = Levels.GuestId
JOIN Classes ON Levels.ClassId = Classes.Id
WHERE GuestLevel = (SELECT MAX(GuestLevel) FROM Levels L2 WHERE L2.GuestId = Guests.Id)
ORDER BY GuestName

--8. Write a query that returns guests that stay within a date range. 
--Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
SELECT Guests.GuestName,
       RoomStays.StayDate FROM Guests
JOIN RoomStays ON (RoomStays.GuestId = Guests.Id)
WHERE RoomStays.StayDate >= '2020-01-01' AND RoomStays.StayDate <= '2020-05-30'

--9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.
--Answer provided by instructor then modified by me to fully answer the question
SELECT 
CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
 WHERE TABLE_NAME = 'Taverns'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
	Then CONCAT
		('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
	Else '' 
	END)
, 
	CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
	Then 
		(CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
	Else '' 
	END
,
	CASE WHEN refConst.CONSTRAINT_NAME IS NULL AND keys.COLUMN_NAME IS NOT NULL
	Then 
		' PRIMARY KEY IDENTITY(1,1)'
	Else '' 
	END
, 
',') as queryPiece FROM 
INFORMATION_SCHEMA.COLUMNS as cols
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON 
(keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst ON 
(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN 
(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
 WHERE cols.TABLE_NAME = 'Taverns'
UNION ALL
SELECT ');';
