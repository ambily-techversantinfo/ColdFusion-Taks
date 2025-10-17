<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q10</title>
    </head>
    <body>
        <cfoutput>
            <cffunction name="multiply" access="public" returntype="numeric" output="false">
                <cfset var result = 1>

                <cfloop collection="#arguments#" item="key">
                    <cfif isNumeric(arguments[key])>
                        <cfset result *= arguments[key]>
                    <cfelse>
                        <cfthrow message="Non-numeric argument (#key#) passed to multiply().">
                    </cfif>
                </cfloop>

                <cfreturn result>
            </cffunction>

            <cfset result1 = multiply(1,2)>
            <cfdump  var="#result1#"> <br>

            <cfset result2 = multiply(1,2,3)>
            <cfdump  var="#result2#"> <br>

            <cfset result3 = multiply(1,2,3,4)>
            <cfdump  var="#result3#"> <br>
        </cfoutput>
    </body>
</html>