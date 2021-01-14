-- Author: Yung Shik Kim

-- This is the script for MT Database Boot Camp Assignment 1

--Create and seed the Tavern table
DROP TABLE IF EXISTS Tavern;

CREATE TABLE Tavern (
	Id INT IDENTITY(1,1),
	TavernName VARCHAR(250),
	OwnerId INT,
	LocationId INT,
	FloorCount INT);

INSERT INTO Tavern (TavernName,OwnerId,LocationId,FloorCount) 
VALUES 
	('The Tavern',1,1,2),
	('The Tavern',1,2,2),
	('The Tavern',1,3,2),
	('The Tavern',1,4,2),
	('The Tavern',1,5,3),
	('Unknown Tavern',NULL,NULL,NULL);

--Create and seed the Users table
DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
	Id INT IDENTITY(1,1),
	UserName VARCHAR(250),
	RoleId INT);

INSERT INTO Users (UserName,roleId) 
VALUES 
	('Alex',1),
	('Bob',2),
	('Christine',2),
	('Dan',3),
	('Evan',5),
	('Fred',4),
	('Gina',3);

--Create and seed the Roles table
DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles(
	Id INT IDENTITY(1,1),
	RoleName VARCHAR(250),
	RoleDescription VARCHAR(250));

INSERT INTO Roles (RoleName,RoleDescription) 
VALUES
	('Owner','One who owns the tavern'),
	('Guest','One who utilizes the tavern'),
	('Worker','One who works at the tavern'),
	('Supplier','One who supplies to the tavern'),
	('Blacklisted','One who is banned from entering the tavern');

--Create and seed the Location table
DROP TABLE IF EXISTS Locations;

CREATE TABLE Locations(
	Id INT IDENTITY(1,1),
	LocName VARCHAR(250));

INSERT INTO Locations (LocName) 
VALUES
	('Eastburg'),
	('Westville'),
	('North Town'),
	('Southperry'),
	('Center City');

--Create and seed the BasementRats table
DROP TABLE IF EXISTS BasementRats

CREATE TABLE BasementRats(
	Id INT IDENTITY(1,1),
	RatName VARCHAR(250),
	TavernId INT);

INSERT INTO BasementRats (RatName,TavernId) 
VALUES
	('Rick',1),
	('Rhonda',1),
	('Roderick',2),
	('Rob',3),
	('Ralph',5),
	('Robin',5),
	('Rachel',5),
	('Reily',5),
	('Ron',NULL);

--Create and seed Supplies table
DROP TABLE IF EXISTS Supplies;

CREATE TABLE Supplies(
	Id INT IDENTITY(1,1),
	SupplyName VARCHAR(250),
	Unit VARCHAR(250));

INSERT INTO Supplies (SupplyName, Unit) 
VALUES
	('Beer','ounce'),
	('Whiskey','ounce'),
	('Rum','ounce'),
	('Vodka','ounce'),
	('Wine','ounce'),
	('Mead','ounce'),
	('Meat','pound'),
	('Wheat','pound');

--Create and seed Inventory table
DROP TABLE IF EXISTS Inventory;

CREATE TABLE Inventory(
	Id INT IDENTITY(1,1),
	SupplyId INT,
	TavernId INT,
	SupplyCount INT,
	DateUpdated VARCHAR(250));

INSERT INTO Inventory (SupplyId, TavernId, SupplyCount, DateUpdated)
VALUES
	(1,1,100,'January 2nd,2020'),
	(2,2,100,'February 3rd,2020'),
	(3,4,100,'March 4th,2020'),
	(4,3,40,'November 10th,2019'),
	(5,5,200,'May 5th,2020'),
	(6,5,200,'June 6th,2020'),
	(7,1,100,'July 7th,2020'),
	(7,2,100,'August 7th,2020'),
	(7,3,120,'September 9th,2020'),
	(7,4,200,'December 28th,2019'),
	(7,5,100,'July 8th,2020'),
	(8,1,80,'August 8th,2020'),
	(8,2,70,'August 8th,2020'),
	(8,3,50,'August 8th,2020'),
	(8,4,30,'October 13th, 2019'),
	(8,5,200,'August 8th,2020');

