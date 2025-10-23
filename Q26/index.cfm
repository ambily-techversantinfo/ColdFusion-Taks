<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit 26</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" enctype="multipart/form-data" method="POST" name="formSubmit" class="formClass">
            File : <input type="file" name="uploadedFile" required="yes"> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset uploadDir = "/opt/coldfusion2025/cf_installer/ColdFusion/cfusion/wwwroot/uploads/">

                <cffile 
                    action="upload" 
                    filefield="uploadedFile" 
                    destination="#uploadDir#" 
                    nameConflict="Overwrite" 
                    result="uploadResult">
                
                <cffile action="read"
                    file="#uploadResult.serverDirectory#/#uploadResult.serverFile#"
                    variable="fileContents">

                <cfset inputText = encodeForHTML(fileContents)>
                <cfset cleanText = trim(REReplace(inputText, "[\r\n]+$", "", "all"))>

                <cfset wordObj = createObject("component", "tagCloud").init(cleanText)>
                <cfset message = wordObj.saveWords()>
                <cfoutput> #message# </cfoutput>
            </cfif>
        </p>
    </body>
</html>