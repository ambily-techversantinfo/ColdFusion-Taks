<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q8</title>
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
            <cfset keyName = trim(form.inputKey)>
            <cfset value = trim(form.inputValue)>

            <cfif NOT structKeyExists(session, "myStruct")>
                <cfset session.myStruct = {}>
            </cfif>

            <cfif structKeyExists(session.myStruct, keyName)>
                <cfset structUpdate(session.myStruct, keyName, value)>
            <cfelse>
                <cfset structInsert(session.myStruct, keyName, value)>
            </cfif>

            <cfdump var="#session.myStruct#" expand="yes">
        </cfif>
    </body>
</html>
