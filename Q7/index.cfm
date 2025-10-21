<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q7</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Key : <input 
                name="inputKey" 
                type="text"
                value=""
                required="yes" 
                message="Please enter input Key"> <br> <br>
            Value : <input 
                name="inputValue" 
                type="text"
                value=""
                required="yes" 
                message="Please enter input Value"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif structKeyExists(form, "submit")>
            <cfset keyName = form.inputKey>
            <cfset value = form.inputValue>

            <cfif NOT structKeyExists(session, "myStructUsingSession")>
                <cfset session.myStructUsingSession = {}>
            </cfif>

            <cfset structInsert(session.myStructUsingSession, keyName, value)>
            <cfdump var="#session.myStructUsingSession#" expand="yes">
        </cfif>
    </body>
</html>


