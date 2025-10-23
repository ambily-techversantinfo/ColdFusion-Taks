<!DOCTYPE html>
<html>
    <head>
        <title> Login Page</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Username : <input 
                name="username" 
                type="text"
                value=""
                required="yes" 
                message="Please enter username"> <br> <br>
            Password : <input 
                name="password" 
                type="password"
                value=""
                required="yes" 
                message="Please enter password"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
            <cfset username = trim(form.username)>
            <cfset password = trim(form.password)>

            <cfset validUsers = { "admin" = "1234", "user1" = "pass1" }>

            <cfif structKeyExists(validUsers, username) AND validUsers[username] EQ password>
                <cfset session.username = username>
                <cfset session.loggedIn = true>
                <cflocation url="welcome.cfm">
            <cfelse>
                <cfoutput>Invalid username or password. Try again</cfoutput>
            </cfif>
        </cfif>
        </p>
    </body>
</html>

