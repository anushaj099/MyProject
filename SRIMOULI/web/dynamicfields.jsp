<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
      <SCRIPT language="javascript">
  function addRow(tableID) {

   var table = document.getElementById(tableID);

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
                      
   var colCount = table.rows[0].cells.length;
                      //   alert(colCount);
   for(var i=0; i<colCount; i++) {

    var newcell = row.insertCell(i);

    newcell.innerHTML = table.rows[0].cells[i].innerHTML;
    //alert(newcell.childNodes[0].type);
    switch(newcell.childNodes[0].type) {
     case "text":
       newcell.childNodes[0].value = "";
       break;
     case "checkbox":
       newcell.childNodes[0].checked = false;
       break;
     case "select-one":
       newcell.childNodes[0].selectedIndex = 0;
       break;
    }
   }
                        
                        
  }
  /*function calculate(tableID){
      alert("hiiiiiiiiii");
      var inputs=document.querySelectorAll("#"+tableID+"input");
      var total=0;
      for(var i=0;i<inputs.length;i++){
          if (!isNaN(parseInt(inputs[i].value))) {
        total += parseInt(inputs[i].value);
        }
      }
      alert(total);
  }*/

    </SCRIPT>
   </head>
    <body>
       
 
        <s:form action="dfield" id="myForm">
            <TABLE class="hours-table" id="dataTable" BORDER=0 CELLPADDING=0 CELLSPACING=0>
                          <% 
                          int x=2;
                          %>
            <% for(int i=0;i<3;i++) {%>             
        
<tr>
    <td><s:select name="ptp.variety" cssClass="form-control" list="{'Cotton1','Comber'}" theme="simple" readonly="true"/></td>  
<td><s:textfield name="ptp.TotalBales" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales"  theme="simple" ></s:textfield></td>
<td><s:textfield name="ptp.weight" cssClass="form-control price"  onkeypress="return isNumberKey(this,event)" id="mix1" theme="simple" ></s:textfield></td>
<td><s:textfield name="ptp.mixing" cssClass="form-control price2" readonly="true"  onmousemove="javascript:addNumbers1()"  id="noBales1" theme="simple"></s:textfield></td>
</tr>
         <% } %>
</table>

<table class="hours-table">
    <tr>
<td><s:textfield name="ptp.variety" value="Total" theme="simple" readonly="true"></s:textfield></td>
<td><b><s:textfield name="ptp.totalTotalBales" id="totalPrice3" readonly="true" cssClass="form-control"  theme="simple" ></s:textfield> </b></td>
<td><b><s:textfield name="ptp.totalWeight" id="totalPrice1" readonly="true" cssClass="form-control total" theme="simple"></s:textfield>   </b></td>
<td><b><s:textfield name="ptp.totalMixing" id="totalPrice2"  readonly="true" cssClass="form-control" theme="simple" ></s:textfield> </b></td>
</tr> 
</table> 
</s:form>
        <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" onkeyup="myFunction()"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
 <script>
$('.price3').mouseenter(function () {
    var sum = 0;
    $('.price3').each(function() {
        sum += Number($(this).val());
        var n;
        n=sum.toFixed(3);
    });
    $('#totalPrice3').val(sum);
});

$('.price').mouseenter(function () {
    var sum = 0;
    $('.price').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice1').val(sum);
});

$('.price2').mousemove(function () {
   var sum = 0;
    $('.price2').each(function() {
        sum += Number($(this).val());
    sum=100.00;
    });
     
    $('#totalPrice2').val(sum);
});

 $(document).ready(function () {
    $('.hours-table tr').on('mousemove', function() {
        $('.hours-table tr').each(function() {
            var n=0;
            var hours = $(this).find('input.price').val();
           var rate=parseFloat(document.getElementById("totalPrice1").value);
            var dateTotal = (hours / rate)*100;
            n=dateTotal.toFixed(3);
            $(this).find('input.price2').val(n);
        }); //END .each
        return false;
    }); // END click 
});
 
/*$('.price').keyup(function () {
$('.price').each(function () {    
     var sum = 0,n=0;
     var y=parseFloat(document.getElementById("totalPrice1").value);
     var grade =  $(this).val();
           alert(grade+"haiiiiiiiiiiii"+y);
           sum=(grade/y)*100;alert("hhhhhhhhhhhhhhhh"+sum);
           n=sum.toFixed(3);
           $('.price2').val(n);
});
});*/



/*function addNumbers1()
{
    var sum=0;
    var n;
    var x=parseFloat(document.getElementById("mix1").value);
    var y=parseFloat(document.getElementById("totalPrice1").value);
   
        sum=(x/y)*100;
      n=sum.toFixed(3);
    
    var z=document.getElementById("noBales1");
    if(isNaN(n))
        n="";
    z.value=n;
   
      
}*/

</script>
</html>