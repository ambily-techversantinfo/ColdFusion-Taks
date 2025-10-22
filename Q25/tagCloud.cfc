<cfcomponent output="false">
    <!--- Constructor --->
    <cffunction name="init" access="public" returntype="any" output="false">
        <cfargument name="inputText" type="string" required="true">
        <cfset variables.inputText = arguments.inputText>
        <cfreturn this>
    </cffunction>

    <cffunction name="saveWords" access="public" returntype="void" output="false">
        <cfset newString = Replace(variables.inputText, ".", " ", "ALL") />
        <cfset words = listToArray(newString, " ")>

        <cfloop array="#words#" index="word">
            <cfif len(trim(word)) GT 2 && !isNumeric(word)>
                <cfquery datasource="myMSSQLDB">
                    INSERT INTO tags (tags)
                    VALUES (<cfqueryparam value="#trim(word)#" cfsqltype="cf_sql_varchar">)
                </cfquery>
            </cfif>
        </cfloop>
    </cffunction>

    <cffunction name="getWords" access="public" returntype="array" output="false">
        <cfset var words = []>
        <cfquery datasource="myMSSQLDB" name="wordQuery">
            SELECT tags
            FROM tags
            ORDER BY tags
        </cfquery>

        <cfloop query="wordQuery">
            <cfset arrayAppend(words, wordQuery.tags)>
        </cfloop>

        <cfreturn words>
    </cffunction>
</cfcomponent>