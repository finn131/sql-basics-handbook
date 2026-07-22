-- ============================================================================
-- SQL BASIC QUERIES DUMP & PRACTICE SCRIPT
-- Topic: Fundamental SQL, Filtering, Aggregation, and Order of Execution
-- ============================================================================

-- 1. SETUP DATABASE & TABLE
CREATE DATABASE IF NOT EXISTS data_analyst_db;
USE data_analyst_db;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    major VARCHAR(50),
    gpa DECIMAL(3, 2),
    age INT,
    enrollment_date DATE,
    status VARCHAR(20) DEFAULT 'Active'
);

-- 2. INSERT DUMMY DATA
INSERT INTO students (first_name, last_name, major, gpa, age, enrollment_date, status) VALUES
('Adit', 'Pratama', 'Computer Science', 3.85, 21, '2022-08-15', 'Active'),
('Siti', 'Azzahra', 'Data Science', 3.90, 20, '2023-01-10', 'Active'),
('Budi', 'Santoso', 'Computer Science', 2.95, 22, '2021-08-15', 'Inactive'),
('Citra', 'Dewi', 'Information Systems', 3.40, 21, '2022-08-15', 'Active'),
('Eko', 'Kurniawan', 'Data Science', 3.10, 23, '2020-08-20', 'Graduated'),
('Fani', 'Raharja', 'Information Systems', NULL, 19, '2024-01-15', 'Active'),
('Gita', 'Gutawa', 'Computer Science', 3.75, 20, '2023-08-15', 'Active'),
('Hadi', 'Wijaya', 'Data Science', 2.80, 22, '2021-08-15', 'Inactive');

-- ============================================================================
-- 3. QUERY EXAMPLES & PRACTICE PROBLEMS
-- ============================================================================

-- [A] RETRIEVING DATA (SELECT & DISTINCT)
-- Ambil semua data
SELECT * FROM students;

-- Ambil nama dan IPK saja
SELECT first_name, last_name, gpa FROM students;

-- Ambil daftar jurusan tanpa duplikat
SELECT DISTINCT major FROM students;


-- [B] FILTERING DATA (WHERE, LIKE, IN, BETWEEN, IS NULL)
-- Filter IPK di atas 3.50
SELECT * FROM students 
WHERE gpa > 3.50;

-- Filter jurusan Computer Science atau Data Science menggunakan IN
SELECT first_name, major, gpa 
FROM students 
WHERE major IN ('Computer Science', 'Data Science');

-- Mencari mahasiswa yang punya nama depan berawalan huruf 'A' (Pattern Matching)
SELECT * FROM students 
WHERE first_name LIKE 'A%';

-- Mencari mahasiswa dengan rentang umur 20 - 22 tahun
SELECT first_name, age 
FROM students 
WHERE age BETWEEN 20 AND 22;

-- Cek mahasiswa yang data IPK-nya belum diisi (NULL)
SELECT * FROM students 
WHERE gpa IS NULL;


-- [C] SORTING & LIMITING (ORDER BY & LIMIT)
-- Tampilkan 3 mahasiswa dengan IPK tertinggi
SELECT first_name, major, gpa 
FROM students 
WHERE gpa IS NOT NULL
ORDER BY gpa DESC 
LIMIT 3;


-- [D] AGGREGATION & GROUPING (GROUP BY & HAVING)
-- Hitung total mahasiswa dan rata-rata IPK per jurusan
SELECT 
    major, 
    COUNT(*) AS total_students, 
    ROUND(AVG(gpa), 2) AS average_gpa
FROM students
WHERE status = 'Active'
GROUP BY major
HAVING average_gpa >= 3.50
ORDER BY average_gpa DESC;