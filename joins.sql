USE SkillHiveDB;
GO

-- 1. Show all projects with their corresponding client names
SELECT 
    p.Title AS ProjectTitle,
    p.Skill,
    p.Budget,
    c.ClientName,
    c.Location
FROM Projects p
JOIN Clients c ON p.ClientID = c.ClientID;
GO

-- 2. Show all bids with project titles and freelancer names
SELECT 
    b.BidID,
    p.Title AS ProjectTitle,
    f.FirstName + ' ' + f.LastName AS FreelancerName,
    b.BidAmount,
    b.BidDate
FROM Bids b
JOIN Projects p ON b.ProjectID = p.ProjectID
JOIN Freelancers f ON b.FreelancerID = f.FreelancerID;
GO

-- 3. Show all freelancers and the projects they have bid on (including those who haven’t)
SELECT 
    f.FirstName + ' ' + f.LastName AS FreelancerName,
    ISNULL(p.Title, 'No Bids') AS ProjectTitle,
    ISNULL(c.ClientName, 'N/A') AS ClientName
FROM Freelancers f
LEFT JOIN Bids b ON f.FreelancerID = b.FreelancerID
LEFT JOIN Projects p ON b.ProjectID = p.ProjectID
LEFT JOIN Clients c ON p.ClientID = c.ClientID;
GO

-- 4. Show all projects and freelancers who have bid on them (including projects with no bids)
SELECT 
    p.Title AS ProjectTitle,
    ISNULL(f.FirstName + ' ' + f.LastName, 'No Bids') AS FreelancerName
FROM Projects p
LEFT JOIN Bids b ON p.ProjectID = b.ProjectID
LEFT JOIN Freelancers f ON b.FreelancerID = f.FreelancerID;
GO
