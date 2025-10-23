<!DOCTYPE html>
<html>
    <head>
        <title> Form Submit 25</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>
    <body>
        <p class="formClass">
            <cfset wordObj = createObject("component", "tagCloud")>

            <cfset wordsArray = wordObj.getWords()>

            <cfscript>
                wordsCount = {};
                uniqueValues = [];
                resultArrayLengthOrder = [];
                resultArrayAphabetOrder = [];

                for (key in wordsArray) {
                    if (structKeyExists(wordsCount, key)) {
                        wordsCount[key] += 1;
                    } else {
                        wordsCount[key] = 1;
                    }

                    value = wordsCount[key];

                    if (!arrayContains(uniqueValues, value)) {
                        arrayAppend(uniqueValues, value);
                    }
                }

                arraySort(uniqueValues, function(a, b) {
                    return b - a;
                });

                for (i = 1; i <= uniqueValues.len(); i++) {
                    matchingKeys = [];

                    for (key in wordsCount) {
                        if (wordsCount[key] == uniqueValues[i]) {
                            arrayAppend(matchingKeys, key);
                        }
                    }

                    resultArray = matchingKeys

                    arraySort(matchingKeys, function(a, b) {
                        return len(b) - len(a);
                    });

                    for (j = 1; j <= matchingKeys.len(); j++) {
                        arrayAppend(resultArrayLengthOrder, {name=matchingKeys[j], count=uniqueValues[i]})
                    }

                    arraySort(resultArray, function(a, b) {
                        if (a > b) return 1;
                        if (a < b) return -1;
                        return 0;
                    });

                    for (j = 1; j <= resultArray.len(); j++) {
                        arrayAppend(resultArrayAphabetOrder, {name=resultArray[j], count=uniqueValues[i]})
                    }
                }
            </cfscript>

            <cfoutput>
                <cfset count = 0>
                <cfset colors = ["red","green","blue","orange"]>
                <cfset fontSize = 20>

                In the word length Order <br> <br>
                <cfloop array="#resultArrayLengthOrder#" item="item">
                    <cfif item.count NEQ count>
                        <cfset fontSize = fontSize-2>
                        <cfset myColor = colors[randRange(1, arrayLen(colors))]>
                    </cfif>

                    <span style="color:#myColor#; font-size:#fontSize#px;">#item.name#  (  #item.count#  ) <br> <br></span>
                    <cfset count = item.count>
                </cfloop>

                <br> <br><br> <br> In the Alphabetical Order <br> <br>
                <cfset count = 0>
                <cfset colors = ["pink","violet","yellow","indigo"]>
                <cfset fontSize = 20>

                <cfloop array="#resultArrayAphabetOrder#" item="item">
                    <cfif item.count NEQ count>
                        <cfset fontSize = fontSize-2>
                        <cfset myColor = colors[randRange(1, arrayLen(colors))]>
                    </cfif>

                    <span style="color:#myColor#; font-size:#fontSize#px;">#item.name#  (  #item.count#  ) <br> <br></span>
                    <cfset count = item.count>
                </cfloop>
            </cfoutput>
        </p>
    </body>
</html>