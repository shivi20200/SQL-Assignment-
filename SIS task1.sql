--database SISDB creation
-- 5 tables Students,Teachers,Courses,Enrollment,Payments
--1. create database "SISDB"
CREATE DATABASE SISDB;
GO

USE SISDB;
GO

--2. schema defined
CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone_number NVARCHAR(15)
);
GO
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL
);
GO


CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name NVARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
GO
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
GO
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
GO

--5. Insert 10 sample records in each table
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Jack', 'Doey', '2000-01-11', 'jack.doey@example.com', '1234567899'),
('Jane', 'Smith', '1999-05-22', 'jane.smith@example.com', '2345678901'),
('Emily', 'Jones', '2001-07-30', 'emily.jones@example.com', '3456789012'),
('Michael', 'Brown', '2000-03-14', 'michael.brown@example.com', '4567890123'),
('Sarah', 'Davis', '1998-11-09', 'sarah.davis@example.com', '5678901234'),
('David', 'Wilson', '2002-02-20', 'david.wilson@example.com', '6789012345'),
('Laura', 'Garcia', '1997-12-01', 'laura.garcia@example.com', '7890123456'),
('James', 'Martinez', '2000-08-19', 'james.martinez@example.com', '8901234567'),
('Linda', 'Anderson', '2001-10-03', 'linda.anderson@example.com', '9012345678'),
('Robert', 'Taylor', '1996-04-25', 'robert.taylor@example.com', '0123456789');
GO
INSERT INTO Teacher (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Lee', 'bob.lee@example.com'),
('Catherine', 'White', 'catherine.white@example.com'),
('Daniel', 'Miller', 'daniel.miller@example.com'),
('Eva', 'Harris', 'eva.harris@example.com'),
('Frank', 'Clark', 'frank.clark@example.com'),
('Grace', 'Lewis', 'grace.lewis@example.com'),
('Henry', 'Walker', 'henry.walker@example.com'),
('Ivy', 'Hall', 'ivy.hall@example.com'),
('Jack', 'Allen', 'jack.allen@example.com');
GO

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 3, 1),
('Physics', 4, 2),
('Chemistry', 3, 3),
('Biology', 4, 4),
('History', 3, 5),
('Literature', 2, 6),
('Computer Science', 4, 7),
('Art', 2, 8),
('Music', 2, 9),
('Economics', 3, 10);
GO

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-09-01'),
(2, 1, '2023-09-01'),
(3, 2, '2023-09-01'),
(4, 3, '2023-09-02'),
(5, 4, '2023-09-02'),
(6, 5, '2023-09-03'),
(7, 6, '2023-09-04'),
(8, 7, '2023-09-04'),
(9, 8, '2023-09-05'),
(10, 9, '2023-09-05');
GO

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 1500.00, '2023-09-10'),
(2, 1500.00, '2023-09-10'),
(3, 1600.00, '2023-09-11'),
(4, 1600.00, '2023-09-11'),
(5, 1700.00, '2023-09-12'),
(6, 1800.00, '2023-09-12'),
(7, 1400.00, '2023-09-13'),
(8, 1400.00, '2023-09-13'),
(9, 1300.00, '2023-09-14'),
(10, 1200.00, '2023-09-14');
GO





