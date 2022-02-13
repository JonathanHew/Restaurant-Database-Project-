Drop Table Branch CASCADE CONSTRAINTS;
Drop Table Customer CASCADE CONSTRAINTS;
Drop Table TableTop CASCADE CONSTRAINTS;
Drop Table Staff CASCADE CONSTRAINTS;
Drop Table Managers CASCADE CONSTRAINTS;
Drop Table Booking CASCADE CONSTRAINTS;
Drop Table Guest CASCADE CONSTRAINTS;
Drop Table Penalty CASCADE CONSTRAINTS;



Create Table Branch (
branchID Number(7),
branchAddress varchar2(50),
branchPhone Number(10),
CONSTRAINT Branch_PK PRIMARY KEY (branchID)
);

Create Table Customer (
custID Number(7),
custName VARCHAR2(30),
custAddress VARCHAR2(50),
custPhone NUMBER(10),
custAge NUMBER(3),
custEmail VARCHAR2(50),
CONSTRAINT Customer_PK PRIMARY KEY (custID),
CONSTRAINT custEmail_CHK CHECK (custEmail like '%@%.com'),
CONSTRAINT custAge_CHK CHECK (custAge > 18)
);

Create Table TableTop (
tableID NUMBER(7),
tableSeat NUMBER(2),
tableLocation VARCHAR2(30),
branchID NUMBER(7),
CONSTRAINT TableTop_PK PRIMARY KEY (tableID),
CONSTRAINT TableTop_Branch_FK FOREIGN KEY (branchID) REFERENCES Branch (branchID)
);

Create Table Staff (
staffID NUMBER(7),
branchID NUMBER(7),
staffName VARCHAR2(30),
staffAddress VARCHAR2(50),
staffPhone NUMBER(10),
staffEmail VARCHAR2(50),
staffDOB DATE,
staffStartDate DATE,
CONSTRAINT Staff_PK PRIMARY KEY (staffID),
CONSTRAINT Staff_Branch_FK FOREIGN KEY (branchID) REFERENCES Branch (branchID),
CONSTRAINT staffEmail_CHK CHECK (staffEmail like '%@burgershack.com')
);

Create Table Managers (
managerID NUMBER(7),
staffID NUMBER(7),
CONSTRAINT Managers_PK PRIMARY KEY (managerID),
CONSTRAINT Managers_Staff_FK FOREIGN KEY (staffID) REFERENCES Staff (staffID)
);

Create Table Booking (
bookingID NUMBER(7),
bookingTime DATE,
bookingNumPeople NUMBER(2),
bookingStayDuration NUMBER(2),
bookingType VARCHAR2(30),
custID NUMBER(7),
tableID NUMBER(7),
managerID NUMBER(7),
staffID NUMBER(7),
CONSTRAINT Booking_PK PRIMARY KEY (bookingID),
CONSTRAINT Booking_Customer_FK FOREIGN KEY (custID) REFERENCES Customer (custID),
CONSTRAINT Booking_TableTop_FK FOREIGN KEY (tableID) REFERENCES TableTop (tableID),
CONSTRAINT Booking_Managers_FK FOREIGN KEY (managerID) REFERENCES Managers (managerID),
CONSTRAINT Booking_Staff_FK FOREIGN KEY (staffID) REFERENCES Staff (staffID)
);

Create Table Guest (
guestID NUMBER(7),
guestName VARCHAR2(30), 
guestEmail VARCHAR2(50),
guestAddress VARCHAR2(50),
guestPhone NUMBER(10),
custID NUMBER(7),
bookingID NUMBER(7),
CONSTRAINT Guest_PK PRIMARY KEY (guestID),
CONSTRAINT Guest_Customer_FK FOREIGN KEY (custID) REFERENCES Customer (custID),
CONSTRAINT Guest_Booking_FK FOREIGN KEY (bookingID) REFERENCES Booking (bookingID),
CONSTRAINT guestEmail_CHK CHECK (guestEmail like '%@%.com')
);

