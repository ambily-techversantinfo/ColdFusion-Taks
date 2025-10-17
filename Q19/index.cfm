<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q19</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfif StructKeyExists(Cookie, "VisitsCounter")>
                    <cfset Cookie.VisitsCounter = Cookie.VisitsCounter + 1>
                <cfelse>
                    <cfcookie name="VisitsCounter" value=1 expires=30 httponly="yes" />
                </cfif>
                <cfoutput>
                    The value of "VisitsCounter" is: #Cookie.VisitsCounter#
                </cfoutput>
            </cfif>
        </p>
    </body>
</html>
