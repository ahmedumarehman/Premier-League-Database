--Syed Fassih ul Hassny, Ahmed Umar Rehman
--i221730              , i221580

create DATABASE FOOTBALL_LEAGUE_SIGNUP;
use FOOTBALL_LEAGUE_SIGNUP;

--DROP TABLE Team
--9
--DROP TABLE Player
--8
--DROP TABLE Match
--7
--DROP TABLE Standing
--1
--DROP TABLE Referee
--2
--DROP TABLE Goal
--3
--DROP TABLE Substitution
--4
--DROP TABLE Ticket
--5


create table Team
(
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100),
    Coach VARCHAR(100),
    FoundedYear INT,
    Stadium VARCHAR(100),
    Country VARCHAR(50),
    TotalPlayers INT,
    Trophies INT
);

create table Player
(
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100),
    Position VARCHAR(50),
    DateOfBirth DATE,
    Nationality VARCHAR(50),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

create table Match
(
    MatchID INT PRIMARY KEY,
    Date DATE,
    Location VARCHAR(100),
    HomeTeamID INT,
    AwayTeamID INT,
    Score VARCHAR(10),
    FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID)
);

create table Standing
(
    StandingID INT PRIMARY KEY,
    TeamID INT,
    LeagueID INT,
    MatchesPlayed INT,
    Wins INT,
    Draws INT,
    Losses INT,
    Points INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    -- FOREIGN KEY (LeagueID) REFERENCES League(LeagueID)
);

create table Referee
(
    RefereeID INT PRIMARY KEY,
    RefereeName VARCHAR(100),
    Nationality VARCHAR(50),
    ExperienceYears INT
);

create table Goal
(
    GoalID INT PRIMARY KEY,
    MatchID INT,
    PlayerID INT,
    MinuteScored INT,
    Type VARCHAR(50),
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

create table Substitution
(
    SubstitutionID INT PRIMARY KEY,
    MatchID INT,
    PlayerOutID INT,
    PlayerInID INT,
    Minute INT,
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
    FOREIGN KEY (PlayerOutID) REFERENCES Player(PlayerID),
    FOREIGN KEY (PlayerInID) REFERENCES Player(PlayerID)
);

create table Ticket
(
    TicketID INT PRIMARY KEY,
    MatchID INT,
    SeatNumber VARCHAR(10),
    Price DECIMAL(10, 2),
    PurchaseDate DATE,
    CustomerName VARCHAR(100),
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID)
);

INSERT INTO Team
    (TeamID, TeamName, Coach, FoundedYear, Stadium, Country, TotalPlayers, Trophies)
VALUES
    (1, 'Manchester Utd', 'Erik ten Hag', 1878, 'Old Trafford', 'England', 28, 86),
    (2, 'Liverpool', 'Jurgen Klopp', 1892, 'Anfield', 'England', 25, 89),
    (3, 'Manchester City', 'Pep Guardiola', 1880, 'Etihad Stadium', 'England', 24, 33),
    (4, 'Chelsea', 'Mauricio Pochettino', 1905, 'Stamford Bridge', 'England', 26, 67),
    (5, 'Tottenham Hotspur', 'Ange Postecoglou', 1882, 'Tottenham Hotspur Stadium', 'England', 24, 35),
    (6, 'Arsenal', 'Mikel Arteta', 1886, 'Emirates Stadium', 'England', 26, 60),
    (7, 'Aston Villa', 'Unai Emery', 1874, 'Villa Park', 'England', 25, 25),
    (8, 'Newcastle United', 'Eddie Howe', 1892, 'St James'' Park', 'England', 27, 14),
    (9, 'West Ham United', 'David Moyes', 1895, 'London Stadium', 'England', 25, 4),
    (10, 'Everton', 'Sean Dyche', 1878, 'Goodison Park', 'England', 26, 24),
    (11, 'Leicester City', 'Enzo Maresca', 1884, 'King Power Stadium', 'England', 24, 4),
    (12, 'Southampton', 'Russell Martin', 1885, 'St Mary''s Stadium', 'England', 25, 2),
    (13, 'Crystal Palace', 'Roy Hodgson', 1905, 'Selhurst Park', 'England', 26, 0),
    (14, 'Brighton & Hove Albion', 'Roberto De Zerbi', 1901, 'Amex Stadium', 'England', 25, 0),
    (15, 'Brentford', 'Thomas Frank', 1889, 'Brentford Community Stadium', 'England', 24, 0),
    (16, 'Fulham', 'Marco Silva', 1879, 'Craven Cottage', 'England', 25, 2),
    (17, 'Wolverhampton Wanderers', 'Gary O''Neil', 1877, 'Molineux Stadium', 'England', 25, 13),
    (18, 'Nottingham Forest', 'Steve Cooper', 1865, 'City Ground', 'England', 26, 13),
    (19, 'Burnley', 'Vincent Kompany', 1882, 'Turf Moor', 'England', 24, 5),
    (20, 'Sheffield United', 'Paul Heckingbottom', 1889, 'Bramall Lane', 'England', 24, 4);

