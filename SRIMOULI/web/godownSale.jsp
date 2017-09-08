<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sri Mouli Textiles Private Limited</title>

    <!-- Bootstrap Core CSS -->
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
    <s:head/>
  <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
      <sj:head/>
      
      <SCRIPT language=Javascript>
     function isDecimalKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                    var regex = /^[0-9a-zA-Z ]*$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }
                
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

</head>

<body style="background-color: #EEEEEE">
    
    
      <style type="text/css">
            label[for="i"] {
            color: black;
            font-family:sans-serif;
            font-style: normal;
            font-size: 11pt;
            padding-bottom: 10px;}    
            
            input[type="radio"]{
                width: 25px;
                margin-left: 10px;
            }
            input[type="checkbox"]{
                width: 25px;
                    margin-left: 10px;
            }
            label[for="price"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;}
           label[for="price1"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;}
            label[for="expprod"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;}
        </style>
        
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
               <h1 class="page-header">Sri Mouli Textiles Private Limited Sales Data</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">
 <div class="clear">&#x00A0;</div>
     <s:form action="addSale"  enctype="multipart/form-data" method="post">          
    <table>
        <tr>
            <td><s:hidden name="id" value="%{id}" /></td>
            <td><sj:datepicker id="i" name="gsd.date" maxDate="now" changeMonth="true" changeYear="true" label="Date" placeholder="Enter Sale date (dd-mm-yyyy)" displayFormat="dd-mm-yy" size="90" cssClass="lab" readonly="true"/> </td>
            <td><s:textfield id="i" name="gsd.cname" label="Customer Name" placeholder="Enter Customer Name" onkeypress="return isDecimalKey(event)" cssClass="form-control form-group" ></s:textfield></td> 
            <td><s:select id="i" name="gsd.ptype" label="Select Product" list="%{productlist}"  cssClass="form-control form-group"  headerKey="-1" headerValue="-- Select Product --"/></td>
            <td><s:textfield id="i" name="gsd.nbales" label="No. of Bales" placeholder="Enter No. of Bales" onkeypress="return isNumberKey(this,event)" cssClass="form-control form-group" ></s:textfield></td> 
            <!--<td><s:textfield id="i" name="gsd.nkgs" label="No. of Kgs" placeholder="Enter No. of Kgs" onkeypress="return isNumberKey(this,event)" cssClass="form-control form-group" ></s:textfield></td> -->
            <td><s:textfield id="price" name="gsd.grossWeight" label="Gross Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Gross Weight" cssClass="form-control form-group" ></s:textfield></td>
            <td><s:textfield id="price1" name="gsd.tareWeight" label="Tare Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Tare Weight" cssClass="form-control form-group" ></s:textfield></td>
            <td><s:textfield id="expprod" readonly="true" onfocus="javascript:subNumbers()" name="gsd.netWeight" label="Net Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Net Weight" cssClass="form-control form-group" ></s:textfield></td>
            <td><s:textfield id="i" name="gsd.vno" label="Vehicle Number" placeholder="Enter Vehicle No." cssClass="form-control form-group" ></s:textfield></td> 
            <td><s:textfield id="i" name="gsd.remarks" label="Remarks" placeholder="Enter Remarks" onkeypress="return isDecimalKey(event)" cssClass="form-control form-group" ></s:textfield></td> 
        </tr>
    </table>
        <br/><br/>
       
    <div class="form-group">
         <s:if test="year.isEmpty()">
        <div class="col-sm-6 text-center" id="two">
        <s:submit label="Submit" cssClass="btn btn-primary" align="center" onclick="return subNumbers()"></s:submit> 
    </div>
         </s:if>
        
    <s:else>
         <div class="col-sm-6 text-center" id="two">
         <s:submit disabled="true" label="Submit" cssClass="btn btn-primary" align="center" onclick="return subNumbers()"></s:submit> 
    </div>
    </s:else>
    <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center"  cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
    </div>
    </div>
    </s:form>
    </center>
    </div>
        <!-- /.row -->
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
    <!-- /.container -->
    <script language="javascript">
        
        function subNumbers() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("price").value);
                    var y = parseFloat(document.getElementById("price1").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                     sum = x-y;
                   n = sum.toFixed(2);
                   //n=Math.round(sum);
                    var z = document.getElementById("expprod");
                        if (isNaN(n))
                        n = "";
                    z.value =n;
                } 
            
        </script>
    
</body>
</html>