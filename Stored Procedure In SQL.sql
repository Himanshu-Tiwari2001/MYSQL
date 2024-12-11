	CREATE DATABASE Player_stats;
    USE Player_stats;


-- Create the table
CREATE TABLE CricketPlayers (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(50),
    Team VARCHAR(30),
    Role VARCHAR(20),
    MatchesPlayed INT,
    RunsScored INT,
    WicketsTaken INT
);

-- Insert 20 records into the table
INSERT INTO CricketPlayers (PlayerID, PlayerName, Team, Role, MatchesPlayed, RunsScored, WicketsTaken) VALUES
(1, 'Virat Kohli', 'India', 'Batsman', 280, 12000, 4),
(2, 'Steve Smith', 'Australia', 'Batsman', 150, 7500, 3),
(3, 'Kane Williamson', 'New Zealand', 'Batsman', 150, 7300, 2),
(4, 'Joe Root', 'England', 'Batsman', 160, 8500, 5),
(5, 'Rashid Khan', 'Afghanistan', 'Bowler', 100, 1100, 250),
(6, 'Jasprit Bumrah', 'India', 'Bowler', 120, 300, 150),
(7, 'Pat Cummins', 'Australia', 'Bowler', 90, 400, 170),
(8, 'Ben Stokes', 'England', 'All-Rounder', 110, 3200, 85),
(9, 'Shakib Al Hasan', 'Bangladesh', 'All-Rounder', 200, 6000, 270),
(10, 'David Warner', 'Australia', 'Batsman', 170, 8100, 0),
(11, 'AB de Villiers', 'South Africa', 'Batsman', 220, 9500, 2),
(12, 'MS Dhoni', 'India', 'Wicketkeeper', 300, 10500, 1),
(13, 'Chris Gayle', 'West Indies', 'Batsman', 350, 14000, 15),
(14, 'Lasith Malinga', 'Sri Lanka', 'Bowler', 220, 300, 320),
(15, 'Babar Azam', 'Pakistan', 'Batsman', 100, 5400, 0),
(16, 'Andre Russell', 'West Indies', 'All-Rounder', 150, 3500, 120),
(17, 'Moeen Ali', 'England', 'All-Rounder', 180, 3900, 150),
(18, 'Mitchell Starc', 'Australia', 'Bowler', 85, 200, 160),
(19, 'Rohit Sharma', 'India', 'Batsman', 230, 9800, 8),
(20, 'Quinton de Kock', 'South Africa', 'Wicketkeeper', 130, 5500, 2);

-- Insert 10 top bowlers into the CricketPlayers table
INSERT INTO CricketPlayers (PlayerID, PlayerName, Team, Role, MatchesPlayed, RunsScored, WicketsTaken) VALUES
(21, 'Anil Kumble', 'India', 'Bowler', 132, 2500, 619),
(22, 'Muttiah Muralitharan', 'Sri Lanka', 'Bowler', 133, 1250, 800),
(23, 'Shane Warne', 'Australia', 'Bowler', 145, 3000, 708),
(24, 'Glenn McGrath', 'Australia', 'Bowler', 124, 641, 563),
(25, 'Wasim Akram', 'Pakistan', 'Bowler', 104, 2898, 502),
(26, 'Curtly Ambrose', 'West Indies', 'Bowler', 98, 635, 405),
(27, 'Brett Lee', 'Australia', 'Bowler', 76, 870, 310),
(28, 'James Anderson', 'England', 'Bowler', 180, 1200, 650),
(29, 'Shaun Pollock', 'South Africa', 'Bowler', 108, 2000, 421),
(30, 'Zaheer Khan', 'India', 'Bowler', 92, 800, 311);

-- Query to verify data
SELECT * FROM CricketPlayers WHERE Role = 'Bowler';


-- Query to verify data
SELECT * FROM CricketPlayers;


SELECT PlayerName ,Team,Role,RunsScored
FROM CricketPlayers
WHERE RunsScored BETWEEN 5000 AND 13000;

SELECT PlayerName ,Team,Role,RunsScored
FROM CricketPlayers
order by RunsScored DESC
LIMIT 5;

-- ✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️
-- use of stored procedure in sql   
  DELIMITER &&
  CREATE PROCEDURE TOP_5_BATSMAN()
  BEGIN
   SELECT PlayerName ,Team,Role,RunsScored
   FROM CricketPlayers
   order by RunsScored DESC
   LIMIT 5;
   END && 
 DELIMITER ;
 -- THE OF CALLING THE USER DEFINED PROCEDURE
 -- ✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️
 CALL TOP_5_BATSMAN();
 
 DELIMITER &&
  CREATE PROCEDURE TOP_5_BOWLER()
  BEGIN
   SELECT PlayerName ,Team,Role,WicketsTaken
   FROM CricketPlayers
   order by WicketsTaken DESC
   LIMIT 5;
   END && 
 DELIMITER ;
 
 CALL TOP_5_BOWLER()
 
 -- ANOTHER TYPE OF STORED PROCEDURE  (IN STORED PROCEDURE)
 
 DELIMITER //
 CREATE PROCEDURE SORTBYBOWLERS(IN VAR INT)
 BEGIN
  SELECT PlayerName ,Team,Role,WicketsTaken
   FROM CricketPlayers
   order by WicketsTaken DESC
   LIMIT VAR;
   END //
DELIMITER ;
-- HERE WE CAN PASS PARAMETER / LIMIT 
CALL SORTBYBOWLERS(15);

SET SQL_SAFE_UPDATES = 0;

UPDATE  CricketPlayers 
SET MatchesPlayed= 182 , WicketsTaken=155
 where PlayerID= 2; 
 
-- multiple PARAMETER TYPE STORED PROCEDURE 
-- EXAMPLE --> UPDATE  STORED PROCEDURE
--  DELIMITER //
--  CREATE PROCEDURE updates_playerstats(IN matchesplayed INT, IN wicketstaken INT,IN playerid INT)
--  BEGIN 
--  UPDATE  CricketPlayers 
--  SET MatchesPlayed= matchesplayed , WicketsTaken=wicketstaken
--  where PlayerID=playerid ;
--  End //
--  DELIMITER ;
 
 

 
 -- Create the stored procedure
DELIMITER //
CREATE PROCEDURE UpdatePlayerStats (
    IN p_PlayerID INT,
    IN p_MatchesPlayed INT,
    IN p_WicketsTaken INT
)
BEGIN
    UPDATE CricketPlayers 
    SET MatchesPlayed = p_MatchesPlayed, 
        WicketsTaken = p_WicketsTaken
    WHERE PlayerID = p_PlayerID;
END //
DELIMITER ;

CALL UpdatePlayerStats(1, 300, 11);

 
 SELECT * FROM CricketPlayers;
 DELETE FROM CricketPlayers;
 SHOW CREATE TABLE CricketPlayers;
 DESC CricketPlayers;



 
 
  



