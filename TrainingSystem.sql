CREATE TABLE RecommendedAgeGroup
(  
    RecommendedAgeID CHAR(5) PRIMARY KEY,
	RecommendedAgeName VARCHAR(50) UNIQUE,
	RecommendedAgeExplain TEXT,
);

CREATE TABLE TrainingPlan
(  
    TrainingPlanID CHAR(5) PRIMARY KEY,
	TrainingCategoryID Char(5),
	TrainingCost decimal (5,2),
);

Create Table CourseCategory
(
	CourseCategoryID CHAR(5) PRIMARY KEY,
	CourseCateogryName VARCHAR(50) UNIQUE,
	CourseCategoryExplain TEXT,
);

Create Table TrainingCourse
(
	CourseID CHAR(5) PRIMARY KEY,
	CourseName VARCHAR(50),
	CourseCategoryCode Char(5),
);
Create Table TrainingPlanCourse
(
	TrainingPlanID CHAR(5),
	CourseCode CHAR(5),
);

Create Table TraineeAttendTraining
(
	TraineeID CHAR(5),
	TrainingPlanID CHAR(5),
);
Create Table TraineeInformation
(
	TraineeID CHAR(5) PRIMARY KEY,
	TraineeName VARCHAR(50),
	TraineeAge SMALLINT,
	TraineeAddress VARCHAR(50),
	TraineeGeneder VARCHAR(10),
);

Create Table Teacher
(
	TeacherID CHAR(5) PRIMARY KEY,
	TeacherName VARCHAR(50),
);
Create Table Teach
(
	TeacherID CHAR(5),
	CourseID CHAR(5),
);

INSERT
INTO TrainingCategory
VALUES
('00001','sports','Sport is commonly defined as an athletic activity that involves a degree of competition, such as netball or basketball. Some games and many kinds of racing are called sports. A professional at a sport is called an athlete. ... Some people like to watch other people play sports.'),
('00002','science','Science is the pursuit and application of knowledge and understanding of the natural and social world following a systematic methodology based on evidence. Scientific methodology includes the following: Objective observation: Measurement and data (possibly although not necessarily using mathematics as a tool) Evidence.'),
('00003','technology','Technology is the set of knowledge, skills, experience and techniques through which humans change, transform and use our environment in order to create tools, machines, products and services that meet our needs and desires. Etymologically the word comes from the Greek tekne (technical, art, skill) and logos (knowledge)');

INSERT
INTO TrainingPlan
VALUES
('10101','A','00001',400.12),
('10102','B','00002',600.11),
('10103','B','00002',650.31),
('10104','B','00002',670.10),
('10105','C','00003',420.01);



INSERT
INTO TrainingPlan
VALUES
('10106','A','00001',430.12),
('10107','A','00001',450.12);


INSERT
INTO CourseCategory
VALUES
('11111','basketball','Basketball is a game played between two teams of five players each on a rectangular court, usually indoors. Each team tries to score by tossing the ball through the opponents goal, an elevated horizontal hoop and net called a basket.'),
('11112','football','Football is a sport played by two teams of 11 players on a 120-yard, rectangular field with goal lines on each end. A football is an oval-like inflated ball usually made of cowhide or rubber.'),
('11113','swimming','is an individual or team racing sport that requires the use of ones entire body to move through water. ... Competitive swimming is one of the most popular Olympic sports, with varied distance events in butterfly, backstroke, breaststroke, freestyle, and individual medley'),
('11114','physics','Physics is the branch of science that deals with the structure of matter and how the fundamental constituents of the universe interact. It studies objects ranging from the very small using quantum mechanics to the entire universe using general relativity.');



INSERT
INTO TrainingCourse
VALUES
('99991','Enlightenment'),
('99992','Junior','11111','55556'),
('99993','Intermediate','11111','55557')



INSERT
INTO TraineeInformation
VALUES
('12121','Batis',20,'D1','Male'),
('12122','Omar',30,'D5','Male');

INSERT
INTO TraineeInformation
VALUES
('12125','Aisha',13,'D1','Female')


INSERT
INTO TraineeInformation
VALUES
('12123','Ali',25,'E1','Male'),
('12124','Mohammed',22,'C1','Male');


INSERT
INTO TraineeAttendTraining
VALUES
('12123','10101'),
('12124','10102');


select *
from TraineeInformation

select *
from TraineeAttendTraining

select *
from TrainingPlan

select *
from TrainingPlanCourse


select *
from TrainingCourse

select *
from CourseCategory


ALTER TABLE TrainingPlan
ADD FOREIGN KEY (TrainingCategoryCode) REFERENCES TrainingCategory(TrainingCategoryCode);

ALTER TABLE TrainingCourse
ADD FOREIGN KEY (CourseCategoryCode) REFERENCES CourseCategory(CourseCategoryCode);

ALTER TABLE TrainingPlanCourse
ADD FOREIGN KEY (TrainingPlanCode) REFERENCES TrainingPlan(TrainingPlanCode);

ALTER TABLE TrainingPlanCourse
ADD FOREIGN KEY (CourseCode) REFERENCES TrainingCourse(CourseCode);


ALTER TABLE TraineeAttendTraining
ADD FOREIGN KEY (TraineeCode) REFERENCES TraineeInformation(TraineeCode);

