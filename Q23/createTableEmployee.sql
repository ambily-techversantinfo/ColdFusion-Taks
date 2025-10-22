CREATE TABLE employeeDetails (
    id INT IDENTITY(1,1) PRIMARY KEY,
    firstname NVARCHAR(50) NOT NULL,
    lastname NVARCHAR(50) NOT NULL,
    emailId NVARCHAR(50) NOT NULL,
    phoneNumber NVARCHAR(50) NOT NULL,
    position NVARCHAR(50) NOT NULL,
    relocate NVARCHAR(10) NOT NULL,
    startDate NVARCHAR(50) NOT NULL,
    portfolio NVARCHAR(50) NULL,
    resume NVARCHAR(50) NULL,
    salary NVARCHAR(50) NULL,
);