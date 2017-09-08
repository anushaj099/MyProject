
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sri Mouli Textiles Private Limited</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <script src="js/bootstrap.min.js"></script>
        
    </head>
    <body>
       <table>
    <tr>
        <td>Amount</td>
    </tr>
    <tr class="row_to_clone">
        <td>
            <input type="text" name="amount" value="" class="txt" autocomplete='off' />
        </td>
    </tr>
    <tr class="row_to_clone">
        <td>
            <input type="text" name="amount" value="" class="txt" autocomplete='off' />
        </td>
    </tr>
</table>
<a class="addRow" href="#">Add Another Row</a>

<div>Sum: <span id="sum"></span></div>
    </body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
 <script type="text/javascript">
        

function addRow() {
    /* Declare variables */
    var elements, templateRow, rowCount, row, className, newRow, element;
    var i, s, t;

    /* Get and count all "tr" elements with class="row".    The last one will
     * be serve as a template. */
    if (!document.getElementsByTagName) return false; /* DOM not supported */
    elements = document.getElementsByTagName("tr");
    templateRow = null;
    rowCount = 0;
    for (i = 0; i < elements.length; i++) {
        row = elements.item(i);

        /* Get the "class" attribute of the row. */
        className = null;
        if (row.getAttribute) className = row.getAttribute('class')
        if (className === null && row.attributes) { // MSIE 5
            /* getAttribute('class') always returns null on MSIE 5, and
             * row.attributes doesn't work on Firefox 1.0.    Go figure. */
            className = row.attributes['class'];
            alert("hellllllo"+className);
            if (className && typeof (className) === 'object' && className.value) {
                // MSIE 6
                className = className.value;
            }
        }

        /* This is not one of the rows we're looking for.    Move along. */
        if (className != "row_to_clone") continue;

        /* This *is* a row we're looking for. */
        templateRow = row;
        rowCount++;
    }
    if (templateRow == null) return false; /* Couldn't find a template row. */

    /* Make a copy of the template row */
    newRow = templateRow.cloneNode(true);

    /* Change the form variables e.g. price[x] -> price[rowCount] */
    elements = newRow.getElementsByTagName("input");
    for (i = 0; i < elements.length; i++) {
        element = elements.item(i);
        s = null;
        s = element.getAttribute("name");
        if (s == null) continue;
        t = s.split("[");
        if (t.length < 2) continue;
        s = t[0] + "[" + rowCount.toString() + "]";
        element.setAttribute("name", s);
        element.value = "";
    }
    
    /* Remove any pre-existing value from row */
    $(newRow).find("input").val("");
    
    /* Add the newly-created row to the table */
    templateRow.parentNode.appendChild(newRow);
    return true;
}

function calculateSum() {
    var sum = 0;
    //iterate through each textboxes and add the values
    $(".txt").each(function () {

        //add only if the value is number
        if (!isNaN(this.value) && this.value.length != 0) {
            sum += parseFloat(this.value);
        }

    });
    //.toFixed() method will roundoff the final sum to 2 decimal places
    $("#sum").html(sum.toFixed(2));
}

$(".addRow").on("click", addRow);

$("table").on("keyup", ".txt", function () {
    calculateSum();
});

</script>
</html>
