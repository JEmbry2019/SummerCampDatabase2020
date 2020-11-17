-- CREATE DATABASE--


CREATE DATABASE SummerCampNov16;
GO
USE SummerCampNov16

/******************************************************   Create Tables   ******************************************************/
/* Campers, Guardians, Camper_Guardians, Counselors, CPR_Training, Games, Meals, Camper_Meals  */

DROP TABLE IF EXISTS Campers

CREATE TABLE Campers(
CamperId int PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL,
Grade VARCHAR (20) NOT NULL,
HasAllergy Bit NOT NULL,
Age int,
)


DROP TABLE IF EXISTS Guardians

CREATE TABLE Guardians(
GuardianId int PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR (100) NOT NULL,
Relationship VARCHAR (25),
PrimaryphoneNumber VARCHAR(25) NOT NULL,
EnroleDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
)



---Campers Guardians Bridge Table MANY to MANY ---
DROP TABLE IF EXISTS Camper_Guardians

CREATE TABLE Camper_Guardians (
	CamperID int FOREIGN KEY REFERENCES Campers(CamperId),
	GuardianId int FOREIGN KEY REFERENCES Guardians(GuardianId)
	CONSTRAINT CamperGuardians_pk PRIMARY KEY (CamperId, GuardianId),
)




DROP TABLE IF EXISTS Counselors

CREATE TABLE Counselors (
	CounselorId int PRIMARY KEY,
	GradeLevel VARCHAR(10),
	FirstName VARCHAR(240) NOT NULL,
	LastName VARCHAR(240) NOT NULL,
	SalaryPerHr MONEY 
)


-- One to Many -- One Training Many Counselors --

DROP TABLE IF EXISTS CPR_Training

CREATE TABLE CPR_Training (
	CPR_Id int PRIMARY KEY,
	LevelOne VARCHAR(10),
	LevelTwo VARCHAR(10),
	CampCounselorId  int NOT NULL,
	CONSTRAINT fk_CampCounselor FOREIGN KEY (CampCounselorId)
	REFERENCES Counselors(CounselorId)

)


DROP TABLE IF EXISTS Games

CREATE TABLE Games(
	GameId int PRIMARY KEY,
	Title VARCHAR(200) NOT NULL,
	Grade VARCHAR(100),
	[Location] VARCHAR (100),
	GameCounselorId  int NOT NULL,
	[HoursWorked] int,
	CONSTRAINT fk_GameCounselor FOREIGN KEY (GameCounselorId)
	REFERENCES Counselors(CounselorId)
)



DROP TABLE IF EXISTS Meals

CREATE TABLE Meals(
MealId int PRIMARY KEY,
MealType VARCHAR (240),
[Cafeteria] VARCHAR (100)
)

---Campers Meals Bridge Table MANY to MANY ---
DROP TABLE IF EXISTS Camper_Meals

CREATE TABLE Camper_Meals (
	CamperID int FOREIGN KEY REFERENCES Campers(CamperId),
	MealId int FOREIGN KEY REFERENCES Meals(MealId)
	CONSTRAINT CamperMeals_pk PRIMARY KEY (CamperId, MealId),
)


Select *
From Camper_Meals




/*************************************************************   Insert Data    **************************************************/

--  CAMPERS TABLE  --
INSERT INTO Campers(CamperId,FirstName, LastName, Grade, HasAllergy, Age)
VALUES
	(1, 'Bob', 'Smith', '6', 1, 10),
	(2, 'Sam', 'Jones', '7', 0, 12),
	(3, 'Trey', 'Thomas', '8',1, 13),

    (4, 'Gustave', 'Valsler', '8', 1, 13),
	(5, 'Karoline', 'Brompton', '7', 0, 11),
	(6, 'Alethea', 'Bispham', '6', 0, 10),
	(7, 'Gerrie', 'Manthroppe', '7', 1, 12),
	(8, 'Durante', 'Ilem', '7', 0, 12),
	(9, 'Lexie', 'Cape', '8', 0, 14),
	(10, 'Eldin', 'Cape', '6', 1, 10),
	(11, 'Hetty', 'Gowdy', '7', 0, 12),
	(12, 'Drona', 'Crain', '6', 1, 11),
	(13, 'Artair', 'Crain', '7', 0, 12),
	(14, 'Skippie', 'Peak', '6', 0, 10),
	(15, 'Marley', 'Chenery', '6', 1, 11),
	(16, 'Lucias', 'Long', '7', 1, 12),
	(17, 'Kellby', 'Long', '7', 0, 13),
	(18, 'Michelle', 'Snel', '7', 0, 12),
	(19, 'Lucian', 'Pridie', '7', 1, 13),
	(20, 'Clare', 'Goodness', '6', 0, 10),
	(21, 'Cal', 'Goodness', '6', 0, 11), 
	(22, 'Jeniffer', 'Askaw', '8', 1, 14),
	(23, 'Sally', 'Strong', '6', 0, 10),
	(24, 'Pancho', 'Payfoot', '7', 0, 12),
	(25, 'Hancho', 'Payfoot', '7', 0, 13)

