--Author: Yung Shik Kim

--Query is split into two parts to try to fix the problem existing with original query (Assignment2.sql)

--This query will only deal with inserting into the table

--Inserting into tables from Assignment 1
/*Inserting in this order for sake of hierarchy:
Locations
Roles
Users
Taverns
Supplies
Inventories
ReceivedInventories
ServiceStatus
ServiceLists
TavernServices
Sales
SupplySales
*/
--NOTE: Table BasementRats is removed as we no longer need to track rats

--Locations
INSERT INTO Locations (LocationName) 
VALUES
	('Eastburg'),
	('Westville'),
	('North Town'),
	('Southperry'),
	('Center City');

--Roles
INSERT INTO Roles (RoleName,RoleDescription)
VALUES
	('Owner','One who owns the tavern'),
	('Guest','One who utilizes the tavern'),
	('Worker','One who works at the tavern'),
	('Supplier','One who supplies to the tavern'),
	('Blacklisted','One who is banned from entering the tavern');

--Users
INSERT INTO Users (UserName,RoleId,Birthday)
VALUES
	('Alex',1,'1976-08-12'),
	('Bob',2,'1962-07-20'),
	('Christine',2,'1988-03-09'),
	('Dan',3,'1990-01-21'),
	('Evan',5,'2000-10-10'),
	('Fred',4,'1989-06-19'),
	('Gina',3,'1987-11-15'),
	('Harry',2,'1984-9-22');

--Taverns
INSERT INTO Taverns(TavernName,OwnerId,LocationId,FloorCount) 
VALUES 
	('The Eastburg Tavern',1,1,2),
	('The Westville Tavern',1,2,2),
	('The North Town Tavern',1,3,2),
	('The Southperry Tavern',1,4,2),
	('The Center City Tavern',1,5,3),
	('Unknown Tavern',NULL,NULL,NULL);

--Supplies
INSERT INTO Supplies (SupplyName, Unit) 
VALUES
	('Beer','ounce'),
	('Whiskey','ounce'),
	('Vodka','ounce'),
	('Rum','ounce'),
	('Wine','ounce'),
	('Mead','ounce'),
	('Meat','pound'),
	('Wheat','pound'),
	('Axe Throwing Target','pound');

--Inventories
INSERT INTO Inventories(SupplyId, TavernId, SupplyCount, DateUpdated)
VALUES
	(1,1,100,'2020-01-02'),
	(2,2,100,'2020-02-03'),
	(3,3,100,'2020-03-04'),
	(4,4,40,'2019-11-10'),
	(5,5,200,'2020-05-05'),
	(6,5,200,'2020-06-06'),
	(7,1,100,'2020-07-07'),
	(7,2,100,'2020-08-07'),
	(7,3,120,'2020-09-09'),
	(7,4,200,'2019-12-28'),
	(7,5,100,'2020-07-08'),
	(8,1,80,'2020-08-08'),
	(8,2,70,'2020-08-08'),
	(8,3,50,'2020-08-08'),
	(8,4,30,'2019-10-13'),
	(8,5,200,'2020-08-08'),
	(9,5,0,'2020-03-19');

--ReceivedInventories
INSERT INTO ReceivedInventories(SupplyId,TavernId,Cost,SupplyAmount,DateReceived) 
VALUES
	(1,1,'100.00',10,'2020-01-01'),
	(2,2,'100.00',10,'2020-02-02'),
	(3,3,'100.00',10,'2020-03-03'),
	(4,4,'100.00',10,'2020-04-04'),
	(5,5,'600.00',20,'2020-05-05'),
	(6,5,'400.00',20,'2020-06-06'),
	(7,1,'50.00',10,'2020-07-07'),
	(7,2,'50.00',10,'2020-07-07'),
	(7,3,'50.00',10,'2020-07-07'),
	(7,4,'50.00',10,'2020-07-07'),
	(7,5,'100.00',20,'2020-07-07'),
	(8,1,'30.00',10,'2020-08-08'),
	(8,2,'30.00',10,'2020-08-08'),
	(8,3,'30.00',10,'2020-08-08'),
	(8,4,'30.00',10,'2020-08-08'),
	(8,5,'60.00',20,'2020-08-08');

--ServiceStatus
INSERT INTO ServiceStatus (StatusName)
VALUES
	('Active'),
	('Inactive'),
	('Upcoming'),
	('Out-of-stock'),
	('Discontinued'),
	('On Pause');

