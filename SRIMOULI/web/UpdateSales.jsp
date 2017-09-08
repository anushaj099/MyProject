<%-- 
    Document   : UpdatePurchase
    Created on : Dec 26, 2016, 12:47:25 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html>
<html>
    <head>
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
      
    </head>
    <body style="background-color: #EEEEEE">
        <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 11pt;
            font-family: sans-serif;
            font-style: normal;
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
       <s:iterator value="ulist" var="myobj" >  
             <%@include file="Upperpage4.jsp" %>   
           
          <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Sales Update</h1>
            </div>
        </div>  
                <center>
        <div class="row">

 <div class="clear">&#x00A0;</div>
     <s:form action="updateSales"  enctype="multipart/form-data" >          
    <table>
        <tr>
             <s:iterator value="glist">
            <td><s:hidden name="gsd.id" value="%{id}" /></td>
            <td><s:hidden name="gsd.ids" value="%{ids}" /></td> 
            
            <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield readonly="true" displayFormat="dd-mm-yy" id="i" name="gsd.date" value="%{date1}"  label="Date "  size="90"  cssClass="form-control" /> </td>
         <%--   <td><sj:datepicker name="gsd.date" id="i" changeMonth="true" changeYear="true" value="%{date}" label="Date" placeholder="Enter Purchase date (dd-mm-yyyy)" displayFormat="dd-mm-yy" size="90" cssClass="lab" readonly="true"/> </td>--%>
            <td><s:textfield id="i" name="gsd.cname" value="%{customerName}" onkeypress="return isDecimalKey(event)" label="Customer Name" placeholder="Enter Customer Name" cssClass="form-control form-group" ></s:textfield></td> 
            <td><s:select id="i" name="gsd.ptype" value="%{productType}" label="Select Product" list="%{productlist}"  cssClass="form-control form-group"  headerKey="-1" headerValue="-- Select Product --"/></td>
            <td><s:textfield id="i" name="gsd.nbales" label="No. of Bales" onkeypress="return isNumberKey(this,event)" value="%{noOfBales}" placeholder="Enter No. of Bales" cssClass="form-control form-group" ></s:textfield></td> 
            <!--<td><s:textfield id="i" name="gsd.nkgs" label="No. of Kgs" onkeypress="return isNumberKey(this,event)" value="%{noOfKgs}" placeholder="Enter No. of Kgs" cssClass="form-control form-group" ></s:textfield></td> -->
             <td><s:textfield id="price" name="gsd.grossWeight" value="%{grossWeight}" label="Gross Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Gross Weight" cssClass="form-control form-group" ></s:textfield></td>
            <td><s:textfield id="price1" name="gsd.tareWeight" value="%{tareWeight}" label="Tare Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Tare Weight" cssClass="form-control form-group" ></s:textfield></td>
           <td><s:textfield id="expprod" readonly="true" value="%{netWeight}" onfocus="javascript:subNumbers()" name="gsd.netWeight" label="Tare Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Net Weight" cssClass="form-control form-group" ></s:textfield></td>
            <td><s:textfield id="i" name="gsd.vno" label="Vehicle No." value="%{vehicleNo}" placeholder="Enter Vehicle No." cssClass="form-control form-group" ></s:textfield></td> 
            <td><s:textfield id="i" name="gsd.remarks" label="Remarks" onkeypress="return isDecimalKey(event)" value="%{remarks}" placeholder="Enter Remarks" cssClass="form-control form-group" ></s:textfield></td> 
             </s:iterator>
         </tr>
    </table>
        <br/><br/>
          <div class="form-group">
                        <div class="col-sm-6 text-center">
                            <s:submit value="Update" cssClass="btn btn-primary" align="center" onclick="return subNumbers()"></s:submit> 

                            </div>
                            <div class="col-sm-6 text-center">
                                <button type="reset" class="btn btn-primary" >Cancel</button>
                        </div>
                    </div>
     </s:form>
        </center> 
       </div></s:iterator>
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
