<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q3</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Enter Values : <input 
                name="inputText" 
                type="text"
                value=""
                required="yes" 
                message="Please enter input text"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset numbers = form.inputText>
                <cfset numberArray = listToArray(numbers, ",")>

                <cfloop array="#numberArray#" item="item">
                    <cfif IsNumeric(item)>
                        <cfif item MOD 3 EQ 0>
                            <cfoutput> #item# <br></cfoutput>
                        <cfelse>
                            <cfcontinue>
                        </cfif>
                    </cfif>
                </cfloop>
            </cfif>
        </p>
    </body>
</html>