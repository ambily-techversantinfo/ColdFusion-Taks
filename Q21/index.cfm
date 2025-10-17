<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit 21</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" enctype="multipart/form-data" method="POST" name="formSubmit" class="formClass">
            Birthday Baby Name: <input 
                            type="text" 
                            name="name" 
                            label="Name"
                            required="yes" 
                            message="Please enter Birthday baby name">
                        <br><br>
            Email: <input 
                            type="text" 
                            name="email" 
                            label="Email Id"
                            required="yes" 
                            message="Please enter Email Id">
                        <br><br>
            Birthday Wish : <textarea name="wish" rows="5" cols="50"></textarea> <br> <br>
            Greeting image : <input type="file" name="uploadedFile" required="yes"> <br> <br>

            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset name = form.name>
                <cfset emailId = form.email>
                <cfset wish = structKeyExists(form, "wish") ? form.wish : "">
                <cfset errors = {}>

                <cfif len(trim(emailId)) eq 0>
                    <cfset errors.email = "Email is required.">
                <cfelseif NOT REFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$", form.email)>
                    <cfset errors.email = "Invalid email format.">
                </cfif>

                <cfif NOT structIsEmpty(errors)>
                    <cfoutput>
                        <ul>
                            <cfloop collection="#errors#" item="field">
                                <li>#errors[field]#</li>
                            </cfloop>
                        </ul>
                    </cfoutput> <br> <br>
                </cfif>

                <cfset uploadDir = "/opt/coldfusion2025/cf_installer/ColdFusion/cfusion/wwwroot/uploads/">

                <cffile 
                    action="upload" 
                    filefield="uploadedFile" 
                    destination="#uploadDir#" 
                    nameConflict="Overwrite" 
                    result="uploadResult">

                <cfset originalLocation = uploadResult.serverDirectory & "/" & uploadResult.serverFile>

                <cfmail 
                    from="ambilysabu92@gmail.com" 
                    to="#emailId#" 
                    subject="Birthday Greetings"
                    server="smtp.gmail.com"
                    port="587"
                    username="ambily@techversantinfo.com"
                    password="ncixcoptncgcauah"
                    useTLS="true"
                >
                    Dear #name#,

                    #wish#

                    With Love,
                    Ann
                    
                    <cfmailparam file="#originalLocation#" disposition="inline" contentID="myImage">
                </cfmail>
            </cfif> 
        </p>
    </body>
</html>
