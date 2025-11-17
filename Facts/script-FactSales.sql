CREATE TABLE FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    OrderDateKey INT,
    DueDateKey INT,
    ShipDateKey INT,
    CustomerKey INT,
    ProductKey INT,
    EmployeeKey INT,
    TerritoryKey INT,
    OrderQty INT,
    UnitPrice DECIMAL(18,2),
    UnitPriceDiscount DECIMAL(18,2),
    LineTotal DECIMAL(18,2)
);
