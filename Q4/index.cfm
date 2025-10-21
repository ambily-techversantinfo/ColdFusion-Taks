<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q4</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <p class="formClass">
            <cfset currentDateTime = now()>
            <cfset currentDate = LSDateFormat(currentDateTime, "dd-mm-yyyy")>
            <cfset currentMonthNumeric = month(currentDateTime)>
            <cfset currentMonthString = monthAsString(currentMonthNumeric)>
            <cfset dayOfWeekToday = DayOfWeek(currentDateTime)>
            <cfset checkDayOfWeek = arrayFind([1,2,3,4,5,6], dayOfWeekToday)>

            <cfif checkDayOfWeek NEQ 0>
                <cfset daySubtract = dayOfWeekToday + 1>
            <cfelseif dayOfWeekToday EQ 7>
                <cfset daySubtract = 1>
            </cfif>

            <cfset lastFriday = DateAdd("d", -daySubtract, currentDateTime)>
            <cfset lastFridayFormatted = LSDateFormat(lastFriday, "dd-mm-yyyy")>

            <cfset dayOfMonth = Day(currentDateTime)>
            <cfset NumberOfDaysInMonth = DaysInMonth(currentDateTime)>
            <cfset RemainingDays = NumberOfDaysInMonth - dayOfMonth>
            <cfset lastDayOfMonth = DateAdd("d", RemainingDays, currentDateTime)>
            <cfset lastDayOfMonthFormatted = LSDateFormat(lastDayOfMonth, "dddd")>

            <cfoutput> 
                Current Date : #currentDate# <br><br>
                Current Month Numeric : #currentMonthNumeric# <br><br>
                Current Month Word : #currentMonthString# <br><br>
                Day of week : #dayOfWeekToday# <br><br>
                Last Friday Date : #lastFridayFormatted# <br><br>
                Last day of the Month : #lastDayOfMonthFormatted# <br><br>
            </cfoutput>

            <!--- Last 5 days --->
            <cfloop from="1" to="5" index="i">
                <cfset lastDay = DateAdd("d", -i, currentDateTime)>
                <cfset dayOfWeekLastDay = DayOfWeek(lastDay)>
                <cfset lastDayFormatted = LSDateFormat(lastDay, "dd-mmm-yyyy")>
                <cfset lastDayFormattedString = LSDateFormat(lastDay, "dddd")>

                <cfswitch expression=#dayOfWeekLastDay#>
                    <cfcase value="1">
                        <cfset className = "redText">
                    </cfcase>
                    <cfcase value="2">
                        <cfset className = "greenText">
                    </cfcase>
                    <cfcase value="3">
                        <cfset className = "orangeText">
                    </cfcase>
                    <cfcase value="4">
                        <cfset className = "yellowText">
                    </cfcase>
                    <cfcase value="5">
                        <cfset className = "boldBlackText">
                    </cfcase>
                    <cfcase value="6">
                        <cfset className = "blueText">
                    </cfcase>
                    <cfcase value="7">
                        <cfset className = "boldRedText">
                    </cfcase>
                    <cfdefaultcase>
                        <cfset className = "boldBlackText">
                    </cfdefaultcase>
                </cfswitch>

                <cfoutput> 
                    <span class="#className#"> 
                        #lastDayFormatted# --- #lastDayFormattedString#<br> 
                    </span>
                </cfoutput>
            </cfloop>
        </p>
    </body>
</html>
