select * from students;
--1. insert a new student into the "Students" table with the following details:

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES
('John', 'Doe', '2000-01-15', 'john.doe@example.com', '1234567890');


--2. an SQL query to enroll a student in a course. 
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 2, '2024-09-29');


--3.Update the email address of a specific teacher in the "Teacher" table. 
UPDATE Teacher
SET email = 'catherine.newemail@example.com'
WHERE teacher_id = 3;
GO

--4.delete a specific enrollment record from the "Enrollments" table. 
DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 2;
GO

--5.Update the "Courses" table to assign a specific teacher to a course.
UPDATE Courses
SET teacher_id = 4
WHERE course_id = 3;
GO

--6.Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table.
DELETE FROM Payments
WHERE student_id = 1;

DELETE FROM Enrollments
WHERE student_id = 1;
GO

DELETE FROM Students
WHERE student_id = 1;
GO


--7.Update the payment amount for a specific payment record in the "Payments" table. 
UPDATE Payments
SET amount = 1600.00
WHERE payment_id = 1;

Select * from payments;
GO