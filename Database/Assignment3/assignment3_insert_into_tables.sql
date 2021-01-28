--Author: Yung Shik Kim

--This query will only deal with inserting into the table

--Inserting into tables
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
GuestStatus
Guests
Classes
Levels
Sales
SupplySales
RoomStatus
Rooms
RoomStays
*/

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
	('Bartender','One who tends the bar at the tavern'),
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
	('Gina',3,'1987-11-15');

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
	('Inn'),
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
	(2,4,1),
	(2,5,1),
	(3,1,1),
	(3,2,1),
	(3,3,1),
	(3,4,2),
	(3,5,1),
	(4,1,1),
	(4,2,2),
	(4,3,2),
	(4,4,2),
	(4,5,1),
	(5,1,1),
	(5,2,1),
	(5,5,1),
	(6,5,6),
	(7,5,5),
	(8,5,4),
	(9,5,3);

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
	('Harry','This guest seems hungry, but not for food','1984-09-22','2014-08-08',4),
	('Ike','This guest is doing okay','1997-05-10','2012-02-18',1),
	('Julia','This guest looks a little uneasy','1989-08-13','2020-02-09',2),
	('Keith','This guest is calm as ever but very skillful','1999-03-07','2019-11-25',3),
	('Lauren','This guest is bothered by something','1969-04-04','2018-07-03',5),
	('Mike','This guest cannot wait to go adventuring','2004-06-11','2017-10-19',6),
	('Mike','This guest is irritated that there is another Mike','2002-05-09','2015-12-15',7);

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
	(1,1,88,'2014-08-08'),
	(2,1,70,'2012-02-18'),
	(2,2,20,'2015-10-18'),
	(3,3,5,'2020-02-09'),
	(4,4,100,'2019-11-25'),
	(4,5,99,'2020-03-11'),
	(5,2,45,'2018-07-03'),
	(6,6,30,'2017-10-19'),
	(7,6,55,'2015-12-15');

--Sales
INSERT INTO Sales (GuestId,TavernId,ServiceNameId,Price,AmountPurchased,AmountReceived,DatePurchased)
VALUES
	(2,1,1,'10.00',2,'20.00','2020-02-28'),
	(2,1,3,'20.00',3,'60.00','2020-02-28'),
	(2,1,4,'5.00',2,'10.00','2020-02-28'),
	(2,1,5,'30.00',1,'30.00','2020-02-28'),
	(2,2,3,'20.00',2,'40.00','2020-04-01'),
	(2,2,5,'20.00',1,'20.00','2020-04-01'),
	(2,5,3,'40.00',1,'40.00','2020-07-03'),
	(2,5,5,'40.00',1,'40.00','2020-07-03'),
	(3,1,3,'20.00',1,'20.00','2020-09-17'),
	(1,1,1,'10.00',10,'100.00','2020-09-19'),
	(1,2,1,'10.00',10,'100.00','2020-09-22'),
	(1,3,1,'10.00',10,'100.00','2020-09-26'),
	(1,4,1,'10.00',10,'100.00','2020-09-30'),
	(1,5,1,'30.00',2,'60.00','2020-10-04'),
	(1,5,1,'20.00',17,'340.00','2020-10-04'),
	(2,1,2,'50.00',1,'50.00','2020-02-28'),
	(3,3,2,'60.00',1,'60.00','2020-10-20'),
	(4,5,2,'120.00',1,'120.00','2020-07-03'),
	(4,5,2,'120.00',1,'120.00','2020-11-12'),
	(5,4,2,'30.00',1,'30.00','2020-10-19'),
	(6,2,2,'75.00',1,'75.00','2020-03-07'),
	(7,2,2,'75.00',1,'75.00','2020-03-07');

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

--Seeding data for tables created for Assignment 3
--RoomStatus
INSERT INTO RoomStatus (StatusName)
VALUES
	('Available'),
	('Not Available'),
	('Occupied'),
	('Reserved'),
	('Upcoming');

--Rooms
INSERT INTO Rooms (RoomStatusId, TavernId)
VALUES
	(1,1),
	(1,1),
	(3,1),
	(1,2),
	(3,2),
	(3,2),
	(1,3),
	(2,3),
	(3,3),
	(1,4),
	(1,4),
	(1,5),
	(1,5),
	(3,5),
	(3,5),
	(4,5),
	(4,5),
	(5,5);

--RoomStays
INSERT INTO RoomStays (SaleId,GuestId,RoomId,StayDate,RoomRate)
VALUES
	(16,2,1,'2020-02-28','50.00'),
	(17,3,7,'2020-10-20','60.00'),
	(18,4,13,'2020-07-03','120.00'),
	(19,4,15,'2020-11-12','120.00'),
	(20,5,11,'2020-10-19','30.00'),
	(21,6,5,'2020-03-07','75.00'),
	(22,7,6,'2020-03-07','75.00');
