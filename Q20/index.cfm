<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit 20</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <cfscript>
            function generateRandomCaptchaText(length=6) {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var captchaText = "";
                for (var i = 1; i <= length; i++) {
                    captchaText &= Mid(chars, RandRange(1, Len(chars)), 1);
                }
                return captchaText;
            }

            captchaValue = generateRandomCaptchaText();

            if (StructKeyExists(session, "captcha")) {
                 session.prevCaptcha = session.captcha;
            }

            session.captcha = captchaValue;
            errors = structNew();
        </cfscript>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset email = form.email>
                <cfset captcha = form.captcha>

                <cfif len(trim(captcha)) EQ 0>
                    <cfset errors.captcha = "Captcha is required.">
                </cfif>

                <cfif len(trim(email)) EQ 0>
                    <cfset errors.email = "Email is required.">
                <cfelseif NOT REFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$", form.email)>
                    <cfset errors.email = "Invalid email format.">
                </cfif>

                <cfif trim(captcha) NEQ session.prevCaptcha>
                    <cfset errors.captcha = "CAPTCHA did not match. Please try again.">
                </cfif>

                <cfif structIsEmpty(errors)>
                    <cfoutput>Form submitted successfully!<br>
                        Captcha: #captcha#<br>
                        Email: #email#
                    </cfoutput> <br> <br>
                    <cfoutput> Email Address successfully subscribe our newsletter </cfoutput> <br> <br>
                    <cfset StructDelete(session, "captcha")>
                <cfelse>
                    <cfoutput>
                        <ul>
                            <cfloop collection="#errors#" item="field">
                                <li>#errors[field]#</li>
                            </cfloop>
                        </ul>
                    </cfoutput> <br> <br>
                </cfif>
                
            </cfif>
        </p>

        <form action="" method="POST" name="formSubmit" class="formClass">
            Enter Email : <input 
                            type="text" 
                            name="email" 
                            label="Email">
                        <br><br>
            Enter Captcha : <input 
                            type="text" 
                            name="captcha" 
                            label="Captcha">
                        <br><br>
            <cfimage action="captcha"
                    text="#captchaValue#"
                    width="200"
                    height="60"
                    difficulty="medium"
                    fonts="Arial,Verdana,Times New Roman"
                    fontSize="24"
                    border="yes"
                    borderColor="##000000"
                    borderThickness="1"> <br> <br>

            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>
