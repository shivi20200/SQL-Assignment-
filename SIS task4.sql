SELECT  AVG(student_count) AS average_students_per_course
FROM ( SELECT course_id, COUNT(student_id) AS student_count                 --1
  FROM Enrollments GROUP BY course_id) AS course_enrollments;



SELECT S.student_id, S.first_name, S.last_name, P.amount
FROM Students S
JOIN Payments P ON S.student_id = P.student_id                               --2
WHERE P.amount = (SELECT MAX(amount) FROM Payments);
GO

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrollment_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name
HAVING COUNT(E.student_id) = (                                                --3
    SELECT MAX(enrollment_count) 
    FROM (
        SELECT COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery
);
GO

SELECT  T.teacher_id, T.first_name, T.last_name, 
    (SELECT SUM(P.amount)
     FROM Payments P
     JOIN Enrollments E ON P.student_id = E.student_id
     JOIN Courses C ON E.course_id = C.course_id                               --4
     WHERE C.teacher_id = T.teacher_id
    ) AS total_payments
FROM Teacher T;
	GO



SELECT  S.student_id,  S.first_name,  S.last_name
FROM  Students S
WHERE (SELECT COUNT(E.course_id)                                                 --5
     FROM Enrollments E
     WHERE E.student_id = S.student_id ) = (SELECT COUNT(C.course_id) FROM Courses C);


SELECT T.teacher_id, T.first_name, T.last_name
FROM Teacher T
WHERE T.teacher_id NOT IN (
    SELECT C.teacher_id                                              --6
    FROM Courses C
);

SELECT AVG(age) AS average_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age                 --7
    FROM Students
) AS student_ages;


SELECT C.course_id, C.course_name
FROM Courses C                                                                 --8
WHERE C.course_id NOT IN (
    SELECT E.course_id
    FROM Enrollments E
);

SELECT  S.student_id, S.first_name,  S.last_name,  C.course_id,  C.course_name, 
    COALESCE(SUM(P.amount), 0) AS total_payments
FROM Students S                                                                       --9
JOIN  Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
LEFT JOIN  Payments P ON S.student_id = P.student_id
GROUP BY  S.student_id,  S.first_name,  S.last_name,  C.course_id,  C.course_name;

	
	
SELECT S.student_id, S.first_name, S.last_name
FROM Students S
WHERE  (SELECT COUNT(P.payment_id) FROM Payments P                            --10
WHERE P.student_id = S.student_id) > 1;

	
SELECT S.student_id, S.first_name, S.last_name, 
COALESCE(SUM(P.amount), 0) AS total_payments
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id                              --11
GROUP BY  S.student_id,  S.first_name,  S.last_name;



SELECT  C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C                                                                     --12
LEFT JOIN  Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;

	
	
SELECT  S.student_id,  S.first_name,  S.last_name, 
  COALESCE(AVG(P.amount), 0) AS average_payment
FROM  Students S                                                                    --13
LEFT JOIN  Payments P ON S.student_id = P.student_id
GROUP BY  S.student_id,   S.first_name,   S.last_name;
