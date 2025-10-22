<cfcomponent output="false">
    <cffunction name="checkEmail" access="remote" returntype="struct" output="false" httpmethod="post" returnFormat="json">
        <cfargument name="email" type="string" required="true">

        <cfset result = structNew()>
        <cfset result.emailExists = false>

        <cfquery datasource="myMSSQLDB" name="emailCheck">
            SELECT COUNT(*) as total
            FROM users
            WHERE emailId = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfif emailCheck.total GT 0>
            <cfset result.emailExists = true>
        </cfif>

        <cfreturn result>
    </cffunction>

    <cffunction name="saveData" access="public" returntype="void" output="false">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="emailId" type="string" required="true">

        <cfquery datasource="myMSSQLDB" name="insertForm">
            INSERT INTO users (firstname, emailId)
            VALUES (
                <cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>
</cfcomponent>