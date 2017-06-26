--Exercises

--1 - Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.
--Solution:
select * from city where population > 100000 and countrycode = 'USA';

--2 - Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.
--Solution:
select name from city where population > 120000 and countrycode = 'USA';

--3 - Query all columns (attributes) for every row in the CITY table.
--Solution:
select * from city;

--4 - Query all columns for a city in CITY with the ID 1661.
--Solution:
select * from city where ID = 1661;

--5 - Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
--Solution:
select * from city where countrycode = 'JPN';

--6 - Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
--Solution:
select name from city where countrycode = 'JPN';

--7 - Query a list of CITY and STATE from the STATION table.
--Solution:
select city, state from station;

--8 - Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.
--Solution:
select distinct city from station where ID%2 = 0;

--9 - Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; query the value of N - N' from STATION. In other words, 
--    find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
--Solution:
select (select count(city) from station) - (select count(distinct city) from station) as DIFFERENCE

--10 - Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
--     If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
--Solution:
SELECT TOP 1 city,
       LEN(city)  AS Longest
FROM   station
WHERE  LEN(city) = (
           SELECT MAX(LEN(city))
           FROM   station
       )
ORDER BY city;              
SELECT TOP 1 city,
       LEN(city) AS Shortest
FROM   station
WHERE  LEN(city) = (
           SELECT MIN(LEN(city))
           FROM   station
       )
ORDER BY city;