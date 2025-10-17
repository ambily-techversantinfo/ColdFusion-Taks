<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit 21</title>
    </head>
    <body>
        <cfset inputArray = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]'>
        <cfif IsJSON(inputArray)>
            <cfset cfData = DeserializeJSON(inputArray)>

            <cfoutput>
                <h2>Details</h2>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Location</th>
                    </tr>

                    <cfloop array="#cfData#" index="details">
                        <tr>
                            <td>#details.Name#</td>
                            <td>#details.Age#</td>
                            <td>#details.LOCATION#</td>
                        </tr>
                    </cfloop>
                </table>
            </cfoutput>
        </cfif>
    </body>
</html>