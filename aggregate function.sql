USE SkillHiveDB;
GO

-- 1. Total number of freelancers
SELECT COUNT(*) AS TotalFreelancers
FROM Freelancers;
GO

-- 2. Average bid amount across all projects
SELECT AVG(BidAmount) AS AverageBid
FROM Bids;
GO

-- 3. Maximum budget among all projects
SELECT MAX(Budget) AS MaxProjectBudget
FROM Projects;
GO

-- 4. Number of projects posted by each client
SELECT 
    c.ClientName,
    COUNT(p.ProjectID) AS ProjectCount
FROM Clients c
LEFT JOIN Projects p ON c.ClientID = p.ClientID
GROUP BY c.ClientName;
GO

-- 5. Number of bids made by each freelancer
SELECT 
    f.FirstName + ' ' + f.LastName AS FreelancerName,
    COUNT(b.BidID) AS TotalBids
FROM Freelancers f
LEFT JOIN Bids b ON f.FreelancerID = b.FreelancerID
GROUP BY f.FirstName, f.LastName;
GO

-- 6. Average experience of freelancers per city
SELECT 
    City,
    AVG(Experience) AS AvgExperience
FROM Freelancers
GROUP BY City;
GO
