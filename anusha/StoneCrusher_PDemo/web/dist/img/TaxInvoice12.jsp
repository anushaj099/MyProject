<%-- 
    Document   : supplyInvoice
    Created on : Jun 28, 2017, 5:35:19 PM
    Author     : Masrat
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SAI VENKATA KISHNA READYMIX INDUSTRY</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
        <!-- iCheck for checkboxes and radio inputs -->
        <link rel="stylesheet" href="plugins/iCheck/all.css">
        <!-- Bootstrap Color Picker -->
        <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
        <!-- Bootstrap time Picker -->
        <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="plugins/select2/select2.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/skin-yellow.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style type="text/css">

            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 10pt;
                padding-bottom: 10px;
                padding-left: 100px;
            } 

        </style>


        <style type="text/css">
            #s
            {
                width: 100px;
                height: 40px;
                margin-left: 150px;
            }
        </style>


        <SCRIPT language=Javascript>
            function isDecimalKey(evt)
            {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                if (key.length === 0)
                    return;
                var regex = /^[a-zA-Z ]*$/;
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
        <SCRIPT language="javascript">
  function addRow(one1) {
   var table = document.getElementById(one1);

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
                      
   var colCount = table.rows[2].cells.length;
                      //   alert(colCount);
   for(var i=0; i<colCount; i++) {

    var newcell = row.insertCell(i);

    newcell.innerHTML  = table.rows[rowCount-1].cells[i].innerHTML ;
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
  // alert(rowCount);
  // $(".table").find("tr:nth-child("+(rowCount+1)+")").find("td:nth-child("+(5)+")").text("");                
                        
  }
  </script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

           <s:iterator value="ulist" var="myobj"> 
            <%@include  file="upperpage1.jsp" %>
           </s:iterator>
            <!-- Left side column. contains the logo and sidebar -->

            <!-- Content Wrapper. Contains page content -->
       
                <!-- Content Header (Page header) -->
                <section class="content-header">


                </section>

                <!-- Main content -->
                <section class="content">


                    <div class="row">

                        <div class="col-md-12">



                            <div class="box box-warning">          

                                <s:form action="retrieveTaxInvoice" method="post" theme="css_xhtml">
                                    <table border="1" style="width:100%;">
                                        
                                        <tr>
                                       <table border="1" style="width:100%">
                                            <td align="center">
                                                 <img src="dist/img/SVK_Logo.png" class="img-circle" alt="User Image">
                                            </td>
                                            <td align="center">
                                                 <img src="dist/img/SVk_Head.png" class="img-circle" alt="User Image">
                                                 <div style="line-height: -5px;">
                                                <h4 style="font-family:arial,sans-serif;font-weight:bold;margin-top: -5px;">SAI VENKATA KRISHNA READYMIX INDUSTRY</h4>
                                                <h5 style="font-family:arial,sans-serif;font-weight:bold;">GSTIN:37ACAF3876J1ZO</h5>
                                                <h6 style="font-family:arial,sans-serif;"><b>Plant:</b> Survey No. 398/A1, <b>PERECHERLA,</b> Guntur Dist. (A.P).</h6>
                                                <h6 style="font-family:arial,sans-serif;"><b>Regd. Off:</b> 6, Sai Krishna Residency, 4/1 Vidya Nagar, Guntur, Andhra Pradesh, 522006.</h6>
                                                <h6 style="font-family:arial,sans-serif;">Mobile No: 9676999712,e-mail: sahanaraavi@gmail.com</h6>
                                                 </div>
                                                 </td>
                                             <td align="center">
                                                 <h4><b>Original for</b></h4>
                                                 <h4><b>Receipient</b></h4>
                                            </td>
                                        </table>
                                        </tr>
                                        

                                        <tr>
                                        <table border="0"  width="100%" frame="box">    
                                     <s:iterator value="invlist">
                                            <tr>
                                                <td colspan="2" style="border-color:white;">

                                                    <label id="i">Invoice No:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="invoiceNo"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Transportation Mode:</label>
                                                </td>
                                                <td>
                                                    <s:property value="transportMode"/>

                                                </td>

                                            </tr>

                                            <tr>
                                                <td colspan="2" style="border-color:white">

                                                    <label id="i">Invoice Date:</label>
                                                </td>
                                                <td colspan="2">
                                                   
<s:date format="dd-MM-yyyy" var="date1" name="%{invoiceDate}"/> <s:property value="%{date1}" ></s:property>


                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Vehicle.No :</label>
                                                </td>
                                                <td>
                                                    <s:property value="vehNo"/>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2" style="border-color:white">

                                                    <label id="i">Reverse Charge:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="reverseCharge"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Date of Supply:</label>
                                                </td>
                                                <td>
     <s:date format="dd-MM-yyyy" var="date1" name="%{dateOfSupply}"/> <s:property value="%{date1}" ></s:property>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td><label id="i">State:</label></td>
                                                <td  style="border-color:white">
                                                     <s:property value="state"/>
                                                    
                                                </td>
                                                <td>
                                                   <label id="i">Code:</label>

                                                </td>
                                                <td><s:property value="code"/></td>
                                                <td style="border-color:white">

                                                    <label id="i">Place of Supply:</label>
                                                </td>
                                                <td>
                                                    <s:property value="placeOfSupply"/>

                                                </td>

                                            </tr>
 
                                              
                                                
                                           
                                            
<!--                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">State Code:</label>
                                                </td>
                                                <td>
                                             

                                                </td>
                                                

                                            </tr>  -->
                                          </s:iterator> 
                                        </table>
                                        </tr>
                                        

                                        <tr>
                                        <table border="0" style="width:100%" frame="box">
                                          <s:iterator value="invlist"> 
                                            <tr>
                                                <th style="text-align:center;text-align:center;word-spacing: 3px;letter-spacing: 2px" colspan="2"><u>BILL TO PARTY</u></th>
                                                <th style="text-align:center; text-align:center;word-spacing: 3px;letter-spacing: 2px" colspan="2"><u>SHIP TO PARTY</u></th>
                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="billToName"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="shipToName"/>    
                                                </td>

                                            </tr>

                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                 
                                                    <s:textarea value="%{billToAddress}" name="add1" cols="30" rows="4" />
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                  
                                                    <s:textarea value="%{shipAddress}" name="add2" rows="4" cols="30"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="border-color:white">
                                                    <table>
                                                        <td> <label id="i">State:</label></td>
                                                         <td style="padding-left:15px;"> <s:property value="billTostate"/>    </td>
                                                    </table>

                                                   
                                                </td>
                                                <td>
                                                   <table>
                                                        <td> <label id="i">State Code:</label></td>
                                                         <td style="padding-left:20px;">  <s:property value="billToCode"/>  </td>
                                                    </table>
                                                </td>
                                                <td style="border-color:white">
                                                    <table>
                                                        <td> <label id="i">State:</label></td>
                                                         <td style="padding-left:15px;">   <s:property value="shipToState"/>     </td>
                                                    </table>
                                                </td>
                                                <td>
                                                     <table>
                                                        <td> <label id="i">State Code:</label></td>
                                                         <td style="padding-left:20px;">   <s:property value="shipToCode"/>      </td>
                                                    </table> 
                                                </td>

                                            </tr>
                                           
                                            <tr>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="billToGstin"/>
                                                </td>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="shipToGstin"/>
                                                </td>
                                            </tr>
                                          </s:iterator> 
                                        </table>
                                       
                                      
                                        </tr>
                                              
                                        
                                        <tr>
                                        <table border="1" width="100%" class="EventDetail" id="one1">
                                            <tr>
                                                <th rowspan="2" style="text-align: center;width: 5%">S.No</th>
                                                <th rowspan="2" style="text-align: center;width: 10%">Description of Goods</th>
                                                <th rowspan="2" style="text-align: center;width: 10%">HSN Code (GST)</th>
                                                <th rowspan="2" style="text-align: center;width: 7%">Qty (CuM)</th>
                                               
                                                <th rowspan="2" style="text-align: center;width: 8%">Value Before Tax(/CuM)</th>
                                                <th rowspan="2" style="text-align: center;width: 8%">Value After Tax(/CuM)</th>
                                                
                                               
                                                 <th rowspan="2" style="text-align: center;width: 7%">Taxable value &#8377;</th>
                                                 <th colspan="2" style="text-align: center;width: 10%">CGST</th>
                                                  <th colspan="2" style="text-align: center;width: 10%">SGST</th>
                                                   <th rowspan="2" style="text-align: center;width: 10%">Total</th>
                                                  
                                            </tr>
                                            <tr style="text-align: center">
                                                <th style="text-align: center;width: 7%">Rate %</th>
                                                <th style="text-align: center;width: 10%">Amount &#8377;</th>
                                                <th style="text-align: center;width: 7%">Rate %</th>
                                                <th style="text-align: center;width: 10%">Amount &#8377;</th>
                                               
                                            </tr>
                                            
        <s:set var="total1" value="0" />
       <s:iterator value="tlist1">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist2">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
    <s:iterator value="tlist3">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist4">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
    <s:iterator value="tlist5">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
     </tr>
       </s:iterator>
   
    <s:iterator value="tlist6">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist7">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist8">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist9">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist10">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist11">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist12">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
   <s:iterator value="tlist13">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
             <td style="text-align: center"><s:property  value="chTotal" /></td> 
   </tr>
       </s:iterator>
    <s:iterator value="tlist14">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
            <td style="text-align: center"><s:property  value="chTotal" /></td>  
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist15">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
            <td style="text-align: center"><s:property  value="chTotal" /></td>  
   </tr>
       </s:iterator>
   
                                           
</table>
  </tr>
  <tr>
      <s:iterator value="invlist">
  <table border="1" width="100%">
      <tr>
   <td width="19%" class="text-center"><b>Total</b></td>  
   <td width="5%" style="text-align: center"><s:property value="totalQty"/></td>
   <td width="6%" style="text-align: center"><s:property value="totalValBtax"/></td>
   <td width="6%" style="text-align: center"><s:property value="totalValAtax"/></td>
   <td width="5.4%" style="text-align: center"><s:property value="totalTaxval"/></td>
   <td width="5.3%" style="text-align: center">&#X00A0;</td>
   <td width="7.5%" style="text-align: center"><s:property value="totalCgstAmt"/></td>
    <td width="5.3%">&#X00A0;</td>
   <td width="7.5%" style="text-align: center"><s:property value="totalSgstAmt"/></td>
   <td width="7.1%" style="text-align: center"><s:property value="totalInv"/></td>
  


   </tr>
  
  </table>
      </s:iterator>
    </tr>
    <tr>
        <s:iterator value="invlist">
   <table border="1" width="100%">
        <tr>
            <td colspan="2" width="55.5%"><center><b>Total Invoice amount in words:</b> <s:property value="%{words}"/></center></td>  
         <td width="34.5%"><b>Total Amount before Tax</b></td> 
         <td><s:property value="totalTaxval"/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center"> <b>Bank Details</b></td>
            
      
        <td width="34.5%"><b>Add:CGST</b></td> 
         <td><s:property value="totalCgstAmt"/></td>
        </tr>
        <tr>
             <td><b>Bank Name:</b></td> 
         <td><s:property value="bankName"/></td>
        <td><b>Add:SGST</b></td> 
         <td><s:property value="totalCgstAmt"/></td>
        </tr>
        <tr>
             <td><b>Bank Branch:</b></td> 
         <td><s:property value="bankBranch"/></td>
        <td width="34.5%"><b>Total Tax Amount</b></td> 
         <td><s:property value="totalCgstAmt+totalCgstAmt"/></td>
        </tr>
        <tr>
            <td width="15%"><b>Bank A/C:</b></td> 
        <td><s:property value="bankAc"/></td>
        <td width="34.5%"><b>Add:Round Value</b></td> 
         <td><s:property value=""/></td>
       
   </tr>
   <tr>
        <td width="5%"><b>Bank IFSC:</b></td> 
         <td><s:property value="bankIfsc"/></td>
         <td width="34.5%"><b>Total Amount after Tax</b></td> 
         <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalInv}" /></td>
   </tr>
   </table>
        </s:iterator>
  </tr>
    
<tr>
    <s:iterator value="invlist">
    <table border="1" style="width:100%">
                    <tr>
                        <th width="30%" colspan="2" style="text-align:center"><b>Terms & conditions</b></th>
                        <th width="20%" rowspan="5">&#X00A0;</th>
       <th width="15%">GST on Reverse Charge</th>
       <td><s:property value="gstReverseCharge"/></td>
          </tr>
              <tr>
                  <td width="63%" colspan="2" rowspan="2">1. We declare that this invoice shows the actual price of the goods described and that all are true and correct. 2. We declare to the best of our knowledge and belief that particulars stated herein are true and correct and there is no additional consideration accuring to use either directly or indirectly in any manner other amounts indicated here. 3. <b>Interest:</b> We charge interest @24% p.a after 15days from the sale Invoice date.  </td>
              <td colspan="2">Ceritified that the particulars given above are true and correct</td>  
    </tr>
        <tr>
         
        <td style="text-align:center" colspan="2"><b>For Sai Venkata Krishna Readymix Industry </b></td>     
     </tr>
     <tr>
         <td colspan="2" style="text-align:center"><b>Received the goods correctly and good condition</b></td>
     <td rowspan="2" colspan="2">&#X00A0;</td>
    </tr>
    <tr>
        
        <td colspan="2">&#X00A0;</td>  
        
    </tr>
    <tr>
        <td style="text-align:center" colspan="2">Signature of the Customer</td>
        <td style="text-align:center"><b>Common Seal</b></td>
        <td style="text-align:center" colspan="2">Authorised Signatory</td>
    </tr>
                             
            
 </table>
    </s:iterator>
</tr>
 </table>





                                    <!--              <td><br/></td>
                                          <div class="form-group has-feedback">
                                    <s:textfield id="i" name="logindto.fullName" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Full Name" size="90" label="Full Name"/>
                                       
                                      </div>
                                        <td><br/></td>
                                         <div class="form-group has-feedback">
                                    <s:textfield name="logindto.designation" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Designation" size="90" label="Designation"/>
                                
                                </div>
                                  
                                  <td><br/></td>
                                   <div class="form-group has-feedback">
                                    <s:textfield name="logindto.mobileNo" onkeypress="return isNumberKey(this,event)" id="i" cssClass="form-control" placeholder="Mobile Number" size="90" label="Mobile Number"/>
                                 
                                </div>
                                  
                                   <td><br/></td>
                                <div class="form-group has-feedback">
                                    <s:textfield name="logindto.LType" value="User" readonly="true" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Login Type" size="90" label="Login Type"/>
                                 
                                </div>
                                   
                                     <td><br/></td>
                                      <div class="form-group has-feedback">
                                    <s:textfield id="i" name="logindto.loginid"  onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="User Name" size="90" label="User Name"/>
                           
                          </div>
                               
                                <td><br/></td>
                          <div class="form-group has-feedback">
                                    <s:password name="logindto.password" id="i" cssClass="form-control" placeholder="Password" size="90" label="Password"/>
                                 
                                </div>
                                
                                      <td><br/></td>
                                    <s:submit id="s" value="Submit" cssClass="btn btn-primary btn-block btn-flat" align="center"/>
                                   <td><br/></td>
                                  
                                  </table>
                                </s:form>
                                -->


                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->



                    </div>
                    <!-- /.col (right) -->
           
            <!-- /.row -->

        </section>
                
                
                
                
                
                <section class="content">


                    <div class="row">

                        <div class="col-md-12">



                            <div class="box box-warning">          

                                <s:form action="retrieveTaxInvoice" method="post" theme="css_xhtml">
                                    <table border="1" style="width:100%">
                                        
                                        <tr>
                                       <table border="1" style="width:100%">
                                             <td align="center">
                                                 <img src="dist/img/SVK_Logo.png" class="img-circle" alt="User Image">
                                            </td>
                                            <td align="center">
                                                 <img src="dist/img/SVk_Head.png" class="img-circle" alt="User Image">
                                                 <div style="line-height: -5px;">
                                                <h4 style="font-family:arial,sans-serif;font-weight:bold;margin-top: -5px;">SAI VENKATA KRISHNA READYMIX INDUSTRY</h4>
                                                <h5 style="font-family:arial,sans-serif;font-weight:bold;">GSTIN:37ACAF3876J1ZO</h5>
                                                <h6 style="font-family:arial,sans-serif;"><b>Plant:</b> Survey No. 398/A1, <b>PERECHERLA,</b> Guntur Dist. (A.P).</h6>
                                                <h6 style="font-family:arial,sans-serif;"><b>Regd. Off:</b> 6, Sai Krishna Residency, 4/1 Vidya Nagar, Guntur, Andhra Pradesh, 522006.</h6>
                                                <h6 style="font-family:arial,sans-serif;">Mobile No: 9676999712,e-mail: sahanaraavi@gmail.com</h6>
                                                 </div>
                                                 </td>
                                             <td align="center">
                                                 <h4><b>Original for</b></h4>
                                                 <h4><b>Receipient</b></h4>
                                            </td>
                                        </table>
                                        </tr>
                                        

                                        <tr>
                                        <table border="0"  width="100%" frame="box">    
                                     <s:iterator value="invlist">
                                            <tr>
                                                <td colspan="2" style="border-color:white;">

                                                    <label id="i">Invoice No:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="invoiceNo"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Transportation Mode:</label>
                                                </td>
                                                <td>
                                                    <s:property value="transportMode"/>

                                                </td>

                                            </tr>

                                            <tr>
                                                <td colspan="2" style="border-color:white">

                                                    <label id="i">Invoice Date:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="invoiceDate"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Vehicle.No :</label>
                                                </td>
                                                <td>
                                                    <s:property value="vehNo"/>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2" style="border-color:white">

                                                    <label id="i">Reverse Charge:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="reverseCharge"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Date of Supply:</label>
                                                </td>
                                                <td>
                                                    <s:property value="invoiceDate"/>

                                                </td>

                                            </tr>
                                             <tr>
                                                <td><label id="i">State:</label></td>
                                                <td  style="border-color:white">
                                                     <s:property value="state"/>
                                                    
                                                </td>
                                                <td>
                                                   <label id="i">Code:</label>

                                                </td>
                                                <td><s:property value="code"/></td>
                                                <td style="border-color:white">

                                                    <label id="i">Place of Supply:</label>
                                                </td>
                                                <td>
                                                    <s:property value="placeOfSupply"/>

                                                </td>

                                            </tr>
                                            
                                           
                                              
                                                
                                           
                                            
<!--                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">State Code:</label>
                                                </td>
                                                <td>
                                             

                                                </td>
                                                

                                            </tr>  -->
                                          </s:iterator> 
                                        </table>
                                        </tr>
                                        

                                        <tr>
                                        <table border="0" style="width:100%" frame="box">
                                          <s:iterator value="invlist"> 
                                            <tr>
                                                <th style="text-align:center;text-align:center;word-spacing: 3px;letter-spacing: 2px" colspan="2"><u>BILL TO PARTY</u></th>
                                                <th style="text-align:center; text-align:center;word-spacing: 3px;letter-spacing: 2px" colspan="2"><u>SHIP TO PARTY</u></th>
                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="billToName"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="shipToName"/>    
                                                </td>

                                            </tr>

                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                 
                                                    <s:textarea value="%{billToAddress}" name="add1" cols="30" rows="4" />
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                  
                                                    <s:textarea value="%{shipAddress}" name="add2" rows="4" cols="30"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="border-color:white">
                                                    <table>
                                                        <td> <label id="i">State:</label></td>
                                                         <td style="padding-left:15px;"> <s:property value="billTostate"/>    </td>
                                                    </table>

                                                   
                                                </td>
                                                <td>
                                                   <table>
                                                        <td> <label id="i">State Code:</label></td>
                                                         <td style="padding-left:20px;">  <s:property value="billToCode"/>  </td>
                                                    </table>
                                                </td>
                                                <td style="border-color:white">
                                                    <table>
                                                        <td> <label id="i">State:</label></td>
                                                         <td style="padding-left:15px;">   <s:property value="shipToState"/>     </td>
                                                    </table>
                                                </td>
                                                <td>
                                                     <table>
                                                        <td> <label id="i">State Code:</label></td>
                                                         <td style="padding-left:20px;">   <s:property value="shipToCode"/>      </td>
                                                    </table> 
                                                </td>

                                            </tr>
                                            
                                            <tr>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="billToGstin"/>
                                                </td>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="shipToGstin"/>
                                                </td>
                                            </tr>
                                          </s:iterator> 
                                        </table>
                                     
                                      
                                        </tr>
                                      
                                        <tr>
                                        <table border="1" width="100%" class="EventDetail" id="one1">
                                             <tr>
                                                <th rowspan="2" style="text-align: center;width: 5%">S.No</th>
                                                <th rowspan="2" style="text-align: center;width: 10%">Description of Goods</th>
                                                <th rowspan="2" style="text-align: center;width: 10%">HSN Code (GST)</th>
                                                <th rowspan="2" style="text-align: center;width: 7%">Qty (CuM)</th>
                                               
                                                <th rowspan="2" style="text-align: center;width: 8%">Value Before Tax(/CuM)</th>
                                                <th rowspan="2" style="text-align: center;width: 8%">Value After Tax(/CuM)</th>
                                                
                                               
                                                 <th rowspan="2" style="text-align: center;width: 7%">Taxable value &#8377;</th>
                                                 <th colspan="2" style="text-align: center;width: 10%">CGST</th>
                                                  <th colspan="2" style="text-align: center;width: 10%">SGST</th>
                                                   <th rowspan="2" style="text-align: center;width: 10%">Total</th>
                                                  
                                            </tr>
                                            <tr style="text-align: center">
                                                <th style="text-align: center;width: 7%">Rate %</th>
                                                <th style="text-align: center;width: 10%">Amount &#8377;</th>
                                                <th style="text-align: center;width: 7%">Rate %</th>
                                                <th style="text-align: center;width: 10%">Amount &#8377;</th>
                                               
                                            </tr>
                                            
        <s:set var="total1" value="0" />
       <s:iterator value="tlist1">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist2">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
    <s:iterator value="tlist3">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist4">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
    <s:iterator value="tlist5">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
     </tr>
       </s:iterator>
   
    <s:iterator value="tlist6">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist7">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist8">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist9">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist10">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist11">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist12">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
   <s:iterator value="tlist13">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
             <td style="text-align: center"><s:property  value="chTotal" /></td> 
   </tr>
       </s:iterator>
    <s:iterator value="tlist14">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
            <td style="text-align: center"><s:property  value="chTotal" /></td>  
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist15">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
            <td style="text-align: center"><s:property  value="chTotal" /></td>  
   </tr>
       </s:iterator>
   
                                           
</table>
  </tr>
  <tr>
      <s:iterator value="invlist">
  <table border="1" width="100%">
     <tr>
   <td width="19%" class="text-center"><b>Total</b></td>  
   <td width="5%" style="text-align: center"><s:property value="totalQty"/></td>
   <td width="6%" style="text-align: center"><s:property value="totalValBtax"/></td>
   <td width="6%" style="text-align: center"><s:property value="totalValAtax"/></td>
   <td width="5.4%" style="text-align: center"><s:property value="totalTaxval"/></td>
   <td width="5.3%" style="text-align: center">&#X00A0;</td>
   <td width="7.5%" style="text-align: center"><s:property value="totalCgstAmt"/></td>
    <td width="5.3%">&#X00A0;</td>
   <td width="7.5%" style="text-align: center"><s:property value="totalSgstAmt"/></td>
   <td width="7.1%" style="text-align: center"><s:property value="totalInv"/></td>
  


   </tr>
  
  </table>
      </s:iterator>
    </tr>
    <tr>
        <s:iterator value="invlist">
   <table border="1" width="100%">
         <tr>
            <td colspan="2" width="55.5%"><center><b>Total Invoice amount in words:</b> <s:property value="%{words}"/></center></td>  
         <td width="34.5%"><b>Total Amount before Tax</b></td> 
         <td><s:property value="totalTaxval"/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center"> <b>Bank Details</b></td>
            
      
        <td width="34.5%"><b>Add:CGST</b></td> 
         <td><s:property value="totalCgstAmt"/></td>
        </tr>
        <tr>
             <td><b>Bank Name:</b></td> 
         <td><s:property value="bankName"/></td>
        <td><b>Add:SGST</b></td> 
         <td><s:property value="totalCgstAmt"/></td>
        </tr>
        <tr>
             <td><b>Bank Branch:</b></td> 
         <td><s:property value="bankBranch"/></td>
        <td width="34.5%"><b>Total Tax Amount</b></td> 
         <td><s:property value="totalCgstAmt+totalCgstAmt"/></td>
        </tr>
        <tr>
            <td width="15%"><b>Bank A/C:</b></td> 
        <td><s:property value="bankAc"/></td>
        <td width="34.5%"><b>Add:Round Value</b></td> 
         <td><s:property value=""/></td>
       
   </tr>
   <tr>
        <td width="5%"><b>Bank IFSC:</b></td> 
         <td><s:property value="bankIfsc"/></td>
         <td width="34.5%"><b>Total Amount after Tax</b></td> 
         <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalInv}" /></td>
   </tr>
   </table>
        </s:iterator>
  </tr>
    
