USE SkillHiveDB;
GO

-- 1. Projects with a budget higher than the average budget
SELECT 
    Title,
    Budget
FROM Projects
WHERE Budget > (
    SELECT AVG(Budget)
    FROM Projects
);
GO

-- 2. Freelancers who have placed a bid on Python projects
SELECT 
    FirstName,
    LastName,
    City
FROM Freelancers
WHERE FreelancerID IN (
    SELECT b.FreelancerID
    FROM Bids b
    JOIN Projects p ON b.ProjectID = p.ProjectID
    WHERE p.Skill = 'Python'
);
GO

-- 3. Clients who posted more than the average number of projects
SELECT 
    ClientName
FROM Clients
WHERE ClientID IN (
    SELECT ClientID
    FROM Projects
    GROUP BY ClientID
    HAVING COUNT(*) > (
        SELECT AVG(ProjectCount)
        FROM (
            SELECT COUNT(*) AS ProjectCount
            FROM Projects
            GROUP BY ClientID
        ) AS AvgProjects
    )
);
GO

-- 4. Projects that have received no bids
SELECT 
    Title
FROM Projects
WHERE ProjectID NOT IN (
    SELECT DISTINCT ProjectID
    FROM Bids
);
GO

-- 5. Freelancers with 2 to 4 years of experience who bid on projects in Mumbai
SELECT 
    FirstName,
    LastName,
    Experience
FROM Freelancers
WHERE Experience BETWEEN 2 AND 4
AND FreelancerID IN (
    SELECT b.FreelancerID
    FROM Bids b
    JOIN Projects p ON b.ProjectID = p.ProjectID
    JOIN Clients c ON p.ClientID = c.ClientID
    WHERE c.Location = 'Mumbai'
);
GO
