<!DOCTYPE html>
<html>
    <head>
        <title> Query Functions</title>
    </head>

    <body>
        <cfscript>
            myQuery=QueryNew("id,name,email","integer,varchar,varchar");

            QueryAddRow(myQuery , 3);

            QuerySetCell(myQuery, "id", 1 ,1);
            QuerySetCell(myQuery, "name", "Ann" ,1);
            QuerySetCell(myQuery, "email", "ann@123.com" ,1);

            QuerySetCell(myQuery, "id", 2 ,2);
            QuerySetCell(myQuery, "name", "mariya" ,2);
            QuerySetCell(myQuery, "email", "mary@123.com" ,2);

            QuerySetCell(myQuery, "id", 3 ,3);
            QuerySetCell(myQuery, "name", "jo" ,3);
            QuerySetCell(myQuery, "email", "jo@123.com" ,3);

            queryAddRow(myQuery,{id=4,name="lis", email="lis@123.com"});

            newData = {id=5,name="Jane",email="doe@123.com"};
            myQuery.addRow(newData);

            myStruct = {};
            QueryAddRow(myQuery,myStruct);
            myQuery.setCell("id", 6, 6);
            myQuery.setCell("name", "nayan", 6);

            WriteDump(myQuery);
        </cfscript>
    </body>
</html>