SELECT *
FROM Campers


--  GUARDIANS TABLE  --
INSERT INTO Guardians(GuardianId, FirstName, LastName, Relationship, PrimaryphoneNumber)
VALUES
	(100, 'John', 'Smith', 'Father', '(502) 111-1111'),
	(101, 'Jane', 'Smith', 'Mother', '(502) 111-2222'),
	(102, 'Sarah', 'Ham', 'Mother', '(502) 222-1111'),
	(103, 'Thelma', 'Thomas', 'Mother', '(502) 333-1111'),
	(104, 'Tom', 'Thomas', 'Father', '(502) 333-2222'),

	(105, 'Augustus', 'Sygroves', 'Stepfather', '(702)-376-6981'),
	(106, 'Glory', 'Younglove', 'Mother', '(602)-730-9633'),
	(107, 'Burlie' , 'Tea', 'Grandparent', '(278)-187-5060' ),
	(108, 'Kamila', 'Crowson' , 'Stepmother', '(602)-457-1894' ),
	(109, 'James', 'Cape', 'Father', '(602) 475-9223'),
	(110, 'Julie', 'Cape', 'Mother', '(602) 829-0628'),
	(111, 'Rosaline', 'Crain', 'Mother', '(329) 596-4229'),
	(112, 'Marvin', 'Crain', 'Father', '(317) 136-3130'),
	(113, 'Cosmo', 'Long', 'Father', '(702) 331-8156'),
	(114, 'Tybi', 'Long', 'Mother', '(702) 689-1047'),

	(115, 'Marvin', 'Melt', 'Grandparent', '(602) 133-3130'),
	(116, 'Calvin', 'Prdie', 'Father', '(390) 131-8156'),
	(117, 'Graace', 'Goodness', 'Grandparent', '(859) 669-1047'),
	(118, 'James', 'Askaw', 'Father', '(502) 222-8877'),
	(119, 'Sara', 'Strong', 'Grandparent', '(502) 999-8877'),
	(120, 'Lilly', 'Payfoot', 'Mother', '(303) 987-8967'),
	(121, 'Sam', 'Payfoot', 'Father', '(303) 987-8968')
	

SELECT *
FROM Guardians


---Campers Guardians Bridge Table MANY to MANY ---
INSERT INTO Camper_Guardians(CamperID, GuardianId)
VALUES
	(1, 100),
	(1, 101),
	(2, 102),
	(3, 103),
	(3, 104),
	(4, 105),
	(5, 106),
	(6, 107),
	(7, 108),
	(8, 108),
	(9, 109),
	(9, 110),
	(10, 109),
	(10, 110),
	(11, 110),
	(12, 111),
	(12, 112),
	(13, 111),
	(13, 112),
	(14, 115),
	(15, 113),
	(15, 114),
	(16, 113),
	(16, 114),
	(17, 113),
	(17, 114),
	(18, 115),
	(19, 116),
	(20, 117),
	(21, 117),
	(22, 118),
	(23, 119),
	(24, 120),
	(24, 121),
	(25, 120),
	(25, 121)

SELECT *	
FROM Camper_Guardians



--  COUNSELORS TABLE  --
INSERT INTO Counselors (CounselorId, GradeLevel, FirstName, LastName, SalaryPerHr )
VALUES
	(6001, '6', 'Zane', 'Shaul', 10),
	(6002, '6', 'Shurlock', 'Rodda', 12),
	(6003, '6', 'Cy', 'Duckering', 14),
	(7001, '7', 'Inglis', 'Crame', 12),
	(7002, '7', 'Nikolai', 'Franckton', 10),
	(7003, '7', 'Worthington', 'Moyes', 14),
	(8001, '8', 'Valma', 'Durham', 12),
	(8002, '8', 'Isidora', 'Mosson', 14),
	(8003, '8', 'Guillaume', 'Beedle', 16),
	(9001, '9', 'Addam', 'Apple', 8),
	(9002, '9', 'Allie', 'Appleton', 12),
	(9003, '9', 'Alex', 'Applegate', 20),
	(1010, '10', 'Bob', 'Brown', 20)


	

