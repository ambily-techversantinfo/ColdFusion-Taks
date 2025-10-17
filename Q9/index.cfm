<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q9</title>
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

            <cfif NOT structKeyExists(session, "myStructTask9")>
                <cfset session.myStructTask9 = {}>
            </cfif>

            <cfif structKeyExists(session.myStructTask9, keyName)>
                <cfoutput> '#keyName# already present. Cannot add again' </cfoutput> <br> <br>
            <cfelse>
                <cfset structInsert(session.myStructTask9, keyName, value)>
            </cfif>

            <cfdump var="#session.myStructTask9#" expand="yes">
        </cfif>
    </body>
</html>
