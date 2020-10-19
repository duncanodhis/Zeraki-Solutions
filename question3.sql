/*
creating database Education ,tables in it Institution,Course,Student 
*/
CREATE DATABASE  Education;

USE Education;

CREATE TABLE IF NOT EXISTS Institution(
    institutionid  INT(11) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250)

  );
CREATE TABLE IF NOT EXISTS Course (
       courseid  INT(11) AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(250),
       institution INT(11),
       FOREIGN KEY (institution) REFERENCES Institution(institutionid)
        ON UPDATE RESTRICT ON DELETE CASCADE

  );
 CREATE TABLE IF NOT EXISTS Student (
    studentid INT(11) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250),
    course INT(11),
    FOREIGN KEY (course) REFERENCES  Course(courseid)
    ON UPDATE RESTRICT ON DELETE CASCADE


  );
/* 
Doing some basic insertion for testing the question that follows 

*/
/*
INSERT INTO Institution(institutionid,name) VALUES(1,'JKUAT');
INSERT INTO Institution(institutionid,name) VALUES(2,'UON');
INSERT INTO Institution(institutionid,name) VALUES(3,'MU');

INSERT INTO Course(courseid,name,institution) VALUES (1,'MCS',1);
INSERT INTO Course(courseid,name,institution) VALUES (2,'CS',2);
INSERT INTO Course(courseid,name,institution) VALUES (3,'MC',3);

INSERT INTO Student(studentid,name,course) VALUES (1,'duncan',1);
INSERT INTO Student(studentid,name,course) VALUES (2,'dun',2);
INSERT INTO Student(studentid,name,course) VALUES (3,'duniel',3);

INSERT INTO Institution(institutionid,name) VALUES(4,'JKUAT');
INSERT INTO Institution(institutionid,name) VALUES(5,'UON');
INSERT INTO Institution(institutionid,name) VALUES(6,'MU');

INSERT INTO Course(courseid,name,institution) VALUES (4,'MCS',4);
INSERT INTO Course(courseid,name,institution) VALUES (5,'CS',5);
INSERT INTO Course(courseid,name,institution) VALUES (6,'MC',6);

INSERT INTO Student(studentid,name,course) VALUES (4,'JAC',4);
INSERT INTO Student(studentid,name,course) VALUES (5,'NEL',5);
INSERT INTO Student(studentid,name,course) VALUES (6,'PEER',6);
*/

/*
a MySQL query that will display the number of students per course per institution 
*/
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT Institution.name AS 'INSTITUTION NAME ',Course.name AS 'COURSE NAME ',COUNT(DISTINCT Student.studentid) AS 'NUMBER OF STUDENTS'
FROM Institution,Course,Student
WHERE Student.course=Course.courseid AND Course.institution= Institution.institutionid
GROUP BY Institution.name
