<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q17</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass" onsubmit="return validateForm()">
            Enter Number : <input 
                name="inputNumber" 
                type="text"
                value=""
                required="yes" 
                message="Please enter Number"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset number = form.inputNumber>
                <cfoutput> Number Given : #number# </cfoutput> <br> <br>

                <cfloop index="i" from="1" to="#number#">
                    <cfif i MOD 2 EQ 0>
                    <cfoutput> <span class="greenText"> #i# </span> </cfoutput> <br>
                    <cfelse>
                    <cfoutput> <span class="blueText"> #i# </span> </cfoutput> <br>
                    </cfif>
                </cfloop>
            </cfif>
        </p>

        <script>
            function validateForm() {
                let inputNumber = document.getElementById("inputNumber").value;

                if (inputNumber === "") {
                    alert("Number must be filled out");
                    return false;
                }

                if (Number.isNaN(Number(inputNumber))) {
                    alert("Please enter a number");
                    return false;
                }
            }
        </script>
    </body>
</html>
