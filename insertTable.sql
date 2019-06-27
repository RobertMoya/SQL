--California State University, San Bernardino
--Department of Computer Science
--Course:CSE572
-- Robert Moya
--
-- Taxi

SET CONSTRAINT ALL DEFERRED;

INSERT INTO Office VALUES ('1001','84 South Alton Street South Windsor, CT 06074','3','0001');
INSERT INTO Office VALUES ('1002','18 Willow St.Cherry Hill, NJ 08003','26','0002');
INSERT INTO Office VALUES ('1003','132 Arlington Dr.Fairfax, VA 22030','34','0003');
INSERT INTO Office VALUES ('1004','43 N. Boston Court Lakeville, MN 55044','56','0004');
INSERT INTO Office VALUES ('1005','8939 West Lakewood Ave.Paterson, NJ 07501','30','0005');

INSERT INTO Staff VALUES ('0001','Robert','Moya','M','1992-18-08','1001');
INSERT INTO Staff VALUES ('0002','Jensen','Gastelum','M','1992-27-09','1002');
INSERT INTO Staff VALUES ('0003','Fatima','Alba','F','1994-4-07','1003');
INSERT INTO Staff VALUES ('0004','John','Doe','M','1982-2-08','1004');
INSERT INTO Staff VALUES ('0005','Jane','Doe','F','1962-31-08','1005');

INSERT INTO Manager VALUES ('(993) 888-2625','Uber','0001');
INSERT INTO Manager VALUES ('(610) 537-5583','Uber','0002');
INSERT INTO Manager VALUES ('(356) 582-1612','Lift','0003');
INSERT INTO Manager VALUES ('(449) 460-3883','Lift','0004');
INSERT INTO Manager VALUES ('(382) 704-5342','Taxi','0005');

INSERT INTO Taxi VALUES ('4545','Y','0001');
INSERT INTO Taxi VALUES ('4646','Y','0002');
INSERT INTO Taxi VALUES ('4747','Y','0003');
INSERT INTO Taxi VALUES ('4848','Y','0004');
INSERT INTO Taxi VALUES ('4949','Y','0005');

INSERT INTO Job VALUES ('1111','(583) 907-9952','19-18-10','19-12-10','100.00','1','10.6','Pick up at light','0001','001','4545');
INSERT INTO Job VALUES ('2222','(444) 840-2543','10-12-11','10-16-11','700.00','2','150.6','Pick up at school','0002','002','4646');
INSERT INTO Job VALUES ('3333','(824) 451-4340','10-12-11','10-14-11','150.00','3','16.6','Pick up at stop sign','0003','003','4747');
INSERT INTO Job VALUES ('4444','(663) 408-9948','10-12-12','10-13-12','180.00','4','18.6','Pick up at walmart','0004','004','4848');
INSERT INTO Job VALUES ('5555','(883) 576-0095','10-12-12','10-13-12','190.00','5','19.6','Pick up at house','0005','005','4949');

INSERT INTO Contract VALUES ('50.00','1','1001','001');
INSERT INTO Contract VALUES ('50.00','2','1001','001');
INSERT INTO Contract VALUES ('50.00','3','1002','002');
INSERT INTO Contract VALUES ('50.00','4','1003','004');
INSERT INTO Contract VALUES ('50.00','5','1004','003');

INSERT INTO Business VALUES ('Uber','13 Proctor Court Asheboro, NC 27205','001','1001','1111');
INSERT INTO Business VALUES ('Uber','13 Proctor Court Asheboro, NC 27205','001','1001','1111');
INSERT INTO Business VALUES ('Lift','8 Helen Court Strongsville, OH 44136','002','1002','2222');
INSERT INTO Business VALUES ('Lift','8 Helen Court Strongsville, OH 44136','003','1003','3333');
INSERT INTO Business VALUES ('Taxi','821 South Aspen Lane Tallahassee, FL 32303','004','1004','4444');
INSERT INTO Business VALUES ('Taxi','821 South Aspen Lane Tallahassee, FL 32303','005','1005','5555');

INSERT INTO Private VALUES (' Mirna','Flaviano','13 Proctor Court Asheboro, NC 27205','001','1001');
INSERT INTO Private VALUES (' Mirno','Flaviana','13 Proctor Court Asheboro, NC 27205','001','1001');
INSERT INTO Private VALUES (' Rob','Mo','8 Helen Court Strongsville, OH 44136','002','1002');
INSERT INTO Private VALUES (' Jen','Gas','8 Helen Court Strongsville, OH 44136','002','1003');
INSERT INTO Private VALUES (' Fata','Alba','821 South Aspen Lane Tallahassee, FL 32303','003','1004');
INSERT INTO Private VALUES (' Steve','Jobs','821 South Aspen Lane Tallahassee, FL 32303','004','1004');

INSERT INTO TaxiDriver VALUES ('0001','4545');
INSERT INTO TaxiDriver VALUES ('0001','4545');
INSERT INTO TaxiDriver VALUES ('0002','4646');
INSERT INTO TaxiDriver VALUES ('0003','4747');
INSERT INTO TaxiDriver VALUES ('0004','4848');
INSERT INTO TaxiDriver VALUES ('0005','4949');
INSERT INTO TaxiDriver VALUES ('0004','4848');

--SET CONSTRAINTS ALL IMMEDIATE;

--SELECT * FROM Staff;
--SELECT * FROM Office;
