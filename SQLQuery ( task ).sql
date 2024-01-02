--create a databse
create database CompanyDB;
--create a table of  department
CREATE TABLE Departments (
    DepartmentID int PRIMARY KEY,
    DepartmentName varchar(255)
);
--create a tale of emplyees
CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    DepartmentID int,
    Salary decimal,
    HireDate datetime,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
--add a hiredate in employee table
alter table Employees add hiredate datetime;

--5 records adding in department table
INSERT INTO Departments (DepartmentID, DepartmentName)VALUES (1, 'IT'),
    (2, 'Sales'),
    (3, 'Marketing'),
    (4, 'Finance'),
    (5, 'se');
	--10 records adding in employees table
	INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)VALUES  (1, 'John', 'Doe', 1, 50000, '2021-01-01'),
    (2, 'Jane', 'Smith', 2, 45000, '2022-02-15'),
    (3, 'Bob', 'Johnson', 3, 60000, '2020-11-20'),
    (4, 'Emily', 'Davis', 4, 55000, '2023-04-01'),
    (5, 'Michael', 'Brown', 5, 40000, '2021-05-30'),
    (6, 'David', 'Miller', 1, 48000, '2022-08-22'),
    (7, 'Anna', 'Williams', 2, 52000, '2020-09-10'),
    (8, 'Ryan', 'Jones', 3, 65000, '2023-03-05'),
    (9, 'Sarah', 'Thomas', 4, 58000, '2021-12-18'),
    (10, 'Kevin', 'Lee', 5, 43000, '2022-06-04');


	select * from Employees;

	select * from Departments;

--adding a salary of employee whose departentid is 1
update Employees set salary=salary*1.1 where DepartmentID=1;
 select*from Employees;
--extra editing
 update Employees set  Salary=2500 where   DepartmentID=4;

 --deleting the record of those  employee whose salary  less then 30000
delete from  Employees where Salary<30000;
 select*from Employees;

 --Write a SQL query to retrieve the FirstName, LastName,DepartmentName, and Salary of employees by joining the Employees and
--department table.
select e.FirstName, e.LastName, d.DepartmentName, e.Salary from Employees e inner join Departments d
on e.DepartmentID = d.DepartmentID; 

--Retrieve all departments and employee counts

select d.DepartmentName,count(e.EmployeeID) as EmployeeCount  from Departments d
left  join Employees e on d.DepartmentID = e.DepartmentID group by d.DepartmentID, d.DepartmentName;

--Select Data using WHERE and JOIN:Write a query to select the FirstName, LastName, andHireDate of employees who were hired after '2023-01-01'.

select e.FirstName, e.LastName, e.HireDate from Employees e inner join Departments d  on  e.DepartmentID = d.DepartmentID
where e.HireDate > '2023-01-01';

