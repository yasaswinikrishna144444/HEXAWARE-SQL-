-- STEP 1: Create the database
IF DB_ID('SkillHiveDB') IS NULL
    CREATE DATABASE SkillHiveDB;
GO

USE SkillHiveDB;
GO

-- STEP 2: Drop tables if they already exist (in correct order)
IF OBJECT_ID('Bids', 'U') IS NOT NULL DROP TABLE Bids;
IF OBJECT_ID('Freelancers', 'U') IS NOT NULL DROP TABLE Freelancers;
IF OBJECT_ID('Projects', 'U') IS NOT NULL DROP TABLE Projects;
IF OBJECT_ID('Clients', 'U') IS NOT NULL DROP TABLE Clients;
GO

-- STEP 3: Create Clients table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    ClientName NVARCHAR(100),
    Email NVARCHAR(100),
    Location NVARCHAR(100)
);
GO

-- STEP 4: Create Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT,
    Title NVARCHAR(100),
    Budget DECIMAL(10,2),
    Skill NVARCHAR(100),
    Deadline DATETIME,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
GO

-- STEP 5: Create Freelancers table
CREATE TABLE Freelancers (
    FreelancerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    SkillSet NVARCHAR(200),
    Experience INT,
    City NVARCHAR(100)
);
GO

-- STEP 6: Create Bids table
CREATE TABLE Bids (
    BidID INT PRIMARY KEY IDENTITY(1,1),
    ProjectID INT,
    FreelancerID INT,
    BidAmount DECIMAL(10,2),
    BidDate DATETIME,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (FreelancerID) REFERENCES Freelancers(FreelancerID)
);
GO
