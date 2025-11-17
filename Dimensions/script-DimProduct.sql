CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    Name VARCHAR(100),
    ProductNumber VARCHAR(50),
    Color VARCHAR(30),
    StandardCost DECIMAL(18,2),
    ListPrice DECIMAL(18,2),
    Size VARCHAR(20),
    Weight DECIMAL(10,2),
    ProductCategory VARCHAR(100),
    ProductSubcategory VARCHAR(100)
);


