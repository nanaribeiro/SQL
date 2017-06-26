--Exercises

--1 - Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%';

--2 - Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u';

--3 - Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city like '[aeiouAEIOU]%[aeiouAEIOU]';

--4 - Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city not like '[aeiouAEIOU]%';

--5 - Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city not like '%[aeiouAEIOU]';

--6 - Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city not like '[aeiouAEIOU]%[aeiouAEIOU]';

--7 - Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
--Solution:
select distinct city from station where city not like '[aeiouAEIOU]%' and city not like '%[aeiouAEIOU]';

--8 - Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
--If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
--Solution:
select name from students where marks > 75 order by RIGHT(name,3), id asc;

--9 - Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
--Solution:
select name from employee order by NAME;

--10 - Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 
--per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
--Solution:
select name from employee where salary > 2000 and months < 10 order by employee_id ASC;