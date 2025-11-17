/*
Script de implementación para AdventureWorks2022

Este código lo generó una herramienta.
Los cambios en este archivo pueden provocar un comportamiento incorrecto y se perderán si
el código se vuelve a generar.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "AdventureWorks2022"
:setvar DefaultFilePrefix "AdventureWorks2022"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSRV2022\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSRV2022\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecte el modo SQLCMD y deshabilite la ejecución de scripts si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
ESTABLECER NOEXEC DESACTIVADO; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Quitando Propiedad extendida [MS_Description]...';


GO
EXECUTE sp_dropextendedproperty @name = N'MS_Description';


GO
PRINT N'Quitando Propiedad extendida [PRIMARY].[MS_Description]...';


GO
EXECUTE sp_dropextendedproperty @name = N'MS_Description', @level0type = N'FILEGROUP', @level0name = N'PRIMARY';


GO
PRINT N'Creando Tabla [dbo].[DimCustomer]...';


GO
CREATE TABLE [dbo].[DimCustomer] (
    [CustomerKey] INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT           NULL,
    [PersonType]  VARCHAR (10)  NULL,
    [FirstName]   VARCHAR (50)  NULL,
    [LastName]    VARCHAR (50)  NULL,
    [FullName]    VARCHAR (200) NULL,
    [Email]       VARCHAR (100) NULL,
    [CompanyName] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[DimDate]...';


GO
CREATE TABLE [dbo].[DimDate] (
    [DateKey]       INT          NOT NULL,
    [FullDate]      DATE         NULL,
    [Year]          INT          NULL,
    [Quarter]       INT          NULL,
    [Month]         INT          NULL,
    [MonthName]     VARCHAR (20) NULL,
    [Day]           INT          NULL,
    [DayOfWeek]     INT          NULL,
    [DayOfWeekName] VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[DimEmployee]...';


GO
CREATE TABLE [dbo].[DimEmployee] (
    [EmployeeKey]      INT           IDENTITY (1, 1) NOT NULL,
    [BusinessEntityID] INT           NULL,
    [FirstName]        VARCHAR (100) NULL,
    [LastName]         VARCHAR (100) NULL,
    [JobTitle]         VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[DimProduct]...';


GO
CREATE TABLE [dbo].[DimProduct] (
    [ProductKey]         INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]          INT             NULL,
    [Name]               VARCHAR (100)   NULL,
    [ProductNumber]      VARCHAR (50)    NULL,
    [Color]              VARCHAR (30)    NULL,
    [StandardCost]       DECIMAL (18, 2) NULL,
    [ListPrice]          DECIMAL (18, 2) NULL,
    [Size]               VARCHAR (20)    NULL,
    [Weight]             DECIMAL (10, 2) NULL,
    [ProductCategory]    VARCHAR (100)   NULL,
    [ProductSubcategory] VARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([ProductKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[DimSalesTerritory]...';


GO
CREATE TABLE [dbo].[DimSalesTerritory] (
    [TerritoryKey]      INT           IDENTITY (1, 1) NOT NULL,
    [TerritoryID]       INT           NULL,
    [Name]              VARCHAR (100) NULL,
    [CountryRegionCode] VARCHAR (10)  NULL,
    [GroupName]         VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([TerritoryKey] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[FactSales]...';


GO
CREATE TABLE [dbo].[FactSales] (
    [SalesKey]          INT             IDENTITY (1, 1) NOT NULL,
    [OrderDateKey]      INT             NULL,
    [DueDateKey]        INT             NULL,
    [ShipDateKey]       INT             NULL,
    [CustomerKey]       INT             NULL,
    [ProductKey]        INT             NULL,
    [EmployeeKey]       INT             NULL,
    [TerritoryKey]      INT             NULL,
    [OrderQty]          INT             NULL,
    [UnitPrice]         DECIMAL (18, 2) NULL,
    [UnitPriceDiscount] DECIMAL (18, 2) NULL,
    [LineTotal]         DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([SalesKey] ASC)
);


GO
PRINT N'Actualización completada.';


GO
