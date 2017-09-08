<%-- 
    Document   : OeUpdate
    Created on : Dec 23, 2016, 5:07:28 PM
    Author     : ch.mounika
--%>

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
        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <sj:head />
        <s:head />
        <SCRIPT language=Javascript>
            <!--
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

            function isDecimalKey(evt)
            {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                if (key.length === 0)
                    return;
                var regex = /^[0-9.,\b]+$/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }

            //-->
        </SCRIPT>

    </head>

   <body style="background-color: #EEEEEE">
        <style type="text/css">
            label[for="i"] {
                color: black;
                font-family: sans-serif;
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
        </style>
        <s:iterator value="ulist" var="myobj">
            <%@include  file="Upperpage4.jsp" %>
        </s:iterator>
        <div class="container">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sri Mouli Textiles Private Limited Open End (OE) Update</h1>
                </div>
            </div>
            <!-- /.row -->

            <!-- Projects Row -->
            <div class="row">

                <center>
                    <div class="row">

                        <div class="clear">&#x00A0;</div>
                        <s:form action="oeUpdate"  enctype="multipart/form-data" method="post" onsubmit="return updateAll()">  

    <table>
   <s:iterator value="list">
    <tr>
     <td><s:hidden name="oe.id" value="%{id}" /></td>
    <td><s:hidden name="oe.ido" value="%{ido}" /></td>
    <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield name="oe.date" id="i" readonly="true" label="Date" value="%{date1}" size="90" cssClass="form-control form-group" displayFormat="dd-mm-yy" /></td>
 <%--  <td><sj:datepicker id="i" value="%{date}" name="oe.date" changeMonth="true" changeYear="true" readonly="true" label="Date" requiredLabel="true" requiredPosition="left" placeholder="Enter Purchase date (dd-mm-yyyy)" displayFormat="dd-mm-yy" size="90" cssClass="lab"/> </td>--%>
 <td><s:textfield id="i" value="%{superviser}" name="oe.superviser" label="Supervisor" readonly="true" headerKey="-1" headerValue="-- Select Supervisor --"  cssClass="form-control form-group" /></td> 
  <td><s:textfield id="i" value="%{shifts}" name="oe.shifts" label="Select Shift" readonly="true" cssClass="form-control form-group"/></td>
       </tr>
      </s:iterator>
 </table>

    <div class="col-sm-12 text-center"><h3>Open End Material Data</h3></div>
<br/><br/><br/><br/>
  <div class="tab1">
   <table class="table table-bordered table-responsive">
      <tr>
           <th>Open End</th>
    <th>Employee Id</th>
     
     <th>COUNT</th>
    <th>Count Maintain</th>
   <th>Speed of M/C</th>
    <th>TM</th>
    <th>M/C Running</th>
   <th>Expected Production (in Kgs)</th>
   <th>Actual Production (in Kgs)</th>
   <th>Efficiency</th>
    <th>Breakages in shifts</th>
    <th>100% Exp</th>
    <th>Remarks</th>
   </tr>
   <s:iterator value="glist1" status="rowstatus" var="obj10">
   <tr>
        <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple" readonly="true"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>  
       
   <td><s:textfield value="%{count}" id="vals1" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" label="Employee ID" placeholder="Enter OE-1 COUNT" cssClass="form-control" ></s:textfield></td>
    <td><s:textfield value="%{countMaintain}" id="valu1" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" label="Employee ID"  cssClass="form-control valu1" ></s:textfield></td>
    <td><s:textfield value="%{mcSpeed}" id="valu2" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" label="Employee ID" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp1" ></s:textfield></td>
   <td><s:textfield value="%{tm}" id="valu3" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" label="Employee ID" placeholder="Enter OE-1 TM" cssClass="form-control tm1" ></s:textfield></td>
   <td><s:textfield value="%{mcRunning}" id="valu4" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" label="Employee ID" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr1" ></s:textfield></td>
   <td><s:textfield value="%{expectedProduction}" readonly="true" id="expprod" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers()" name="oe.expectedProduction" theme="simple" label="Employee ID"  cssClass="form-control price" ></s:textfield></td>
     <td><s:textfield value="%{actualProduction}" id="digit1" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" label="Employee ID" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit1" ></s:textfield></td>
     <td><s:textfield value="%{efficiency}" readonly="true" id="data1" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" label="Employee ID"  onmousemove="javascript:efficiency1()" cssClass="form-control price3" ></s:textfield></td>
     <td><s:textfield value="%{breakeges}" id="noBales" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" label="Employee ID" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4" ></s:textfield></td>
    <td><s:textfield value="%{hundredPercentEfcy}" readonly="true" id="expproduce" onkeypress="return isNumberKey(this,event)"  onclick="javascript:addNum()"  name="oe.hundredPercentEfcy" theme="simple" label="Employee ID"  cssClass="form-control price5" ></s:textfield></td>
     <td><s:textfield value="%{remarks}" id="noBales" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control" ></s:textfield></td>
   </tr>
  </s:iterator>
  <s:iterator value="glist2" status="rowstatus" var="obj11">
   <tr>
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td> 
    <td><s:textfield value="%{empId}" id="emp1" name="oe.empId" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>
    <td><s:textfield value="%{count}" id="vals11" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" label="Employee ID" placeholder="Enter OE-1 COUNT" cssClass="form-control" ></s:textfield></td>
  <td><s:textfield value="%{countMaintain}" id="valu11" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" label="Employee ID"  cssClass="form-control valu11" ></s:textfield></td>
   <td><s:textfield value="%{mcSpeed}" id="valu21" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" label="Employee ID" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp2" ></s:textfield></td>
    <td><s:textfield value="%{tm}" id="valu31" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" label="Employee ID" placeholder="Enter OE-1 TM" cssClass="form-control tm2" ></s:textfield></td>
   <td><s:textfield value="%{mcRunning}" id="valu41" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" label="Employee ID" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr2" ></s:textfield></td>
   <td><s:textfield value="%{expectedProduction}" readonly="true" id="expprod2" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers2()" name="oe.expectedProduction" theme="simple" label="Employee ID"  cssClass="form-control price" ></s:textfield></td>
  <td><s:textfield value="%{actualProduction}" id="digit2" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" label="Employee ID" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit2" ></s:textfield></td>
    <td><s:textfield value="%{efficiency}" readonly="true" id="data2" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" label="Employee ID"  onmousemove="javascript:efficiency2()" cssClass="form-control price3" ></s:textfield></td>
   <td><s:textfield value="%{breakeges}" id="noBales" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" label="Employee ID" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4" ></s:textfield></td>
   <td><s:textfield value="%{hundredPercentEfcy}" readonly="true" id="expproduce2" onkeypress="return isNumberKey(this,event)"  onmousemove="javascript:addNum2()" name="oe.hundredPercentEfcy" theme="simple" label="Employee ID"  cssClass="form-control price5" ></s:textfield></td>
  <td><s:textfield value="%{remarks}" id="noBales" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control" ></s:textfield></td>
   </tr>
   </s:iterator>
   <s:iterator value="glist3" status="rowstatus" var="obj12">
     <tr>
         <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple" readonly="true"></s:textfield></td> 
   <td><s:textfield value="%{empId}" id="emp2" name="oe.empId" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>  
  
   
    <td><s:textfield value="%{count}" id="vals12" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" label="Employee ID" placeholder="Enter OE-1 COUNT" cssClass="form-control" ></s:textfield></td>
    <td><s:textfield value="%{countMaintain}" id="valu12" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" label="Employee ID"  cssClass="form-control valu12" ></s:textfield></td>
  <td><s:textfield value="%{mcSpeed}" id="valu22" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" label="Employee ID" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp3" ></s:textfield></td>
  <td><s:textfield value="%{tm}" id="valu32" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" label="Employee ID" placeholder="Enter OE-1 TM" cssClass="form-control tm3" ></s:textfield></td>
     <td><s:textfield value="%{mcRunning}" id="valu42" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" label="Employee ID" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr3" ></s:textfield></td>
    <td><s:textfield value="%{expectedProduction}" readonly="true"  id="expprod3" onkeypress="return isNumberKey(this,event)"  onmousemove="javascript:addNumbers3()" name="oe.expectedProduction" theme="simple" label="Employee ID"  cssClass="form-control price" ></s:textfield></td>
    <td><s:textfield value="%{actualProduction}" id="digit3" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" label="Employee ID" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit3" ></s:textfield></td>
   <td><s:textfield value="%{efficiency}" readonly="true" id="data3" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" label="Employee ID"  onmousemove="javascript:efficiency3()" cssClass="form-control price3" ></s:textfield></td>
     <td><s:textfield value="%{breakeges}" id="noBales" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" label="Employee ID" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4" ></s:textfield></td>
    <td><s:textfield value="%{hundredPercentEfcy}" readonly="true" id="expproduce3" onkeypress="return isNumberKey(this,event)"  onmousemove="javascript:addNum3()" name="oe.hundredPercentEfcy" theme="simple" label="Employee ID"  cssClass="form-control price5" ></s:textfield></td>
   <td><s:textfield value="%{remarks}" id="noBales" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control" ></s:textfield></td>
    </tr>
    </s:iterator>
   <s:iterator value="glist4" status="rowstatus">
   <tr>
        <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple" readonly="true"></s:textfield></td> 
     <td><s:textfield value="%{empId}" id="emp3" name="oe.empId" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>   
  
      <td><s:textfield value="%{count}" id="vals13" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" label="Employee ID" placeholder="Enter OE-1 COUNT" cssClass="form-control" ></s:textfield></td>
    <td><s:textfield value="%{countMaintain}" id="valu13" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" label="Employee ID"  cssClass="form-control valu13" ></s:textfield></td>
    <td><s:textfield value="%{mcSpeed}" id="valu23" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" label="Employee ID" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp4" ></s:textfield></td>
    <td><s:textfield value="%{tm}" id="valu33" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" label="Employee ID" placeholder="Enter OE-1 TM" cssClass="form-control tm4" ></s:textfield></td>
      <td><s:textfield value="%{mcRunning}" id="valu43" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" label="Employee ID" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr4" ></s:textfield></td>
     <td><s:textfield value="%{expectedProduction}" readonly="true" id="expprod4" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers4()" name="oe.expectedProduction" theme="simple" label="Employee ID"  cssClass="form-control price" ></s:textfield></td>
     <td><s:textfield value="%{actualProduction}" id="digit4" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" label="Employee ID" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit4" ></s:textfield></td>
       <td><s:textfield value="%{efficiency}" readonly="true" id="data4" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" label="Employee ID"  onmousemove="javascript:efficiency4()" cssClass="form-control price3" ></s:textfield></td>
      <td><s:textfield value="%{breakeges}" id="noBales" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" label="Employee ID" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4" ></s:textfield></td>
    <td><s:textfield value="%{hundredPercentEfcy}" readonly="true" id="expproduce4" onkeypress="return isNumberKey(this,event)"  onmousemove="javascript:addNum4()" name="oe.hundredPercentEfcy" theme="simple" label="Employee ID"  cssClass="form-control price5" ></s:textfield></td>
     <td><s:textfield value="%{remarks}" id="noBales" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control" ></s:textfield></td>
     </tr>
    </s:iterator>
     <s:iterator value="glist5" status="rowstatus">
    <tr>
         <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple" readonly="true"></s:textfield></td>
   <td><s:textfield value="%{empId}" id="emp4" name="oe.empId" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>   
  
  <td><s:textfield value="%{count}" id="vals14" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" label="Employee ID" placeholder="Enter OE-1 COUNT" cssClass="form-control" ></s:textfield></td>
   <td><s:textfield value="%{countMaintain}" id="valu14" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" label="Employee ID"  cssClass="form-control valu14" ></s:textfield></td>
  <td><s:textfield value="%{mcSpeed}" id="valu24" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" label="Employee ID" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp5" ></s:textfield></td>
   <td><s:textfield value="%{tm}" id="valu34" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" label="Employee ID" placeholder="Enter OE-1 TM" cssClass="form-control tm5" ></s:textfield></td>
    <td><s:textfield value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="valu44"  name="oe.mcRunning" theme="simple" label="Employee ID" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr5" ></s:textfield></td>
   <td><s:textfield value="%{expectedProduction}" readonly="true" id="expprod5" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers5()" name="oe.expectedProduction" theme="simple" label="Employee ID"  cssClass="form-control price" ></s:textfield></td>
 <td><s:textfield value="%{actualProduction}" id="digit5" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" label="Employee ID" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit5" ></s:textfield></td>
   <td><s:textfield value="%{efficiency}" readonly="true"  id="data5" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" label="Employee ID"  onmousemove="javascript:efficiency5()" cssClass="form-control price3" ></s:textfield></td>
  <td><s:textfield value="%{breakeges}" id="noBales" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" label="Employee ID" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4" ></s:textfield></td>
    <td><s:textfield value="%{hundredPercentEfcy}" readonly="true" id="expproduce5" onkeypress="return isNumberKey(this,event)"  onmousemove="javascript:addNum5()" name="oe.hundredPercentEfcy" theme="simple" label="Employee ID"  cssClass="form-control price5" ></s:textfield></td>
  <td><s:textfield value="%{remarks}" id="noBales" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control" ></s:textfield></td>
   </tr>
   </s:iterator>
    <s:iterator value="glist6" status="rowstatus">
     <tr>
         <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple" readonly="true"></s:textfield></td> 
   <td><s:textfield value="%{empId}" id="emp5" name="oe.empId" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>   
   
  <td><s:textfield value="%{count}" id="vals15" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" label="Employee ID" placeholder="Enter OE-1 COUNT" cssClass="form-control" ></s:textfield></td>
  <td><s:textfield value="%{countMaintain}" id="valu15" onkeypress="return isNumberKey(this,event)"  name="oe.countMaintain" theme="simple" label="Employee ID"  cssClass="form-control valu15" ></s:textfield></td>
   <td><s:textfield value="%{mcSpeed}" id="valu25" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" label="Employee ID" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp6" ></s:textfield></td>
   <td><s:textfield value="%{tm}" id="valu35" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" label="Employee ID" placeholder="Enter OE-1 TM" cssClass="form-control tm6" ></s:textfield></td>
   <td><s:textfield value="%{mcRunning}" id="valu45" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" label="Employee ID" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr6" ></s:textfield></td>
   <td><s:textfield value="%{expectedProduction}" readonly="true" id="expprod6" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers6()" name="oe.expectedProduction" theme="simple" label="Employee ID"  cssClass="form-control price" ></s:textfield></td>
  <td><s:textfield value="%{actualProduction}" id="digit6" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" label="Employee ID" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit6" ></s:textfield></td>
 <td><s:textfield value="%{efficiency}" readonly="true" id="data6" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" label="Employee ID"  onmousemove="javascript:efficiency6()" cssClass="form-control price3" ></s:textfield></td>
  <td><s:textfield value="%{breakeges}" id="noBales" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" label="Employee ID" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4" ></s:textfield></td>
    <td><s:textfield value="%{hundredPercentEfcy}" readonly="true" id="expproduce6" onkeypress="return isNumberKey(this,event)"  onmousemove="javascript:addNum6()" theme="simple" label="Employee ID" name="oe.hundredPercentEfcy"  cssClass="form-control price5" ></s:textfield></td>
   <td><s:textfield value="%{remarks}" id="noBales" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control" ></s:textfield></td>
    </tr>
  </s:iterator>

  <s:iterator value="list">
    <tr>
  <td colspan="7" class="text-center"><b>Total Production</b></td>
   <td><b><s:textfield value="%{totalEp}" readonly="true" id="totalPrice1" name="oe.totalEp" theme="simple" placeholder="Enter Total Expected Production (in Kgs)" cssClass="form-control" ></s:textfield></b></td>
    <td><b><s:textfield value="%{totalAp}" readonly="true" id="totalPrice2" name="oe.totalAp" theme="simple" placeholder="Enter Total Actual Production (in Kgs)" cssClass="form-control" ></s:textfield></b></td>
    <td><b><s:textfield value="%{totalEfcy}" readonly="true" id="data7" name="oe.totalEfcy" theme="simple" placeholder="Enter Total Efficiency" onmousemove="javascript:efficiency7()" cssClass="form-control" ></s:textfield></b></td>
    <td></td>
<!--   <td><b><s:textfield   cssClass="form-control" value="100% EXP" theme="simple" readonly="true"></s:textfield></b></td>-->
    <td><b><s:textfield value="%{totalHpEfcy}" readonly="true" id="totalPrice5" name="oe.totalHpEfcy" theme="simple" placeholder="Enter Total 100% Exp" cssClass="form-control" ></s:textfield></b></td>
   <td><b><s:textfield id="noBales"  theme="simple" cssClass="form-control" ></s:textfield></b></td>
   </tr>
    </s:iterator>
     </table>
      </div>
    <div class="form-group">
     <div class="col-sm-6 text-center">
         <s:submit value="Update" cssClass="btn btn-primary"  align="center"></s:submit> 
    </div>
      <div class="col-sm-6 text-center">
         <button type="reset" class="btn btn-primary" >Cancel</button>
           </div>
     </div>
   </s:form>

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
                    
                      <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                
               function findval(item) {
                                 name = item;
                             }
                             function addNumbers() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu1").value);
                                 var y = parseFloat(document.getElementById("valu2").value);
                                 var a = parseFloat(document.getElementById("valu3").value);
                                 var b = parseFloat(document.getElementById("valu4").value);
                    
                                 sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*b/60;
                                 //n = sum.toFixed(3);
                                 n = Math.round(sum);
                                 var z = document.getElementById("expprod");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNumbers2() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu11").value);
                                 var y = parseFloat(document.getElementById("valu21").value);
                                 var a = parseFloat(document.getElementById("valu31").value);
                                 var b = parseFloat(document.getElementById("valu41").value);
                                   sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*b/60;
                                 //n = sum.toFixed(3);
                                 n = Math.round(sum);
                                 var z = document.getElementById("expprod2");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNumbers3() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu12").value);
                                 var y = parseFloat(document.getElementById("valu22").value);
                                 var a = parseFloat(document.getElementById("valu32").value);
                                 var b = parseFloat(document.getElementById("valu42").value);
                                 sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*b/60;
                                 //n = sum.toFixed(3);
                                 n = Math.round(sum);
                                 var z = document.getElementById("expprod3");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNumbers4() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu13").value);
                                 var y = parseFloat(document.getElementById("valu23").value);
                                 var a = parseFloat(document.getElementById("valu33").value);
                                 var b = parseFloat(document.getElementById("valu43").value);
                                 sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*b/60;
                                 //n = sum.toFixed(3);
                                 n = Math.round(sum);
                                 var z = document.getElementById("expprod4");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNumbers5() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu14").value);
                                 var y = parseFloat(document.getElementById("valu24").value);
                                 var a = parseFloat(document.getElementById("valu34").value);
                                 var b = parseFloat(document.getElementById("valu44").value);
                                 sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*b/60;
                                 //n = sum.toFixed(3);
                                 n = Math.round(sum);
                                 var z = document.getElementById("expprod5");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }
                             function addNumbers6() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu15").value);
                                 var y = parseFloat(document.getElementById("valu25").value);
                                 var a = parseFloat(document.getElementById("valu35").value);
                                 var b = parseFloat(document.getElementById("valu45").value);
                                 sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*b/60;
                                 //n = sum.toFixed(3);
                                 n = Math.round(sum);
                                 var z = document.getElementById("expprod6");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }


                             function addNum() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu1").value);
                                 var y = parseFloat(document.getElementById("valu2").value);
                                 var a = parseFloat(document.getElementById("valu3").value);
                     if (name === 'Shift 1' || name === 'Shift 2') {
                        sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*510/60;
                         n = sum.toFixed(2);
                    } else if (name === 'Shift 3') {
                      sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*420/60;
                       n = sum.toFixed(2);
                    }
                                 // n=Math.round(sum);
                                 var z = document.getElementById("expproduce");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }
                             function addNum2() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu11").value);
                                 var y = parseFloat(document.getElementById("valu21").value);
                                 var a = parseFloat(document.getElementById("valu31").value);
