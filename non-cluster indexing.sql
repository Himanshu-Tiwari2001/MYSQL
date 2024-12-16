create database Non_ClusterIndexing;
use Non_ClusterIndexing;

CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY, -- This will automatically create a clustered index
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary INT
);
INSERT INTO EmployeeDetails (EmployeeID, FirstName, LastName, Department, Salary)
VALUES 
(1, 'John', 'Smith', 'HR', 50000),
(2, 'Jane', 'Doe', 'IT', 60000),
(3, 'Sam', 'Brown', 'Finance', 55000),
(4, 'Sara', 'Wilson', 'IT', 70000),
(5, 'Mike', 'Taylor', 'HR', 52000);

CREATE INDEX idx_LastName ON Employees (LastName);



