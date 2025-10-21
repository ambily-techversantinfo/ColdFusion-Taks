
<!DOCTYPE html>
<html>
    <head>
        <title> File details </title>
    </head>
    <body>
        <cfif structKeyExists(url, "id")>
            <cfset recordId = url.id>
            <cfquery datasource="myMSSQLDB" name="getFileRecord">
                SELECT *
                FROM fileDetails
                WHERE id = <cfqueryparam value="#recordId#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfoutput>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                        <th>ID</th>
                        <th>Image Name</th>
                        <th>Description</th>
                        <th>Image</th>
                    </tr>

                    <cfloop query="getFileRecord">
                        <tr>
                            <td>#id#</td>
                            <td>#filename#</td>
                            <td>#description#</td>
                            <td><cfimage source="#filepath#" action="writeToBrowser"></td>
                        </tr>
                    </cfloop>
                </table>
            </cfoutput>
        <cfelse>
            <cfoutput>No ID was passed in the URL.</cfoutput>
        </cfif>
    </body>
</html>