if (name === 'Shift 1' || name === 'Shift 2') {
                        sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*510/60;
                    n = sum.toFixed(2);
                    } else if (name === 'Shift 3') {
                    sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*420/60;
                    n = sum.toFixed(2);
                    }
                                 // n=Math.round(sum);
                                 var z = document.getElementById("expproduce2");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNum3() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu12").value);
                                 var y = parseFloat(document.getElementById("valu22").value);
                                 var a = parseFloat(document.getElementById("valu32").value);

                                 if (name === 'Shift 1' || name === 'Shift 2') {
                        sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*510/60;
                    n = sum.toFixed(2);
                    } else if (name === 'Shift 3') {
                    sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*420/60;
                    n = sum.toFixed(2);
                    }
                                 // n=Math.round(sum);
                                 var z = document.getElementById("expproduce3");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNum4() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu13").value);
                                 var y = parseFloat(document.getElementById("valu23").value);
                                 var a = parseFloat(document.getElementById("valu33").value);

                                 if (name === 'Shift 1' || name === 'Shift 2') {
                        sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*510/60;
                    n = sum.toFixed(2);
                    } else if (name === 'Shift 3') {
                    sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*420/60;
                    n = sum.toFixed(2);
                    }
                                 // n=Math.round(sum);
                                 var z = document.getElementById("expproduce4");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }

                             function addNum5() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu14").value);
                                 var y = parseFloat(document.getElementById("valu24").value);
                                 var a = parseFloat(document.getElementById("valu34").value);

                                if (name === 'Shift 1' || name === 'Shift 2') {
                        sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*510/60;
                    n = sum.toFixed(2);
                    } else if (name === 'Shift 3') {
                    sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*420/60;
                    n = sum.toFixed(2);
                    }
                                 // n=Math.round(sum);
                                 var z = document.getElementById("expproduce5");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }
                             function addNum6() {
                                 var sum = 0;
                                 var n;
                                 var x = parseFloat(document.getElementById("valu15").value);
                                 var y = parseFloat(document.getElementById("valu25").value);
                                 var a = parseFloat(document.getElementById("valu35").value);

                                 if (name === 'Shift 1' || name === 'Shift 2') {
                        sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*510/60;
                    n = sum.toFixed(2);
                    } else if (name === 'Shift 3') {
                    sum = (7.2*y/(a * Math.sqrt(x))/x/1000)*3*448/24*420/60;
                    n = sum.toFixed(2);
                    }
                                 // n=Math.round(sum);
                                 var z = document.getElementById("expproduce6");
                                 if (isNaN(n))
                                     n = 0;
                                 z.value = n;
                             }


 function abc() {
                var sum = 0;

                // we use jQuery each() to loop through all the textbox with 'price' class
                // and compute the sum for each loop
                $('.price').each(function () {
                    sum += Number($(this).val());
                });

                // set the computed value to 'totalPrice' textbox
                $('#totalPrice1').val(sum);

            }
            function def(){
                // initialize the sum (total price) to zero
                var sum = 0;

                // we use jQuery each() to loop through all the textbox with 'price' class
                // and compute the sum for each loop
                $('.price2').each(function () {
                    sum += Number($(this).val());
                });

                // set the computed value to 'totalPrice' textbox
                $('#totalPrice2').val(sum);

            }
             function ghi(){
                // initialize the sum (total price) to zero
                var sum = 0;

                // we use jQuery each() to loop through all the textbox with 'price' class
                // and compute the sum for each loop
                $('.price5').each(function () {
                    sum += Number($(this).val());
                });

                // set the computed value to 'totalPrice' textbox
                $('#totalPrice5').val(sum);

            }
          
            function updateAll() {
                 var e=document.getElementById("emp").value;
       var d=document.getElementById("vals1").value;  var d1=document.getElementById("valu1").value;
       var d2=document.getElementById("valu2").value;var d3=document.getElementById("valu3").value;
        if(d.length!==0 || d1.length!==0 ||d2.length!==0 || d3.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp').focus();
              return false;
           }
       }
        var e=document.getElementById("emp1").value;
       var d=document.getElementById("vals11").value;  var d1=document.getElementById("valu11").value;
       var d2=document.getElementById("valu21").value;var d3=document.getElementById("valu31").value;
        if(d.length!==0 || d1.length!==0 ||d2.length!==0 || d3.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp1').focus();
              return false;
           }
       }
        var e=document.getElementById("emp2").value;
       var d=document.getElementById("vals12").value;  var d1=document.getElementById("valu12").value;
       var d2=document.getElementById("valu22").value;var d3=document.getElementById("valu32").value;
        if(d.length!==0 || d1.length!==0 ||d2.length!==0 || d3.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp2').focus();
              return false;
           }
       }
        var e=document.getElementById("emp3").value;
       var d=document.getElementById("vals13").value;  var d1=document.getElementById("valu13").value;
       var d2=document.getElementById("valu23").value;var d3=document.getElementById("valu33").value;
        if(d.length!==0 || d1.length!==0 ||d2.length!==0 || d3.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp3').focus();
              return false;
           }
       }
        var e=document.getElementById("emp4").value;
       var d=document.getElementById("vals14").value;  var d1=document.getElementById("valu14").value;
       var d2=document.getElementById("valu24").value;var d3=document.getElementById("valu34").value;
        if(d.length!==0 || d1.length!==0 ||d2.length!==0 || d3.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp4').focus();
              return false;
           }
       }
     var e=document.getElementById("emp5").value;
       var d=document.getElementById("vals15").value;  var d1=document.getElementById("valu15").value;
       var d2=document.getElementById("valu25").value;var d3=document.getElementById("valu35").value;
        if(d.length!==0 || d1.length!==0 ||d2.length!==0 || d3.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp5').focus();
              return false;
           }
       }
              var digit1 = $('#digit1').val();
                                 var expprod = document.getElementById("expprod").value;
                                 if (parseFloat(digit1) > parseFloat(expprod))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $('#digit1').val("");
                                      $('#digit1').focus();
                                      return false;
                                 }
                                  var digit2 = $('#digit2').val();
                                 var expprod2 = document.getElementById("expprod2").value;
                                 if (parseFloat(digit2) > parseFloat(expprod2))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $('#digit2').val("");
                                      $('#digit2').focus();
                                      return false;
                                 }
                                 
                                  var digit3 = $('#digit3').val();
                                 var expprod3 = document.getElementById("expprod3").value;
                                 if (parseFloat(digit3) > parseFloat(expprod3))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     
                                     $('#digit3').val("");
                                      $('#digit3').focus();
                                  return false;
                                 }
                                  var digit4 = $('#digit4').val();
                                 var expprod4 = document.getElementById("expprod4").value;
                                 if (parseFloat(digit4) > parseFloat(expprod4))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $('#digit4').val("");
                                      $('#digit4').focus();
                                 return false;
                                 }
                                  var digit5 = $('#digit5').val();
                                 var expprod5 = document.getElementById("expprod5").value;
                                 if (parseFloat(digit5) > parseFloat(expprod5))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $('#digit5').val("");
                                      $('#digit5').focus();
                                  return false;
                                 }
                                 var digit6 = $('#digit6').val();
                                 var expprod6 = document.getElementById("expprod6").value;
                                 if (parseFloat(digit6) > parseFloat(expprod6))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $('#digit6').val("");
                                      $('#digit6').focus();
                                      return false;
                                 } 
                                 
                 efficiency7();
                 efficiency1();
                 efficiency2();
                 efficiency3();
                 efficiency4();
                 efficiency5();
                 efficiency6();
                 
                abc();
                def();
                ghi();
            }



                             function efficiency1() {
                                 var x = parseFloat(document.getElementById("expprod").value);
                                 var y = parseFloat(document.getElementById("digit1").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data1");
                                 res.value = z;
                             }
                             function efficiency2() {
                                 var x = parseFloat(document.getElementById("expprod2").value);
                                 var y = parseFloat(document.getElementById("digit2").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data2");
                                 res.value = z;
                             }
                             function efficiency3() {
                                 var x = parseFloat(document.getElementById("expprod3").value);
                                 var y = parseFloat(document.getElementById("digit3").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data3");
                                 res.value = z;
                             }
                             function efficiency4() {
                                 var x = parseFloat(document.getElementById("expprod4").value);
                                 var y = parseFloat(document.getElementById("digit4").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data4");
                                 res.value = z;
                             }
                             function efficiency5() {
                                 var x = parseFloat(document.getElementById("expprod5").value);
                                 var y = parseFloat(document.getElementById("digit5").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data5");
                                 res.value = z;
                             }
                             function efficiency6() {
                                 var x = parseFloat(document.getElementById("expprod6").value);
                                 var y = parseFloat(document.getElementById("digit6").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data6");
                                 res.value = z;
                             }

                             function efficiency7() {
                                 var x = parseFloat(document.getElementById("totalPrice1").value);
                                 var y = parseFloat(document.getElementById("totalPrice2").value);
                                 var n = (y / x) * 100;
                                 var z = n.toFixed(3);
                                 if (isNaN(n) || isNaN(y) || isNaN(x) || y === 0 || x === 0)
                                     z = 0;
                                 var res = document.getElementById("data7");
                                 res.value = z;
                             }

 
                    // we used jQuery 'keyup' to trigger the computation as the user type
                             $('.price').mouseenter(function () {

                                 // initialize the sum (total price) to zero
                                 var sum = 0;

                                 // we use jQuery each() to loop through all the textbox with 'price' class
                                 // and compute the sum for each loop
                                 $('.price').each(function () {
                                     sum += Number($(this).val());
                                 });

                                 // set the computed value to 'totalPrice' textbox
                                 $('#totalPrice1').val(sum);


                             });
                             $('.price2').mouseenter(function () {

                                 // initialize the sum (total price) to zero
                                 var sum = 0;

                                 // we use jQuery each() to loop through all the textbox with 'price' class
                                 // and compute the sum for each loop
                                 $('.price2').each(function () {
                                     sum += Number($(this).val());
                                 });

                                 // set the computed value to 'totalPrice' textbox
                                 $('#totalPrice2').val(sum);

                             });
                             $('.price3').mouseenter(function () {

                                 // initialize the sum (total price) to zero
                                 var sum = 0;

                                 // we use jQuery each() to loop through all the textbox with 'price' class
                                 // and compute the sum for each loop
                                 $('.price3').each(function () {
                                     sum += Number($(this).val());
                                 });

                                 // set the computed value to 'totalPrice' textbox
                                 $('#totalPrice3').val(sum);

                             });

                             $('.price5').mouseenter(function () {

                                 // initialize the sum (total price) to zero
                                 var sum = 0;

                                 // we use jQuery each() to loop through all the textbox with 'price' class
                                 // and compute the sum for each loop
                                 $('.price5').each(function () {
                                     sum += Number($(this).val());
                                 });

                                 // set the computed value to 'totalPrice' textbox
                                 $('#totalPrice5').val(sum);

                             });
                             $("#digit1").change(function () {
                                 var digit1 = $(this).val();
                                 var expprod = document.getElementById("expprod").value;
                                 if (parseFloat(digit1) > parseFloat(expprod))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $(this).val("");
                                      $(this).focus();
                                 } else {
                                     // do something
                                 }
                             });
                             $("#digit2").change(function () {
                                 var digit2 = $(this).val();
                                 var expprod2 = document.getElementById("expprod2").value;
                                 if (parseFloat(digit2) > parseFloat(expprod2))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $(this).val("");
                                      $(this).focus();
                                 } else {
                                     // do something
                                 }
                             });
                             $("#digit3").change(function () {
                                 var digit3 = $(this).val();
                                 var expprod3 = document.getElementById("expprod3").value;
                                 if (parseFloat(digit3) > parseFloat(expprod3))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $(this).val("");
                                      $(this).focus();
                                 } else {
                                     // do something
                                 }
                             });
                             $("#digit4").change(function () {
                                 var digit4 = $(this).val();
                                 var expprod4 = document.getElementById("expprod4").value;
                                 if (parseFloat(digit4) > parseFloat(expprod4))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $(this).val("");
                                      $(this).focus();
                                 } else {
                                     // do something
                                 }
                             });
                             $("#digit5").change(function () {
                                 var digit5 = $(this).val();
                                 var expprod5 = document.getElementById("expprod5").value;
                                 if (parseFloat(digit5) > parseFloat(expprod5))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $(this).val("");
                                      $(this).focus();
                                 } else {
                                     // do something
                                 }
                             });
                             $("#digit6").change(function () {
                                 var digit6 = $(this).val();
                                 var expprod6 = document.getElementById("expprod6").value;
                                 if (parseFloat(digit6) > parseFloat(expprod6))

                                 {
                                     alert("Actual Production must be less than Expected Production");
                                     $(this).val("");
                                      $(this).focus();
                                 } else {
                                     // do something
                                 }
                             });
                      
                             
     $( ".acp6" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
         $("#expprod6").val("");
                 $("#data6").val("");
                 $("#expproduce6").val("");
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});