Create Table Penalty (
penaltyID NUMBER(7),
penaltyPrice NUMBER(3),
bookingID NUMBER(7),
CONSTRAINT Penalty_Booking_FK FOREIGN KEY (penaltyID) REFERENCES Booking (bookingID)
);

commit;

--inserting data into Branch
insert into Branch (branchID, branchAddress, branchPhone) values (1, 'Blanchardstown', 0831231000);
insert into Branch (branchID, branchAddress, branchPhone) values (2, 'Tallaght', 0831231001);
insert into Branch (branchID, branchAddress, branchPhone) values (3, 'Greystones', 0831231002);
insert into Branch (branchID, branchAddress, branchPhone) values (4, 'Dublin City', 0831231003);
insert into Branch (branchID, branchAddress, branchPhone) values (5, 'Rathfarnam', 0831231004);

--inserting data into Customer
insert into Customer (custID, custName, custAddress, custPhone, custAge, custEmail) VALUES (1, 'Alex Adams', '1 Arklow Road, Dublin', 0832001000, 19, 'aadams@hotmail.com');
insert into Customer (custID, custName, custAddress, custPhone, custAge, custEmail) VALUES (2, 'Barry Bam', '2 Blanchardstown Road, Dublin', 0832001001, 20, 'bbam@hotmail.com');
insert into Customer (custID, custName, custAddress, custPhone, custAge, custEmail) VALUES (3, 'Charlie Coole', '3 Carlow Road, Carlow', 0832001002, 21, 'ccoole@hotmail.com');
insert into Customer (custID, custName, custAddress, custPhone, custAge, custEmail) VALUES (4, 'Dec Delitte', '4 Derry Road, Cork', 0832001003, 51, 'ddelitte@hotmail.com');
insert into Customer (custID, custName, custAddress, custPhone, custAge, custEmail) VALUES (5, 'Emily Eva', '5 Earth Road, Galway', 0832001004, 63, 'eeva@hotmail.com');

--inserting data into TableTop
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (1, 2, 'window', 1);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (2, 4, 'interior', 1);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (3, 6, 'window', 1);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (4, 8, 'interior', 1);

insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (5, 2, 'window', 2);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (6, 4, 'interior', 2);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (7, 6, 'window', 2);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (8, 8, 'interior', 2);

insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (9, 2, 'window', 3);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (10, 4, 'interior', 3);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (11, 6, 'window', 3);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (12, 8, 'interior', 3);

insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (13, 2, 'window', 4);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (14, 4, 'interior', 4);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (15, 6, 'window', 4);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (16, 8, 'interior', 4);

insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (17, 2, 'window', 5);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (18, 4, 'interior', 5);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (19, 6, 'window', 5);
insert into TableTop (tableID, tableSeat, tableLocation, branchID) VALUES (20, 8, 'interior', 5);

