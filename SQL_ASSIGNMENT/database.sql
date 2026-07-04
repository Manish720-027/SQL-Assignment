

DROP TABLE IF EXISTS EmployeeDetails;
DROP TABL
E IF EXISTS Employee;
--Employee table
CREATE TABLE Employee
(
    empid INT PRIMARY KEY,
    ename VARCHAR(50),
    gender VARCHAR(10),
    salary INT,
    city VARCHAR(50)
);

--EmployeeDetails table
CREATE TABLE EmployeeDetails
(
    empid INT,
    projects VARCHAR(10),
    empposition VARCHAR(30),
    doj DATE,

    CONSTRAINT fk_employee
    FOREIGN KEY(empid)
    REFERENCES Employee(empid)
);

--Insert data 
INSERT INTO Employee VALUES
(1,'John Doe','Male',50000,'New York'),
(2,'Jane Smith','Female',55000,'Los Angeles'),
(3,'Michael Johnson','Male',60000,'Chicago'),
(4,'Emily Williams','Female',48000,'Houston'),
(5,'Robert Brown','Male',52000,'Miami');

--Insert data 
INSERT INTO EmployeeDetails VALUES
(1,'P1','Manager','2022-01-15'),
(2,'P2','Analyst','2022-03-10'),
(3,'P1','Developer','2022-02-22'),
(4,'P4','Designer','2022-04-05'),
(5,'P2','Engineer','2022-01-30');