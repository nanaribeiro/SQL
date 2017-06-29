--Exercises
-- 1 - Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

--Equilateral: It's a triangle with  sides of equal length.
--Isosceles: It's a triangle with  sides of equal length.
--Scalene: It's a triangle with  sides of differing lengths.
--Not A Triangle: The given values of A, B, and C don't form a triangle.

--Solution:
SELECT CASE 
            WHEN A + B <= C THEN 'Not A Triangle'
            WHEN A = B AND A             = C THEN 'Equilateral'
            WHEN A = B OR A = C OR B     = C THEN 'Isosceles'
            ELSE 'Scalene'
       END AS RESULTADO
FROM   Triangles;

-- 2 - Generate the following two result sets:

--a. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses).
--For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
--b. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 

--There are a total of [occupation_count] [occupation]s.
--where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same
--[occupation_count], they should be ordered alphabetically.

--Solution:
--A)
SELECT CONCAT(NAME, '(', LEFT(occupation, 1), ')') AS result
FROM   occupations
ORDER BY
       NAME;
--B)
SELECT CONCAT(
           'There are total ',
           COUNT(occupation),
           ' ',
           LOWER(occupation),
           's.'
       ) AS oc
FROM   occupations
GROUP BY
       occupation
ORDER BY
       COUNT(occupation) ASC
       
--3 - Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers
--should be Doctor, Professor, Singer, and Actor, respectively.
       
--Note: Print NULL when there are no more names corresponding to an occupation.
       
--Solution:
       WITH cte AS (
           SELECT RANK() OVER(PARTITION BY Occupation ORDER BY NAME) AS RANK,
                  CASE 
                       WHEN Occupation = 'Doctor' THEN NAME
                       ELSE NULL
                  END  AS doctor,
                  CASE 
                       WHEN Occupation = 'Professor' THEN NAME
                       ELSE NULL
                  END  AS prof,
                  CASE 
                       WHEN Occupation = 'Singer' THEN NAME
                       ELSE NULL
                  END  AS singer,
                  CASE 
                       WHEN Occupation = 'Actor' THEN NAME
                       ELSE NULL
                  END  AS actor
           FROM   Occupations
       )

SELECT MIN(doctor),
       MIN(prof),
       MIN(singer),
       MIN(actor)
FROM   cte
GROUP BY
       RANK
       
--4 - Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
--	Root: If node is root node.
--	Leaf: If node is leaf node.
--	Inner: If node is neither root nor leaf node.

--Solution:
SELECT n,
       CASE 
            WHEN p IS NULL THEN 'Root'
            WHEN n IN (SELECT B1.P
                       FROM   BST B1
                              JOIN BST B2
                                   ON  B1.P = B2.N) THEN 'Inner'
            ELSE 'Leaf'
       END
FROM   bst
ORDER BY
       n;
       
--5 - Write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of 
--employees. Order your output by ascending company_code.

--Note:
--The tables may contain duplicate records.
--The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10,
--and C_2.

--Solution:
SELECT Company.company_code,
       Company.founder,
       COUNT(DISTINCT employee.lead_manager_code),
       COUNT(DISTINCT employee.senior_manager_code),
       COUNT(DISTINCT employee.manager_code),
       COUNT(DISTINCT employee.employee_code)
FROM   company
       JOIN employee
            ON  employee.company_code = Company.company_code
GROUP BY
       Company.company_code,
       Company.founder
ORDER BY
       Company.company_code ASC