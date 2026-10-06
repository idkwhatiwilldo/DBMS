-- Practical 8: Normalization through 1NF, 2NF, 3NF and BCNF
-- Conceptual decomposition from StudentEnrollment:
-- 0NF -> 1NF(StudentID, StudentName, CourseID, CourseName, Instructor, Room, Grade)
-- 2NF -> Student, Course, Enrollment
-- 3NF -> Student, Course, InstructorRoom, Enrollment
-- BCNF case study -> TeacherSubject(Teacher, Subject), StudentTeacher(Student, Teacher)

CREATE DATABASE IF NOT EXISTS NormalizationDemo;
USE NormalizationDemo;

DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS InstructorRoom;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
  StudentID VARCHAR(10) PRIMARY KEY,
  StudentName VARCHAR(50) NOT NULL
);

CREATE TABLE InstructorRoom (
  Instructor VARCHAR(50) PRIMARY KEY,
  Room VARCHAR(10)
);

CREATE TABLE Course (
  CourseID VARCHAR(10) PRIMARY KEY,
  CourseName VARCHAR(50) NOT NULL,
  Instructor VARCHAR(50),
  CONSTRAINT fk_course_instructor FOREIGN KEY (Instructor)
    REFERENCES InstructorRoom(Instructor)
);

CREATE TABLE Enrollment (
  StudentID VARCHAR(10),
  CourseID VARCHAR(10),
  Grade CHAR(2),
  PRIMARY KEY (StudentID, CourseID),
  CONSTRAINT fk_enr_student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  CONSTRAINT fk_enr_course FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

DESCRIBE Student;
DESCRIBE InstructorRoom;
DESCRIBE Course;
DESCRIBE Enrollment;