<tr>
    <s:iterator value="invlist">
    <table border="1" style="width:100%">
                     <tr>
                        <th width="30%" colspan="2" style="text-align:center"><b>Terms & conditions</b></th>
                        <th width="20%" rowspan="5">&#X00A0;</th>
       <th width="15%">GST on Reverse Charge</th>
       <td><s:property value="gstReverseCharge"/></td>
          </tr>
              <tr>
                  <td width="63%" colspan="2" rowspan="2">1. We declare that this invoice shows the actual price of the goods described and that all are true and correct. 2. We declare to the best of our knowledge and belief that particulars stated herein are true and correct and there is no additional consideration accuring to use either directly or indirectly in any manner other amounts indicated here. 3. <b>Interest:</b> We charge interest @24% p.a after 15days from the sale Invoice date.  </td>
              <td colspan="2">Ceritified that the particulars given above are true and correct</td>  
    </tr>
        <tr>
         
        <td style="text-align:center" colspan="2"><b>For Sai Venkata Krishna Readymix Industry </b></td>     
     </tr>
     <tr>
         <td colspan="2" style="text-align:center"><b>Received the goods correctly and good condition</b></td>
     <td rowspan="2" colspan="2">&#X00A0;</td>
    </tr>
    <tr>
        
        <td colspan="2">&#X00A0;</td>  
        
    </tr>
    <tr>
        <td style="text-align:center" colspan="2">Signature of the Customer</td>
        <td style="text-align:center"><b>Common Seal</b></td>
        <td style="text-align:center" colspan="2">Authorised Signatory</td>
    </tr>
                             
                 
            
 </table>
    </s:iterator>