Select *
FROM Counselors


--  GAMES TABLE  --
INSERT INTO Games(GameCounselorId, GameId, Title, Grade, [Location], [HoursWorked])
VALUES
	(6001, 1, 'BBall','6', 'Gym1', 30),
	(6002, 2, 'Soccer', '6', 'Field1', 40),
	(6003, 3, 'Computer', '6', 'Lab1', 20),
	(7001, 4, 'BBall','7', 'Gym2', 30),
	(7002, 5, 'Soccer', '7', 'Field2', 40),
	(7003, 6, 'Computer', '7', 'Lab2', 20),
	(8001, 7, 'BBall','8', 'Gym3', 25),
	(8002, 8, 'Soccer', '8', 'Field3', 35),
	(8003, 9, 'Computer', '8', 'Lab3', 40),

-- 9th Grade --
	(9001, 10, 'BBall', '9', 'Gym4', 30),
	(9002, 11, 'BaseBall', '9', 'Lab4', 35),
	(9003, 12, 'VBall', '9', 'Lab4', 40),

-- Extra programs --
	(6001, 13, 'ART1','6', 'Cafe1', 20),
	(7001, 14, 'ART2','7', 'Cafe1', 25),
	(8001, 15, 'ART2','8', 'Cafe1', 30),
	(1010, 16, 'BBall', '10', 'Gym3', 10)

SELECT *
FROM Games

--  MEALS TABLE  --
INSERT INTO Meals(MealId, MealType, Cafeteria)
VALUES
	(0, 'Standard', 'Cafe1'),
	(1, 'Veggie', 'Cafe2')

SELECT *
FROM Meals

--  CAMPERS_MEALS TABLE  --
INSERT INTO Camper_Meals
VALUES
	
	(1, 1),
	
	(3, 1),

	(5, 0),
	(6, 0),
	(7, 1),
	(8, 1),
	(9, 0),
	(10, 0),
	(11, 1),
	(12, 0),
	(13, 1),
	(14, 0),
	(15, 0),
	(16, 1),
	(17, 1),
	(18, 0),
	(19, 0),
	(20, 1),
	(21, 0),
	(22, 0),
	(23, 1),
	(24, 0),
	(25, 0)


SELECT *
FROM Camper_Meals


--  CPR_TRAINING TABLE  --
INSERT INTO CPR_Training (CampCounselorId, CPR_Id, LevelOne, LevelTwo)
VALUES
	(6001, 1, 'Yes', 'Yes'),
	
	(6003, 3, 'Yes', NULL),
	(7001, 4, 'Yes', 'Yes'),
	
	(7003, 5, 'Yes', 'Yes'),
	(8001, 6, 'Yes', 'Yes'),
	
	(8003, 8, 'Yes', NULL),

	(9001, 9, 'Yes', NULL)

Select *
FROM CPR_Training


/************************************************************* SELECT Statements  ******************************************/

-- SELECT using a WHERE CLAUSE --

SELECT GameCounselorId, GameId, Title, Grade, [Location]
FROM Games
WHERE Location = 'Cafe1'

-- SELECT using an OR and an AND OPERATOR --

SELECT *
FROM Campers
WHERE (Grade = 7 OR Grade = 8) AND Age > 12

-- SELECT using IS NOT NULL --

SELECT *
FROM CPR_Training
WHERE LevelTwo IS NOT NULL



/************************************************************  DML Statements  *********************************************/
-- DELETE with a WHERE CLAUSE and a VARIABLE --
DECLARE @gradeNum VARCHAR(25) = 9
DELETE
FROM Games
WHERE @gradeNum = Grade

SELECT *
FROM Games

-- UPDATE with WHERE CLAUSE and a VARIABLE --

Declare @relate varchar(25) = 'Mom';
UPDATE Guardians
   SET Relationship = @relate
      
 WHERE Relationship = 'Mother'



--DELETE ROW that another Table References during a Transaction.---

