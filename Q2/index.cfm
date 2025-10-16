<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q2</title>
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

                <cfswitch expression=#number#>
                    <cfcase value=1>
                        <span> OK </span>
                    </cfcase>
                    <cfcase value=2>
                        <span> OK </span>
                    </cfcase>
                    <cfcase value=3>
                        <span> Fair </span>
                    </cfcase>
                    <cfcase value=4>
                        <span> Good </span>
                    </cfcase>
                    <cfcase value=5>
                        <span> Very Good </span>
                    </cfcase>
                    <cfdefaultcase>
                        <span> Invalid Number </span>
                    </cfdefaultcase>
                </cfswitch>
            </cfif>
        </p>
    </body>
</html>
