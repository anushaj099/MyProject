<%-- 
    Document   : Production
    Created on : Dec 12, 2016, 10:28:19 AM
    Author     : ch.mounika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <sj:head/>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sri Mouli Textiles Private Limited</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap Core CSS -->
    <link href="Images/SriMouli.ico" rel="icon">
   
    <!-- Custom CSS -->
    <link href="css/Srimouli.css" rel="stylesheet">
<link href="css/newcss.css" rel="stylesheet">
   
     <link href="css/bootstrap.min.css" rel="stylesheet">
       <style type="text/css">
            label[for="i"] {
            font-family:sans-serif;
            font-style: normal;
            color: black;
             font-size: 12pt;
            padding-bottom: 10px;} 
            label[for="fromDate"]{
            font-family:sans-serif;
                font-style: normal;
                color:black;
                font-size: 12pt;
                padding-bottom: 10px;
            }
            
        </style>

         <s:head />
  <!-- jQuery -->
   
   <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/Srimouli.css" rel="stylesheet">
        <link href="css/newcss.css" rel="stylesheet">



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="js/jquery.js"></script>
  
  
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
   
      <sx:head/>
   <script type="text/javascript">
    window.onload = function() {
   document.getElementById('fromDate').children[1].setAttribute("readOnly","true");
};
</script>
 
           <SCRIPT language="javascript">
  function addRow(one1) {
   var table = document.getElementById(one1);

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
                      
   var colCount = table.rows[0].cells.length;
                      //   alert(colCount);
   for(var i=0; i<colCount; i++) {

    var newcell = row.insertCell(i);

    newcell.innerHTML = table.rows[1].cells[i].innerHTML;
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
 
    </SCRIPT> 
 
        
   
 <style type="text/css">
* {margin:0;padding:0;}
#ticker {
display:block;
width:100#100;
color:#fff;
background:#000080;
font-family: Gill, Helvetica, sans-serif;
font-size:larger; 
font-weight:bold;
margin:auto;
text-align:center;
}


  </style> 
   <script type="text/javascript">
                   
             function isNumberKey(el, evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode !== 45 && charCode !== 8 && (charCode !== 46) && (charCode < 48 || charCode > 57))
                    return false;
                if (charCode === 46) {
                    if ((el.value) && (el.value.indexOf('.') >= 0))
                        return false;
                    else
                        return true;
                }
                return true;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                var number = evt.value.split('.');
                if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            }
            
   </script>
  
    </head>
    <body style="background-color: #EEEEEE">
          <s:if test="%{shift_date!=null}">
       <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property>  </marquee>
    </s:if>
    <s:else>
        <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>  
    </s:else>
     
    <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage2.jsp" %>                  