</tr>
 </table>





                                    <!--              <td><br/></td>
                                          <div class="form-group has-feedback">
                                    <s:textfield id="i" name="logindto.fullName" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Full Name" size="90" label="Full Name"/>
                                       
                                      </div>
                                        <td><br/></td>
                                         <div class="form-group has-feedback">
                                    <s:textfield name="logindto.designation" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Designation" size="90" label="Designation"/>
                                
                                </div>
                                  
                                  <td><br/></td>
                                   <div class="form-group has-feedback">
                                    <s:textfield name="logindto.mobileNo" onkeypress="return isNumberKey(this,event)" id="i" cssClass="form-control" placeholder="Mobile Number" size="90" label="Mobile Number"/>
                                 
                                </div>
                                  
                                   <td><br/></td>
                                <div class="form-group has-feedback">
                                    <s:textfield name="logindto.LType" value="User" readonly="true" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Login Type" size="90" label="Login Type"/>
                                 
                                </div>
                                   
                                     <td><br/></td>
                                      <div class="form-group has-feedback">
                                    <s:textfield id="i" name="logindto.loginid"  onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="User Name" size="90" label="User Name"/>
                           
                          </div>
                               
                                <td><br/></td>
                          <div class="form-group has-feedback">
                                    <s:password name="logindto.password" id="i" cssClass="form-control" placeholder="Password" size="90" label="Password"/>
                                 
                                </div>
                                
                                      <td><br/></td>
                                    <s:submit id="s" value="Submit" cssClass="btn btn-primary btn-block btn-flat" align="center"/>
                                   <td><br/></td>
                                  
                                  </table>
                                </s:form>
                                -->


                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->



                    </div>
                    <!-- /.col (right) -->
           
            <!-- /.row -->

        </section>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                <section class="content">


                    <div class="row">

                        <div class="col-md-12">



                            <div class="box box-warning">          

                                <s:form action="retrieveTaxInvoice" method="post" theme="css_xhtml">
                                    <table border="1" style="width:100%">
                                        
                                        <tr>
                                       <table border="1" style="width:100%">
                                             <td align="center">
                                                 <img src="dist/img/SVK_Logo.png" class="img-circle" alt="User Image">
                                            </td>
                                            <td align="center">
                                                 <img src="dist/img/SVk_Head.png" class="img-circle" alt="User Image">
                                                 <div style="line-height: -5px;">
                                                <h4 style="font-family:arial,sans-serif;font-weight:bold;margin-top: -5px;">SAI VENKATA KRISHNA READYMIX INDUSTRY</h4>
                                                <h5 style="font-family:arial,sans-serif;font-weight:bold;">GSTIN:37ACAF3876J1ZO</h5>
                                                <h6 style="font-family:arial,sans-serif;"><b>Plant:</b> Survey No. 398/A1, <b>PERECHERLA,</b> Guntur Dist. (A.P).</h6>
                                                <h6 style="font-family:arial,sans-serif;"><b>Regd. Off:</b> 6, Sai Krishna Residency, 4/1 Vidya Nagar, Guntur, Andhra Pradesh, 522006.</h6>
                                                <h6 style="font-family:arial,sans-serif;">Mobile No: 9676999712,e-mail: sahanaraavi@gmail.com</h6>
                                                 </div>
                                                 </td>
                                             <td align="center">
                                                 <h4><b>Original for</b></h4>
                                                 <h4><b>Receipient</b></h4>
                                            </td>
                                        </table>
                                        </tr>
                                        

                                        <tr>
                                        <table border="0"  width="100%" frame="box">    
                                     <s:iterator value="invlist">
                                            <tr>
                                                <td colspan="2" style="border-color:white;">

                                                    <label id="i">Invoice No:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="invoiceNo"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Transportation Mode:</label>
                                                </td>
                                                <td>
                                                    <s:property value="transportMode"/>

                                                </td>

                                            </tr>

                                            <tr>
                                                <td colspan="2" style="border-color:white">

                                                    <label id="i">Invoice Date:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="invoiceDate"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Vehicle.No :</label>
                                                </td>
                                                <td>
                                                    <s:property value="vehNo"/>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2" style="border-color:white">

                                                    <label id="i">Reverse Charge:</label>
                                                </td>
                                                <td colspan="2">
                                                    <s:property value="reverseCharge"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Date of Supply:</label>
                                                </td>
                                                <td>
                                                    <s:property value="invoiceDate"/>

                                                </td>

                                            </tr>
                                             <tr>
                                                <td><label id="i">State:</label></td>
                                                <td  style="border-color:white">
                                                     <s:property value="state"/>
                                                    
                                                </td>
                                                <td>
                                                   <label id="i">Code:</label>

                                                </td>
                                                <td><s:property value="code"/></td>
                                                <td style="border-color:white">

                                                    <label id="i">Place of Supply:</label>
                                                </td>
                                                <td>
                                                    <s:property value="placeOfSupply"/>

                                                </td>

                                            </tr>
                                            
                                           
                                                
                                           
                                            