--Create and seed ReceivedInventory table
DROP TABLE IF EXISTS ReceivedInventory

CREATE TABLE ReceivedInventory(
	Id INT IDENTITY(1,1),
	SupplyId INT,
	TavernId INT,
	Cost INT,
	SupplyAmount INT,
	DateReceived VARCHAR(250));

INSERT INTO ReceivedInventory (SupplyId,TavernId,Cost,SupplyAmount,DateReceived) 
VALUES
	(1,1,10,10,'January 1st,2020'),
	(2,2,20,10,'February 2nd,2020'),
	(3,4,15,10,'March 3rd,2020'),
	(4,3,20,10,'April 4th,2020'),
	(5,5,30,20,'May 5th,2020'),
	(6,5,20,20,'June 6th,2020'),
	(7,1,5,10,'July 7th,2020'),
	(7,2,5,10,'July 7th,2020'),
	(7,3,5,10,'July 7th,2020'),
	(7,4,5,10,'July 7th,2020'),
	(7,5,5,10,'July 7th,2020'),
	(8,1,3,20,'August 8th,2020'),
	(8,2,3,10,'August 8th,2020'),
	(8,3,3,10,'August 8th,2020'),
	(8,4,3,10,'August 8th,2020'),
	(8,5,3,20,'August 8th,2020');

--Create and seed ServiceStatus table
DROP TABLE IF EXISTS ServiceStatus;

CREATE TABLE ServiceStatus(
	Id INT IDENTITY(1,1),
	StatusName VARCHAR(250));

INSERT INTO ServiceStatus (StatusName)
VALUES
	('Active'),
	('Inactive'),
	('Upcoming'),
	('Out-of-stock'),
	('Discontinued'),
	('On Pause');

--Create and seed TavernService table
DROP TABLE IF EXISTS TavernService;

CREATE TABLE TavernService(
	Id INT IDENTITY(1,1),
	ServiceName VARCHAR(250),
	TavernId INT,
	StatusId INT);

INSERT INTO TavernService (ServiceName,TavernId,StatusId)
VALUES
	('Pool',1, 1),
	('Pool',2, 1),
	('Pool',3, 1),
	('Pool',4, 2),
	('Pool',5, 1),
	('Weapon Sharpening',1,1),
	('Weapon Sharpening',2,2),
	('Weapon Sharpening',3,2),
	('Weapon Sharpening',4,2),
	('Weapon Sharpening',5,1),
	('Stable',1, 1),
	('Stable',2, 1),
	('Stable',5, 1),
	('Cabaret',5, 6),
	('Fist Fighting',5,5),
	('Axe Throwing',5,4),
	('Telephone',5,3);

--Create and seed Sales table
DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales(
	Id INT IDENTITY(1,1),
	UserId INT,
	TavernId INT,
	ServiceId INT,
	Price INT,
	AmountPurchased INT,
	AmountReceived INT,
	DatePurchased VARCHAR(250));

INSERT INTO Sales (UserId,TavernId,ServiceId,Price,AmountPurchased,AmountReceived,DatePurchased)
VALUES
	(2,1,1,20,3,60,'February 28th,2020'),
	(2,1,6,5,2,10,'February 28th,2020'),
	(2,1,11,30,1,30,'February 28th,2020'),
	(2,2,2,20,2,40,'April 1st,2020'),
	(2,2,12,20,1,20,'April 1st,2020'),
	(2,5,5,40,1,40,'July 3rd,2020'),
	(2,5,13,40,1,40,'July 3rd,2020'),
	(3,1,1,20,1,20,'September 17th,2020');

