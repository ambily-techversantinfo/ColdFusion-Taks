<!DOCTYPE html>
<html>
    <head>
        <title> Multiply Function</title>
    </head>

    <body>
        <!-- Multiply 2 numbers -->
        <cfinvoke component="component" method="multiply" returnvariable="res1">
            <cfinvokeargument name="a" value="1">
            <cfinvokeargument name="b" value="2">
        </cfinvoke>
        <cfoutput>Invoke Tag Result multiply(1,2): #res1#</cfoutput> <br> <br>

        <!-- Multiply 3 numbers -->
        <cfinvoke component="component" method="multiply" returnvariable="res2">
            <cfinvokeargument name="x" value="1">
            <cfinvokeargument name="y" value="2">
            <cfinvokeargument name="z" value="3">
        </cfinvoke>
        <cfoutput>Invoke Tag Result multiply(1,2,3): #res2#</cfoutput> <br> <br>

        <!-- Multiply 4 numbers -->
        <cfinvoke component="component" method="multiply" returnvariable="res3">
            <cfinvokeargument name="p" value="1">
            <cfinvokeargument name="q" value="2">
            <cfinvokeargument name="r" value="3">
            <cfinvokeargument name="t" value="4">
        </cfinvoke>
        <cfoutput>Invoke Tag Result multiply(1,2,3,4): #res3#</cfoutput> <br> <br> <br> <br><br>


        <!-- Create object using cfobject -->
        <cfobject component="component" name="mathObj">

        <cfset result = mathObj.multiply(1, 2)>
        <cfoutput> cfobject Tag Result multiply(1,2): #result# </cfoutput> <br> <br>

        <cfset result1 = mathObj.multiply(1, 2, 3)>
        <cfoutput> cfobject Tag Result multiply(1,2,3): #result1# </cfoutput> <br> <br>

        <cfset result2 = mathObj.multiply(1, 2, 3, 4)>
        <cfoutput> cfobject Tag Result multiply(1,2,3,4): #result2# </cfoutput> <br> <br> <br> <br>

        <!-- Create object using createObject -->
        <cfset mathObjNew = createObject("component", "component")>

        <cfset prod = mathObjNew.multiply(1, 2)>
        <cfoutput>createObject Result multiply(1,2): #prod#</cfoutput> <br> <br>

        <cfset prod1 = mathObjNew.multiply(1, 2, 3)>
        <cfoutput>createObject Result multiply(1,2, 3): #prod1#</cfoutput> <br> <br>

        <cfset prod2 = mathObjNew.multiply(1, 2, 3, 4)>
        <cfoutput>createObject Result multiply(1,2, 3, 4): #prod2#</cfoutput> <br> <br>
    </body>
</html>