$( ".acp5" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
       $("#expprod5").val("");
                 $("#data5").val("");
                 $("#expproduce5").val("");
                $(this).val("");
                 $(this).focus();
    } else {
        // do something
    }
});


$( ".acp4" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
         $("#expprod4").val("");
              
                 $("#data4").val("");
                  $("#expproduce4").val("");
                $(this).val("");
                 $(this).focus();
      
    } else {
        // do something
    }
});


$( ".acp3" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
        $("#expprod3").val("");
              
                 $("#data3").val("");
                 $("#expproduce3").val("");
                $(this).val("");
                 $(this).focus();
    } else {
        // do something
    }
});


$( ".acp2" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
         $("#expprod2").val("");
             
                 $("#data2").val("");
               $("#expproduce2").val("");
                 
                $(this).val("");
                 $(this).focus();
        
       
    } else {
        // do something
    }
});


$( ".acp1" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
            $("#valu2").val("");
                
               $("#expproduce").val("");
               $("#expprod").val("");
               $("#data1").val("");
              
                 
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});

$( ".mcr1" ).change(function() {
    
  var a = $(this).val();
   if (name === 'Shift 1' || name === 'Shift 2') {
    if (parseInt(a) >510)
    {
        alert("M/C Running must be less than or equal to 510");
       
        $(this).val("");
         $(this).focus();
    } 
   }else if(name === 'Shift 3'){
      
       if(parseInt(a)>420){
           alert("M/C Running must be less than or equal to 420");
           $(this).val("");
         $(this).focus();
   }
    }
});
$( ".mcr2" ).change(function() {
    
  var a = $(this).val();
   if (name === 'Shift 1' || name === 'Shift 2') {
    if (parseInt(a) >510)
    {
        alert("M/C Running must be less than or equal to 510");
       
        $(this).val("");
         $(this).focus();
    } 
   }else if(name === 'Shift 3'){
      
       if(parseInt(a)>420){
           alert("M/C Running must be less than or equal to 420");
           $(this).val("");
         $(this).focus();
   }
    }
});

