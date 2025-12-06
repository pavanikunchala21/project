-- List all students
SELECT * FROM students;

-- Get student with enrollments and courses
SELECT s.student_id, s.first_name, s.last_name, c.course_code, c.course_name, e.enroll_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id = 1;

-- Add a new student
INSERT INTO students (first_name, last_name, dob, gender, email, phone, class)
VALUES ('Sita','Rao','2004-02-14','F','sita.r@example.com','9000002222','BSc MPCs');

-- Enroll a student to a course
INSERT INTO enrollments (student_id, course_id) VALUES (3,1);

-- Update student's phone
UPDATE students SET phone = '9999999999' WHERE student_id = 3;

-- Soft drop (mark enrollment dropped)
UPDATE enrollments SET status='dropped' WHERE enrollment_id = 3;

-- Student grade report
SELECT s.student_id, CONCAT(s.first_name,' ',s.last_name) AS student_name,
       c.course_code, c.course_name, g.assessment_name, g.score, g.max_score, g.grade
FROM grades g
JOIN enrollments e ON g.enrollment_id = e.enrollment_id
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id = 1;

-- Course roster with attendance rate (example)
SELECT c.course_id, c.course_name,
       s.student_id, CONCAT(s.first_name,' ',s.last_name) as student,
       SUM(CASE WHEN a.status='present' THEN 1 ELSE 0 END) as presents,
       COUNT(a.attendance_id) as total_days,
       ROUND(SUM(CASE WHEN a.status='present' THEN 1 ELSE 0 END) / GREATEST(COUNT(a.attendance_id),1) * 100,2) as attendance_pct
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
LEFT JOIN attendance a ON a.student_id = s.student_id AND a.course_id = c.course_id
WHERE c.course_id = 1
GROUP BY s.student_id;