--ServiceLists
INSERT INTO ServiceLists (ServiceName)
VALUES
	('Bar'),
	('Pool'),
	('Weapon Sharpening'),
	('Stable'),
	('Cabaret'),
	('Fist Fighting'),
	('Axe Throwing'),
	('Telephone');

--TavernServices
INSERT INTO TavernServices(ServiceNameId,TavernId,StatusId)
VALUES
	(1,1,1),
	(1,2,1),
	(1,3,1),
	(1,4,1),
	(1,5,1),
	(2,1,1),
	(2,2,1),
	(2,3,1),
	(2,4,2),
	(2,5,1),
	(3,1,1),
	(3,2,2),
	(3,3,2),
	(3,4,2),
	(3,5,1),
	(4,1,1),
	(4,2,1),
	(4,5,1),
	(5,5,6),
	(6,5,5),
	(7,5,4),
	(8,5,3);

--Sales
INSERT INTO Sales (UserId,TavernId,ServiceNameId,Price,AmountPurchased,AmountReceived,DatePurchased)
VALUES
	(2,1,1,'10.00',2,'20.00','2020-02-28'),
	(2,1,2,'20.00',3,'60.00','2020-02-28'),
	(2,1,3,'5.00',2,'10.00','2020-02-28'),
	(2,1,4,'30.00',1,'30.00','2020-02-28'),
	(2,2,2,'20.00',2,'40.00','2020-04-01'),
	(2,2,4,'20.00',1,'20.00','2020-04-01'),
	(2,5,2,'40.00',1,'40.00','2020-07-03'),
	(2,5,4,'40.00',1,'40.00','2020-07-03'),
	(3,1,2,'20.00',1,'20.00','2020-09-17'),
	(8,1,1,'10.00',10,'100.00','2020-09-19'),
	(8,2,1,'10.00',10,'100.00','2020-09-22'),
	(8,3,1,'10.00',10,'100.00','2020-09-26'),
	(8,4,1,'10.00',10,'100.00','2020-09-30'),
	(8,5,1,'30.00',2,'60.00','2020-10-04'),
	(8,5,1,'20.00',17,'340.00','2020-10-04');

--SupplySales
INSERT INTO SupplySales (RecInvId,SalesId)
VALUES
	(1,1),
	(7,1),
	(12,1),
	(1,10),
	(7,10),
	(12,10),
	(2,11),
	(8,11),
	(13,11),
	(3,12),
	(4,13),
	(5,14),
	(6,15);

-- Seeding data for tables from Class 2 lab

--GuestStatus
INSERT INTO GuestStatus (StatusName)
VALUES
	('Fine'),
	('Sick'),
	('Placid'),
	('Starving'),
	('Annoyed'),
	('Excited'),
	('Vexed');

--Guests
INSERT INTO Guests (GuestName,Note,Birthday,Cakeday,GuestStatusId)
VALUES
	('Ike','This guest is doing okay','1997-05-10','2012-02-18',1),
	('Julia','This guest looks a little uneasy','1989-08-13','2020-02-09',2),
	('Keith','This guest is calm as ever but very skillful','1999-03-07','2019-11-25',3),
	('Lauren','This guest is bothered by something','1969-04-04','2018-07-03',5),
	('Mike','This guest cannot wait to go adventuring','2004-06-11','2017-10-19',6);

--Classes
INSERT INTO Classes (ClassName)
VALUES
	('Warrior'),
	('Mage'),
	('Archer'),
	('Assassin'),
	('Necromancer'),
	('Gunslinger');

--Levels
INSERT INTO Levels (GuestId, ClassId, GuestLevel,CreationDate)
VALUES
	(1,1,70,'2012-02-18'),
	(1,2,20,'2015-10-18'),
	(2,3,5,'2020-02-09'),
	(3,4,100,'2019-11-25'),
	(3,5,99,'2020-03-11'),
	(4,2,45,'2018-07-03'),
	(5,6,30,'2017-10-19');

/*Making insertions that will fail due to foreign key constraint
  Example using Levels table
 
INSERT INTO Levels (GuestId, ClassId, GuestLevel,CreationDate)
VALUES
	(6,1,70,'2012-02-18'),
	(1,7,20,'2015-10-18');

Error statement when run:
Msg 547, Level 16, State 0, Line 248
The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Levels__GuestId__567ED357"
*/
