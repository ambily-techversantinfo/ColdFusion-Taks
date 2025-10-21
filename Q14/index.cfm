<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit Q14</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" enctype="multipart/form-data" method="POST" name="formSubmit" class="formClass">
            Enter Image Name : <input 
                name="imageName" 
                type="text"
                value=""
                required="yes" 
                message="Please enter the image name"> <br> <br>
            File : <input type="file" name="uploadedFile" required="yes"> <br> <br>
            Description : <textarea name="description" rows="5" cols="50"></textarea> <br> <br>
            <input type="submit" name="submit" value="Upload">
        </form>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset fileName = form.imageName>
                <cfset description = structKeyExists(form, "description") ? form.description : "">
                <cfset uploadDir = "/opt/coldfusion2025/cf_installer/ColdFusion/cfusion/wwwroot/uploads/">
                <cfset allowedExtensions = "jpg,jpeg,png,gif">
                <cfset maxFileSize = 1024 * 1024> <!-- 1 MB -->

                <cffile 
                    action="upload" 
                    filefield="uploadedFile" 
                    destination="#uploadDir#" 
                    nameConflict="Overwrite" 
                    result="uploadResult">
                
                <cfset fileUploadOk = 0>
                <cfif uploadResult.FileSize GT maxFileSize>
                    <cfset fileUploadOk = 1>
                    <cffile action="delete" file="#uploadResult.ServerDirectory#/#uploadResult.ServerFile#">
                    <cfoutput>File too large! Maximum allowed size is 1 MB.</cfoutput>
                </cfif>

                <cfif NOT listFindNoCase(allowedExtensions, uploadResult.ClientFileExt)>
                    <cfset fileUploadOk = 1>
                    <cffile action="delete" file="#uploadResult.ServerDirectory#/#uploadResult.ServerFile#">
                    <cfoutput>Invalid file type. Only JPG, PNG, GIF are allowed.</cfoutput>
                </cfif>

                <cfif fileUploadOk == 0>
                    <cfset original = uploadResult.ServerDirectory & "/" & uploadResult.ServerFile>
                    <cfset thumbnail = uploadResult.ServerDirectory & "/thumb_" & uploadResult.ServerFile>

                    <cfif NOT fileExists(thumbnail)>
                        <cfimage 
                            action="resize"
                            source="#original#"
                            destination="#thumbnail#"
                            width="20"
                            height="20"
                            overwrite="yes">
                    <cfelse>
                        <cfoutput>Thumbnail already exists!</cfoutput>
                    </cfif>

                    <cfquery datasource="myMSSQLDB">
                        INSERT INTO fileDetails ( filename, description, filepath, tempfilepath)
                        VALUES (
                            <cfqueryparam value="#fileName#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#description#" cfsqltype="cf_sql_longvarchar">,
                            <cfqueryparam value="#original#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#thumbnail#" cfsqltype="cf_sql_varchar">
                        )
                    </cfquery>
                </cfif>
            </cfif>

            <br> <br> <br>
            <a href="filelist.cfm">View Listing</a>
        </p>
    </body>
</html>

