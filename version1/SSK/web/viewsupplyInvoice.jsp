<%-- 
    Document   : supplyInvoice
    Created on : Jun 28, 2017, 5:35:19 PM
    Author     : Masrat
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <title>Sri Sai Krishna Stone Crusher</title>
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
  
  <script>
          function myFunction(divName)
          {
               var printContents = document.getElementById(divName).innerHTML;
               var originalContents = document.body.innerHTML;

                 document.body.innerHTML = printContents;

                    window.print();
                     document.body.innerHTML = originalContents;
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
                                
                                <s:iterator value="plist">
                                     <div id="printablearea"> 
                                <s:form action="register" method="post" theme="css_xhtml">
                                    <table border="1" style="width:100%">
                                        <tr>
                                        <center>
                                            <h2>
                                               "SUPPLYMENTRY INVOICE/ DEBIT NOTE / CREDIT NOTE"

                                            </h2>
                                          (As case may be) 
                                        </center>
                                        </tr>
                                        <tr>
                                        <table border="1" style="width:100%">
                                            <td align="center">
                                                <h4>Company Logo</h4>
                                            </td>
                                            <td align="center">
                                                <h4>SAI VENKATA KRISHNA READY MIX INDUSTRY</h4>
                                                <h5>YOUR COMPLETE BUSINESS ADDRESS LINE -1</h5>
                                                <h5>YOUR COMPLETE BUSINESS ADDRESS LINE -2</h5>
                                                <h6><a href="mailto:info@yourbm.com?" target="_top">info@yourbm.com</a></h6>
                                                <h6><a href="mailto:www.yourbm.com?" target="_top">www.yourbm.com</a></h6>
                                            </td>
                                        </table>
                                        </tr>



                                        <tr>
                                        <table border="0" style="width:100%" frame="box">
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Your GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="urGstinNo" />

                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Transportation Mode: (Apply for Supply of Goods only):</label>
                                                </td>
                                                <td>
                                                    <s:property value="transportMode"/>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Tax Is Payable On Reverse Charge: </label>
                                                </td>
                                                <td>
                                                    <s:property value="reverseCharge"/>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Veh.No :</label>
                                                </td>
                                                <td>
                                                    <s:property value="vehNo"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Your Invoice Serial Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="urSiDnNo"/>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Date & Time of Supply:</label>
                                                </td>
                                                <td>
                                                    <s:date format="dd-MM-yyyy HH:mm:SS" var="date1" name="%{supplyTime}"/> <s:property value="%{date1}" ></s:property>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Date:</label>
                                                </td>
                                                <td>
                                                   <s:date format="dd-MM-yyyy" var="date1" name="%{urInvoiceDate}"/> <s:property value="%{date1}" ></s:property>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Place OF Supply:</label>
                                                </td>
                                                <td>
                                                    <s:property value="supplyPlace"/>
                                                </td>

                                            </tr>     
                                        </table>
                                        </tr>


                                        <tr>
                                        <table border="0" frame="box" style="width:100%">
                                            <tr>
                                                <th style="text-align:center;" colspan="2">Details of Receiver (Billed to)</th>
                                                <th style="text-align:center;" colspan="2">Details of Consignee (Shipped to)</th>
                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="receiverName"/>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Name:</label>
                                                </td>
                                                <td>
                                                    <s:property value="consigneeName"/>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                    <s:property value="receiverAddress"/>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">Address :</label>
                                                </td>
                                                <td>
                                                    <s:property value="consigneeAddress"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="border-color:white">

                                                    <label id="i">State:</label>
                                                </td>
                                                <td>
                                                    <s:property value="receiverState"/>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">State:</label>
                                                </td>
                                                <td>
                                                    <s:property value="consigneeState"/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="border-color:white">
                                                    <label id="i">State Code :</label>
                                                </td>
                                                <td>
                                                    <s:property value="receiverPincode"/>
                                                </td>
                                                <td style="border-color:white">

                                                    <label id="i">State Code :</label>
                                                </td>
                                                <td>
                                                    <s:property value="consigneePincode"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="receiverGstinNo"/>                                                </td>
                                                <td style="border-color:white">
                                                    <label id="i">GSTIN Number:</label>
                                                </td>
                                                <td>
                                                    <s:property value="consigneeGstinNo"/>                                                </td>
                                            </tr>
                                        </table>
                                        </tr>
                                        <br/>
                                        <center>
                                        <table id="two1" >
                                            
          </td></tr>

</table> 
          </center>                              
                                        
                                        <tr>
                                        <table border="1" width="100%" style="margin-top: -2%;" id="one1">
                                            <tr>
                                                <th rowspan="2" style="text-align: center">S.No</th>
                                                <th rowspan="2" style="text-align: center">Description of Goods</th>
                                                <th rowspan="2" style="text-align: center">HSN Code (GST)</th>
                                            <th rowspan="2" style="text-align: center">Grade</th>
                                                <th rowspan="2" style="text-align: center">Quantity</th>
                                                 <th rowspan="2" style="text-align: center">UOM</th>
                                                <th rowspan="2" style="text-align: center">Rate</th>
                                                <th rowspan="2" style="text-align: center">Total &#8377;</th>
                                                <th rowspan="2" style="text-align: center">Discount &#8377;</th>
                                                 <th rowspan="2" style="text-align: center">Taxable value &#8377;</th>
                                                 <th colspan="2" style="text-align: center">CGST</th>
                                                  <th colspan="2" style="text-align: center">SGST</th>
                                                   <th colspan="2" style="text-align: center">IGST</th>
                                            </tr>
                                            <tr style="text-align: center">
                                                <th style="text-align: center">Rate</th>
                                                <th style="text-align: center">Amount &#8377;</th>
                                                <th style="text-align: center">Rate</th>
                                                <th style="text-align: center">Amount &#8377;</th>
                                                <th style="text-align: center">Rate</th>
                                                <th style="text-align: center">Amount &#8377;</th>
                                            </tr>
                                           
       <%--<s:hidden name="id" value="%{id}" />--%>
        <s:set var="total1" value="0" />
       <s:iterator value="clist2">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>      
                 
   </tr>
       </s:iterator>
     <s:iterator value="clist3">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist4">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist5">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist6">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   
   <s:iterator value="clist7">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>    
   
   
   <s:iterator value="clist8">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   
   
   <s:iterator value="clist9">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   
   
   <s:iterator value="clist10">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   
   <s:iterator value="clist11">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist12">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist13">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist14">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   <s:iterator value="clist15">
   <tr>
          <s:set var="total1" value="%{#total1+1}" />
          <td style="text-align: center"><s:property  value="%{#total1}" /></td>
          <td style="text-align: center"><s:property value="goodDescription"/></td>
          <td style="text-align: center"><s:property  value="hsnCode" /></td>
            <td style="text-align: center"><s:property  value="grade" /></td>
            <td style="text-align: center"><s:property  value="qty" /></td>
             <td style="text-align: center"><s:property  value="uom" /></td>
           <td style="text-align: center"><s:property  value="rate" /></td>   
              <td style="text-align: center"><s:property  value="total" /></td>
             <td style="text-align: center"><s:property  value="discount" /></td>
              <td style="text-align: center"><s:property  value="taxableValue" /></td>
               <td style="text-align: center"><s:property  value="cgstRate" /></td>
              <td style="text-align: center"><s:property  value="cgstAmt" /></td>
              <td style="text-align: center"><s:property  value="sgstRate" /></td>
               <td style="text-align: center"><s:property  value="sgstAmt" /></td>
                <td style="text-align: center"><s:property  value="igstRate" /></td>
                 <td style="text-align: center"><s:property  value="igstAmt" /></td>       
   </tr>
       </s:iterator>
   
   
   
</table>
  </tr>
  <tr>
  <table border="1" width="100%">
      <tr>
   <td   width="58.9%" class="text-center"><b>Total</b></td>  
   <td style="text-align: center"><s:textfield  size="45" value="%{totTaxVal}" id="totalPrice1" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   <td width="3.7%">&#X00A0;</td>
   <td style="text-align: center"><s:textfield size="25" value="%{totCgst}" id="totalPrice1" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   <td width="3.7%">&#X00A0;</td>
   <td style="text-align: center"><s:textfield  size="24" value="%{totSgst}" id="totalPrice3" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
<td width="3.5%">&#X00A0;</td>
<td style="text-align: center"><s:textfield name="form.totalNoofkgsPacked" size="25" value="%{totIgst}" id="totalPrice3" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>

<!--<td><s:textfield   id="totalPrice4" cssClass="form-control"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>-->
   </tr>
  
  </table>
    </tr>
    <tr>
   <table border="1" width="100%">
        <tr>
       <td><b>Invoice Value (In Words):</b></td>  
       <td style="text-align: center"><s:textfield  size="34" id="totalPrice1" value="%{word}"  cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   <td>Total &#8377;</td>
   <td style="text-align: center"><s:textfield name="form.totalOpeningStock" size="18" value="%{invoiceTotal}" id="totalPrice1" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   
   </tr>
   </table>
  </tr>
  <tr>

   <table border="1"  style="width:100%">
                    <tr>
          <th style="text-align:center;" colspan="2">Certified that the Particulars given above are true and correct</th>
       <th style="text-align:center;">Electronic Reference Number :</th>
              </tr>
              <tr>
              
             <td style="border-color:white">
                 <b><u> Declaration</u></b><br/>
 <label id="i">This SI/DN/CN is issued in adjustment to Original Invoice No:</label>
                           </td>
                <td>
                <s:property value="orgInvoiceNo"/>
</td>
                     <td rowspan="2">
                     <td>  </td>
     </tr>
     <tr>
           <td style="border-color:white">
 <label id="i">Orginal Invoice Dated:</label>
                                                </td>
                                                <td>
              <s:date format="dd-MM-yyyy" var="date1" name="%{orgInvoiceDate}"/> <s:property value="%{date1}" ></s:property>

                                                     
                                                </td>
                                           
              </tr>
 </table>
</tr>
<tr>
    <table border="1" style="width:100%">
                    <tr>
          <th style="text-align:center;">YOUR TERM & CONDITION OF SALE</th>
       <th style="text-align:center;" colspan="2">SAI VENKATA KRISHNA READY MIX INDUSTRY</th>
              </tr>
              <tr>
                  <td rowspan="4">
                      <s:textarea  value="%{termsConditions}" readonly="true" id="i" name="logindto.fullName" onkeypress="return isDecimalKey(event)" cssClass="form-control lable" cols="30" rows="4"/>
</td>
              
             <td style="border-color:white">
                
 <label id="i">Signature:</label>
                           </td>
                <td>
                    <s:textfield readonly="true" id="i" name="logindto.fullName" onkeypress="return isDecimalKey(event)" cssClass="form-control lable"/>
</td>
                     
     </tr>
     <tr>
         <th style="text-align:center;" colspan="2">Authorised Signatory</th>
     </tr>
     <tr>
           <td style="border-color:white">
 <label id="i">Name:</label>
         </td>
    <td>
        <s:property value="authName"/>
</td>
          </tr>                         
              <tr>
           <td style="border-color:white">
 <label id="i">Designation:</label>
                       </td>
                <td>
                    <s:property value="authDesign"/>
 </td>
                  </tr>  
 </table>
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
                                </s:iterator>


                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->



                    </div>
                        </div>
                        
                        <center>     <button onclick="myFunction('printablearea')" id="s" style="margin-right: 250px;"   class="bfsbutton btn btn-primary btn-block btn-flat">Download Bill</button> </center>

                    <!-- /.col (right) -->
           
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer" style="margin:0px !important;">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2017 <a href="http://nivriticloudsolutions.com">Nivriti Solutions Global</a>.</strong> All rights
        reserved.
    </footer>

    <!-- Control Sidebar -->
   
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
