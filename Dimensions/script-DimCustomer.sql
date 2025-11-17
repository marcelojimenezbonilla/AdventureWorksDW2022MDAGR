CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    PersonType VARCHAR(10),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    FullName VARCHAR(200),
    Email VARCHAR(100),
    CompanyName VARCHAR(100)
);


