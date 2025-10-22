<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit 25</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <form action="" enctype="multipart/form-data" method="POST" name="formSubmit" class="formClass">
            Enter Text : <textarea name="inputText" rows="5" cols="50"></textarea> <br> <br>
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
                <cfset inputText = trim(form.inputText)>

                <cfif inputText !== "">
                    <cfset wordObj = createObject("component", "tagCloud").init(inputText)>

                    <cfset wordObj.saveWords()>
                </cfif>
            </cfif>
        </p>
    </body>
</html>