USE student_mgmt;

-- Teachers
INSERT INTO teachers (first_name, last_name, email, phone, hire_date)
VALUES
('Rajesh','Kumar','rajesh.k@example.com','9000000001','2023-06-01'),
('Anita','Shah','anita.s@example.com','9000000002','2024-01-10');

-- Courses
INSERT INTO courses (course_code, course_name, description, credits, teacher_id)
VALUES
('CS101','Computer Fundamentals','Intro to computers and programming',3,1),
('DB201','Database Systems','Relational Databases and SQL',4,2);

-- Students
INSERT INTO students (first_name, last_name, dob, gender, email, phone, join_date, class)
VALUES
('Pavani','Kunchala','2003-05-12','F','pavani.k@example.com','7386325587','2021-06-15','BSc MPCs'),
('Ravi','Kumar','2002-10-30','M','ravi.k@example.com','9000001111','2021-06-15','BSc MPCs');

-- Enrollments
INSERT INTO enrollments (student_id, course_id, enroll_date)
VALUES
(1,1,'2024-07-01'),
(1,2,'2024-07-01'),
(2,1,'2024-07-01');

-- Grades
INSERT INTO grades (enrollment_id, assessment_name, score, max_score, grade)
VALUES
(1,'Midterm',78,100,'B'),
(2,'Midterm',85,100,'A'),
(3,'Midterm',65,100,'C');

-- Attendance
INSERT INTO attendance (student_id, course_id, attendance_date, status)
VALUES
(1,1,'2024-09-01','present'),
(1,2,'2024-09-01','present'),
(2,1,'2024-09-01','absent');
