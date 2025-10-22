<cfcomponent>
    <cffunction name="saveForm" access="public" returntype="void" output="false">
        <cfargument name="firstname" type="string" required="true">
        <cfargument name="lastname" type="string" required="true">
        <cfargument name="emailId" type="string" required="true">
        <cfargument name="phoneNumber" type="string" required="true">
        <cfargument name="resume" type="string">
        <cfargument name="salary" type="string">
        <cfargument name="position" type="string" required="true">
        <cfargument name="relocate" type="string" required="true">
        <cfargument name="startDate" type="string" required="true">
        <cfargument name="portfolio" type="string">

        <cfquery datasource="myMSSQLDB" name="insertForm">
            INSERT INTO employeeDetails (firstname, lastname, emailId, phoneNumber, position, relocate, startDate, portfolio, resume, salary)
            VALUES (
                <cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.phoneNumber#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.position#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.relocate#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.portfolio#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.resume#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.salary#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>
</cfcomponent>