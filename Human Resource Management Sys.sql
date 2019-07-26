
create table noman.Employees
(
EmpID int primary key identity,
EmpFstName varchar(15) not null,
EmpLstName varchar(15) not null,
EmpAddress varchar(30) not null,
Gender varchar(10) not null,
PhnNo varchar(15) not null,
DOB date not null,
Designation varchar(15) not null,
Comment varchar(250) not null,
EmpImage VARCHAR(150)
)
Go

CREATE TABLE [dbo].[JobAssignmentAudit] (
    [JobAssignmentAuditID] INT          IDENTITY (1, 1) NOT NULL,
    [JobAssignmentID]      INT          NOT NULL,
    [DesignationID]        INT          NULL,
    [EmployeeID]           INT          NULL,
    [JoiningDate]          VARCHAR (30) NOT NULL,
    [JoiningSalary]        MONEY        NOT NULL,
    [LeavingDate]          VARCHAR (30) NULL,
    [DateModified]         DATE         NOT NULL,
    [CreatedBy]            VARCHAR (50) NOT NULL,
    [Operation]            VARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([JobAssignmentAuditID] ASC)
);
GO

CREATE TABLE [dbo].[Department] (
    [DepartmentID]   INT          IDENTITY (1, 1) NOT NULL,
    [DepartmentName] VARCHAR (25) NULL,
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC)
);
GO

CREATE TABLE [dbo].[Designation] (
    [DesignationID]    INT          IDENTITY (1, 1) NOT NULL,
    [DesignationTitle] VARCHAR (30) NOT NULL,
    [Comment]          VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([DesignationID] ASC)
);
GO

CREATE TABLE [dbo].[Payments] (
    [PaymentID]     INT          IDENTITY (1, 1) NOT NULL,
    [Salary]        MONEY        NOT NULL,
    [Bonus]         MONEY        NOT NULL,
    [MedAllowance]  MONEY        NOT NULL,
    [PayingDate]    VARCHAR (30) NOT NULL,
    [TotalPay]      AS           (([Salary]+[Bonus])+[MedAllowance]),
    [PaymentStatus] VARCHAR (10) NOT NULL,
    [ForTheMonthOf] VARCHAR (15) NOT NULL,
    [EmpID]         INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([PaymentID] ASC),
    FOREIGN KEY ([EmpID]) REFERENCES [dbo].[Employees] ([EmpID]) ON DELETE CASCADE
);

GO

CREATE VIEW vw_JobAssignDetails
AS 
SELECT JobAssignmentID, d.DesignationTitle, e.EmpFstName, e.EmpLstName, JoiningDate, JoiningSalary, LeavingDate, IsActive,
	CreatedBy FROM JobAssignment as ja 
	JOIN Employees as e ON ja.EmployeeID = e.EmpID
	JOIN dbo.Designation AS d ON ja.DesignationID = d.DesignationID

	Go
	CREATE PROCEDURE proc_JobAssignment
	@jobassignmentid int,
	@designationid int,
	@employeeid int,
	@joiningdate VARCHAR(30),
	@joiningsalary MONEY,
	@leavingdate VARCHAR(30),
	@isactive BIT,
	@createdby VARCHAR(50),
	@operation VARCHAR(30)
AS
BEGIN
	DECLARE @joindate DATE, @leavedate DATE;
	
	IF	@operation = 'INSERT'
	BEGIN
	set @joindate = CONVERT(nvarchar(30), @joiningdate, 103);
	SET @leavedate = CONVERT(nvarchar(30), @leavingdate, 103);
		
		INSERT INTO	dbo.JobAssignment
		(
		    DesignationID,
		    EmployeeID,
		    JoiningDate,
		    JoiningSalary,
		    LeavingDate,
		    IsActive,
		    CreatedBy
		)
		VALUES
		(  
			@designationid,
			@employeeid,
			@joindate,
			@joiningsalary,
			@leavedate,
			@isactive,
			@createdby
		)
	END

	ELSE IF	@operation = 'UPDATE'
	BEGIN
	set @joindate = CONVERT(nvarchar(30), @joiningdate, 103);
	SET @leavedate = CONVERT(nvarchar(30), @leavingdate, 103);
		
		UPDATE dbo.JobAssignment
		SET
		    DesignationID = @designationid,
		    EmployeeID = @employeeid,
		    JoiningDate =  @joindate,
		    JoiningSalary = @joiningsalary,
		    LeavingDate =  @leavedate,
		    IsActive = @isactive,
		    CreatedBy = @createdby
		WHERE JobAssignmentID = @jobassignmentid	
	END

	ELSE IF	@operation = 'DELETE'
	BEGIN
		DELETE FROM dbo.JobAssignment
		WHERE JobAssignmentID = @jobassignmentid	
	END
END
GO

CREATE PROCEDURE proc_EmployeePayment
	@paymentid INT,
	@salaryamount MONEY,
	@bonusamount MONEY,
	@medicalallowance MONEY,
	@paymentdate VARCHAR(15),
	@paymentstatus VARCHAR(15),
	@month VARCHAR(15),
	@empid INT,
	@operation VARCHAR(10)
AS
BEGIN

	
	IF	@operation = 'INSERT'
	BEGIN	
		INSERT INTO	dbo.Payments
		(
		    Salary,
		    Bonus,
		    MedAllowance,
		    PayingDate,
		    PaymentStatus,
		    ForTheMonthOf,
		    EmpID
		)
		VALUES
		(   
			@salaryamount,
			@bonusamount,
			@medicalallowance,
			@paymentdate,
			@paymentstatus,
			@month,
			@empid    
		)
		
	END

	ELSE IF	@operation = 'UPDATE'
	BEGIN
	
		UPDATE dbo.Payments
		SET
		    Salary = @salaryamount,
		    Bonus = @bonusamount,
		    MedAllowance = @medicalallowance,
		    PayingDate = @paymentdate,
		    PaymentStatus = @paymentstatus,
		    ForTheMonthOf = @month,
		    EmpID = @empid
		WHERE PaymentID = @paymentid	
	END

	ELSE IF	@operation = 'DELETE'
	BEGIN
		DELETE FROM dbo.Payments
		WHERE PaymentID = @paymentid
	END
END
Go
