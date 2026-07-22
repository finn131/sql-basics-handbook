<h1 align="center">📚 SQL Basic Queries</h1>

<p align="center">
Repository untuk belajar fundamental SQL mulai dari SELECT hingga GROUP BY dan HAVING.
</p>


## 📌 Deskripsi

Repository ini berisi kumpulan contoh query SQL dasar yang digunakan untuk mempelajari cara mengambil, memfilter, mengurutkan, dan menganalisis data menggunakan SQL. Dataset yang digunakan berupa tabel `students` dengan data dummy mahasiswa.

---

## 🚀 Features
Pembuatan database dan tabel (CREATE DATABASE, CREATE TABLE)
Insert data dummy (INSERT INTO)
Mengambil data (SELECT)
Menghilangkan data duplikat (DISTINCT)
Filtering data (WHERE, IN, LIKE, BETWEEN, IS NULL)
Sorting dan pembatasan data (ORDER BY, LIMIT)
Fungsi agregasi (COUNT, AVG, MIN, MAX)
Pengelompokan data (GROUP BY)
Filtering hasil agregasi (HAVING)
Memahami urutan eksekusi query SQL

## 🛠️ Tech Stack

<p> <img src="https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/> <img src="https://img.shields.io/badge/Database-Learning-orange?style=for-the-badge"/> </p>

## 📂 Project Structure
    learning-sql-basics/
    │
    ├── README.md
    └── script
        └── sql_basic_queries.sql

## 🗄️ Struktur Tabel

Tabel yang digunakan bernama `students` dengan struktur sebagai berikut:

| Kolom           | Tipe Data    | Keterangan                   |
| --------------- | ------------ | ---------------------------- |
| student_id      | INT          | Primary Key & Auto Increment |
| first_name      | VARCHAR(50)  | Nama depan mahasiswa         |
| last_name       | VARCHAR(50)  | Nama belakang mahasiswa      |
| major           | VARCHAR(50)  | Jurusan                      |
| gpa             | DECIMAL(3,2) | IPK mahasiswa                |
| age             | INT          | Umur mahasiswa               |
| enrollment_date | DATE         | Tanggal masuk                |
| status          | VARCHAR(20)  | Status mahasiswa             |

---

# 🔍 Query Dasar SQL

## 1. SELECT

Digunakan untuk mengambil data dari tabel.

```sql
SELECT * FROM students;
```

Mengambil seluruh data dari tabel.

```sql
SELECT first_name, last_name, gpa
FROM students;
```

Mengambil kolom tertentu saja.

---

## 2. DISTINCT

Digunakan untuk menghilangkan data duplikat.

```sql
SELECT DISTINCT major
FROM students;
```

Contoh output:

| major               |
| ------------------- |
| Computer Science    |
| Data Science        |
| Information Systems |

---

## 3. WHERE

Digunakan untuk melakukan filtering data berdasarkan kondisi tertentu.

```sql
SELECT *
FROM students
WHERE gpa > 3.50;
```

Menampilkan mahasiswa dengan IPK di atas 3.50.

---

## 4. IN

Digunakan untuk mencari data dengan beberapa nilai sekaligus.

```sql
SELECT first_name, major, gpa
FROM students
WHERE major IN ('Computer Science', 'Data Science');
```

---

## 5. LIKE

Digunakan untuk pencarian pola (pattern matching).

```sql
SELECT *
FROM students
WHERE first_name LIKE 'A%';
```

Menampilkan mahasiswa yang namanya diawali huruf **A**.

Beberapa wildcard:

| Simbol | Fungsi          |
| ------ | --------------- |
| `%`    | Banyak karakter |
| `_`    | Satu karakter   |

Contoh:

```sql
WHERE first_name LIKE '%a'
```

Nama yang diakhiri huruf **a**.

---

## 6. BETWEEN

Digunakan untuk mencari data dalam rentang tertentu.

```sql
SELECT first_name, age
FROM students
WHERE age BETWEEN 20 AND 22;
```

---

## 7. IS NULL

Digunakan untuk mengecek data yang belum memiliki nilai.

```sql
SELECT *
FROM students
WHERE gpa IS NULL;
```

Pada dataset ini, mahasiswa **Fani Raharja** memiliki nilai IPK `NULL`.

---

## 8. ORDER BY

Digunakan untuk mengurutkan data.

```sql
SELECT first_name, major, gpa
FROM students
ORDER BY gpa DESC;
```

Keterangan:

* `ASC` → Urutan kecil ke besar / A-Z
* `DESC` → Urutan besar ke kecil / Z-A

---

## 9. LIMIT

Digunakan untuk membatasi jumlah data yang ditampilkan.

```sql
SELECT first_name, major, gpa
FROM students
WHERE gpa IS NOT NULL
ORDER BY gpa DESC
LIMIT 3;
```

Menampilkan 3 mahasiswa dengan IPK tertinggi.

---

## 10. Aggregate Function

### COUNT()

Menghitung jumlah data.

```sql
SELECT COUNT(*)
FROM students;
```

### AVG()

Menghitung rata-rata.

```sql
SELECT AVG(gpa)
FROM students;
```

### MAX()

```sql
SELECT MAX(gpa)
FROM students;
```

### MIN()

```sql
SELECT MIN(gpa)
FROM students;
```

---

## 11. GROUP BY

Digunakan untuk mengelompokkan data.

```sql
SELECT
    major,
    COUNT(*) AS total_students,
    ROUND(AVG(gpa), 2) AS average_gpa
FROM students
GROUP BY major;
```

---

## 12. HAVING

Digunakan untuk melakukan filtering setelah proses `GROUP BY`.

```sql
SELECT
    major,
    COUNT(*) AS total_students,
    ROUND(AVG(gpa), 2) AS average_gpa
FROM students
WHERE status = 'Active'
GROUP BY major
HAVING average_gpa >= 3.50
ORDER BY average_gpa DESC;
```

---

# ⚙️ Urutan Eksekusi Query SQL

Meskipun kita menulis query seperti ini:

```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...
```

SQL sebenarnya mengeksekusinya dalam urutan berikut:

```text
FROM
↓
WHERE
↓
GROUP BY
↓
HAVING
↓
SELECT
↓
ORDER BY
↓
LIMIT
```

Memahami urutan ini sangat penting agar lebih mudah melakukan debugging dan membuat query yang kompleks.

---

## 📚 References
- SQL Documentation
- MySQL Documentation
- PostgreSQL Documentation

# 🎯 Kesimpulan

Materi dasar SQL yang dipelajari meliputi:

* Mengambil data menggunakan `SELECT`
* Menghilangkan duplikat dengan `DISTINCT`
* Memfilter data menggunakan `WHERE`
* Pattern matching dengan `LIKE`
* Filtering menggunakan `IN`, `BETWEEN`, dan `IS NULL`
* Mengurutkan data menggunakan `ORDER BY`
* Membatasi output dengan `LIMIT`
* Menggunakan fungsi agregasi (`COUNT`, `AVG`, `MAX`, `MIN`)
* Mengelompokkan data dengan `GROUP BY`
* Memfilter hasil agregasi menggunakan `HAVING`

Penguasaan query dasar ini merupakan fondasi sebelum mempelajari materi SQL yang lebih lanjut seperti `JOIN`, `Subquery`, `CTE`, `Window Function`, dan optimasi query.