$( ".mcr3" ).change(function() {
    
  var a = $(this).val();
   if (name === 'Shift 1' || name === 'Shift 2') {
    if (parseInt(a) >510)
    {
        alert("M/C Running must be less than or equal to 510");
       
        $(this).val("");
         $(this).focus();
    } 
   }else if(name === 'Shift 3'){
      
       if(parseInt(a)>420){
           alert("M/C Running must be less than or equal to 420");
           $(this).val("");
         $(this).focus();
   }
    }
});

$( ".mcr4" ).change(function() {
    
  var a = $(this).val();
   if (name === 'Shift 1' || name === 'Shift 2') {
    if (parseInt(a) >510)
    {
        alert("M/C Running must be less than or equal to 510");
       
        $(this).val("");
         $(this).focus();
    } 
   }else if(name === 'Shift 3'){
      
       if(parseInt(a)>420){
           alert("M/C Running must be less than or equal to 420");
           $(this).val("");
         $(this).focus();
   }
    }
});
$( ".mcr5" ).change(function() {
    
  var a = $(this).val();
   if (name === 'Shift 1' || name === 'Shift 2') {
    if (parseInt(a) >510)
    {
        alert("M/C Running must be less than or equal to 510");
       
        $(this).val("");
         $(this).focus();
    } 
   }else if(name === 'Shift 3'){
      
       if(parseInt(a)>420){
           alert("M/C Running must be less than or equal to 420");
           $(this).val("");
         $(this).focus();
   }
    }
});
$( ".mcr6" ).change(function() {
    
  var a = $(this).val();
   if (name === 'Shift 1' || name === 'Shift 2') {
    if (parseInt(a) >510)
    {
        alert("M/C Running must be less than or equal to 510");
       
        $(this).val("");
         $(this).focus();
    } 
   }else if(name === 'Shift 3'){
      
       if(parseInt(a)>420){
           alert("M/C Running must be less than or equal to 420");
           $(this).val("");
         $(this).focus();
   }
    }
});

