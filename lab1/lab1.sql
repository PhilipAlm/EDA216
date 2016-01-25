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