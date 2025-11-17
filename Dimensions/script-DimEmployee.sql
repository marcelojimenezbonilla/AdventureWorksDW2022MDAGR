CREATE TABLE DimEmployee (
    EmployeeKey INT IDENTITY(1,1) PRIMARY KEY,
    BusinessEntityID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    JobTitle VARCHAR(100)
);