$( ".tm1" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseFloat(a1) >=3 && parseFloat(a1)<=7.5))
    {
        alert("Must be in 3 and 7.5");
         $("#valu3").val("");
                $("#valu4").val("");
                  addNumbers();
                  efficiency1();
                  addNum();
//            $("#expprod").val("");
//             $("#data1").val("");
//             $("#expproduce").val("");
             
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});

$( ".tm2" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseFloat(a1) >=3 && parseFloat(a1)<=7.5))

    {
        alert("Must be in 3 and 7.5");
        $("#valu31").val("");
                $("#valu41").val("");
             addNumbers2();
                  efficiency2();
                  addNum2();
          
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});

$( ".tm3" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
     if (!(parseFloat(a1) >=3 && parseFloat(a1)<=7.5))
    {
         alert("Must be in 3 and 7.5");
        $("#valu32").val("");
                $("#valu42").val("");
              addNumbers3();
                  efficiency3();
                  addNum3();
            
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});

$( ".tm4" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
     if (!(parseFloat(a1) >=3 && parseFloat(a1)<=7.5))

    {
        alert("Must be in 3 and 7.5");
           $("#valu33").val("");
                $("#valu43").val("");
                addNumbers4();
                  efficiency4();
                  addNum4();
              
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});

$( ".tm5" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseFloat(a1) >=3 && parseFloat(a1)<=7.5))

    {
       alert("Must be in 3 and 7.5");
          $("#valu34").val("");
                $("#valu44").val("");
               addNumbers5();
                  efficiency5();
                  addNum5();
            
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});

