-- a)
SELECT firstname, lastname
FROM students;

-- b)

SELECT firstname, lastname 
FROM students
ORDER BY lastname; -- /firstname

-- c)

SELECT *
FROM students
WHERE pnbr LIKE '85%';

-- d) 

SELECT *
FROM students
WHERE mod(substring(pnbr,10,1),2) = 0;

-- substring(string, start pos, length of the string)

-- e)

SELECT count(*) 
FROM students;

-- f)

SELECT *
FROM courses
WHERE coursecode LIKE 'FMA%';

-- g)

SELECT *
FROM courses 
WHERE credits > 7.5;

-- h)

SELECT count(*) 
FROM courses
WHERE level = 'A'; -- same for 'G2', 'G1'

-- i)

SELECT coursecode
FROM takencourses
WHERE pNbr = '910101-1234';

-- j)

SELECT coursename,credits
FROM courses
JOIN takencourses on (takencourses.coursecode = courses.coursecode)
WHERE takencourses.pnbr = '910101-1234';

-- k)

SELECT sum(credits)
FROM courses 
JOIN takencourses on (takencourses.coursecode = courses.coursecode)
WHERE takencourses.pnbr = '910101-1234';

-- l)

SELECT avg(grade)
FROM takencourses
JOIN courses on (takencourses.coursecode = courses.coursecode)
WHERE takencourses.pnbr = '910101-1234';

-- m) 

SELECT coursecode
FROM takencourses
JOIN students on (takencourses.pnbr = students.pnbr)
WHERE students.firstname ='Eva' and students.lastname = 'Alm';

SELECT coursename, credits
FROM courses
JOIN takencourses on (takencourses.coursecode = courses.coursecode)
JOIN students on (takencourses.pnbr = students.pnbr)
WHERE students.firstname = 'Eva' and students.lastname = 'Alm';

SELECT sum(credits)
FROM courses
JOIN takencourses t on (t.coursecode = courses.coursecode)
JOIN students s on (s.pnbr = t.pnbr)
WHERE s.firstname = 'Eva' and s.lastname = 'Alm';

SELECT avg(grade)
FROM courses c
JOIN takencourses t on (t.coursecode = c.coursecode)
JOIN students s on (s.pnbr = t.pnbr)
WHERE s.firstname = 'Eva' and s.lastname = 'Alm';

-- n)

SELECT * 
FROM students s
JOIN takencourses t on (t.pnbr = s.pnbr)
JOIN courses c on (c.coursecode = t.coursecode)
WHERE credits = 0;

-- o)

o) Which students have the highest grade average? Advice: define and use a view that
gives the person number and grade average for each student.

CREATE VIEW averagegrade as
SELECT avg(grade), pnbr
FROM students s
JOIN takencourses t on (t.pnbr = s.pnbr);

SELECT max(grade)
FROM averagegrade;




/*

mysql> describe takencourses;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| pNbr       | char(11) | NO   | PRI |         |       |
| courseCode | char(6)  | NO   | PRI |         |       |
| grade      | int(11)  | NO   |     | NULL    |       |
+------------+----------+------+-----+---------+-------+
3 rows in set (0,02 sec)

mysql> describe courses;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| courseCode | char(6)     | NO   | PRI |         |       |
| courseName | varchar(70) | NO   |     | NULL    |       |
| level      | char(2)     | YES  |     | NULL    |       |
| credits    | double      | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0,07 sec)

mysql> describe students;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| pNbr      | char(11)    | NO   | PRI |         |       |
| firstName | varchar(20) | NO   |     | NULL    |       |
| lastName  | varchar(20) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0,02 sec)
*/





