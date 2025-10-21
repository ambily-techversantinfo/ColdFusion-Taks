<cfcomponent>
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
</cfcomponent>