$( ".tm6" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseFloat(a1) >=3 && parseFloat(a1)<=7.5))

    {
        alert("Must be in 3 and 7.5");
         $("#valu35").val("");
                $("#valu45").val("");
                addNumbers6();
                  efficiency6();
                  addNum6();
              
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});  



$( ".valu15" ).change(function() {
  var valu15 = $(this).val();
    var anu = document.getElementById("vals15").value;
      var ac5=parseFloat(anu-0.9);
    if (parseFloat(valu15) < parseFloat(anu-0.9))

    {
       alert("Count Maintained must be between "+ac5+" to "+anu+".999---");
        $(this).val("");
        $( ".valu15" ).focus();
    } 
    
     else if (parseInt(valu15) > parseInt(anu))

    {
         alert("Count Maintained must be between "+ac5+" to "+anu+".999---");
        $(this).val("");
        $(this).focus();
    } 
        else {
        // do something
    }
});


$( ".valu14" ).change(function() {
  var valu14 = $(this).val();
    var anu1 = document.getElementById("vals14").value;
     var ac4=parseFloat(anu1-0.9);
    if (parseFloat(valu14) < parseFloat(anu1-0.9))

    {
       alert("Count Maintained must be between "+ac4+" to "+anu1+".999---");
        $(this).val("");
         $( ".valu14" ).focus();
    } 
    
     else if (parseInt(valu14) > parseInt(anu1))

    {
        alert("Count Maintained must be between "+ac4+" to "+anu1+".999---");
        $(this).val("");
         $( ".valu14" ).focus();
    } 
        else {
        // do something
    }
});



$( ".valu13" ).change(function() {
  var valu13 = $(this).val();
    var anu2 = document.getElementById("vals13").value;
    var ac3=parseFloat(anu2-0.9);
    if (parseFloat(valu13) < parseFloat(anu2-0.9))

    {
         alert("Count Maintained must be between "+ac3+" to "+anu2+".999---");
        $(this).val("");
         $( ".valu13" ).focus();
    } 
    
     else if (parseInt(valu13) > parseInt(anu2))

    {
        alert("Count Maintained must be between "+ac3+" to "+anu2+".999---");
        $(this).val("");
         $( ".valu13" ).focus();
    } 
        else {
        // do something
    }
});


