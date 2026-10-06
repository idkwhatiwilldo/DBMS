-- Practical 7: ER Design and Mapping to Relational Tables
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

DROP TABLE IF EXISTS IssueRecord;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Category;

CREATE TABLE Category (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(40) NOT NULL
);
CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Designation VARCHAR(30)
);
CREATE TABLE Book (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Author VARCHAR(60),
  Publisher VARCHAR(60),
  CategoryID INT,
  CONSTRAINT fk_book_category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE Member (
  MemberID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(60) UNIQUE,
  Phone VARCHAR(15),
  RegisteredBy INT,
  CONSTRAINT fk_member_staff FOREIGN KEY (RegisteredBy) REFERENCES Staff(StaffID)
);
CREATE TABLE IssueRecord (
  BookID INT,
  MemberID INT,
  IssueDate DATE NOT NULL,
  DueDate DATE,
  ReturnDate DATE,
  PRIMARY KEY (BookID, MemberID, IssueDate),
  CONSTRAINT fk_issue_book FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT fk_issue_member FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

DESCRIBE IssueRecord;

