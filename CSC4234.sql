CREATE TABLE Tutor (
 tutorNo char(5) NOT NULL,
 firstName varchar(25) NOT NULL,
 lastName varchar(25) NOT NULL,
 street varchar(25) NOT NULL,
 city char(25) NOT NULL,
 zipCode char(5) NOT NULL,
 phoneNumber char(10),
 PRIMARY KEY (tutorNo)
);

CREATE TABLE Student (
 studentID char(5) NOT NULL,
 firstName varchar(25) NOT NULL,
 lastName varchar(25) NOT NULL,
 street varchar(25) NOT NULL,
 city char(25) NOT NULL,
 zipCode char(5) NOT NULL,
 phoneNumber char(10),
 feePaid int DEFAULT 0,
 PRIMARY KEY (studentID)
);




CREATE TABLE Course (
 courseCode char(5) NOT NULL,
 courseName varchar(100) NOT NULL,
 description varchar(255),
 PRIMARY KEY (courseCode) 
 );
  
 CREATE TABLE CourseSection (
  courseCode char(5) NOT NULL,
  sectionNo char(5) NOT NULL,
  startDate date NOT NULL,
  endDate date NOT NULL,
  daysOfWeek varchar(11) NOT NULL, -- This must be in the form 'MTuWThFSaSu' meaning Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday. IE "TuTh" Means class meets on Tuesdays and Thursdays
  startTime char(9) NOT NULL, --All dates are hhh:mm:ss to be compatible with non-oracle time datatypes
  duration char(9) NOT NULL,
  tutorNo char(5) NOT NULL,
  maxStudents int NOT NULL,
  PRIMARY KEY (courseCode,sectionNo),
  FOREIGN KEY (courseCode) REFERENCES Course (courseCode),
  FOREIGN KEY (tutorNo) REFERENCES Tutor (tutorNo)
 );
 
 
 
CREATE TABLE EnrollmentLog (
 courseCode char(5) NOT NULL,
 sectionNo char(5) NOT NULL,
 studentID char(5) NOT NULL,
 PRIMARY KEY (courseCode,sectionNo,studentID),
 FOREIGN KEY (courseCode,sectionNo) REFERENCES CourseSection (courseCode,sectionNo),
 FOREIGN KEY (studentID) REFERENCES Student (studentID)
);


INSERT INTO Tutor
VALUES('T0001', 'John','Smith','SW 9th Ave.','Coral Gables','33143','3055055324');

INSERT INTO Tutor
VALUES('T0002', 'Martha','Stein','SW 57th Ave.','South Miami','33146','3055234324');

INSERT INTO Tutor
VALUES('T0003', 'James','Baker','Eisenhower Blvd.','Kendall','33132','7869380072');

INSERT INTO Tutor
VALUES('T0004', 'Juan','Martinez','Ponce de Leon Blvd.','Coral Gables','33145','3054432436');

INSERT INTO Tutor
VALUES('T0005', 'Tracy','Johnson','Tamiami Trl.','Hialeah','33130','7862397024');


INSERT INTO Student (studentID,firstName,lastName,street,city,zipCode,phoneNumber)
VALUES('S0010','John','Yelsoi',' ',' ','80027','303030300')

INSERT INTO Student (studentID,firstName,lastName,street,city,zipCode,phoneNumber)
VALUES('S0001', 'Rich','Pendleton','Flagler St.','Miami','33129','7863450975');

INSERT INTO Student (studentID,firstName,lastName,street,city,zipCode,phoneNumber)
VALUES('S0002', 'Patricia','Gates','Johnson St.','Cutler Bay','33127','9232249574');

INSERT INTO Student (studentID,firstName,lastName,street,city,zipCode,phoneNumber)
VALUES('S0003', 'Gabby','Reichert','SW. 82nd Ave.','South Miami','33143','3055504973');

INSERT INTO Student (studentID,firstName,lastName,street,city,zipCode,phoneNumber)
VALUES('S0004', 'Maria','Perez','SW 57th Ave.','Miami','33143','7863443599');

INSERT INTO Student (studentID,firstName,lastName,street,city,zipCode,phoneNumber)
VALUES('S0005', 'William','Geitner','Miller Ave.','Coral Gables','33146','3051348872');


INSERT INTO Course
VALUES('MT001','Introduction to Calculus','A broad overview of the principles of calculus');

INSERT INTO Course
VALUES('AP001','Introduction to Digging Up Your Ancestors','A broad overview of the principles of Anthropology and Archaeology');

INSERT INTO Course
VALUES('SP001','Spanish Level 1','A broad overview of conversational Spanish -- designed for students with no prior Spanish abilities');

INSERT INTO Course
VALUES('SP002','Spanish Level 2','An intermediate Spanish course covering verb conjugation and novice level vocabulary');