$( ".valu12" ).change(function() {
  var valu12 = $(this).val();
    var anu3 = document.getElementById("vals12").value;
    var ac2=parseFloat(anu3-0.9);
    if (parseFloat(valu12) < parseFloat(anu3-0.9))

    {
        alert("Count Maintained must be between "+ac2+" to "+anu3+".999---");
        $(this).val("");
         $( ".valu12" ).focus();
    } 
    
     else if (parseInt(valu12) > parseInt(anu3))

    {
         alert("Count Maintained must be between "+ac2+" to "+anu3+".999---");
        $(this).val("");
         $( ".valu12" ).focus();
    } 
        else {
        // do something
    }
});


$( ".valu11" ).change(function() {
  var valu11 = $(this).val();
    var anu4 = document.getElementById("vals11").value;
     var ac1=parseFloat(anu4-0.9);
    if (parseFloat(valu11) < parseFloat(anu4-0.9))

    {
        alert("Count Maintained must be between "+ac1+" to "+anu4+".999---");
        $(this).val("");
         $( ".valu11" ).focus();
    } 
    
     else if (parseInt(valu11) > parseInt(anu4))

    {
       alert("Count Maintained must be between "+ac1+" to "+anu4+".999---");
        $(this).val("");
         $( ".valu11" ).focus();
    } 
        else {
        // do something
    }
});


$( ".valu1" ).change(function() {
  var valu1 = $(this).val();
    var anu5 = document.getElementById("vals1").value;
    var ac=parseFloat(anu5-0.9);
    if (parseFloat(valu1) < parseFloat(anu5-0.9))

    {
      alert("Count Maintained must be between "+ac+" to "+anu5+".999---");
        $(this).val("");
         $( ".valu1" ).focus();
    } 
    
     else if (parseInt(valu1) > parseInt(anu5))

    {
        alert("Count Maintained must be between "+ac+" to "+anu5+".999---");
        $(this).val("");
         $( ".valu1" ).focus();
    } 
        else {
        // do something
    }
});



    $(document).ready(function () {
$('#emp').blur(function(){
   
        if(($('#emp').val()).length!==0){
           
            var a=parseInt($('#emp').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
      
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         
         var a3=parseInt(a1[i]);
         var b;
         
         if(a.valueOf()===a3.valueOf()){
             
              b="hello";
        }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
         }
         }
         }
     }
       }
            });
            
         $('#emp1').blur(function(){
   
        if(($('#emp1').val()).length!==0){
           
            var a=parseInt($('#emp1').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
      
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         
         var a3=parseInt(a1[i]);
         var b;
         
         if(a.valueOf()===a3.valueOf()){
             
              b="hello";
        }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
         }
         }
         }
     }
       }
            });  
 $("#vals1").blur(function(){
  if(($('#vals1').val()).length!==0){
            var a=parseInt($('#vals1').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
          else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid count");
			 $("#vals1").val("");
                $("#vals1").attr("readonly", false);
                 $("#vals1").focus();
             }
         }
          }
      }
  }
  });
    
$('#emp2').blur(function(){
   
        if(($('#emp2').val()).length!==0){
           
            var a=parseInt($('#emp2').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
      
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         
         var a3=parseInt(a1[i]);
         var b;
         
         if(a.valueOf()===a3.valueOf()){
             
              b="hello";
        }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
         }
         }
         }
     }
       }
            });
             $("#vals11").blur(function(){
  if(($('#vals11').val()).length!==0){
            var a=parseInt($('#vals11').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
          else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid count");
			 $("#vals11").val("");
                $("#vals11").attr("readonly", false);
                 $("#vals11").focus();
             }
         }
          }
      }
  }
  });

$('#emp3').blur(function(){
   
        if(($('#emp3').val()).length!==0){
           
            var a=parseInt($('#emp3').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
      
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         
         var a3=parseInt(a1[i]);
         var b;
         
         if(a.valueOf()===a3.valueOf()){
             
              b="hello";
        }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
         }
         }
         }
     }
       }
            });
 $("#vals12").blur(function(){
  if(($('#vals12').val()).length!==0){
            var a=parseInt($('#vals12').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
          else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid count");
			 $("#vals12").val("");
                $("#vals12").attr("readonly", false);
                 $("#vals12").focus();
             }
         }
          }
      }
  }
  });

