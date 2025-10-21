<!DOCTYPE html>
<html>
    <head>
        <title>Users Table</title>
    </head>
    <body>
        <cfquery datasource="myMSSQLDB">
            CREATE TABLE users (
                id INT IDENTITY(1,1) PRIMARY KEY,
                firstname NVARCHAR(50) NOT NULL,
                emailId NVARCHAR(50) NOT NULL
            );
        </cfquery>

        <cfoutput>
            Table <strong>users</strong> created successfully!
        </cfoutput>
    </body>
</html>
