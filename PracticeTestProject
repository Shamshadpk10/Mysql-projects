

CREATE TABLE Employee (
  empid INT,
  empname VARCHAR(50),
  department VARCHAR(50),
  contactno VARCHAR(20),
  emaildid VARCHAR(50),
  empheadid INT,
  PRIMARY KEY (empid)
);

CREATE TABLE EmpDept (
  DeptId INT,
  DeptName VARCHAR(50),
  Dept_off VARCHAR(50),
  DeptHead INT,
  PRIMARY KEY (DeptId),
  FOREIGN KEY (DeptHead) REFERENCES Employee(empid)
);

CREATE TABLE EmpSalary (
  EmpId INT,
  Salary DECIMAL(10, 2),
  IsPermanent BOOLEAN,
  PRIMARY KEY (EmpId),
  FOREIGN KEY (EmpId) REFERENCES Employee(empid)
);

CREATE TABLE Project (
  projectId INT,
  Duration INT,
  PRIMARY KEY (projectId)
);

CREATE TABLE Country (
  cid INT,
  cname VARCHAR(50),
  PRIMARY KEY (cid)
);

CREATE TABLE Client (
  clientId INT,
  Clientname VARCHAR(50),
  cid INT,
  PRIMARY KEY (clientId),
  FOREIGN KEY (cid) REFERENCES Country(cid)
);

CREATE TABLE EmpProject (
  EmpId INT,
  ProjectId INT,
  ClientID INT,
  StartYear INT,
  EndYear INT,
  PRIMARY KEY (EmpId, ProjectId),
  FOREIGN KEY (EmpId) REFERENCES Employee(empid),
  FOREIGN KEY (ProjectId) REFERENCES Project(projectId),
  FOREIGN KEY (ClientID) REFERENCES Client(clientId)
);

INSERT INTO Employee (empid, empname, department, contactno, emaildid, empheadid)
VALUES
  (1, 'John Doe', 'IT', '1234567890', 'john.doe@example.com', 2),
  (2, 'Jane Smith', 'HR', '9876543210', 'jane.smith@example.com', 5),
  (3, 'David Johnson', 'Marketing', '5555555555', 'david.johnson@example.com', 4),
  (4, 'Emily Williams', 'Finance', '9999999999', 'emily.williams@example.com', NULL),
  (5, 'Michael Brown', 'Sales', '7777777777', 'michael.brown@example.com', NULL),
  (6, 'Sarah Davis', 'IT', '4444444444', 'sarah.davis@example.com', NULL);

INSERT INTO EmpDept (DeptId, DeptName, Dept_off, DeptHead)
VALUES
  (1, 'IT', 'Building A', 1),
  (2, 'HR', 'Building B', 2),
  (3, 'Marketing', 'Building C', 3),
  (4, 'Finance', 'Building D', 4),
  (5, 'Sales', 'Building E', 5),
  (6, 'IT', 'Building A', 1);

INSERT INTO EmpSalary (EmpId, Salary, IsPermanent)
VALUES
  (1, 5000.00, true),
  (2, 6000.00, true),
  (3, 4500.00, false),
  (4, 7000.00, true),
  (5, 5500.00, true),
  (6, 4000.00, false);

INSERT INTO Project (projectId, Duration)
VALUES
  (1, 30),
  (2, 45),
  (3, 60),
  (4, 90),
  (5, 30),
  (6, 75);

INSERT INTO Country (cid, cname)
VALUES
  (1, 'United States'),
  (2, 'United Kingdom'),
  (3, 'Canada'),
  (4, 'Australia'),
  (5, 'Germany'),
  (6, 'France');

INSERT INTO Client (clientId, Clientname, cid)
VALUES
  (1, 'ABC Corporation', 1),
  (2, 'XYZ Corporation', 2),
  (3, '123 Inc.', 3),
  (4, 'ABC Ltd.', 1),
  (5, '789 Enterprises', 4),
  (6, 'PQR Solutions', 5);

INSERT INTO EmpProject (EmpId, ProjectId, ClientID, StartYear, EndYear)
VALUES
  (1, 1, 1, 2022, 2023),
  (2, 2, 2, 2021, 2024),
  (3, 3, 3, 2023, 2025),
  (4, 4, 4, 2020, 2022),
  (5, 5, 5, 2022, 2023),
  (6, 6, 6, 2021, 2024);
  
  -- 8 Select the detail of the employee whose name start with P.
  select * from employee where empname like 'P%';
   -- 9 
   select count(*) from empsalary where IsPermanent =True and Salary>5000.0;
   -- 10 
   select * from employee where empname like '%gmail.com';
   -- 11
   SELECT * FROM Employee WHERE department IN ('104', '102');
-- 12 
SELECT DeptName FROM EmpDept WHERE DeptId = 102;
-- 13
SELECT sum(SALARY)  as total_salry_of_permntemp  FROM EMPSALARY where ispermanent = True;
-- 14 List name of all employees whose name ends with a.
select * from employee where empname like '%a';
-- 16  How many project started in year 2010.
SELECT count(*) as projectstart_2020 from empproject where startyear =2020;
-- 17 How many project started and finished in the same year.
select count(*) as one_year_project from empproject where startyear = endyear;
-- 18 Select the name of the employee whose name's 3rd character is 'h'.
select empname from employee where empname like '__h%';
-- 19 Select the department name of the company which is assigned to  the employee whose employee id is grater 103.
SELECT department FROM Employee WHERE empid > 103; -- all my table id is <=6
-- 20 Select the name of the employee who is working under Abhishek.
SELECT empname FROM Employee
WHERE empheadid IN (
  SELECT empid
  FROM Employee
  WHERE empname = 'Abhishek'
);
-- 21 Select the name of the employee who is department head of HR.
SELECT empname FROM Employee WHERE department = 'HR' AND empid = empheadid;
-- 22 Select the name and email of the Dept Head who is not  Permanent.
select empname,emaildid from employee where empid =empheadid and IsPermanent = FALSE;
-- 23 Select the employee whose department off is Monday.
SELECT e.empname FROM Employee e JOIN EmpDept ed ON e.department = ed.DeptName
WHERE ed.Dept_off = 'Monday';
-- 24 Select the Indian clients details.
SELECT c.clientId, c.Clientname, co.cname AS Country FROM Client c JOIN Country co ON c.cid = co.cid
WHERE co.cname = 'India';
-- 25 select the details of all employee working in development  department.
select * from employee where department ='It';








   
  
  
