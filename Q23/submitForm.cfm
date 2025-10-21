<!DOCTYPE html>
<html>
    <head>
        <title>Employee Application Form</title>
    </head>
    <body>
        <cfif structKeyExists(form, "submit")>
            <cfset phoneNumber = trim(form.first3) & "-" & trim(form.next3) & "-" & trim(form.final4)>
            <cfset salary = trim(form.salayDoller) & "." & trim(form.salaryCents)>
            <cfset startDate = trim(form.month) & "/" & trim(form.date) & "/" & trim(form.year)>

            <cfif structKeyExists(form, "resume") AND form.resume NEQ "">
                <cfset uploadDir = "/opt/coldfusion2025/cf_installer/ColdFusion/cfusion/wwwroot/uploads/">
                <cffile 
                        action="upload" 
                        filefield="resume" 
                        destination="#uploadDir#" 
                        nameConflict="overwrite" 
                        result="uploadResult">
                
                <cfset resumePath = uploadResult.ServerFile>
            <cfelse>
                <cfset resumePath = "">
            </cfif>

            <cfinvoke 
                component="dbInsert"
                method="saveForm"
                firstname="#form.firstName#"
                lastname="#form.lastName#"
                emailId="#form.email#"
                phoneNumber="#phoneNumber#"
                position="#form.department#"
                relocate="#form.relocate#"
                startDate="#startDate#"
                portfolio="#form.website#"
                resume="#resumePath#"
                salary="#salary#"
            />

            <cfoutput>
                <p style="color:green;">Data saved successfully!</p>
            </cfoutput>
        <cfelse>
            <cfoutput>
                <p style="color:red;">Data Not Updated!</p>
            </cfoutput>
        </cfif>
    </body>
</html>
