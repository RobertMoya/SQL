/*    
Project Option: <FASTCABS> 
Purpose: CREATE VIEWS 
Author: ROBERT MOYA AND JENSEN GASTELUM 
 */

SPOOL view.txt
SET linesize 5000;

--a)The names and phone numbers of the Managers at each office.
DROP VIEW MANAGERS;
CREATE VIEW MANAGERS AS
SELECT e.firstName || ' ' || e.lastName AS MANAGER, a.phoneNumber, l.address || ' ' || l.officeid AS OFFICE_AND_OFFICEID
FROM MANAGER a, OFFICE l, STAFF e
WHERE e.employeeID = a.employeeID
AND a.OfficeId = l.OfficeId;

--b)The names of all female drivers based in the Glasgow office.
DROP VIEW FEMALE_GLASGOW;
CREATE VIEW FEMALE_GLASGOW AS
SELECT e.firstName || ' ' || e.lastName AS EMPLOYEE, l.address || ' ' || l.officeid AS OFFICE_AND_OFFICEID
FROM TaxiDriver a, OFFICE l, STAFF e
WHERE e.officeID = l.officeID
AND e.gender LIKE '%F%'
AND a.employeeId = e.employeeId
AND l.address LIKE '%Glasgow%';

--c)The total number of staff at each office.
DROP VIEW STAFF_PER_OFFICE;
CREATE VIEW STAFF_PER_OFFICE AS
SELECT a.officeID,  count(*) AS NUMBER_OF_EMPLOYEES, l.address
FROM STAFF a, OFFICE l
where a.officeId = l.officeId
GROUP BY a.officeId, l.address;

--d)The details of all taxis at the Glasgow office.
DROP VIEW TAXIS_GLASGOW;
CREATE VIEW TAXIS_GLASGOW AS
SELECT a.taxiId, a.registered AS registered, e.firstName || ' ' || e.lastName AS OWNER, l.address || ' ' || l.officeid AS LOCATION_OF_TAXI
FROM Taxi a, OFFICE l, STAFF e
WHERE e.officeId = l.officeId
AND e.employeeId = a.employeeId
AND a.registered LIKE '%Y%'
AND l.address LIKE '%Glasgow%';

--e)The total number of W registered taxis.
DROP VIEW TOTAL_W_TAXIS;
CREATE VIEW TOTAL_W_TAXIS AS
SELECT registered, count(*) AS total_registered  
FROM Taxi 
WHERE registered LIKE '%Y%'
GROUP BY registered;

--f)The number of drivers allocated to each taxi.
DROP VIEW DRIVERS_ALLC;
CREATE VIEW DRIVERS_ALLC AS
SELECT a.officeID,  count(*) AS NUMBER_OF_EMPLOYEES, l.address
FROM STAFF a, OFFICE l
where a.officeId = l.officeId
GROUP BY a.officeId, l.address;

--g)The name and number of owners with more than one taxi.
DROP VIEW OWNERS_MORE_THEN_ONE_TAXI;
CREATE VIEW OWNERS_MORE_THEN_ONE_TAXI AS
SELECT t.employeeId AS EMP#, a.firstName, a.lastName, count(*) AS NUMBER_OF_TAXIS
FROM STAFF a, Taxi t
WHERE a.employeeId = t.employeeId
GROUP BY t.employeeId, a.firstName, a.lastName
HAVING count(*) > 1;

--h)The full address of all business clients in Glasgow.
DROP VIEW GLASGOW_BUSINESS;
CREATE VIEW GLASGOW_BUSINESS AS
SELECT businessName, address, clientId
FROM Business
WHERE address LIKE '%Glasgow%'
GROUP BY businessName, address, clientId;

--i)The details of the current contracts with business clients in Glasgow.
DROP VIEW GLASGOW_BUSINESS_INFO;
CREATE VIEW GLASGOW_BUSINESS_INFO AS
SELECT a.businessName, a.address, a.clientId, b.officeId, b.contractNumber, b.fixedRatePerJob
FROM Business a, Contract b
WHERE address LIKE '%Glasgow%'
AND a.clientId = b.clientId
GROUP BY a.businessName, a.address, a.clientId, b.officeId, b.contractNumber, b.fixedRatePerJob;

