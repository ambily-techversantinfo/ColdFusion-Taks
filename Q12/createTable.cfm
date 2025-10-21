<cfquery datasource="myMSSQLDB">
    CREATE TABLE members (
        firstname NVARCHAR(50) NOT NULL,
        lastname NVARCHAR(50) NOT NULL
    );
</cfquery>

<cfoutput>
    Table <strong>members</strong> created successfully!
</cfoutput>