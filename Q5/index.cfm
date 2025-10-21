<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q5</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" method="POST" name="formSubmit" class="formClass">
            Users' DOB : <input 
                            type="text" 
                            name="userDob" 
                            label="Date of Birth" 
                            required="yes" 
                            validate="date" 
                            message="Please choose user's DOB (mm/dd/yyyy)">
                        <br><br>
            Mothers' DOB : <input 
                            type="text" 
                            name="motherDob" 
                            label="Mother's Date of Birth" 
                            required="yes" 
                            validate="date" 
                            message="Please choose mother's DOB (mm/dd/yyyy)">
                        <br><br>

            <input type="submit" name="submit" value="Submit">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset userDob = form.userDob>
                <cfset motherDob = form.motherDob>

                <cfset currentDateTime = now()>
                <cfset currentDate = LSDateFormat(currentDateTime, "yyyy-mm-dd")>
                <cfset usersAge = DateDiff("yyyy",userDob,currentDate)>

                <cfset dateDifference = DateDiff("yyyy",motherDob,userDob)>

                <cfset currentYear = year(currentDateTime)>

                <cfset usersDay = day(userDob)>
                <cfset usersMonth = month(userDob)>

                <cfset usersNextBirthday = createDate(currentYear, usersMonth, usersDay)>
                
                <cfif DateCompare(usersNextBirthday, currentDateTime) EQ -1>
                    <cfset usersNextBirthday = DateAdd("yyyy", 1, usersNextBirthday)>
                </cfif>

                <cfset daysForUsersBirthday = dateDiff("d", currentDateTime, usersNextBirthday)>

                <cfset mothersDay = day(motherDob)>
                <cfset mothersMonth = month(motherDob)>

                <cfset mothersNextBirthday = createDate(currentYear, mothersMonth, mothersDay)>
                
                <cfif DateCompare(mothersNextBirthday, currentDateTime) EQ -1>
                    <cfset mothersNextBirthday = DateAdd("yyyy", 1, mothersNextBirthday)>
                </cfif>

                <cfset daysForMothersBirthday = dateDiff("d", currentDateTime, mothersNextBirthday)>

                <cfoutput> 
                    Users Age : #usersAge#  <br> <br>
                    At the age of <b> #dateDifference# </b> Mother give birth to user. <br> <br>
                    User's birthday coming in #daysForUsersBirthday# days. <br> <br>
                    Mother's birthday coming in #daysForMothersBirthday# days.
                </cfoutput>
            </cfif>
        </p>
    </body>
</html>