INSERT INTO Player
    (PlayerID, PlayerName, Position, DateOfBirth, Nationality, TeamID)
VALUES
    (1, 'Marcus Rashford', 'Forward', '1997-10-31', 'England', 1),
    (2, 'Bruno Fernandes', 'Midfielder', '1994-09-08', 'Portugal', 1),
    (3, 'Mohamed Salah', 'Forward', '1992-06-15', 'Egypt', 2),
    (4, 'Virgil van Dijk', 'Defender', '1991-07-08', 'Netherlands', 2),
    (5, 'Kevin De Bruyne', 'Midfielder', '1991-06-28', 'Belgium', 3),
    (6, 'Erling Haaland', 'Forward', '2000-07-21', 'Norway', 3),
    (7, 'Raheem Sterling', 'Forward', '1994-12-08', 'England', 4),
    (8, 'Thiago Silva', 'Defender', '1984-09-22', 'Brazil', 4),
    (9, 'Harry Kane', 'Forward', '1993-07-28', 'England', 5),
    (10, 'Heung-min Son', 'Forward', '1992-07-08', 'South Korea', 5),
    (11, 'Bukayo Saka', 'Midfielder', '2001-09-05', 'England', 6),
    (12, 'Martin Ødegaard', 'Midfielder', '1998-12-17', 'Norway', 6),
    (13, 'Ollie Watkins', 'Forward', '1995-12-30', 'England', 7),
    (14, 'Emiliano Martinez', 'Goalkeeper', '1992-09-02', 'Argentina', 7),
    (15, 'Alexander Isak', 'Forward', '1999-09-21', 'Sweden', 8),
    (16, 'Bruno Guimarães', 'Midfielder', '1997-11-16', 'Brazil', 8),
    (17, 'Jarrod Bowen', 'Forward', '1996-12-20', 'England', 9),
    (18, 'Lucas Paqueta', 'Midfielder', '1997-08-27', 'Brazil', 9),
    (19, 'Dominic Calvert-Lewin', 'Forward', '1997-03-16', 'England', 10),
    (20, 'Jordan Pickford', 'Goalkeeper', '1994-03-07', 'England', 10),
    (21, 'Jamie Vardy', 'Forward', '1987-01-11', 'England', 11),
    (22, 'Wilfred Ndidi', 'Midfielder', '1996-12-16', 'Nigeria', 11),
    (23, 'James Ward-Prowse', 'Midfielder', '1994-11-01', 'England', 12),
    (24, 'Ché Adams', 'Forward', '1996-07-13', 'Scotland', 12),
    (25, 'Wilfried Zaha', 'Forward', '1992-11-10', 'Ivory Coast', 13),
    (26, 'Marc Guehi', 'Defender', '2000-07-13', 'England', 13),
    (27, 'Evan Ferguson', 'Forward', '2004-10-19', 'Ireland', 14),
    (28, 'Kaoru Mitoma', 'Midfielder', '1997-05-20', 'Japan', 14),
    (29, 'Ivan Toney', 'Forward', '1996-03-16', 'England', 15),
    (30, 'Bryan Mbeumo', 'Forward', '1999-08-07', 'Cameroon', 15),
    (31, 'Aleksandar Mitrović', 'Forward', '1994-09-16', 'Serbia', 16),
    (32, 'Andreas Pereira', 'Midfielder', '1996-01-01', 'Brazil', 16),
    (33, 'Ruben Neves', 'Midfielder', '1997-03-13', 'Portugal', 17),
    (34, 'Pedro Neto', 'Forward', '2000-03-09', 'Portugal', 17),
    (35, 'Morgan Gibbs-White', 'Midfielder', '2000-01-27', 'England', 18),
    (36, 'Taiwo Awoniyi', 'Forward', '1997-08-12', 'Nigeria', 18),
    (37, 'Josh Brownhill', 'Midfielder', '1995-12-19', 'England', 19),
    (38, 'Jay Rodriguez', 'Forward', '1989-07-29', 'England', 19),
    (39, 'Oliver Norwood', 'Midfielder', '1991-04-12', 'Northern Ireland', 20),
    (40, 'Rhian Brewster', 'Forward', '2000-04-01', 'England', 20);

INSERT INTO Match
    (MatchID, Date, Location, HomeTeamID, AwayTeamID, Score)