$('#emp4').blur(function(){
   
        if(($('#emp4').val()).length!==0){
           
            var a=parseInt($('#emp4').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
      
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         
         var a3=parseInt(a1[i]);
         var b;
         
         if(a.valueOf()===a3.valueOf()){
             
              b="hello";
        }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
         }
         }
         }
     }
       }
            });
            $("#vals13").blur(function(){
  if(($('#vals13').val()).length!==0){
            var a=parseInt($('#vals13').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
          else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid count");
			 $("#vals13").val("");
                $("#vals13").attr("readonly", false);
                 $("#vals13").focus();
             }
         }
          }
      }
  }
  });

       $('#emp5').blur(function(){
   
        if(($('#emp5').val()).length!==0){
           
            var a=parseInt($('#emp5').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
      
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         
         var a3=parseInt(a1[i]);
         var b;
         
         if(a.valueOf()===a3.valueOf()){
             
              b="hello";
        }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
         }
         }
         }
     }
       }
            });     
        });
      $("#vals14").blur(function(){
  if(($('#vals14').val()).length!==0){
            var a=parseInt($('#vals14').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
          else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid count");
			 $("#vals14").val("");
                $("#vals14").attr("readonly", false);
                 $("#vals14").focus();
             }
         }
          }
      }
  }
  });
    $("#vals15").blur(function(){
  if(($('#vals15').val()).length!==0){
            var a=parseInt($('#vals15').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
          else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid count");
			 $("#vals15").val("");
                $("#vals15").attr("readonly", false);
                 $("#vals15").focus();
             }
         }
          }
      }
  }
  });
   //  TM Validation
   
   
    $(function() {
    var content = $('#valu3').val();

    $('#valu3').keyup(function() { 
        if ($('#valu3').val() !== content) {
             addNumbers();
              efficiency1();
                  addNum();
           
        }
       
});

 $('#valu3').blur(function() { 
        if ($('#valu3').val() !== content) {
           addNumbers();
              efficiency1();
                  addNum();
        
        }
     });
     
     
  
     var content = $('#valu31').val();
    $('#valu31').keyup(function() { 
        if ($('#valu31').val() !== content) {
             addNumbers2();
              efficiency2();
                  addNum2();
           
        }
       
});

 $('#valu31').blur(function() { 
        if ($('#valu31').val() !== content) {
           addNumbers2();
              efficiency2();
                  addNum2();
        
        }
     });
     
      var content = $('#valu32').val();
    $('#valu32').keyup(function() { 
        if ($('#valu32').val() !== content) {
             addNumbers3();
              efficiency3();
                  addNum3();
                   }
       });
 $('#valu32').blur(function() { 
        if ($('#valu32').val() !== content) {
           addNumbers3();
              efficiency3();
                  addNum3();
        
        }
     });
     
   var content = $('#valu33').val();
    $('#valu33').keyup(function() { 
        if ($('#valu33').val() !== content) {
             addNumbers4();
              efficiency4();
                  addNum4();
                   }
       });
 $('#valu33').blur(function() { 
        if ($('#valu33').val() !== content) {
           addNumbers4();
              efficiency4();
                  addNum4();
        
        }
     });  
     
     var content = $('#valu34').val();
    $('#valu34').keyup(function() { 
        if ($('#valu34').val() !== content) {
             addNumbers5();
              efficiency5();
                  addNum5();
                   }
       });
 $('#valu34').blur(function() { 
        if ($('#valu34').val() !== content) {
           addNumbers5();
              efficiency5();
                  addNum5();
        
        }
     });  
     
      var content = $('#valu35').val();
    $('#valu35').keyup(function() { 
        if ($('#valu35').val() !== content) {
             addNumbers6();
              efficiency6();
                  addNum6();
                   }
       });
 $('#valu35').blur(function() { 
        if ($('#valu35').val() !== content) {
           addNumbers6();
              efficiency6();
                  addNum6();
        
        }
     }); 
     
     // Count Validation
     
      var content = $('#vals1').val();
    $('#vals1').keydown(function() { 
        if ($('#vals1').val() !== content) {
            $("#valu1").val("");
            $("#expprod").val("");
             $("#data1").val("");
             $("#expproduce").val("");
             
                   }
       });
       
       
      var content = $('#vals11').val();
    $('#vals11').keydown(function() { 
        if ($('#vals11').val() !== content) {
            $("#valu11").val("");
            $("#expprod2").val("");
             $("#data2").val("");
             $("#expproduce2").val("");
             
                   }
       });
       
      var content = $('#vals12').val();
    $('#vals12').keydown(function() { 
        if ($('#vals12').val() !== content) {
            $("#valu12").val("");
            $("#expprod3").val("");
             $("#data3").val("");
             $("#expproduce3").val("");
             
                   }
       });
      var content = $('#vals13').val();
    $('#vals13').keydown(function() { 
        if ($('#vals13').val() !== content) {
            $("#valu13").val("");
            $("#expprod4").val("");
             $("#data4").val("");
             $("#expproduce4").val("");
             
                   }
       });
       
        var content = $('#vals14').val();
    $('#vals14').keydown(function() { 
        if ($('#vals14').val() !== content) {
            $("#valu14").val("");
            $("#expprod5").val("");
             $("#data5").val("");
             $("#expproduce5").val("");
             
                   }
       });
        var content = $('#vals15').val();
    $('#vals15').keyup(function() { 
        if ($('#vals15').val() !== content) {
            $("#valu15").val("");
            $("#expprod6").val("");
             $("#data6").val("");
             $("#expproduce6").val("");
             
                   }
       });
       
       
       // Count Maintain validation
       
        var content = $('#valu1').val();
    $('#valu1').keydown(function() { 
        if ($('#valu1').val() !== content) {
             $("#expprod").val("");
             $("#data1").val("");
               }
       });
       
       var content = $('#valu11').val();
    $('#valu11').keydown(function() { 
        if ($('#valu11').val() !== content) {
            $("#expprod2").val("");
             $("#data2").val("");
               }
       });
       
        var content = $('#valu12').val();
    $('#valu12').keydown(function() { 
        if ($('#valu12').val() !== content) {
            $("#expprod3").val("");
             $("#data3").val("");
               }
       });
       
         var content = $('#valu13').val();
    $('#valu13').keydown(function() { 
        if ($('#valu13').val() !== content) {
            $("#expprod4").val("");
             $("#data4").val("");
               }
       });
       
        var content = $('#valu14').val();
    $('#valu14').keydown(function() { 
        if ($('#valu14').val() !== content) {
            $("#expprod5").val("");
             $("#data5").val("");
               }
       });
         
         var content = $('#valu15').val();
    $('#valu15').keydown(function() { 
        if ($('#valu15').val() !== content) {
            $("#expprod6").val("");
             $("#data6").val("");
               }
       });
     
   });  
     
     // M/C Speed Validation
     
     var content = $('#valu2').val();
    $('#valu2').keydown(function() { 
        if ($('#valu2').val() !== content) {
            $("#expprod").val("");
             $("#data1").val("");
              $("#expproduce").val("");
               }
       });
       
     var content = $('#valu21').val();
    $('#valu21').keydown(function() { 
        if ($('#valu21').val() !== content) {
            $("#expprod2").val("");
             $("#data2").val("");
              $("#expproduce2").val("");
               }
       });
        var content = $('#valu22').val();
    $('#valu22').keydown(function() { 
        if ($('#valu22').val() !== content) {
            $("#expprod3").val("");
             $("#data3").val("");
              $("#expproduce3").val("");
               }
       });
        var content = $('#valu23').val();
    $('#valu23').keydown(function() { 
        if ($('#valu23').val() !== content) {
            $("#expprod4").val("");
             $("#data4").val("");
              $("#expproduce4").val("");
               }
       });
        var content = $('#valu24').val();
    $('#valu24').keydown(function() { 
        if ($('#valu24').val() !== content) {
            $("#expprod5").val("");
             $("#data5").val("");
              $("#expproduce5").val("");
               }
       });
      var content = $('#valu25').val();
    $('#valu25').keydown(function() { 
        if ($('#valu25').val() !== content) {
            $("#expprod6").val("");
             $("#data6").val("");
              $("#expproduce6").val("");
               }
       });

//Actual Production

var content = $('#digit1').val();
$("#digit1").keyup(function(){
       if ($('#digit1').val() !== content) {
                $("#data1").val("");
            }
            });
        var content = $('#digit2').val();
$("#digit2").keyup(function(){
       if ($('#digit2').val() !== content) {
                $("#data2").val("");
            }
            });
             var content = $('#digit3').val();
$("#digit3").keyup(function(){
       if ($('#digit3').val() !== content) {
                $("#data3").val("");
            }
            });
         $("#digit4").keyup(function(){
       if ($('#digit4').val() !== content) {
                $("#data4").val("");
            }
            }); 
               $("#digit5").keyup(function(){
       if ($('#digit5').val() !== content) {
                $("#data5").val("");
            }
            }); 
         $("#digit6").keyup(function(){
       if ($('#digit6').val() !== content) {
                $("#data6").val("");
            }
            }); 


                    </script>

                    </body>
                    </html>
