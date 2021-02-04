--Author: Yung Shik Kim

--This query will only deal with dropping and creating table
--File is unmodified from previous version as there was no need for it

--Dropping tables in this order for sake of hierarchy
DROP TABLE IF EXISTS RoomStays;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS RoomStatus;
DROP TABLE IF EXISTS SupplySales; --must be dropped first as it is a linking table between Sales table and ReceivedInventories table
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS TavernServices;
DROP TABLE IF EXISTS ServiceStatus;
DROP TABLE IF EXISTS ServiceLists;
DROP TABLE IF EXISTS ReceivedInventories;
DROP TABLE IF EXISTS Inventories;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Locations;

--Creating table in the opposite order from which they were dropped
--Locations
CREATE TABLE Locations(
	Id INT IDENTITY(1,1),
	LocationName VARCHAR(250));

--Roles
CREATE TABLE Roles(
	Id INT IDENTITY(1,1),
	RoleName VARCHAR(50),
	RoleDescription VARCHAR(250));

--Users
CREATE TABLE Users(
	Id INT IDENTITY(1,1),
	UserName VARCHAR(250),
	RoleId INT,
	Birthday DATETIME);

--Taverns
CREATE TABLE Taverns (
	Id INT IDENTITY(1,1),
	TavernName VARCHAR(250),
	OwnerId INT,
	LocationId INT,
	FloorCount INT);

--Supplies
CREATE TABLE Supplies(
	Id INT IDENTITY(1,1),
	SupplyName VARCHAR(250),
	Unit VARCHAR(50));

--Inventories
CREATE TABLE Inventories(
	Id INT IDENTITY(1,1),
	SupplyId INT,
	TavernId INT,
	SupplyCount INT,
	DateUpdated DATETIME);

--ReceivedInventories
CREATE TABLE ReceivedInventories(
	Id INT IDENTITY(1,1),
	SupplyId INT,
	TavernId INT,
	Cost MONEY,
	SupplyAmount INT,
	DateReceived DATETIME);

--ServiceStatus
CREATE TABLE ServiceStatus(
	Id INT IDENTITY(1,1),
	StatusName VARCHAR(50));

--ServiceLists
CREATE TABLE ServiceLists(
		Id INT IDENTITY(1,1),
		ServiceName VARCHAR(50));

--TavernServices
CREATE TABLE TavernServices(
	Id INT IDENTITY(1,1),
	ServiceNameId INT,
	TavernId INT,
	StatusId INT);

--GuestStatus
CREATE TABLE GuestStatus(
	Id INT PRIMARY KEY IDENTITY(1,1),
	StatusName VARCHAR(50));

--Guests
CREATE TABLE Guests(
	Id INT PRIMARY KEY IDENTITY(1,1),
	GuestName VARCHAR(250),
	Note VARCHAR(500),
	Birthday DATETIME,
	Cakeday DATETIME,
	GuestStatusId INT FOREIGN KEY REFERENCES GuestStatus (Id));

--Classes
CREATE TABLE Classes(
	Id INT PRIMARY KEY IDENTITY(1,1),
	ClassName VARCHAR(50));

--Levels
CREATE TABLE Levels(
	GuestId INT FOREIGN KEY REFERENCES Guests (Id),
	ClassId INT FOREIGN KEY REFERENCES Classes (Id),
	GuestLevel INT,
	CreationDate DATETIME
	CONSTRAINT PK_Levels PRIMARY KEY(GuestId,ClassId));

--Sales
CREATE TABLE Sales(
	Id INT IDENTITY(1,1),
	GuestId INT,
	TavernId INT,
	ServiceNameId INT,
	Price MONEY,
	AmountPurchased INT,
	AmountReceived MONEY,
	DatePurchased DATETIME);

--Create primary keys for all tables above using ALTER statement
ALTER TABLE Locations ADD PRIMARY KEY (Id);
ALTER TABLE Roles ADD PRIMARY KEY (Id);
ALTER TABLE Users ADD PRIMARY KEY (Id);
ALTER TABLE Taverns ADD PRIMARY KEY (Id);
ALTER TABLE Supplies ADD PRIMARY KEY (Id);
ALTER TABLE Inventories ADD PRIMARY KEY (Id);
ALTER TABLE ReceivedInventories ADD PRIMARY KEY (Id);
ALTER TABLE ServiceStatus ADD PRIMARY KEY (Id);
ALTER TABLE ServiceLists ADD PRIMARY KEY (Id);
ALTER TABLE TavernServices ADD PRIMARY KEY (Id);
ALTER TABLE Sales ADD PRIMARY KEY (Id);

--Create foreign keys for all tables that need it above using ALTER statement
--Users
ALTER TABLE Users ADD FOREIGN KEY (RoleId) REFERENCES Roles (Id);
--Tavern
ALTER TABLE Taverns ADD FOREIGN KEY (OwnerId) REFERENCES Users (Id);
ALTER TABLE Taverns ADD FOREIGN KEY (LocationId) REFERENCES Locations (Id);
--Inventories
ALTER TABLE Inventories ADD FOREIGN KEY (SupplyId) REFERENCES Supplies (Id);
ALTER TABLE Inventories ADD FOREIGN KEY (TavernId) REFERENCES Taverns (Id);
--ReceivedInventories
ALTER TABLE ReceivedInventories ADD FOREIGN KEY (SupplyId) REFERENCES Supplies (Id);
ALTER TABLE ReceivedInventories ADD FOREIGN KEY (TavernId) REFERENCES Taverns (Id);
--TavernServices
ALTER TABLE TavernServices ADD FOREIGN KEY (ServiceNameId) REFERENCES ServiceLists (Id);
ALTER TABLE TavernServices ADD FOREIGN KEY (TavernId) REFERENCES Taverns (Id);
ALTER TABLE TavernServices ADD FOREIGN KEY (StatusId) REFERENCES ServiceStatus (Id);
--Sales
ALTER TABLE Sales ADD FOREIGN KEY (TavernId) REFERENCES Taverns (Id);
ALTER TABLE Sales ADD FOREIGN KEY (ServiceNameId) REFERENCES ServiceLists (Id);
ALTER TABLE Sales ADD FOREIGN KEY (GuestId) REFERENCES Guests (Id);

--Create SupplySales table as a linking table between ReceivedSupplies and Sales table
CREATE TABLE SupplySales(
	RecInvId INT FOREIGN KEY REFERENCES ReceivedInventories (Id),
	SalesId INT FOREIGN KEY REFERENCES Sales (Id),
	CONSTRAINT PK_SupplySales PRIMARY KEY(RecInvId,SalesId));

--Creating tables from new user story introduced in Assignment 3
--Create RoomStatus table
CREATE TABLE RoomStatus(
	Id INT PRIMARY KEY IDENTITY(1,1),
	StatusName VARCHAR(50));

--Create Rooms table
CREATE TABLE Rooms(
	Id INT PRIMARY KEY IDENTITY(1,1),
	RoomStatusId INT FOREIGN KEY REFERENCES RoomStatus (Id),
	TavernId INT FOREIGN KEY REFERENCES Taverns (Id));

--Create RoomStays
CREATE TABLE RoomStays(
	Id INT PRIMARY KEY IDENTITY(1,1),
	SaleId INT FOREIGN KEY REFERENCES Sales (Id),
	GuestId INT FOREIGN KEY REFERENCES Guests (Id),
	RoomId INT FOREIGN KEY REFERENCES Rooms (Id),
	StayDate DATETIME,
	RoomRate MONEY); 
