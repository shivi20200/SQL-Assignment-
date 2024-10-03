--1.to calculate the total payments made by a specific student.

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 2
GROUP BY s.first_name, s.last_name;
GO

--2. retrieve a list of courses along with the count of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
GO

--3. find the names of students who have not enrolled in any course. 
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
GO

--4. retrieve the first name, last name of students, and the names of the courses they are enrolled in.
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;
GO

--5.list the names of teachers and the courses they are assigned to.
SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id;
GO

--6.Retrieve a list of students and their enrollment dates for a specific course.
SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Mathematics'; 
GO

--7.Find the names of students who have not made any payments. 
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;
GO

--8.Write a query to identify courses that have no enrollments.
SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
GO

--9.. Identify students who are enrolled in more than one course.
SELECT DISTINCT e1.student_id, s.first_name, s.last_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id AND e1.course_id <> e2.course_id
JOIN Students s ON e1.student_id = s.student_id;
GO

--10.Find teachers who are not assigned to any courses.
SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;
GO