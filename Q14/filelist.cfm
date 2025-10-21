<!DOCTYPE html>
<html>
    <head>
        <title> File details</title>
    </head>
    <body>
        <cfquery name="getFileDetails" datasource="myMSSQLDB">
            SELECT id, filename, tempfilepath
            FROM fileDetails
            ORDER BY id;
        </cfquery>

        <cfoutput>
            <h2>File List</h2>

            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>ID</th>
                    <th>File Name</th>
                    <th>Thumb Image</th>
                </tr>

                <cfloop query="getFileDetails">
                    <tr>
                        <td>#id#</td>
                        <td><a href="filedetail.cfm?id=#id#">#filename#</a></td>
                        <td><cfimage source="#tempfilepath#" action="writeToBrowser"></td>
                    </tr>
                </cfloop>
            </table>
        </cfoutput>
    </body>
</html>
