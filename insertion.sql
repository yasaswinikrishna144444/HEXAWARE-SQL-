-- Insert more Clients
INSERT INTO Clients (ClientName, Email, Location) VALUES
('Vikas Mehra', 'vikas@brandhaus.in', 'Chennai'),
('Pooja Rao', 'pooja@dataedge.com', 'Pune'),
('Zain Khan', 'zain@bizcore.ai', 'Mumbai');

-- Insert more Projects (ClientIDs 4–6)
INSERT INTO Projects (ClientID, Title, Budget, Skill, Deadline) VALUES
(4, 'Brand Strategy', 7000, 'Marketing', '2025-08-01'),
(5, 'ETL Pipeline', 15000, 'Data Engineering', '2025-08-15'),
(6, 'eCommerce UI', 9000, 'Web Design', '2025-08-05');

-- Insert more Freelancers (FreelancerIDs 5–7)
INSERT INTO Freelancers (FirstName, LastName, SkillSet, Experience, City) VALUES
('Nisha', 'Raut', 'Branding, Strategy', 3, 'Chennai'),
('Farhan', 'Ali', 'SQL, ETL, Python', 4, 'Pune'),
('Sneha', 'Menon', 'UI/UX, HTML/CSS', 2, 'Mumbai');

-- Insert more Bids
INSERT INTO Bids (ProjectID, FreelancerID, BidAmount, BidDate) VALUES
(6, 5, 6800, GETDATE()),
(7, 6, 14500, GETDATE()),
(8, 7, 8800, GETDATE()),
(7, 5, 14000, GETDATE());
