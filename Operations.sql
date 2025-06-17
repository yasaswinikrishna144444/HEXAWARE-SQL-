USE SkillHiveDB;
GO

-- 1. Projects with a budget BETWEEN 6000 and 13000
SELECT 
    Title,
    Budget
FROM Projects
WHERE Budget BETWEEN 6000 AND 13000;
GO

-- 2. Freelancers with experience BETWEEN 2 and 4 years
SELECT 
    FirstName,
    LastName,
    Experience
FROM Freelancers
WHERE Experience BETWEEN 2 AND 4;
GO

-- 3. Projects that require skills IN ('Python', 'Power BI')
SELECT 
    Title,
    Skill
FROM Projects
WHERE Skill IN ('Python', 'Power BI');
GO

-- 4. Freelancers located IN ('Kochi', 'Chennai', 'Hyderabad')
SELECT 
    FirstName,
    LastName,
    City
FROM Freelancers
WHERE City IN ('Kochi', 'Chennai', 'Hyderabad');
GO

-- 5. Projects that have NOT received any bids
SELECT 
    Title
FROM Projects
WHERE ProjectID NOT IN (
    SELECT ProjectID FROM Bids
);
GO
-- 1. Top 3 Projects by bid count
SELECT TOP 3
    p.Title AS ProjectTitle,
    COUNT(b.BidID) AS TotalBids
FROM Projects p
LEFT JOIN Bids b ON p.ProjectID = b.ProjectID
GROUP BY p.Title
ORDER BY TotalBids DESC;

-- 2. Freelancers who bid on more than 1 project
SELECT 
    f.FreelancerID,
    f.FirstName + ' ' + f.LastName AS FreelancerName,
    COUNT(b.BidID) AS BidCount
FROM Freelancers f
JOIN Bids b ON f.FreelancerID = b.FreelancerID
GROUP BY f.FreelancerID, f.FirstName, f.LastName
HAVING COUNT(b.BidID) > 1;

-- 3. Clients and their average project budget
SELECT 
    c.ClientName,
    AVG(p.Budget) AS AvgBudget
FROM Clients c
JOIN Projects p ON c.ClientID = p.ClientID
GROUP BY c.ClientName;

-- 4. Freelancers who bid on projects involving 'Design'
SELECT 
    f.FirstName,
    f.LastName,
    p.Title
FROM Freelancers f
JOIN Bids b ON f.FreelancerID = b.FreelancerID
JOIN Projects p ON b.ProjectID = p.ProjectID
WHERE p.Skill LIKE '%Design%';

-- 5. Projects with budget > average budget of their client
SELECT 
    p.Title,
    p.Budget,
    c.ClientName
FROM Projects p
JOIN Clients c ON p.ClientID = c.ClientID
WHERE p.Budget > (
    SELECT AVG(p2.Budget)
    FROM Projects p2
    WHERE p2.ClientID = p.ClientID
);