<!--                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">State Code:</label>
                                                </td>
                                                <td>
                                             

                                                </td>
                                                

                                            </tr>  -->
                                          </s:iterator> 
                                        </table>
                                        </tr>
                                        

                                        <tr>
                                        <table border="0" style="width:100%" frame="box">
                                          <s:iterator value="invlist"> 
                                            <tr>
                                                <th style="text-align:center;text-align:center;word-spacing: 3px;letter-spacing: 2px" colspan="2"><u>BILL TO PARTY</u></th>
                                                <th style="text-align:center; text-align:center;word-spacing: 3px;letter-spacing: 2px" colspan="2"><u>SHIP TO PARTY</u></th>
                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="billToName"/>

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="shipToName"/>    
                                                </td>

                                            </tr>

                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                 
                                                    <s:textarea value="%{billToAddress}" name="add1" cols="30" rows="4" />
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                  
                                                    <s:textarea value="%{shipAddress}" name="add2" rows="4" cols="30"/>
                                                </td>

                                            </tr>
                                           <tr>
                                                <td style="border-color:white">
                                                    <table>
                                                        <td> <label id="i">State:</label></td>
                                                         <td style="padding-left:15px;"> <s:property value="billTostate"/>    </td>
                                                    </table>

                                                   
                                                </td>
                                                <td>
                                                   <table>
                                                        <td> <label id="i">State Code:</label></td>
                                                         <td style="padding-left:20px;">  <s:property value="billToCode"/>  </td>
                                                    </table>
                                                </td>
                                                <td style="border-color:white">
                                                    <table>
                                                        <td> <label id="i">State:</label></td>
                                                         <td style="padding-left:15px;">   <s:property value="shipToState"/>     </td>
                                                    </table>
                                                </td>
                                                <td>
                                                     <table>
                                                        <td> <label id="i">State Code:</label></td>
                                                         <td style="padding-left:20px;">   <s:property value="shipToCode"/>      </td>
                                                    </table> 
                                                </td>

                                            </tr>
                                            
                                            <tr>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="billToGstin"/>
                                                </td>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="shipToGstin"/>
                                                </td>
                                            </tr>
                                          </s:iterator> 
                                        </table>
                                      
                                      
                                        </tr>
                                               
                                        
                                        <tr>
                                        <table border="1" width="100%" class="EventDetail" id="one1">
                                              <tr>
                                                <th rowspan="2" style="text-align: center;width: 5%">S.No</th>
                                                <th rowspan="2" style="text-align: center;width: 10%">Description of Goods</th>
                                                <th rowspan="2" style="text-align: center;width: 10%">HSN Code (GST)</th>
                                                <th rowspan="2" style="text-align: center;width: 7%">Qty (CuM)</th>
                                               
                                                <th rowspan="2" style="text-align: center;width: 8%">Value Before Tax(/CuM)</th>
                                                <th rowspan="2" style="text-align: center;width: 8%">Value After Tax(/CuM)</th>
                                                
                                               
                                                 <th rowspan="2" style="text-align: center;width: 7%">Taxable value &#8377;</th>
                                                 <th colspan="2" style="text-align: center;width: 10%">CGST</th>
                                                  <th colspan="2" style="text-align: center;width: 10%">SGST</th>
                                                   <th rowspan="2" style="text-align: center;width: 10%">Total</th>
                                                  
                                            </tr>
                                            <tr style="text-align: center">
                                                <th style="text-align: center;width: 7%">Rate %</th>
                                                <th style="text-align: center;width: 10%">Amount &#8377;</th>
                                                <th style="text-align: center;width: 7%">Rate %</th>
                                                <th style="text-align: center;width: 10%">Amount &#8377;</th>
                                               
                                            </tr>
                                            
        <s:set var="total1" value="0" />
       <s:iterator value="tlist1">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist2">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
    <s:iterator value="tlist3">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist4">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
    <s:iterator value="tlist5">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
     </tr>
       </s:iterator>
   
    <s:iterator value="tlist6">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist7">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist8">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist9">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist10">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist11">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist12">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
              <td style="text-align: center"><s:property  value="chTotal" /></td>
   </tr>
       </s:iterator>
   
   
   <s:iterator value="tlist13">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
             <td style="text-align: center"><s:property  value="chTotal" /></td> 
   </tr>
       </s:iterator>
    <s:iterator value="tlist14">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
            <td style="text-align: center"><s:property  value="chTotal" /></td>  
   </tr>
       </s:iterator>
   
    <s:iterator value="tlist15">
            <tr>
                 <s:set var="total1" value="%{#total1+1}" />
       <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="%{productDesc}"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
            <td style="text-align: center"><s:property  value="beforeTax" /></td>
             <td style="text-align: center"><s:property  value="afterTax" /></td>
           <td style="text-align: center"><s:property  value="taxableValue" /></td>   
              <td style="text-align: center"><s:property  value="cgRate" /></td>
             <td style="text-align: center"><s:property  value="cgAmt" /></td>
              <td style="text-align: center"><s:property  value="sgRate" /></td>
              <td style="text-align: center"><s:property  value="sgAmt" /></td>
            <td style="text-align: center"><s:property  value="chTotal" /></td>  
   </tr>
       </s:iterator>
   
                                           