ALTER TABLE TraineeAttendTraining
ADD FOREIGN KEY (TrainingPlanCode) REFERENCES TrainingPlan(TrainingPlanCode);

ALTER TABLE Teach
ADD FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID);


ALTER TABLE Teach
ADD FOREIGN KEY (CourseID) REFERENCES TrainingCourse(CourseID);


select *
from TraineeInformation

select *
from TrainingPlan

select *
from TraineeAttendTraining

select *
from RecommendedAgeGroup

select *
from CourseCategory

select *
from TrainingCourse

select *
from teacher

select *
from teach

select *
from TrainingPlanCourse



UPDATE TrainingCourse
SET
CourseHours = 30, CourseCredits = 4;


create view N_Trainees as
select count(TraineeID) as NumberOfTrainee
from TraineeInformation;


select * from N_Trainees;


create proc GetAddress
	@TraineeAddress varchar(50)
AS
SELECT * FROM TraineeInformation
where TraineeAddress like @TraineeAddress+'%';
Go

EXEC GetAddress 'D1'


create view N_Trainees as
select count(TraineeID) as NumberOfTrainee
from TraineeInformation;



create view Trainee as
select TraineeName, TraineeAge
from TraineeInformation;



create proc StudentsBelongToCourses
	@CourseName varchar(50)
AS
SELECT * 
FROM TrainingCourse,TrainingPlan;
where TraineeAddress like @TraineeAddress+'%';
Go
EXEC GetAddress 'D1'


create proc GetAddress
	@TraineeID char(5)
AS
SELECT TraineeAddress FROM TraineeInformation
where TraineeID like @TraineeID+'%';
Go

EXEC GetAddress '12121'
EXEC GetAddress '12122';
select * from TraineeInformation;

/*views*/

create view Instructors as
select TeacherName, CourseName
from Teacher T, TrainingCourse C, Teach e
where T.TeacherID = e.TeacherID and e.CourseID = C.CourseID



select * from N_PlanCourses
select * from Instructors
select * from Trainee;
select * from N_Trainees
select* from TraineeInformation

create proc TraineeDetails
	@TraineeID char(5) =NULL
AS
SELECT * FROM TraineeInformation
where TraineeID like ISNULL( @TraineeID+'%',TraineeID)
Go

create proc CoursesInCategory
	@CourseCategoryName varchar(50) =NULL
AS
SELECT CourseName FROM TrainingCourse T,CourseCategory C
where C.CourseCategoryID = T.CourseCategoryID and C.CourseCateogryName like ISNULL(@CourseCategoryName+'%',C.CourseCateogryName)
Go

EXEC CoursesInCategory 'Art';
EXEC CoursesInCategory 'Sport';
EXEC CoursesInCategory;


EXEC GetAddress 'D1';

EXEC TraineeDetails '12121';


create proc CourseInstructor
	@CourseName varchar(50) =NULL
AS
SELECT TeacherName FROM TrainingCourse T,teach e,teacher I
where I.TeacherID = e.TeacherID and e.CourseID = T.CourseID and T.CourseName like ISNULL(@CourseName+'%',T.CourseName)
Go

EXEC CourseInstructor 'Football';
EXEC CourseInstructor 'Chemistry';
EXEC CourseInstructor;


create proc PlanCost
	@TrainingPlanID char(5) =NULL
AS
SELECT TrainingCost FROM TrainingPlan
where TrainingPlanID like ISNULL(@TrainingPlanID+'%',TrainingPlanID)
Go

EXEC PlanCost '10102';




INSERT
INTO TraineeInformation
VALUES
('12126','Tom',20,'D1','Male');

select * from TraineeInformation

INSERT
INTO TraineeAttendTraining
VALUES
('12126','10101');

select * from TraineeAttendTraining



INSERT
INTO CourseCategory
VALUES
('11115','Music','Music is a form of art that uses sound organised in time. Music is also a form of entertainment that puts sounds together in a way that people like, find interesting or dance to');

select * from CourseCategory


INSERT
INTO TrainingCourse
VALUES
('55551','Jazz','11115',35,5),
('55552','Hip-Hop','11115',35,5);

select * from TrainingCourse

DELETE FROM CourseCategory WHERE CourseCateogryName = 'Music';

UPDATE TrainingCourse
SET CourseName = 'Rock', CourseHours= 20
WHERE CourseID = '55552';

select * from TrainingCourse

DELETE FROM TraineeAttendTraining WHERE Trainee  = 'Music';

INSERT
INTO Teacher
VALUES
('00007','Dainel');

select * from Teacher;


DELETE FROM TrainingCourse WHERE CourseName = 'Rock';

select * from TrainingCourse;



select T.TraineeID, T.TraineeName
from TraineeInformation T,TraineeAttendTraining A, TrainingPlanCourse C, TrainingCourse o, CourseCategory g
where T.TraineeID = A.TraineeID and A.TrainingPlanID = C.TrainingPlanID  and C.CourseID = o.CourseID and o.CourseCategoryID = g.CourseCategoryID and g.CourseCateogryName = 'Art';



select * from CourseCategory


create view N_PlanCourses as
select TrainingPlanID, count(CourseID) as N_Courses
from TrainingPlanCourse
group by TrainingPlanID

select * from N_PlanCourses