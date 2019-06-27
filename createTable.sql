--Robert moya

DROP TABLE Office CASCADE CONSTRAINTS;
CREATE TABLE Office (
	officeId varchar(4),
	address varchar(60),
	numberOfStaff varchar (3),
	employeeId	varchar(4),
	CONSTRAINTS Office_PK PRIMARY KEY (officeId)
);

DROP TABLE Staff CASCADE CONSTRAINTS;
CREATE TABLE Staff(
	employeeId varchar(4),
	firstName varchar(15),
	lastName	varchar(15),
	gender	varchar(1),
	DOB		DATE 'YYYY-DD-MM',
	officeId varchar(4),
	CONSTRAINTS Staff_PK PRIMARY KEY (employeeId),
	CONSTRAINTS Staff_gender_CK CHECK(gender IN ('F','M'))
);

DROP TABLE Manager CASCADE CONSTRAINTS;
CREATE TABLE Manager(
	phoneNumber varchar(15),
	officeName varchar(15),
	employeeId varchar(4),
	CONSTRAINTS Manager_PK PRIMARY KEY (employeeId)
);

DROP TABLE Taxi CASCADE CONSTRAINTS;
CREATE TABLE Taxi(
	taxiId	varchar(4),
	registered	varchar(1),
	employeeId varchar(4),
	CONSTRAINTS Taxi_PK PRIMARY KEY (employeeId),
	CONSTRAINTS Taxi_registered_CK CHECK (registered IN ('Y','N'))
);

DROP TABLE Job CASCADE CONSTRAINTS;
CREATE TABLE Job(
	jobId varchar (4),
	clientPhoneNumber	varchar(15),
	pickUpDate	DATE,
	dropOffDate	DATE,
	amountCharged NUMBER(10,2) NOT NULL,
	contractNumber varchar(3),
	milage	NUMBER(10,2),
	jobDetails varchar(20),
	employeeId varchar(4),
	clientId	varchar(3),
	taxiId		varchar(4),
	CONSTRAINTS Job_PK PRIMARY KEY (jobId)
);

DROP TABLE Contract CASCADE CONSTRAINTS;
CREATE TABLE Contract(
	fixedRatePerJob NUMBER (10,2),
	contractNumber	varchar(3),
	officeId 	varchar(4),
	clientId 	varchar(3),
	CONSTRAINTS Contract_PK PRIMARY KEY (contractNumber)
);

DROP TABLE Business CASCADE CONSTRAINTS;
CREATE TABLE Business(
	businessName	varchar(15),	
	address 	varchar(40),
	clientId	varchar(3),
	officeId	varchar(4),
	jobId		varchar(4),
	CONSTRAINTS Business_PK PRIMARY KEY (clientId)
);

DROP TABLE Private CASCADE CONSTRAINTS;
CREATE TABLE Private(
	firstName	varchar(15),
	lastName	varchar(15),
	address		varchar(60),
	clientId	varchar(3),
	officeId	varchar(4),
	CONSTRAINTS Private_PK PRIMARY KEY (clientId)
);

DROP TABLE TaxiDriver CASCADE CONSTRAINTS;
CREATE TABLE TaxiDriver(
	employeeId varchar(4),
	taxiId 	varchar(4),
	CONSTRAINTS TaxiDriver_PK PRIMARY KEY (employeeId)
);
