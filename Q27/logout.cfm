<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
    </head>
    <body>
        <cfif structKeyExists(session, "loggedIn")>
            <cfset structClear(session)>
        </cfif>

        <cflocation url="index.cfm">
    </body>
</html>