</s:iterator>
     
         
             
      
      <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Issue to Precleaning Data</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
         <center>

     <s:form action="precleaninginsert" method="post" class="form-horizontal">
        <table id="part1">
           
             <td><s:hidden name="id" value="%{id}" /></td>
          
          <s:if test="%{status==123}">
     <td><sx:datetimepicker name="ptp.date" disabled="true" cssStyle="width:600px" onkeypress="return isDecimalKey(event)" cssClass="lab" label="Date"   displayFormat="dd-MM-yyyy" value=""/></td>
     </s:if>
     <s:else>
         <td><sx:datetimepicker  name="ptp.date" cssStyle="width:600px" onkeypress="return isDecimalKey(event)" cssClass="lab" label="Date"   displayFormat="dd-MM-yyyy" value=""/></td> 
     </s:else>
             
             
             <%--<td><sx:datetimepicker id="fromDate"  name="ptp.date" cssStyle="width:600px" onkeypress="return isDecimalKey(event)" cssClass="lab" label="Date"   displayFormat="dd-MM-yyyy" value=""/></td>--%>
          
            
            <td><s:select name="ptp.superviser" id="i" cssClass="form-control " label="Godown Keeper Name"  list="superList" headerKey="-1" headerValue="-- Select Godown Keeper --"/></td>
            
            <td><s:select name="ptp.mixingNumber" id="i" cssClass="form-control" label="Mixing Number" list="{'Mixing1', 'Mixing2', 'Mixing3'}" headerKey="-1" headerValue="-- Select Mixing Number --"/></td>
           
            <td><s:select name="ptp.issueNumber" id="i" cssClass="form-control" label="Issue Number" list="{'1','2','3','4','5','6','7','8','9','10'}" headerKey="-1" headerValue="-- Select Issue Number --"/></td>
            
            <%--<td><s:select id="i"  name="ptp.shifts" list="{'Shift1','Shift2','Shift3'}" onchange="findval(this.value)" label="Select Shift" headerKey="-1" headerValue=" --Select Shift-- " cssClass="form-control shift"/></td>--%>
            <s:hidden value="%{status}" id="check1" />
           
        </table>
            <br/>
     <div class="form-group">
    
         
          <s:if test="year.isEmpty()">
   <div class="col-sm-6 text-center">
                            <center>
                                <s:submit id="goButton" value="Go" cssClass="btn btn-primary" align="right" onsubmit="return validateform()"></s:submit>
                                </center>
                            </div>
                      
    </s:if>
         <s:else>
             <div class="col-sm-6 text-center">
                            <center>
                                <s:submit disabled="true" id="goButton" value="Go" cssClass="btn btn-primary" align="right" onsubmit="return validateform()"></s:submit>
                                </center>
                            </div>
                     
         </s:else>
         
       
    
     </div>
     </s:form>
                
 <s:form action="precleaninginsertReal" enctype="multipart/form-data" method="post" onsubmit="return addAll()">

     <div class="col-sm-12 text-center"><h3>Issue to Precleaning Material Data</h3></div>
 
<div class="tab1">
    <table id="two1">
  <tr > <td align="left">   <input type="button" value="Add Row"  class="btn btn-primary" onclick="addRow('one1')" onkeyup="myFunction()"/>   
        </td></tr>
    </table>
<table class="table table-bordered table-responsive weight-table" id="one1">
   
<tr>
<th>Variety</th>
<th>No. of Bales</th>
<th>Weight</th>
<th>Mixing</th>

</tr>
<% 
                          int x=2;
                          %>
            <% for(int i=0;i<3;i++) {%>             
        
<tr>
    <td><s:select name="ptp.variety" cssClass="form-control" list="productlist" headerKey="" headerValue="Select variety" theme="simple" readonly="true"/></td>  
<td><s:textfield name="ptp.TotalBales" cssClass="form-control price3" placeholder="Enter No. of Bales" onkeypress="return isNumberKey(this,event)" id="bales"  theme="simple" ></s:textfield></td>
<td><s:textfield name="ptp.weight"  cssClass="form-control price" placeholder="Enter Weight"  onkeypress="return isNumberKey(this,event)" id="mix1" theme="simple" ></s:textfield></td>
<td><s:textfield name="ptp.mixing" placeholder="Enter Mixing"  cssClass="form-control price2" readonly="true"  onmousemove="javascript:addNumbers1()"  id="noBales1" theme="simple"></s:textfield></td>
</tr>
         <% } %>
</table>

<table class="table table-bordered table-responsive  weight-table">
<tr>
<td style="width: 225px"><b>Total</b></td>
<td><b><s:textfield name="ptp.totalTotalBales" id="totalPrice3"  placeholder="Enter Total Bales"  readonly="true" cssClass="form-control"  theme="simple" ></s:textfield> </b></td>
<td><b><s:textfield name="ptp.totalWeight" id="totalPrice1" placeholder="Enter Total Weight" readonly="true" cssClass="form-control total" theme="simple"></s:textfield>   </b></td>
<td><b><s:textfield name="ptp.totalMixing" id="totalPrice2" placeholder="Enter Total Mixing"  readonly="true" cssClass="form-control" theme="simple" ></s:textfield> </b></td>
</tr> 
</table>