INSERT INTO Course
VALUES('FR001','French Level 1','A broad overview of conversational French -- designed for students with no prior French abilities');





INSERT INTO CourseSection
VALUES('SP001','00001',to_date('2020-10-01','yyyy-mm-dd'),to_date('2021-03-01','yyyy-mm-dd'),'M','008:00:00','001:30:00','T0003',25);

INSERT INTO CourseSection
VALUES('SP001','00002',to_date('2020-10-01', 'yyyy-mm-dd'),to_date('2021-03-01', 'yyyy-mm-dd'),'M','014:00:00','001:15:00','T0002',20);

INSERT INTO CourseSection
VALUES('SP001','00003',to_date('2020-10-01','yyyy-mm-dd'), to_date('2021-03-01','yyyy-mm-dd'),'W','014:00:00','001:15:00','T0003',25);

INSERT INTO CourseSection
VALUES('AP001','00001',to_date('2020-10-01','yyyy-mm-dd'),to_date('2020-12-31','yyyy-mm-dd'),'Tu','018:00:00','002:15:00','T0004',15);

INSERT INTO CourseSection
VALUES('AP001','00002',to_date('2020-10-01','yyyy-mm-dd'),to_date('2021-12-31','yyyy-mm-dd'),'W','018:00:00','002:15:00','T0005',25);

INSERT INTO CourseSection
VALUES('AP001','00003',to_date('2021-01-01','yyyy-mm-dd'),to_date('2020-03-01','yyyy-mm-dd'),'Tu','018:00:00','002:15:00','T0004',15);

INSERT INTO CourseSection
VALUES('AP001','00004',to_date('2021-01-01','yyyy-mm-dd'),to_date('2021-03-01','yyyy-mm-dd'),'W','018:00:00','002:15:00','T0005',25);

INSERT INTO CourseSection
VALUES('AP001','00005',to_date('2021-04-01','yyyy-mm-dd'),to_date('2020-06-01','yyyy-mm-dd'),'Tu','018:00:00','002:15:00','T0004',15);

INSERT INTO CourseSection
VALUES('AP001','00006',to_date('2021-04-01','yyyy-mm-dd'),to_date('2021-06-01','yyyy-mm-dd'),'W','018:00:00','002:15:00','T0005',25);

INSERT INTO CourseSection
VALUES('AP001','00007',to_date('2021-08-01','yyyy-mm-dd'),to_date('2021-08-08','yyyy-mm-dd'),'MTuWThFSaSu','08:00:00','008:00:00','T0005',50);

INSERT INTO CourseSection
VALUES('FR001','00001',to_date('2020-10-01','yyyy-mm-dd'),to_date('2021-12-12','yyyy-mm-dd'),'TuTh','010:30:00','000:50:00','T0001',20);

INSERT INTO CourseSection
VALUES('SP002','00001',to_date('2020-10-01','yyyy-mm-dd'),to_date('2021-12-12','yyyy-mm-dd'),'MW','012:00:00','000:50:00','T0001',20);

INSERT INTO EnrollmentLog
VALUES('SP002','00001','S0001');

INSERT INTO EnrollmentLog
VALUES('AP001','00006','S0002');

INSERT INTO EnrollmentLog
VALUES('SP001','00003','S0003');

INSERT INTO EnrollmentLog
VALUES('FR001','00001','S0004');

INSERT INTO EnrollmentLog
VALUES('SP001','00001','S0005');


-- 5 Queries. These are also included in the embedded sql file


SELECT s.StudentID, firstName, lastName
FROM EnrollmentLog e, Student s, Course c
WHERE e.studentID = s.studentID AND e.courseCode = c.courseCode AND courseName = 'Spanish Level 2' AND feePaid = 0 ;


SELECT DISTINCT t.tutorNo, firstName, lastName 
FROM  Tutor t, CourseSection s, Course c
WHERE s.tutorNo = t.tutorNo AND s.courseCode = c.courseCode AND courseName = 'Spanish Level 1';

SELECT firstName, lastName, phoneNumber
FROM EnrollmentLog e, Course c, CourseSection f, Student s
WHERE e.studentID = s.studentID AND f.courseCode= e.courseCode AND e.courseCode=c.courseCode AND e.sectionNo = f.sectionNo AND c.courseName = 'Spanish Level 1' AND f.startTime='008:00:00'

SELECT s.sectionNo, courseName, firstName, lastName, startDate
FROM CourseSection s, Course c, Tutor t
WHERE c.courseCode = s.courseCode AND s.tutorNo = t.tutorNo AND daysOfWeek = 'Tu'

SELECT  COUNT(*) AS NumStudent
FROM EnrollmentLog e, CourseSection s, Course c
WHERE s.courseCode=e.courseCode AND e.sectionNo = s.sectionNo AND c.courseCode = s.courseCode AND c.courseName = 'Spanish Level 1' 
