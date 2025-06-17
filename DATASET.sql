-- STEP 1: Create database
IF DB_ID('SkillHiveDB') IS NULL
    CREATE DATABASE SkillHiveDB;
GO

USE SkillHiveDB;
GO

-- STEP 2: Drop tables if they exist (child to parent)
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

-- STEP 7: Insert sample clients
INSERT INTO Clients (ClientName, Email, Location) VALUES
('Neha Reddy', 'neha@designhub.com', 'Mumbai'),
('Ravi Sharma', 'ravi@techline.io', 'Bangalore'),
('Asha Menon', 'asha@marketify.org', 'Delhi');
GO

-- STEP 8: Insert sample projects
INSERT INTO Projects (ClientID, Title, Budget, Skill, Deadline) VALUES
(1, 'Logo Design', 5000, 'Graphic Design', '2025-07-15'),
(1, 'UI Redesign', 12000, 'UI/UX', '2025-07-20'),
(2, 'Web Scraper', 8000, 'Python', '2025-07-18'),
(3, 'Social Media Audit', 4500, 'Marketing', '2025-07-22'),
(2, 'Data Dashboard', 15000, 'Power BI', '2025-07-30');
GO

-- STEP 9: Insert sample freelancers
INSERT INTO Freelancers (FirstName, LastName, SkillSet, Experience, City) VALUES
('Ankit', 'Verma', 'Graphic Design, UI/UX', 4, 'Pune'),
('Sara', 'Kapoor', 'Python, Automation', 3, 'Hyderabad'),
('Mohan', 'Das', 'Marketing, SEO', 5, 'Chennai'),
('Ritika', 'Nair', 'Power BI, Excel', 2, 'Kochi');
GO

-- STEP 10: Insert sample bids
INSERT INTO Bids (ProjectID, FreelancerID, BidAmount, BidDate) VALUES
(1, 1, 4800, GETDATE()),
(2, 1, 11000, GETDATE()),
(3, 2, 7500, GETDATE()),
(4, 3, 4200, GETDATE()),
(5, 4, 14500, GETDATE());
GO
