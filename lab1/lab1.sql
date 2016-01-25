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








