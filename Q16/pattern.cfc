<cfcomponent>
    <cffunction  name="printPattern" access="public" returntype="void" output="true">
        <cfscript>
            for (i = 1; i <= 3; i++) {
                k = 0;
                for (j = 1; j <= 3; j++) {
                    writeOutput((i+k) & Chr(32));
                    k = k+3;
                }
                writeOutput("<br>");
            }
        </cfscript>
    </cffunction>
</cfcomponent>