VALUES
    (1, '2024-11-10', 'Old Trafford', 1, 2, '3-1'),
    (2, '2024-11-11', 'Anfield', 2, 3, '2-2'),
    (3, '2024-11-12', 'Etihad Stadium', 3, 4, '4-0'),
    (4, '2024-11-13', 'Stamford Bridge', 4, 5, '1-1'),
    (5, '2024-11-14', 'Tottenham Hotspur Stadium', 5, 6, '2-3'),
    (6, '2024-11-15', 'Emirates Stadium', 6, 7, '1-0'),
    (7, '2024-11-16', 'Villa Park', 7, 8, '2-2'),
    (8, '2024-11-17', 'St James'' Park', 8, 9, '3-2'),
    (9, '2024-11-18', 'London Stadium', 9, 10, '1-0'),
    (10, '2024-11-19', 'Goodison Park', 10, 11, '2-1'),
    (11, '2024-11-20', 'King Power Stadium', 11, 12, '0-0'),
    (12, '2024-11-21', 'St Mary''s Stadium', 12, 13, '1-1'),
    (13, '2024-11-22', 'Selhurst Park', 13, 14, '2-1'),
    (14, '2024-11-23', 'Amex Stadium', 14, 15, '3-1'),
    (15, '2024-11-24', 'Brentford Community Stadium', 15, 16, '2-2'),
    (16, '2024-11-25', 'Craven Cottage', 16, 17, '1-0'),
    (17, '2024-11-26', 'Molineux Stadium', 17, 18, '2-3'),
    (18, '2024-11-27', 'City Ground', 18, 19, '1-0'),
    (19, '2024-11-28', 'Turf Moor', 19, 20, '2-2'),
    (20, '2024-11-29', 'Bramall Lane', 20, 1, '1-1');



INSERT INTO Standing
    (StandingID, TeamID, LeagueID, MatchesPlayed, Wins, Draws, Losses, Points)
VALUES
    (1, 1, 1, 38, 25, 8, 5, 83),
    (2, 2, 1, 38, 28, 7, 3, 91),
    (3, 3, 1, 38, 26, 9, 3, 87),
    (4, 4, 1, 38, 21, 10, 7, 73),
    (5, 5, 1, 34, 24, 6, 4, 78),
    (6, 6, 1, 38, 23, 9, 6, 78),
    (7, 7, 1, 38, 20, 12, 6, 72),
    (8, 8, 1, 38, 27, 5, 6, 86),
    (9, 9, 1, 38, 18, 10, 10, 64),
    (10, 10, 1, 38, 19, 11, 8, 68),
    (11, 11, 1, 38, 17, 12, 9, 63),
    (12, 12, 1, 38, 23, 8, 7, 77),
    (13, 13, 1, 34, 22, 9, 3, 75),
    (14, 14, 1, 38, 18, 13, 7, 67),
    (15, 15, 1, 38, 24, 7, 7, 79),
    (16, 16, 1, 38, 21, 10, 7, 73),
    (17, 17, 1, 38, 19, 12, 7, 69),
    (18, 18, 1, 38, 22, 8, 8, 74),
    (19, 19, 1, 38, 23, 6, 9, 75),
    (20, 20, 1, 38, 20, 9, 9, 69);

INSERT INTO Referee
    (RefereeID, RefereeName, Nationality, ExperienceYears)
VALUES
    (1, 'Michael Oliver', 'England', 18),
    (2, 'Antonio Mateu Lahoz', 'Spain', 21),
    (3, 'Clement Turpin', 'France', 15),
    (4, 'Björn Kuipers', 'Netherlands', 20),
    (5, 'Damir Skomina', 'Slovenia', 22),
    (6, 'Felix Brych', 'Germany', 18),
    (7, 'Danny Makkelie', 'Netherlands', 12),
    (8, 'Szymon Marciniak', 'Poland', 14),
    (9, 'Pawel Gil', 'Poland', 16),
    (10, 'Ovidiu Hațegan', 'Romania', 17),
    (11, 'Gianluca Rocchi', 'Italy', 19),
    (12, 'Jonas Eriksson', 'Sweden', 19),
    (13, 'Mark Clattenburg', 'England', 13),
    (14, 'Carlos del Cerro Grande', 'Spain', 17),
    (15, 'Fernando Rapallini', 'Argentina', 9);

INSERT INTO Goal
    (GoalID, MatchID, PlayerID, MinuteScored, Type)