</table>
  </tr>
  <tr>
      <s:iterator value="invlist">
  <table border="1" width="100%">
      <tr>
   <td width="19%" class="text-center"><b>Total</b></td>  
   <td width="5%" style="text-align: center"><s:property value="totalQty"/></td>
   <td width="6%" style="text-align: center"><s:property value="totalValBtax"/></td>
   <td width="6%" style="text-align: center"><s:property value="totalValAtax"/></td>
   <td width="5.4%" style="text-align: center"><s:property value="totalTaxval"/></td>
   <td width="5.3%" style="text-align: center">&#X00A0;</td>
   <td width="7.5%" style="text-align: center"><s:property value="totalCgstAmt"/></td>
    <td width="5.3%">&#X00A0;</td>
   <td width="7.5%" style="text-align: center"><s:property value="totalSgstAmt"/></td>
   <td width="7.1%" style="text-align: center"><s:property value="totalInv"/></td>
  


   </tr>
  
  </table>
      </s:iterator>
    </tr>
    <tr>
        <s:iterator value="invlist">
   <table border="1" width="100%">
        <tr>
            <td colspan="2" width="55.5%"><center><b>Total Invoice amount in words:</b> <s:property value="%{words}"/></center></td>  
         <td width="34.5%"><b>Total Amount before Tax</b></td> 
         <td><s:property value="totalTaxval"/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center"> <b>Bank Details</b></td>
            
      
        <td width="34.5%"><b>Add:CGST</b></td> 
         <td><s:property value="totalCgstAmt"/></td>
        </tr>
        <tr>
             <td><b>Bank Name:</b></td> 
         <td><s:property value="bankName"/></td>
        <td><b>Add:SGST</b></td> 
         <td><s:property value="totalCgstAmt"/></td>
        </tr>
        <tr>
             <td><b>Bank Branch:</b></td> 
         <td><s:property value="bankBranch"/></td>
        <td width="34.5%"><b>Total Tax Amount</b></td> 
         <td><s:property value="totalCgstAmt+totalCgstAmt"/></td>
        </tr>
        <tr>
            <td width="15%"><b>Bank A/C:</b></td> 
        <td><s:property value="bankAc"/></td>
        <td width="34.5%"><b>Add:Round Value</b></td> 
         <td><s:property value=""/></td>
       
   </tr>
   <tr>
        <td width="5%"><b>Bank IFSC:</b></td> 
         <td><s:property value="bankIfsc"/></td>
         <td width="34.5%"><b>Total Amount after Tax</b></td> 
         <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalInv}" /></td>
   </tr>
   </table>
        </s:iterator>
  </tr>
    