/*
Deleted Code
INSERT INTO Counselors (CounselorId, GradeLevel, FirstName, LastName )
VALUES
(9001, '9', 'Adam', 'Apple')

INSERT INTO CPR_Training (CampCounselorId, CPR_Id)
VALUES
	(9001, 9)
*/
BEGIN TRANSACTION 
  
	DELETE FROM CPR_Training
	WHERE CampCounselorId = 9001


	DELETE FROM Counselors
	WHERE CounselorId = 9001
  
COMMIT;


/*************************************************************** JOINS *******************************************/

--JOINS Counselor and Games by Grade Level --

SELECT  c.FirstName, c.LastName, c.GradeLevel, g.Title
FROM Counselors c
JOIN Games g
ON c.GradeLevel = g.Grade

---Design a NONCLUSTERED INDEX with ONE KEY COLUMN that improves the performance on LEFT JOIN Counselors NO CPR Training--------------

CREATE NONCLUSTERED INDEX IX_CPRID
ON CPR_Training
(
CPR_ID

)
--  LEFT JOIN Counselors NO CPR Training----
SELECT c.FirstName, c.LastName, cpr.CPR_Id
FROM Counselors c
LEFT JOIN CPR_Training cpr
ON cpr.CampCounselorId = c.CounselorId
WHERE cpr.CampCounselorId IS NULL



-- Join 3 Tables Campers, Camper_Meals, Meals --
Select c.FirstName, c.LastName, m.MealType, m.Cafeteria
FROM Campers c
LEFT JOIN Camper_Meals cm 
ON c.CamperId = cm.CamperId
LEFT JOIN Meals m
ON m.MealId = cm.MealId
Order by  m.MealId, c.LastName


/*******************************************************  More Selects  *******************************************/

-- SELECT Query utilizes a VARIABLE in the WHERE clause --

DECLARE @grands varchar(25) = 'Grandparent'
SELECT * 
FROM Guardians
WHERE Relationship = 'Grandparent'
ORDER BY LastName

-- SELECT Query utilizes an ORDER BY clause --

SELECT FirstName, LastName
FROM Campers
Order By  LastName, FirstName



-- SELECT Query utilizes a GROUP BY and Aggregate Function (COUNT() ) --
SELECT AGE, COUNT(*) AS Total
FROM Campers

GROUP BY AGE 


-- SELECT Query utilizes a Calculated Field (concatenate) --
 SELECT FirstName +' ' +  LastName + ' has an allergy!'
  FROM Campers
  WHERE HasAllergy > 0


-- SELECT Query utilizes a Subquery --

---Design a NONCLUSTERED INDEX with TWO KEY COLUMNS that improves the performance of the AVG Salary Per Hour query------------------

CREATE NONCLUSTERED INDEX IX_Counselors_Salary_Per_Hour
ON Counselors
(
SalaryPerHr,
LastName
)

SELECT LastName, FirstName, SalaryPerHr
FROM Counselors
  WHERE SalaryPerHr > (
      SELECT AVG(SalaryPerHr) 
	  FROM Counselors

	   )

--SELECT Query utilizes a Join , 2 Operators, and a GROUP BY with an Aggregate --

SELECT AVG(g.HoursWorked) AS AverageHours, c.GradeLevel
FROM Games g
FULL JOIN Counselors c
ON g.GameCounselorId = c.CounselorId
WHERE c.GradeLevel < 11 AND g.HoursWorked > 5
GROUP BY c.GradeLevel


-- SELECT Query utilizes a Join with 3 Tables, 2 Operators, and a GROUP BY with an Aggregate and a HAVING Clause --
---Design a NONCLUSTERED INDEX with at least 1 KEY COLUMN and 1 INCLUDE COLUMN that improves the performance of a query------------------

CREATE NONCLUSTERED INDEX IX_NumGuardian_CamperAge
ON Campers
(
Age
)
INCLUDE (LastName);

SELECT COUNT(cg.guardianID) AS NumGuardians,  c.FirstName, c.LastName, MAX(c.Age) AS Age, MAX(g.PrimaryphoneNumber) AS PrimaryNumber
FROM Campers c
FULL JOIN Camper_Guardians cg
ON c.CamperId = cg.CamperID
FULL JOIN Guardians g
ON cg.GuardianId= g.GuardianId 
GROUP BY c.FirstName,  c.LastName
HAVING COUNT(cg.guardianID) > 0 AND Max(c.Age) < 15