VALUES
    (1, 1, 1, 34, 'Open Play'),
    -- Lionel Messi, Manchester Utd vs Real Madrid
    (2, 1, 2, 76, 'Penalty'),
    -- Karim Benzema, Manchester Utd vs Real Madrid
    (3, 2, 3, 12, 'Header'),
    -- Bruno Fernandes, Liverpool vs Manchester City
    (4, 3, 4, 45, 'Free Kick'),
    -- Kylian Mbappe, Etihad Stadium (Man City vs PSG)
    (5, 4, 5, 23, 'Open Play'),
    -- Robert Lewandowski, Stamford Bridge (Chelsea vs Bayern Munich)
    (6, 5, 6, 67, 'Penalty'),
    -- Cristiano Ronaldo, Tottenham Hotspur vs Juventus
    (7, 6, 7, 39, 'Header'),
    -- Mohamed Salah, Emirates Stadium (Liverpool vs Manchester Utd)
    (8, 7, 8, 89, 'Open Play'),
    -- Kevin De Bruyne, Villa Park (Manchester City vs Aston Villa)
    (9, 8, 9, 12, 'Free Kick'),
    -- Mason Mount, St James' Park (Newcastle United vs Chelsea)
    (10, 9, 10, 38, 'Penalty'),
    -- Romelu Lukaku, London Stadium (West Ham vs Chelsea)
    (11, 10, 11, 82, 'Open Play'),
    -- Zlatan Ibrahimovic, Goodison Park (Everton vs AC Milan)
    (12, 11, 12, 24, 'Header'),
    -- Joao Felix, King Power Stadium (Leicester City vs Atletico Madrid)
    (13, 12, 13, 74, 'Free Kick'),
    -- Erling Haaland, Selhurst Park (Crystal Palace vs Borussia Dortmund)
    (14, 13, 14, 31, 'Penalty'),
    -- Harry Kane, Amex Stadium (Brighton vs Tottenham Hotspur)
    (15, 14, 15, 56, 'Open Play'),
    -- Bukayo Saka, Brentford Community Stadium (Brentford vs Arsenal)
    (16, 15, 16, 62, 'Header'),
    -- Aston Villa player, Craven Cottage (Fulham vs Aston Villa)
    (17, 16, 17, 39, 'Free Kick'),
    -- Newcastle United player, Molineux Stadium (Wolves vs Newcastle)
    (18, 17, 18, 84, 'Open Play'),
    -- West Ham player, City Ground (Nottingham Forest vs West Ham)
    (19, 18, 19, 15, 'Penalty'),
    -- Everton player, Turf Moor (Burnley vs Everton)
    (20, 19, 20, 28, 'Free Kick');
-- Leicester player, Bramall Lane (Sheffield United vs Leicester City)

INSERT INTO Substitution
    (SubstitutionID, MatchID, PlayerInID, PlayerOutID, Minute)
VALUES
    (1, 1, 2, 1, 55),
    -- Match 1: Karim Benzema in, Lionel Messi out (Manchester Utd vs Real Madrid)
    (2, 2, 3, 2, 60),
    -- Match 2: Bruno Fernandes in, Karim Benzema out (Liverpool vs Manchester City)
    (3, 3, 4, 3, 72),
    -- Match 3: Kylian Mbappe in, Bruno Fernandes out (Man City vs PSG)
    (4, 4, 5, 4, 65),
    -- Match 4: Robert Lewandowski in, Kylian Mbappe out (Chelsea vs Bayern Munich)
    (5, 5, 6, 5, 80),
    -- Match 5: Cristiano Ronaldo in, Robert Lewandowski out (Tottenham vs Juventus)
    (6, 6, 7, 6, 70),
    -- Match 6: Mohamed Salah in, Cristiano Ronaldo out (Liverpool vs Manchester Utd)
    (7, 7, 8, 7, 63),
    -- Match 7: Kevin De Bruyne in, Mohamed Salah out (Aston Villa vs Manchester City)
    (8, 8, 9, 8, 75),
    -- Match 8: Mason Mount in, Kevin De Bruyne out (Newcastle vs Chelsea)
    (9, 9, 10, 9, 58),
    -- Match 9: Romelu Lukaku in, Mason Mount out (West Ham vs Chelsea)
    (10, 10, 11, 10, 85),
    -- Match 10: Zlatan Ibrahimovic in, Romelu Lukaku out (Everton vs AC Milan)
    (11, 11, 12, 11, 90),
    -- Match 11: Joao Felix in, Zlatan Ibrahimovic out (Leicester vs Atletico Madrid)
    (12, 12, 13, 12, 61),
    -- Match 12: Erling Haaland in, Joao Felix out (Crystal Palace vs Borussia Dortmund)
    (13, 13, 14, 13, 66),
    -- Match 13: Harry Kane in, Erling Haaland out (Brighton vs Tottenham)
    (14, 14, 15, 14, 82),
    -- Match 14: Bukayo Saka in, Harry Kane out (Brentford vs Arsenal)
    (15, 15, 1, 15, 90);
