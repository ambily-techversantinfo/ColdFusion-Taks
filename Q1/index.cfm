<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q1</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Enter Number : <input 
                name="inputNumber" 
                type="text"
                value=""
                required="yes" 
                message="Please enter the number between 1 to 5"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset number = form.inputNumber>

                <cfif number EQ 5>
                    <cfoutput> Very Good </cfoutput>
                <cfelseif number EQ 4>
                    <cfoutput> Good </cfoutput>
                <cfelseif number EQ 3>
                    <cfoutput> Fair </cfoutput>
                <cfelseif number EQ 2 OR number EQ 1>
                    <cfoutput> OK </cfoutput>
                <cfelse>
                    <cfoutput> Invalid Input </cfoutput>
                </cfif>
            </cfif>
        </p>
    </body>
</html>

