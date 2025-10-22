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

                writeOutput("In the word length Order <br> <br>");

                for (item in resultArrayLengthOrder) {
                    writeOutput(item.name & " (" & item.count & ") <br> <br> ");
                }

                writeOutput("<br> <br><br> <br> In the Alphabetical Order <br> <br> ");

                for (item in resultArrayAphabetOrder) {
                    writeOutput(item.name & " (" & item.count & ") <br> <br>");
                }
            </cfscript>
        </p>
    </body>
</html>