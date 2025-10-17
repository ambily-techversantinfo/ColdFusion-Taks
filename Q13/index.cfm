<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q13</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Enter String : <input 
                name="inputString" 
                type="text"
                value=""
                required="yes" 
                message="Please enter the value"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset stringValue = form.inputString>

                <cfset stringToCheck = "the quick brown fox jumps over the lazy dog">

                <cfset matches = reMatch(stringValue, stringToCheck)>

                <cfoutput> Found the key "#stringValue#" word in #arrayLen(matches)# time - #stringToCheck#</cfoutput>
            </cfif>
        </p>
    </body>
</html>

