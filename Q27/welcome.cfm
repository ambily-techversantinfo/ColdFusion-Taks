<!DOCTYPE html>
<html>
    <head>
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "loggedIn") OR session.loggedIn NEQ true>
            <cflocation url="index.cfm">
        </cfif>

        <div class="welcome-container">
            <h1>Welcome, <cfoutput>#session.username#</cfoutput>!</h1>
            <a class="logout-btn" href="logout.cfm">Logout</a>
        </div>
    </body>
</html>