<tr>
    <s:iterator value="invlist">
    <table border="1" style="width:100%">
                   <tr>
                        <th width="30%" colspan="2" style="text-align:center"><b>Terms & conditions</b></th>
                        <th width="20%" rowspan="5">&#X00A0;</th>
       <th width="15%">GST on Reverse Charge</th>
       <td><s:property value="gstReverseCharge"/></td>
          </tr>
              <tr>
                  <td width="63%" colspan="2" rowspan="2">1. We declare that this invoice shows the actual price of the goods described and that all are true and correct. 2. We declare to the best of our knowledge and belief that particulars stated herein are true and correct and there is no additional consideration accuring to use either directly or indirectly in any manner other amounts indicated here. 3. <b>Interest:</b> We charge interest @24% p.a after 15days from the sale Invoice date.  </td>
              <td colspan="2">Ceritified that the particulars given above are true and correct</td>  
    </tr>
        <tr>
         
        <td style="text-align:center" colspan="2"><b>For Sai Venkata Krishna Readymix Industry </b></td>     
     </tr>
     <tr>
         <td colspan="2" style="text-align:center"><b>Received the goods correctly and good condition</b></td>
     <td rowspan="2" colspan="2">&#X00A0;</td>
    </tr>
    <tr>
        
        <td colspan="2">&#X00A0;</td>  
        
    </tr>
    <tr>
        <td style="text-align:center" colspan="2">Signature of the Customer</td>
        <td style="text-align:center"><b>Common Seal</b></td>
        <td style="text-align:center" colspan="2">Authorised Signatory</td>
    </tr>
                             
                        
            
 </table>
    </s:iterator>