</div>


    <div class="form-group">
        <div class="col-sm-6 text-center" id="two">
        <s:submit label="Submit" cssClass="btn btn-primary" align="center"></s:submit> 
     
    </div>
      <div class="col-sm-6 text-center">
            <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
   
          </div>
</div>
</s:form>
</center>
   
<!--             <script src="js/jquery.js"></script>   -->




 <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
            <script type="text/javascript">

                            var resetForm = function () {

                            };
                            function validateForm() {
                              
                                var x = $("#totalPrice1").val();
                                var y = $("#totalPrice2").val();
                                var z = $("#totalPrice3").val();

                                if ((x === '0.0' || y === '0.0' || z === '0.0') || (($("#totalPrice1").val()).length === 0 || ($("#totalPrice2").val()).length === 0 || ($("#totalPrice3").val()).length === 0)) {
                                    alert("Please fill Production Material Data");
                                    return false;
                                }
                            }
                            $(document).ready(function () {

                                yourFunction();
                                $("#totalPrice1").change(function () {
                                    alert("99999999999");
                                    addNumbers1();
                                });
                            });
                            function yourFunction() {
                              
                                var x = parseFloat(document.getElementById("check1").value);
                                if (x === 12345 || isNaN(x)) {
                                    $("#one1").find("input,button,textarea,select").attr("disabled", "disabled");
                                    $("#two").find("input,button,textarea,select").attr("disabled", "disabled");
                                    $("#two1").find("input,button,textarea,select").attr("disabled", "disabled");

                                } else {
                                    $("#goButton").hide();
                                    $("#part1").find("input,button,textarea,select").attr("disabled", "disabled");
                                }
                            }
            </script>


<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<script src="js/jquery.js"></script>
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
    $('.weight-table tr').on('mousemove', function() {
        $('.weight-table tr').each(function() {
           var n=0;
           var hours = $(this).find('input.price').val();
           var rate=parseFloat(document.getElementById("totalPrice1").value);
           var dateTotal = (hours / rate)*100;
       
            n=dateTotal.toFixed(3);
              if(n!=="NaN") {
            $(this).find('input.price2').val(n);
              }
              else {
            $(this).find('input.price2').val("");       
              }
        });
        return false;
    }); 
});


function addAll(){
   
      var x = $("#totalPrice1").val();
      var y = $("#totalPrice2").val();
      var z = $("#totalPrice3").val();
     if ((x === '0.0' || y === '0.0' || z==='0.0') || (x === '0' || y === '0' || z==='0') || (($("#totalPrice1").val()).length === 0 || ($("#totalPrice2").val()).length === 0 || ($("#totalPrice3").val()).length === 0)) {
                        alert("Please fill Issue to Precleaning Material Data");
                       return false;
                    }
         
     
        
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
       if($(this).val()===0) {
            sum="";
        }
        else {
          sum=100.00;  
        }
    
    });
    $('#totalPrice2').val(sum);
});

 $(document).ready(function () {
    $('.weight-table tr').on('mousemove', function() {
        $('.weight-table tr').each(function() {
           var n=0;
           var hours = $(this).find('input.price').val();
           var rate=parseFloat(document.getElementById("totalPrice1").value);
           var dateTotal = (hours / rate)*100;
       
            n=dateTotal.toFixed(3);
              if(n!=="NaN") {
            $(this).find('input.price2').val(n);
              }
              else {
            $(this).find('input.price2').val("");       
              }
        });
        return false;
    }); 
});

        
        
}
</script>
     
 
          
       
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-6 text-center">
                    <p>Copyright &copy; Sri Mouli Textiles Private Limited 2017</p>
                </div>
                <div class="col-lg-6 text-center">
                    <p>Design &#x0026; Developed by <a href="http://www.nivriticloudsolutions.com/">Nivriti Solutions Global Pvt. Ltd.</a></p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
    </div>
    
</body>
</html>