--j)The total number of private clients in each city.
DROP VIEW PRIVATE_CLIENTS_PER_CITIES;
CREATE VIEW PRIVATE_CLIENTS_PER_CITIES AS
SELECT city, count(*) AS NUMBER_OF_CLIENTS
FROM PRIVATE
GROUP BY city;

--k)The details of jobs undertaken by a driver on a given day.
DROP VIEW DAILY_DETAIL;
CREATE VIEW DAILY_DETAIL AS
SELECT employeeId, JobDetails, dropOffDate
FROM Job
WHERE UPPER(employeeId) = UPPER('&employeeId')
AND dropOffDate = (DATE '&dropOffDate');

--l)The names of drivers who are over 55 years old.
DROP VIEW STAFF_55_OVER;
CREATE VIEW STAFF_55_OVER AS
SELECT DOB, ((ROUND(MONTHS_BETWEEN ( SYSDATE, DOB),0))/12) AS AGE
FROM STAFF
WHERE 55 <=  ((ROUND(MONTHS_BETWEEN ( SYSDATE, DOB),0))/12);

--m)The names and numbers of private clients who hired a taxi in November 2000.
DROP VIEW NOV_2000_PRIV;
CREATE VIEW NOV_2000_PRIV AS
SELECT a.jobId, b.firstname, b.lastname, a.clientPhoneNumber, a.pickUpDate
FROM Job a, Private b
WHERE a.clientId = b.clientId
AND Round(DATE '2000-11-11','MONTH')=  ROUND(a.pickupdate,'MONTH');

--n)The names and addresses of private clients who have hired a taxi more than three times.
DROP VIEW TAXI_PRIVATE_THREE_PLUS;
CREATE VIEW TAXI_PRIVATE_THREE_PLUS AS
SELECT count(*) AS NUMBER_OF_TAXIS_HIRED, b.clientId, b.firstName, b.lastName
FROM Job a, Private b
WHERE b.clientId = a.clientId
GROUP BY b.clientId, b.firstName, b.lastName
HAVING count(*) > 3;

--o)The average number of miles driven during a job.
DROP VIEW AVERAGE_MILES;
CREATE VIEW AVERAGE_MILES AS
SELECT AVG(MILAGE) AS AVERAGE_MILAGE_PER_JOB
FROM JOB;

--p)The total number of jobs allocated to each car.
DROP VIEW JOBS_PER_TAXI;
CREATE VIEW JOBS_PER_TAXI AS
SELECT taxiId, count(*) AS JOBS_ALLOCATED
FROM JOB
GROUP BY taxiId;

--q)The total number of jobs allocated to each driver.
DROP VIEW JOBS_PER_DRIVER;
CREATE VIEW JOBS_PER_DRIVER AS
SELECT a.employeeId , b.firstName, b.lastName, count(*) AS JOBS_ALLOCATED
FROM JOB a, STAFF b
WHERE a.employeeId = b.employeeId
GROUP BY a.employeeId, b.firstName, b.lastName;

--r)The total amount charged for each car in November 2000.
DROP VIEW CHARGED_NOV_2000;
CREATE VIEW CHARGED_NOV_2000 AS
SELECT  TO_CHAR(SUM(amountCharged),'$999,999.00') AS TOTAL_CHARGED_NOV_2000
FROM Job
WHERE Round(DATE '2000-11-11','MONTH') =  ROUND(pickupdate,'MONTH');

--s)The total number of jobs and miles driven for a given contract.
DROP VIEW JOBS_MILES_PER_CONTRACT;
CREATE VIEW JOBS_MILES_PER_CONTRACT AS
SELECT contractNumber, sum(milage) AS TOTAL_MILAGE, count(*) AS JOBS
FROM Job
WHERE contractNumber IS NOT NULL
GROUP BY contractNumber;

-- stop sending output to file  
SPOOL OFF