</tr>
 </table>





                                    <!--              <td><br/></td>
                                          <div class="form-group has-feedback">
                                    <s:textfield id="i" name="logindto.fullName" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Full Name" size="90" label="Full Name"/>
                                       
                                      </div>
                                        <td><br/></td>
                                         <div class="form-group has-feedback">
                                    <s:textfield name="logindto.designation" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Designation" size="90" label="Designation"/>
                                
                                </div>
                                  
                                  <td><br/></td>
                                   <div class="form-group has-feedback">
                                    <s:textfield name="logindto.mobileNo" onkeypress="return isNumberKey(this,event)" id="i" cssClass="form-control" placeholder="Mobile Number" size="90" label="Mobile Number"/>
                                 
                                </div>
                                  
                                   <td><br/></td>
                                <div class="form-group has-feedback">
                                    <s:textfield name="logindto.LType" value="User" readonly="true" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Login Type" size="90" label="Login Type"/>
                                 
                                </div>
                                   
                                     <td><br/></td>
                                      <div class="form-group has-feedback">
                                    <s:textfield id="i" name="logindto.loginid"  onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="User Name" size="90" label="User Name"/>
                           
                          </div>
                               
                                <td><br/></td>
                          <div class="form-group has-feedback">
                                    <s:password name="logindto.password" id="i" cssClass="form-control" placeholder="Password" size="90" label="Password"/>
                                 
                                </div>
                                
                                      <td><br/></td>
                                    <s:submit id="s" value="Submit" cssClass="btn btn-primary btn-block btn-flat" align="center"/>
                                   <td><br/></td>
                                  
                                  </table>
                                </s:form>
                                -->


                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->



                    </div>
                    <!-- /.col (right) -->
           
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
  

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Update Resume
                                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Laravel Integration
                                <span class="label label-warning pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Back End Framework
                                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input type="checkbox" class="pull-right" checked>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input type="checkbox" class="pull-right">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script type="text/javascript" src="regvalid.js"></script>

<!-- Page script -->
<script>
                 $('.EventDetail tr:has(td:empty)').hide();
                
                
                
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
        );

        //Date picker
        $('#datepicker').datepicker({
            autoclose: true
        });

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
            showInputs: false
        });
    });
</script>
</body>
</html>
