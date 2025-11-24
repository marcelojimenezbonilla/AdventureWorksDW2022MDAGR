CREATE TABLE Staging.Employee (
	BusinessEntityID     INT,
	NationalIDNumber     NVARCHAR(15),
	LoginID              NVARCHAR(256),
	OrganizationNode     HIERARCHYID NULL,
	OrganizationLevel    AS (OrganizationNode.GetLevel()),
	JobTitle             NVARCHAR(50),
	BirthDate            DATE,
	MaritalStatus        NCHAR(1),
	Gender               NCHAR(1),
	HireDate             DATE,
	SalariedFlag         BIT,
	VacationHours        SMALLINT,
	SickLeaveHours       SMALLINT,
	CurrentFlag          BIT,
	rowguid              UNIQUEIDENTIFIER,
	ModifiedDate         DATETIME,

	RowVersion           BIGINT,

	LoadDate             DATETIME DEFAULT(GETDATE())
);