<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q24</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Email Id : <input 
                name="emailId" 
                type="text"
                value=""
                required="yes" 
                message="Please enter Email Id"
                id="emailId"> 
                <input name="checkEmail" type="checkbox" id="checkEmail">
            <br> <br>
            Name : <input 
                name="firstName" 
                type="text"
                value=""
                required="yes" 
                message="Please enter Name"> <br> <br>
            <input type="submit" name="submit" value="Submit" disabled id="submitBtn">
        </form>

        <p class="error"></p>

        <cfif structKeyExists(form, "submit")>
            <cfinvoke 
                component="dbOprations"
                method="saveData"
                firstname="#form.firstName#"
                emailId="#form.emailId#"
            />

            <cfoutput>
                <p class="success" style="color:green;">Data saved successfully!</p>
            </cfoutput>
        </cfif>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
