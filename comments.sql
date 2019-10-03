/*
Project Option: <FASTCABS> 
Purpose: CREATE COMMENTS FOR TABLES AND ATTRIBUTES  
Author: ROBERT MOYA 
 */

COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED
SET LINESIZE 132
SET PAGESIZE 55

--Table Office
COMMENT ON TABLE Office IS 'Offices of FastCabs';
COMMENT ON COLUMN Office.officeID IS 'Unique office identifier';
COMMENT ON COLUMN Office.address IS 'Address of office location';
COMMENT ON COLUMN Office.employeeID IS 'Employee identification number';

--Table Staff
COMMENT ON TABLE Staff IS 'staff members of FastCabs';
COMMENT ON COLUMN Staff.employeeID IS 'Employee identification number';
COMMENT ON COLUMN Staff.firstName IS 'Employee first name';
COMMENT ON COLUMN Staff.lastName IS 'Employee last name';
COMMENT ON COLUMN Staff.gender IS 'Employee gender male or female';
COMMENT ON COLUMN Staff.DOB IS 'Employee date of birth';
COMMENT ON COLUMN Staff.officeID IS 'Unique office identifier';

--Table Manager
COMMENT ON TABLE Manager IS 'Manager information';
COMMENT ON COLUMN Manager.phoneNumber IS 'Manager contact number';
COMMENT ON COLUMN Manager.officeid IS 'Office ID manager oversees';
COMMENT ON COLUMN Manager.employeeID IS 'Employee Identification number';

--Table Taxi
COMMENT ON TABLE Taxi IS 'Taxi information';
COMMENT ON COLUMN Taxi.taxiID IS 'Taxi identification number';
COMMENT ON COLUMN Taxi.registered IS 'Indication if taxi is registered';
COMMENT ON COLUMN Taxi.employeeID IS 'Emplee Identification number';

--Table Job
COMMENT ON TABLE Job IS 'Job perfromed by FastCabs';
COMMENT ON COLUMN Job.JobID IS 'Job Identification number';
COMMENT ON COLUMN Job.clientPhoneNumber IS 'Clients phone number';
COMMENT ON COLUMN Job.pickUpDate IS 'Pickup date and time';
COMMENT ON COLUMN Job.dropOffDate IS 'Drop off date and time';
COMMENT ON COLUMN Job.amountCharged IS 'Amount charged for job';
COMMENT ON COLUMN Job.contractNumber IS 'Unique contract number (Business only)';
COMMENT ON COLUMN Job.milage IS 'Milage amount for job';
COMMENT ON COLUMN Job.jobDetails IS 'Job details/comments';
COMMENT ON COLUMN Job.employeeId IS 'Employee Identification number';
COMMENT ON COLUMN Job.clientId IS 'Client Identification number';
COMMENT ON COLUMN Job.taxiId IS 'Taxi Identification number';

--Table Contract
COMMENT ON TABLE Contract IS 'Contractual agreements by FastCabs and business';
COMMENT ON COLUMN Contract.fixedRatePerJob IS 'Amount specified per job rate';
COMMENT ON COLUMN Contract.contractNumber IS 'Contract identification number';
COMMENT ON COLUMN Contract.officeID IS 'Office identification number';
COMMENT ON COLUMN Contract.clientID IS 'Client identification';

--Table Business
COMMENT ON TABLE Business IS 'Business clients of FastCabs';
COMMENT ON COLUMN Business.businessName IS 'Name of business client';
COMMENT ON COLUMN Business.address IS 'Address of business client';
COMMENT ON COLUMN Business.officeID IS 'Office identification number';
COMMENT ON COLUMN Business.clientID IS 'Client identification';
COMMENT ON COLUMN Business.contractNumber IS 'Contract identification';

--Table Private
COMMENT ON TABLE Private IS 'Private clients of FastCabs';
COMMENT ON COLUMN Private.firstName IS 'Clients first name';
COMMENT ON COLUMN Private.lastName IS 'Clients last name';
COMMENT ON COLUMN Private.streetAddress IS 'Street address of client';
COMMENT ON COLUMN Private.city IS 'city address of client';
COMMENT ON COLUMN Private.state IS 'State of client';
COMMENT ON COLUMN Private.country IS 'country address of client';
COMMENT ON COLUMN Private.zipCode IS 'Zip code of client';
COMMENT ON COLUMN Private.officeID IS 'Office identification number';
COMMENT ON COLUMN Private.clientID IS 'Client identification';

--Table TaxiDriver
COMMENT ON TABLE TaxiDriver IS 'Relation between driver and taxi';
COMMENT ON COLUMN TaxiDriver.employeeId IS 'Employee identification number';
COMMENT ON COLUMN TaxiDriver.taxiId IS 'Taxi identification number';
