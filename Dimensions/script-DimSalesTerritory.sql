CREATE TABLE DimSalesTerritory (
    TerritoryKey INT IDENTITY(1,1) PRIMARY KEY,
    TerritoryID INT,
    Name VARCHAR(100),
    CountryRegionCode VARCHAR(10),
    GroupName VARCHAR(50)
);