--inserting data into Staff
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (1, 1, 'Aaron Abarth', '1 Aungier Street, Dublin', 0833001000, 'aabarth@burgershack.com', TO_DATE('1/01/1965', 'MM/DD/YYYY'), TO_DATE('12/01/2016', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (2, 1, 'Beth Buns', '2 Bettys Street, Dublin', 0833001001, 'bbuns@burgershack.com', TO_DATE('09/02/1999', 'MM/DD/YYYY'), TO_DATE('06/01/2019', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (3, 1, 'Carly Collins', '1 Charlestown Street, Dublin', 0833001002, 'ccollins@burgershack.com', TO_DATE('09/20/2000', 'MM/DD/YYYY'), TO_DATE('03/01/2020', 'MM/DD/YYYY'));

insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (4, 2, 'Aine Asia', '3 Augherskea, Meath', 0833001003, 'aasia@burgershack.com', TO_DATE('10/10/1980', 'MM/DD/YYYY'), TO_DATE('07/03/2017', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (5, 2, 'Beathan Bas', '4 Batchelors, Meath', 0833001004, 'bbas@burgershack.com', TO_DATE('09/20/2000', 'MM/DD/YYYY'), TO_DATE('2/03/2020', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (6, 2, 'Charlie Chicken', '5 Clonislla, Dublin', 0833001005, 'cchicken@burgershack.com', TO_DATE('10/30/2001', 'MM/DD/YYYY'), TO_DATE('03/03/2019', 'MM/DD/YYYY'));

insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (7, 3, 'Alex Abba', '6 Terenure, Dublin', 0833001006, 'aabba@burgershack.com', TO_DATE('01/20/1991', 'MM/DD/YYYY'), TO_DATE('04/30/2018', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (8, 3, 'Blessing Bond', '8 Grafton, Dublin', 0833001006, 'bbond@burgershack.com', TO_DATE('05/21/1999', 'MM/DD/YYYY'), TO_DATE('07/17/2020', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (9, 3, 'Crabby Cats', '10 Dunshauglin, Meath', 0833001007, 'ccats@burgershack.com', TO_DATE('06/25/1999', 'MM/DD/YYYY'), TO_DATE('04/18/2020', 'MM/DD/YYYY'));

insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (10, 4, 'Aisling Alaba', '11 Meath, Meath', 0833001008, 'aalaba@burgershack.com', TO_DATE('01/20/1995', 'MM/DD/YYYY'), TO_DATE('06/20/2019', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (11, 4, 'Bart Bradley', '12 Mochtas, Dublin', 0833001009, 'bbradley@burgershack.com', TO_DATE('05/28/2001', 'MM/DD/YYYY'), TO_DATE('08/16/2020', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (12, 4, 'Caitlin Crann', '13 Dingle, Dublin', 0833001010, 'ccrann@burgershack.com', TO_DATE('11/17/2000', 'MM/DD/YYYY'), TO_DATE('09/20/2020', 'MM/DD/YYYY'));

insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (13, 5, 'Austin Ally', '14 Tullamore, Meath', 0833001011, 'aally@burgershack.com', TO_DATE('04/04/1994', 'MM/DD/YYYY'), TO_DATE('06/06/2016', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (14, 5, 'Britney Blanche', '15 Mochtas, Dublin', 0833001012, 'bblanche@burgershack.com', TO_DATE('03/30/2000', 'MM/DD/YYYY'), TO_DATE('08/17/2020', 'MM/DD/YYYY'));
insert into Staff (staffID, branchID, staffName, staffAddress, staffPhone, staffEmail, staffDOB, staffStartDate) 
VALUES (15, 5, 'Caitlin Crann', '13 Dingle, Dublin', 0833001010, 'ccrann@burgershack.com', TO_DATE('11/17/2000', 'MM/DD/YYYY'), TO_DATE('09/20/2020', 'MM/DD/YYYY'));

--inserting data into managers
insert into Managers (managerID, staffID) VALUES (1, 1);
insert into Managers (managerID, staffID) VALUES (2, 4);
insert into Managers (managerID, staffID) VALUES (3, 7);
insert into Managers (managerID, staffID) VALUES (4, 10);
insert into Managers (managerID, staffID) VALUES (5, 13);

--inserting data into booking
insert into Booking (bookingID, bookingTime, bookingNumPeople, bookingStayDuration, bookingType, custID, tableID , managerID ,staffID)
VALUES (1, TO_DATE('12/13/2020 21:02:44', 'MM/DD/YYYY HH24:MI:SS'), 2, 1, 'online', 1, 1, 1, 2);
insert into Booking (bookingID, bookingTime, bookingNumPeople, bookingStayDuration, bookingType, custID, tableID , managerID ,staffID)
VALUES (2, TO_DATE('12/14/2020 15:30:36', 'MM/DD/YYYY HH24:MI:SS'), 2, 1, 'phone', 2, 5, 2, 5);
insert into Booking (bookingID, bookingTime, bookingNumPeople, bookingStayDuration, bookingType, custID, tableID , managerID ,staffID)
VALUES (3, TO_DATE('12/15/2020 12:15:59', 'MM/DD/YYYY HH24:MI:SS'), 2, 1, 'walk in', 3, 9, 3, 8);
insert into Booking (bookingID, bookingTime, bookingNumPeople, bookingStayDuration, bookingType, custID, tableID , managerID ,staffID)
VALUES (4, TO_DATE('12/16/2020 16:37:01', 'MM/DD/YYYY HH24:MI:SS'), 2, 1, 'online', 4, 13, 4, 11);
insert into Booking (bookingID, bookingTime, bookingNumPeople, bookingStayDuration, bookingType, custID, tableID , managerID ,staffID)
VALUES (5, TO_DATE('12/17/2020 07:30:44', 'MM/DD/YYYY HH24:MI:SS'), 2, 1, 'phone', 5, 17, 5, 14);

--inserting data into guest 
insert into Guest (guestID, custID, guestName, bookingID, guestPhone, guestAddress, guestEmail)
VALUES (1, 1, 'Sharon Oneill', 1, 0831551000, '10 Drumshanbo, Dublin', 'soneill@hotmail.com');
insert into Guest (guestID, custID, guestName, bookingID, guestPhone, guestAddress, guestEmail)
VALUES (2, 2, 'Jack Homan', 2, 0831551001, '20 Alley, Dublin', 'jhoman@hotmail.com');
insert into Guest (guestID, custID, guestName, bookingID, guestPhone, guestAddress, guestEmail)
VALUES (3, 3, 'Travis Cali', 3, 0831551002, '30 Beverley, Dublin', 'tcali@hotmail.com');
insert into Guest (guestID, custID, guestName, bookingID, guestPhone, guestAddress, guestEmail)
VALUES (4, 4, 'Kendrick Tracy', 4, 0831551003, '40 Sorrel, Dublin', 'ktracy@hotmail.com');
insert into Guest (guestID, custID, guestName, bookingID, guestPhone, guestAddress, guestEmail)
VALUES (5, 5, 'Kacey Kova', 5, 0831551004, '50 Drumshanbo, Dublin', 'kkova@hotmail.com');

--insertiing data into penalty
insert into Penalty (penaltyID, bookingID, penaltyPrice) VALUES (1,1,5);
insert into Penalty (penaltyID, bookingID, penaltyPrice) VALUES (2,2,10);
insert into Penalty (penaltyID, bookingID, penaltyPrice) VALUES (3,3,15);
insert into Penalty (penaltyID, bookingID, penaltyPrice) VALUES (4,4,20);
insert into Penalty (penaltyID, bookingID, penaltyPrice) VALUES (5,5,25);


--SQL query using UPDATE
UPDATE Booking set tableID = 2 WHERE bookingID = 1;

--SQL query using DECODE
SELECT tableID,
    DECODE (tableSeat,
    2, 'Two Seater',
    4, 'Four Seater',
    6, 'Six Seater',
    8, 'Eight Seater',
    tableSeat) "tableSeat"
FROM TableTop;

--query using INNER JOIN and GROUP BY
SELECT branchID, COUNT(tableID)
AS NUMOFTABLES 
FROM Branch JOIN TableTop using (branchID)
GROUP BY branchID;

--query using LEFT OUTER JOIN
SELECT branchID, staffName FROM Branch LEFT OUTER JOIN Staff USING (branchID);

--query using RIGHT OUTER JOIN
SELECT bookingID, staffID From Booking RIGHT OUTER JOIN Staff using (staffID);

--query using UNION
SELECT custName as "Customers Aged 19"
FROM Customer 
WHERE custAge = 19
UNION
SELECT custName as "Customers Aged 20 "
FROM Customer 
WHERE custAge = 20;

--query using INTERESECT
SELECT staffName 
FROM Staff
WHERE staffName LIKE 'Ai%'
INTERSECT
SELECT staffName 
FROM Managers JOIN Staff USING (staffID);

--query USING VIEW
CREATE VIEW ManagerViewBranch1 AS
SELECT staffName, staffEmail, staffPhone
FROM Staff
WHERE branchID= 1;

SELECT * FROM ManagerViewBranch1;




