-- Match 15: Lionel Messi in, Bukayo Saka out (Fulham vs Aston Villa


INSERT INTO Ticket
    (TicketID, MatchID, SeatNumber, Price, PurchaseDate, CustomerName)
VALUES
    (1, 1, 'A12', 100, '2024-01-10', 'John Doe'),
    -- Match 1: Old Trafford, Manchester Utd vs Liverpool
    (2, 1, 'B15', 100, '2024-02-15', 'Jane Smith'),
    -- Match 1: Old Trafford, Manchester Utd vs Liverpool
    (3, 2, 'C22', 80, '2024-03-20', 'Mark Johnson'),
    -- Match 2: Anfield, Liverpool vs Manchester City
    (4, 3, 'A14', 90, '2024-04-05', 'Emily Davis'),
    -- Match 3: Etihad Stadium, Manchester City vs Chelsea
    (5, 4, 'B18', 100, '2024-05-23', 'Chris Lee'),
    -- Match 4: Stamford Bridge, Chelsea vs Tottenham
    (6, 5, 'C30', 95, '2024-06-10', 'Sarah Miller'),
    -- Match 5: Tottenham Hotspur Stadium, Tottenham vs Arsenal
    (7, 6, 'A10', 85, '2024-07-14', 'David Wilson'),
    -- Match 6: Emirates Stadium, Arsenal vs Aston Villa
    (8, 7, 'B20', 120, '2024-08-01', 'Laura Brown'),
    -- Match 7: Villa Park, Aston Villa vs Newcastle
    (9, 8, 'C35', 75, '2024-09-17', 'Michael Clark'),
    -- Match 8: St James' Park, Newcastle vs West Ham
    (10, 9, 'A16', 95, '2024-10-22', 'Linda White'),
    -- Match 9: London Stadium, West Ham vs Everton
    (11, 10, 'B21', 100, '2024-11-12', 'James Harris'),
    -- Match 10: Goodison Park, Everton vs Leicester City
    (12, 11, 'C10', 100, '2024-12-05', 'Olivia Martinez'),
    -- Match 11: King Power Stadium, Leicester City vs Southampton
    (13, 12, 'A24', 85, '2024-03-30', 'Sophia Robinson'),
    -- Match 12: St Mary's Stadium, Southampton vs Crystal Palace
    (14, 13, 'B30', 80, '2024-06-25', 'Liam Walker'),
    -- Match 13: Selhurst Park, Crystal Palace vs Brighton
    (15, 14, 'C45', 120, '2024-07-08', 'Charlotte King');
-- Match 14: Amex Stadium, Brighton vs Brentford






-- Query # 1
-- use SELECT * to show all the tables you made 

SELECT *
FROM Team
SELECT *
FROM Player
SELECT *
FROM Match
SELECT *
FROM Standing
SELECT *
FROM Referee
SELECT *
FROM Goal
SELECT *
FROM Substitution
SELECT *
FROM Ticket



--Query#1


-- SQL Query to Retrieve all columns for each team.
SELECT *
FROM Team


--Query#2
-- Average number of trophies held by teams
SELECT AVG(Trophies) AS AverageTrophies
FROM Team;


--Query#3
-- Count the number of matches played in each stadium.
SELECT Location AS Stadium, COUNT(*) AS Total_Matches_Played
FROM Match
GROUP BY Location;


--Query#4
-- SQL query to list all players who play forward
SELECT
    Playername AS Forwards
FROM Player
WHERE [Position] = 'Forward';


--Query#5
--SQL Query to find teams found before 1900
SELECT *
FROM Team
WHERE FoundedYear < 1900

--Query#6

-- Listing all player who are from England
SELECT
    PlayerName,
    Nationality
FROM Player
WHERE Nationality = 'England';


--Query#7
-- SQL query to retrieve players who born after 1st jan 1995
SELECT
    PlayerID,
    PlayerName,
    DateOfBirth
FROM Player
WHERE DateOfBirth > '1995-01-01';


--Query#8
-- SQL Query to Find all teams with more than 50 trophies.
SELECT
    TeamName AS Team,
    Trophies
FROM Team
WHERE Trophies > 50


--Query#9
-- SQL QUery to Retrieve the list of teams that have exactly 24 players.
SELECT
    TeamName AS Team,
    TotalPlayers AS TotalPlayers
FROM Team
WHERE TotalPlayers = 24


--Query#10
--Retrieving the names of all players along with the name of the team they play for.
SELECT
    P.PlayerName,
    T.TeamName
FROM Player P
    JOIN Team T ON P.TeamID = T.TeamID;


--Query#11
-- SQL Query to find referees who have experience of more than 15 years
SELECT
    RefereeName AS Name,
    Nationality AS Country,
    ExperienceYears AS Experience_Years
FROM Referee
WHERE ExperienceYears > 15;


--Query#12
-- Listing players who have not scored any goals.
SELECT
    P.PlayerID,
    P.PlayerName
FROM
    Player P
    LEFT JOIN
    Goal G ON P.PlayerID = G.PlayerID
WHERE 
    G.GoalID IS NULL;


--Query#13
-- Listing teams with more than 20 players and more than 30 trophies.
SELECT
    TeamName,
    TotalPlayers,
    Trophies
FROM
    Team
WHERE 
    TotalPlayers > 20
    AND Trophies > 30;

--Query#14
-- total number of goals scored by each player.
SELECT
    P.PlayerName,
    COUNT(G.GoalID) AS TotalGoals
FROM
    Goal G
    JOIN
    Player P ON G.PlayerID = P.PlayerID
GROUP BY 
    P.PlayerName;


--Query#15
-- Count the total number of goals scored by each team.
SELECT
    T.TeamName,
    COUNT(G.GoalID) AS TotalGoals
FROM Goal G
    JOIN Match M ON G.MatchID = M.MatchID
    JOIN Team T ON M.HomeTeamID = T.TeamID OR M.AwayTeamID = T.TeamID
GROUP BY T.TeamName
ORDER BY TotalGoals DESC;


--Query#16
-- SQL Query to find details of matchs held at old trafford
SELECT
    M.MatchID AS Matchday_Week,
    M.Date,
    M.Location AS Stadium,
    M.Score,
    HT.TeamName AS HomeTeamName,
    AT.TeamName AS AwayTeamName
FROM Match M
    JOIN Team HT ON M.HomeTeamID = HT.TeamID
    JOIN Team AT ON M.AwayTeamID = AT.TeamID
WHERE HT.Stadium = 'Anfield';


--Query#17
-- SQL query to Retrieve all matches where the home team scored more than 2 goals.
SELECT M.MatchID,
    M.Date,
    M.Location,
    M.Score,

    HT.TeamName AS HomeTeam,
    HT.TeamName AS AwayTeam
FROM Match M

    JOIN Team HT ON M.HomeTeamID = HT.TeamID
    JOIN Team AT ON M.AwayTeamID = AT.TeamID

WHERE CAST(SUBSTRING(M.Score, 1, CHARINDEX('-', M.Score) - 1) AS INT) > 2;


--Query#18
-- list of goals scored in each match, including player names.
SELECT
    M.MatchID,
    M.Date,
    P.PlayerName,
    G.MinuteScored
FROM Goal G
    JOIN Player P ON G.PlayerID = P.PlayerID
    JOIN Match M ON G.MatchID = M.MatchID
ORDER BY M.MatchID, G.MinuteScored;


--Query#19
-- SQL Query to list matches which score line is 2-2
SELECT
    M.MatchID AS Week,
    M.Date,
    M.Location,
    M.Score,

    HT.TeamName AS HomeTeam,
    AT.TeamName AS AwayTeam
FROM Match M


    JOIN Team HT ON M.HomeTeamID=HT.TeamID
    JOIN Team AT ON M.AwayTeamID=AT.TeamID
WHERE M.Score = '2-2';


--Query#20
-- details of all substitutions made in each match, including player names.
SELECT
    M.MatchID,
    M.Date,
    POut.PlayerName AS PlayerOut,
    PIn.PlayerName AS PlayerIn,
    S.[Minute]
FROM Substitution S
    JOIN Match M ON S.MatchID = M.MatchID
    JOIN Player POut ON S.PlayerOutID = POut.PlayerID
    JOIN Player PIn ON S.PlayerInID = PIn.PlayerID
ORDER BY M.MatchID, S.[Minute]


--Query#21
--Finding the average price of tickets for matches played at "Etihad Stadium."
SELECT
    HT.TeamName AS HomeTeam,
    AT.TeamName AS AwayTeam,
    AVG(T.Price) AS AverageTicketPrice
FROM
    Ticket T
    JOIN
    Match M ON T.MatchID = M.MatchID
    JOIN
    Team HT ON M.HomeTeamID = HT.TeamID
    JOIN
    Team AT ON M.AwayTeamID = AT.TeamID
WHERE 
    M.Location = 'Etihad Stadium'
GROUP BY 
    HT.TeamName, AT.TeamName;


--Query#22
-- Calculating the win percentage for each team in the standings.
SELECT
    T.TeamName,
    (CAST(SUM(CASE WHEN M.Score LIKE CONCAT('%', T.TeamName, '%') THEN 1 ELSE 0 END) AS FLOAT) / 
     CAST(COUNT(M.MatchID) AS FLOAT)) * 100 AS WinPercentage
FROM
    Standing S
    JOIN
    Team T ON S.TeamID = T.TeamID
    LEFT JOIN
    Match M ON M.HomeTeamID = T.TeamID OR M.AwayTeamID = T.TeamID
GROUP BY 
    T.TeamName;


--Query#23
-- Finding players who have scored goals in more than one match. empty because no player scored in more than one match
SELECT
    P.PlayerName,
    COUNT(DISTINCT G.MatchID) AS MatchesWithGoals
FROM
    Player P
    JOIN
    Goal G ON P.PlayerID = G.PlayerID
GROUP BY 
    P.PlayerID, P.PlayerName
HAVING 
    COUNT(DISTINCT G.MatchID) > 1;
-- Check if there are any goals scored by players
SELECT
    COUNT(*) AS TotalGoals
FROM
    Goal;


--Query#24
-- Listing the total number of wins for each team in the standings table.
SELECT
    T.TeamName,
    COUNT(*) AS TotalWins
FROM
    Match M
    JOIN
    Team T ON M.HomeTeamID = T.TeamID
WHERE 
    CAST(SUBSTRING(M.Score, 1, CHARINDEX('-', M.Score) - 1) AS INT) > 
    CAST(SUBSTRING(M.Score, CHARINDEX('-', M.Score) + 1, LEN(M.Score)) AS INT)
GROUP BY 
    T.TeamName;


--Query#25
--SQL Query to find total Goals Scored by Teams in Home Matches
WITH
    PlayerGoals
    AS
    (
        SELECT
            p.TeamID,
            COUNT(g.GoalID) AS TotalGoals
        FROM
            Player p
            LEFT JOIN Goal g ON p.PlayerID = g.PlayerID
        GROUP BY 
        p.TeamID
    )
SELECT
    t.TeamName,
    COALESCE(pg.TotalGoals, 0) AS TotalGoals
FROM
    Team t
    LEFT JOIN PlayerGoals pg ON t.TeamID = pg.TeamID
ORDER BY 
    TotalGoals DESC;


--Query#26
--Find the top-scoring player for each nationality and their total goals
WITH
    MaxGoalsPerNationality
    AS
    (
        SELECT
            p1.Nationality,
            MAX(g1.TotalGoals) AS MaxGoals
        FROM
            (
            SELECT
                PlayerID,
                COUNT(GoalID) AS TotalGoals
            FROM
                Goal
            GROUP BY 
                PlayerID
        ) g1
            JOIN Player p1 ON g1.PlayerID = p1.PlayerID
        GROUP BY 
        p1.Nationality
    )
SELECT
    p.Nationality,
    p.PlayerName,
    g.TotalGoals
FROM
    Player p
    JOIN
    (
        SELECT
        PlayerID,
        COUNT(GoalID) AS TotalGoals
    FROM
        Goal
    GROUP BY 
            PlayerID
    ) g ON p.PlayerID = g.PlayerID
    JOIN MaxGoalsPerNationality mgn ON p.Nationality = mgn.Nationality AND g.TotalGoals = mgn.MaxGoals;



--Query#27
--SQL query to calculate the total number of home wins and away wins for each team
SELECT
    T.TeamName,
    SUM(CASE 
            WHEN CAST(SUBSTRING(M.Score, 1, CHARINDEX('-', M.Score) - 1) AS INT) > 
                 CAST(SUBSTRING(M.Score, CHARINDEX('-', M.Score) + 1, LEN(M.Score)) AS INT)
            THEN 1
            ELSE 0
        END) AS TotalHomeWins,
    SUM(CASE 
            WHEN CAST(SUBSTRING(M.Score, CHARINDEX('-', M.Score) + 1, LEN(M.Score)) AS INT) > 
                 CAST(SUBSTRING(M.Score, 1, CHARINDEX('-', M.Score) - 1) AS INT)
            THEN 1
            ELSE 0
        END) AS TotalAwayWins
FROM
    Match M
    JOIN
    Team T ON M.HomeTeamID = T.TeamID
GROUP BY 
    T.TeamName;




--Query#28
-- Getting teams that have scored an average of more than 2 goals per match.
SELECT
    T.TeamName,
    AVG(G.GoalsScored) AS AvgGoalsPerMatch
FROM
    Team T
    JOIN
    Match M ON T.TeamID = M.HomeTeamID OR T.TeamID = M.AwayTeamID
    JOIN
    (
                                                                                                                                SELECT
            MatchID,
            HomeTeamID AS TeamID,
            CAST(SUBSTRING(Score, 1, CHARINDEX('-', Score) - 1) AS INT) AS GoalsScored
        FROM
            Match
    UNION ALL
        SELECT
            MatchID,
            AwayTeamID AS TeamID,
            CAST(SUBSTRING(Score, CHARINDEX('-', Score) + 1, LEN(Score)) AS INT) AS GoalsScored
        FROM
            Match) AS G ON T.TeamID = G.TeamID
GROUP BY 
    T.TeamName
HAVING 
    AVG(G.GoalsScored) > 2;


--Query#29
-- Finding the team with the highest average goals per match.
SELECT
    T.TeamName,
    AVG(G.GoalsScored) AS AvgGoalsPerMatch
FROM
    Team T
    JOIN
    Match M ON T.TeamID = M.HomeTeamID OR T.TeamID = M.AwayTeamID
    JOIN
    (                                                                                                                                                                                                                                                        SELECT
            MatchID,
            HomeTeamID AS TeamID,
            CAST(SUBSTRING(Score, 1, CHARINDEX('-', Score) - 1) AS INT) AS GoalsScored
        FROM
            Match
    UNION ALL
        SELECT
            MatchID,
            AwayTeamID AS TeamID,
            CAST(SUBSTRING(Score, CHARINDEX('-', Score) + 1, LEN(Score)) AS INT) AS GoalsScored
        FROM
            Match) AS G ON T.TeamID = G.TeamID
GROUP BY 
             T.TeamID, T.TeamName;


--Query#30
--Selecting Teams with the Highest Average Goal Scoring Players
SELECT
    t.TeamName,
    AVG(PlayerGoals.TotalGoals) AS AvgGoalsPerPlayer
FROM
    Team t
    JOIN
    Player p ON t.TeamID = p.TeamID
    JOIN
    (
        SELECT
        PlayerID,
        COUNT(GoalID) AS TotalGoals
    FROM
        Goal
    GROUP BY 
            PlayerID
    ) PlayerGoals ON p.PlayerID = PlayerGoals.PlayerID
GROUP BY 
    t.TeamName
ORDER BY 
    AvgGoalsPerPlayer DESC;


--Query#31
--Finding Referees Assigned to Matches with the Most Goals
SELECT
    r.RefereeName,
    m.MatchID,
    (
        SELECT
        COUNT(*)
    FROM
        Goal g
    WHERE 
            g.MatchID = m.MatchID
    ) AS TotalGoals
FROM
    Referee r
    JOIN
    Match m ON r.RefereeID = (
        SELECT
        RefereeID
    FROM
        (
            -- Example logic to assign referees
            SELECT
            ROW_NUMBER() OVER (ORDER BY MatchID) AS RefereeID,
            MatchID
        FROM Match
            ) RefMatches
    WHERE RefMatches.MatchID = m.MatchID
    )
ORDER BY 
    TotalGoals DESC;


--Query#32
--selecting the team with the most experienced players
WITH
    AvgPlayerAgeCTE
    AS
    (
        SELECT
            t.TeamID,
            t.TeamName,
            AVG(YEAR(GETDATE()) - YEAR(p.DateOfBirth)) AS AvgPlayerAge
        FROM
            Team t
            JOIN
            Player p ON t.TeamID = p.TeamID
        GROUP BY 
        t.TeamID, t.TeamName
    )
SELECT
    TeamName,
    AvgPlayerAge
FROM
    AvgPlayerAgeCTE
WHERE 
    AvgPlayerAge = (SELECT MAX(AvgPlayerAge)
FROM AvgPlayerAgeCTE);


--Query#33
--Determining players who contributed to more than 50% of their team's total goals
WITH
    PlayerGoals
    AS
    (
        SELECT
            p.PlayerID,
            p.PlayerName,
            p.TeamID,
            COUNT(g.GoalID) AS TotalGoals
        FROM
            Player p
            LEFT JOIN
            Goal g ON p.PlayerID = g.PlayerID
        GROUP BY 
        p.PlayerID, p.PlayerName, p.TeamID
    ),
    TeamGoals
    AS
    (
        SELECT
            pg.TeamID,
            COALESCE(SUM(pg.TotalGoals), 0) AS TeamTotalGoals
        FROM
            PlayerGoals pg
        GROUP BY 
        pg.TeamID
    )
SELECT
    pg.PlayerName,
    t.TeamName,
    pg.TotalGoals AS PlayerGoals,
    tg.TeamTotalGoals,
    CASE 
        WHEN tg.TeamTotalGoals = 0 THEN 0
        ELSE (CAST(pg.TotalGoals AS FLOAT) / tg.TeamTotalGoals) * 100
    END AS ContributionPercentage
FROM
    PlayerGoals pg
    JOIN
    TeamGoals tg ON pg.TeamID = tg.TeamID
    JOIN
    Team t ON pg.TeamID = t.TeamID
WHERE 
    CASE 
        WHEN tg.TeamTotalGoals = 0 THEN 0
        ELSE (CAST(pg.TotalGoals AS FLOAT) / tg.TeamTotalGoals) * 100
    END > 50;

--empty
--Query#34
-- Listing all matches that have gone into extra time (assume score > 80 minutes).
SELECT
    M.MatchID,
    M.Date,
    M.Location,
    M.HomeTeamID,
    M.AwayTeamID,
    M.Score,
    HT.TeamName AS HomeTeam,
    AT.TeamName AS AwayTeam
FROM
    Match M
    JOIN
    Team HT ON M.HomeTeamID = HT.TeamID
    JOIN
    Team AT ON M.AwayTeamID = AT.TeamID
WHERE 
    CAST(SUBSTRING(M.Score, 1, CHARINDEX('-', M.Score) - 1) AS INT) > 80
    OR CAST(SUBSTRING(M.Score, CHARINDEX('-', M.Score) + 1, LEN(M.Score)) AS INT) > 80;


   
