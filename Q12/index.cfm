<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q12</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Enter Number : <input 
                name="inputNumber" 
                type="text"
                value=""
                required="yes" 
                message="Please enter the number between 1 and 9"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset number = form.inputNumber>

                <cfif NOT isNumeric(number) OR number GT 9>
                    <cfoutput> Invalid input Received. Please enter the number between 1 and 9. </cfoutput>
                </cfif>

                <cfquery name="getMembers" datasource="myMSSQLDB">
                    SELECT firstname,lastname
                    FROM members;
                </cfquery>

                <cfoutput>
                    <h2>Members List</h2>

                    <table border="1" cellpadding="5" cellspacing="0">
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                        </tr>

                        <cfloop query="getMembers">
                            <tr>
                                <td>#firstname#</td>
                                <td>#lastname#</td>
                            </tr>
                        </cfloop>
                    </table>
                </cfoutput>
                <br> <br> 
                <cfoutput>
                    The value in the row number #number# for 'firstname' is: #getMembers.firstname[number]#
                </cfoutput>
            </cfif>
        </p>
    </body>
</html>
