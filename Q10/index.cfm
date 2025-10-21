<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q10</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <cfform action="" method="POST" name="formSubmit" class="formClass">
            Key : <cfinput 
                name="inputKey" 
                type="text"
                value=""
                required="yes" 
                message="Please enter input Key"> <br> <br>
            Value : <cfinput 
                name="inputValue" 
                type="text"
                value=""
                required="yes" 
                message="Please enter input Value"> <br> <br>
            <cfinput type="submit" name="submit" value="Submit">
        </cfform>

        <cfif structKeyExists(form, "submit")>
            <cfset keyName = trim(form.inputKey)>
            <cfset value = trim(form.inputValue)>

            <cfif NOT structKeyExists(session, "myStructTask10")>
                <cfset session.myStructTask10 = {}>
            </cfif>

            <cfif structKeyExists(session.myStructTask10, keyName)>
                <cfset structUpdate(session.myStructTask10, keyName, value)>
            <cfelse>
                <cfset structInsert(session.myStructTask10, keyName, value)>
            </cfif>

            <cfset sortedStructure = StructToSorted(session.myStructTask10, "Text", "asc")>

            <cfdump var="#sortedStructure#" expand="yes">
        </cfif>
    </body>
</html>