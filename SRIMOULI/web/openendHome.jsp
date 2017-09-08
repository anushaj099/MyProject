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
                   
                if((evt.charCode>= 48 && evt.charCode <= 57) || evt.charCode=== 46 ||evt.charCode === 0){
                if(el.value.indexOf('.') > -1){
                if(evt.charCode=== 46)
                evt.preventDefault();
                }
                }else
                evt.preventDefault();
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
          <s:if test="%{shift_date!=null}">
            <s:if test="%{dlist.size==2}">
                <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have one more shift to insert </marquee>
          </s:if>
          <s:elseif test="%{dlist.size==1}">
                <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have two more shifts to insert </marquee>
                </s:elseif>
                <s:else>
            <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have inserted all the shifts </marquee>
           </s:else>
        </s:if>
           <s:else>
           <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>
         </s:else>
        <s:iterator value="ulist" var="myobj">
            <%@include  file="Upperpage2.jsp" %>
        </s:iterator>
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Open End (OE) Data</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">

  <center>
        <div class="row">

 <div class="clear">&#x00A0;</div>
     <s:form action="addOE"  enctype="multipart/form-data" method="post">          
   <table id="part1">
           
             <td><s:hidden name="id" value="%{id}" /></td>
             <td><sj:datepicker maxDate="now" readonly="true" id="i" name="oe.date" changeMonth="true" changeYear="true"  label="Date "  size="90"  displayFormat="dd-mm-yy" cssClass="lab" placeholder="dd-mm-yyyy"/> </td>
     
            <td><s:select name="oe.superviser" id="i" cssClass="form-control " label="Supervisor"  list="superList" headerKey="-1" headerValue="-- Select Supervisor --"/></td>
           
            <td><s:select id="i" name="oe.shifts" list="{'Shift 1','Shift 2','Shift 3'}" onchange="findval(this.value)" label="Select Shift" headerKey="-1" headerValue=" --Select Shift-- " cssClass="form-control shift"/></td>
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
 <s:form action="addOEReal" enctype="multipart/form-data" method="post" onsubmit="return addAll()">


      <div class="col-sm-12 text-center"><h3>Openend Material Data</h3></div>
<div class="tab1">
<table class="table table-bordered table-responsive" id="one1">
<tr>
   
<th>Open End</th>
<th>Employee Id</th>
<th>COUNT</th>
<th>Count Maintain</th>
<th>Speed of M/C</th>
<th>TM</th>
<th>M/C Running in Minutes</th>
<th>Expected Production (in Kgs)</th>
<th>Actual Production (in Kgs)</th>
<th>Efficiency</th>
<th>Breakages in shifts</th>
<th>100% Exp</th>
<th>Remarks</th>
</tr>
<tr>
 
 <td><s:textfield name="oe.openEnd" cssClass="form-control" value="OE-1" theme="simple" readonly="true"></s:textfield></td> 
 <td><s:textfield name="oe.empId" onkeypress="return isNumberKey(this,event)" id="emp" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>   
<td><s:textfield id="vals1" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple"  placeholder="Enter OE-1 COUNT" cssClass="form-control one" ></s:textfield></td>
<td><s:textfield id="valu1" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple"  placeholder="Enter OE-1 Count Maintain" cssClass="form-control valu1 two" ></s:textfield></td>
<td><s:textfield id="valu2" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple"  placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp1 three" ></s:textfield></td>
<td><s:textfield id="valu3" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple"  placeholder="Enter OE-1 TM" cssClass="form-control tm1 four" ></s:textfield></td>
<td><s:textfield id="valu4" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple"  placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr1 five" ></s:textfield></td>
<td><s:textfield id="expprod" onkeypress="return isNumberKey(this,event)" readonly="true" onfocus="javascript:addNumbers()" name="oe.expectedProduction" theme="simple" placeholder="Enter OE-1 Expected Production (in Kgs)" cssClass="form-control price esp" ></s:textfield></td>
<td><s:textfield id="digit1" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple"  placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit1 six" ></s:textfield></td>
<td><s:textfield id="eff"  onkeypress="return isNumberKey(this,event)" readonly="true" name="oe.efficiency" theme="simple"  placeholder="Enter OE-1 Efficiency" onfocus="javascript:efficiency1()" cssClass="form-control price3" ></s:textfield></td>
<td><s:textfield id="valu5" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple"  placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4 seven" ></s:textfield></td>
<td><s:textfield id="expproduce" onkeypress="return isNumberKey(this,event)"  onclick="javascript:addNum()"  name="oe.hundredPercentEfcy" theme="simple"  placeholder="Enter OE-1 100% Exp" cssClass="form-control price5 eight" ></s:textfield></td>
<td><s:textfield id="valu6" name="oe.remarks" theme="simple" label="Employee ID" placeholder="Enter OE-1 Remarks" cssClass="form-control nine" ></s:textfield></td>

</tr>
<tr>

<td><s:textfield name="oe.openEnd" cssClass="form-control" value="OE-2" theme="simple" readonly="true"></s:textfield></td> 
<td><s:textfield name="oe.empId" onkeypress="return isNumberKey(this,event)" cssClass="form-control" id="emp2"  theme="simple" placeholder="Employee id" ></s:textfield></td>       
<td><s:textfield id="vals11" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple"  placeholder="Enter OE-1 COUNT" cssClass="form-control one2" ></s:textfield></td>
<td><s:textfield id="valu11" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" placeholder="Enter OE-1 Count Maintain" cssClass="form-control valu11 two2" ></s:textfield></td>
<td><s:textfield id="valu21" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp2 three2" ></s:textfield></td>
<td><s:textfield id="valu31" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" placeholder="Enter OE-1 TM" cssClass="form-control tm2 four2" ></s:textfield></td>
<td><s:textfield id="valu41" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr2 five2" ></s:textfield></td>
<td><s:textfield id="expprod2" readonly="true" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers2()" name="oe.expectedProduction" theme="simple"  placeholder="Enter OE-1 Expected Production (in Kgs)" cssClass="form-control price esp2" ></s:textfield></td>
<td><s:textfield id="digit2" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple"  placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit2 six2" ></s:textfield></td>
<td><s:textfield id="eff2" readonly="true" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple"  placeholder="Enter OE-1 Efficiency" onfocus="javascript:efficiency2()" cssClass="form-control price3" ></s:textfield></td>
<td><s:textfield id="valu52" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple"  placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4 seven2" ></s:textfield></td>
<td><s:textfield id="expproduce2" onkeypress="return isNumberKey(this,event)"  onclick="javascript:addNum2()" name="oe.hundredPercentEfcy" theme="simple"  placeholder="Enter OE-1 100% Exp" cssClass="form-control price5 eight2" ></s:textfield></td>
<td><s:textfield id="valu62" name="oe.remarks" theme="simple" placeholder="Enter OE-1 Remarks" cssClass="form-control nine2" ></s:textfield></td>
</tr>
<tr>

<td><s:textfield name="oe.openEnd" cssClass="form-control" value="OE-3" theme="simple" readonly="true"></s:textfield></td> 
<td><s:textfield name="oe.empId" onkeypress="return isNumberKey(this,event)" cssClass="form-control" id="emp3" theme="simple" placeholder="Employee id" ></s:textfield></td>   
<td><s:textfield id="vals12" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple"  placeholder="Enter OE-1 COUNT" cssClass="form-control one3" ></s:textfield></td>
<td><s:textfield id="valu12" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple"  placeholder="Enter OE-1 Count Maintain" cssClass="form-control valu12 two3" ></s:textfield></td>
<td><s:textfield id="valu22" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp3 three3" ></s:textfield></td>
<td><s:textfield id="valu32" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple" placeholder="Enter OE-1 TM" cssClass="form-control tm3 four3" ></s:textfield></td>
<td><s:textfield id="valu42" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr3 five3" ></s:textfield></td>
<td><s:textfield id="expprod3" readonly="true" onkeypress="return isNumberKey(this,event)"  onfocus="javascript:addNumbers3()" name="oe.expectedProduction" theme="simple" placeholder="Enter OE-1 Expected Production (in Kgs)" cssClass="form-control price esp3" ></s:textfield></td>
<td><s:textfield id="digit3" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit3 six3" ></s:textfield></td>
<td><s:textfield id="eff3" readonly="true" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" placeholder="Enter OE-1 Efficiency" onfocus="javascript:efficiency3()" cssClass="form-control price3" ></s:textfield></td>
<td><s:textfield id="valu53" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4 seven3" ></s:textfield></td>
<td><s:textfield id="expproduce3" onkeypress="return isNumberKey(this,event)"  onfocus="javascript:addNum3()" name="oe.hundredPercentEfcy" theme="simple" placeholder="Enter OE-1 100% Exp" cssClass="form-control price5 eight3" ></s:textfield></td>
<td><s:textfield id="valu63" name="oe.remarks" theme="simple" placeholder="Enter OE-1 Remarks" cssClass="form-control nine3" ></s:textfield></td>
</tr>
<tr>

<td><s:textfield name="oe.openEnd" cssClass="form-control" value="OE-4" theme="simple" readonly="true"></s:textfield></td> 
<td><s:textfield name="oe.empId" onkeypress="return isNumberKey(this,event)" cssClass="form-control" id="emp4"  theme="simple" placeholder="Employee id" ></s:textfield></td>   
<td><s:textfield id="vals13" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple" placeholder="Enter OE-1 COUNT" cssClass="form-control one4" ></s:textfield></td>
<td><s:textfield id="valu13" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple" placeholder="Enter OE-1 Count Maintain" cssClass="form-control  valu13 two4" ></s:textfield></td>
<td><s:textfield id="valu23" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp4 three4" ></s:textfield></td>
<td><s:textfield id="valu33" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple"  placeholder="Enter OE-1 TM" cssClass="form-control tm4 four4" ></s:textfield></td>
<td><s:textfield id="valu43" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple" placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr4 five4" ></s:textfield></td>
<td><s:textfield id="expprod4" readonly="true" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers4()" name="oe.expectedProduction" theme="simple"  placeholder="Enter OE-1 Expected Production (in Kgs)" cssClass="form-control price esp4" ></s:textfield></td>
<td><s:textfield id="digit4" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple"  placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit4 six4" ></s:textfield></td>
<td><s:textfield id="eff4" readonly="true" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple"  placeholder="Enter OE-1 Efficiency" onfocus="javascript:efficiency4()" cssClass="form-control price3" ></s:textfield></td>
<td><s:textfield id="valu54" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple"  placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4 seven4" ></s:textfield></td>
<td><s:textfield id="expproduce4" onkeypress="return isNumberKey(this,event)"  onclick="javascript:addNum4()" name="oe.hundredPercentEfcy" theme="simple"  placeholder="Enter OE-1 100% Exp" cssClass="form-control price5 eight4" ></s:textfield></td>
<td><s:textfield id="valu64" name="oe.remarks" theme="simple"  placeholder="Enter OE-1 Remarks" cssClass="form-control nine4" ></s:textfield></td>
</tr>
<tr>

<td><s:textfield name="oe.openEnd" cssClass="form-control" value="OE-5" theme="simple" readonly="true"></s:textfield></td> 
<td><s:textfield name="oe.empId" onkeypress="return isNumberKey(this,event)" cssClass="form-control" id="emp5" theme="simple" placeholder="Employee id" ></s:textfield></td>   
<td><s:textfield id="vals14" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple"  placeholder="Enter OE-1 COUNT" cssClass="form-control one5" ></s:textfield></td>
<td><s:textfield id="valu14" onkeypress="return isNumberKey(this,event)" name="oe.countMaintain" theme="simple"  placeholder="Enter OE-1 Count Maintain" cssClass="form-control valu14 two5" ></s:textfield></td>
<td><s:textfield id="valu24" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple" placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp5 three5" ></s:textfield></td>
<td><s:textfield id="valu34" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple"  placeholder="Enter OE-1 TM" cssClass="form-control tm5 four5" ></s:textfield></td>
<td><s:textfield id="valu44"  onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple"  placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr5 five5" ></s:textfield></td>
<td><s:textfield id="expprod5" readonly="true" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers5()" name="oe.expectedProduction" theme="simple"  placeholder="Enter OE-1 Expected Production (in Kgs)" cssClass="form-control price esp5" ></s:textfield></td>
<td><s:textfield id="digit5" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple"  placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit5 six5" ></s:textfield></td>
<td><s:textfield id="eff5" readonly="true" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple"  placeholder="Enter OE-1 Efficiency" onfocus="javascript:efficiency5()" cssClass="form-control price3" ></s:textfield></td>
<td><s:textfield id="valu55" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple"  placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4 seven5" ></s:textfield></td>
<td><s:textfield id="expproduce5" onkeypress="return isNumberKey(this,event)"  onclick="javascript:addNum5()" name="oe.hundredPercentEfcy" theme="simple"  placeholder="Enter OE-1 100% Exp" cssClass="form-control price5 eight5" ></s:textfield></td>
<td><s:textfield id="valu65" name="oe.remarks" theme="simple"  placeholder="Enter OE-1 Remarks" cssClass="form-control nine5" ></s:textfield></td>
</tr>
<tr>
<td><s:textfield name="oe.openEnd" cssClass="form-control" value="OE-6" theme="simple" readonly="true"></s:textfield></td> 
<td><s:textfield name="oe.empId" onkeypress="return isNumberKey(this,event)" cssClass="form-control" id="emp6"  theme="simple" placeholder="Employee id" ></s:textfield></td>   
<td><s:textfield id="vals15" onkeypress="return isNumberKey(this,event)" name="oe.count" theme="simple"  placeholder="Enter OE-1 COUNT" cssClass="form-control one6" ></s:textfield></td>
<td><s:textfield id="valu15" onkeypress="return isNumberKey(this,event)"  name="oe.countMaintain" theme="simple"  placeholder="Enter OE-1 Count Maintain" cssClass="form-control valu15 two6" ></s:textfield></td>
<td><s:textfield id="valu25" onkeypress="return isNumberKey(this,event)" name="oe.mcSpeed" theme="simple"  placeholder="Enter OE-1 Speed of M/C" cssClass="form-control acp6 three6" ></s:textfield></td>
<td><s:textfield id="valu35" onkeypress="return isNumberKey(this,event)" name="oe.tm" theme="simple"  placeholder="Enter OE-1 TM" cssClass="form-control tm6 four6" ></s:textfield></td>
<td><s:textfield id="valu45" onkeypress="return isNumberKey(this,event)" name="oe.mcRunning" theme="simple"  placeholder="Enter OE-1 M/C Running" cssClass="form-control mcr6 five6" ></s:textfield></td>
<td><s:textfield id="expprod6" readonly="true" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers6()" name="oe.expectedProduction" theme="simple" placeholder="Enter OE-1 Expected Production (in Kgs)" cssClass="form-control price esp6" ></s:textfield></td>
<td><s:textfield id="digit6" onkeypress="return isNumberKey(this,event)" name="oe.actualProduction" theme="simple" placeholder="Enter OE-1 Actual Production (in Kgs)" cssClass="form-control price2 digit6 six6" ></s:textfield></td>
<td><s:textfield id="eff6" readonly="true" onkeypress="return isNumberKey(this,event)" name="oe.efficiency" theme="simple" placeholder="Enter OE-1 Efficiency" onfocus="javascript:efficiency6()" cssClass="form-control price3" ></s:textfield></td>
<td><s:textfield id="valu56" onkeypress="return isDecimalKey(event)" name="oe.breakeges" theme="simple" placeholder="Enter OE-1 Breacked in Shifts" cssClass="form-control price4 seven6" ></s:textfield></td>
<td><s:textfield id="expproduce6" onkeypress="return isNumberKey(this,event)"  onclick="javascript:addNum6()" theme="simple" name="oe.hundredPercentEfcy" placeholder="Enter OE-1 100% Exp" cssClass="form-control price5 eight6" ></s:textfield></td>
<td><s:textfield id="valu66" name="oe.remarks" theme="simple" placeholder="Enter OE-1 Remarks" cssClass="form-control nine6" ></s:textfield></td>
</tr>
<tr>
<td colspan="7" class="text-center"><b>Total Production</b></td>
<td><b><s:textfield id="totalPrice1" readonly="true" name="oe.totalEp" theme="simple" placeholder="Enter Total Expected Production (in Kgs)" cssClass="form-control" ></s:textfield></b></td>
<td><b><s:textfield id="totalPrice2" readonly="true" name="oe.totalAp" theme="simple" placeholder="Enter Total Actual Production (in Kgs)" cssClass="form-control" ></s:textfield></b></td>
<td><b><s:textfield id="eff7" readonly="true" name="oe.totalEfcy" theme="simple" placeholder="Enter Total Efficiency" onclick="javascript:efficiency7()" cssClass="form-control" ></s:textfield></b></td>
<td></td>
<!--<td><b><s:textfield  cssClass="form-control" name="oe.totalBreakeges"  theme="simple" readonly="true"></s:textfield></b></td>-->
<td><b><s:textfield id="totalPrice5" readonly="true" name="oe.totalHpEfcy" theme="simple" placeholder="Enter Total 100% Exp" cssClass="form-control" ></s:textfield></b></td>
<td></td>
</tr>
</table>
</div>

                                <div class="form-group">
                                    <div class="col-sm-6 text-center" id="two">
                                    <s:submit label="Submit" cssClass="btn btn-primary" align="center"></s:submit> 
                                     </div>
                                    <div class="col-sm-6 text-center">
                                      <s:reset value="Cancel" align="center"  cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset> 
                                   
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
    
    <script type="text/javascript">
        function addAll(){
              var digit1 = $('#digit1').val();
                                 var expprod = document.getElementById("expprod").value;
                                 if (parseFloat(digit1) > parseFloat(expprod))

                                 {
                                     alert("greater than  Expected value");
                                     $('#digit1').val("");
                                      $('#digit1').focus();
                                      return false;
                                 }
                                  var digit2 = $('#digit2').val();
                                 var expprod2 = document.getElementById("expprod2").value;
                                 if (parseFloat(digit2) > parseFloat(expprod2))

                                 {
                                     alert("greater than  Expected value");
                                     $('#digit2').val("");
                                      $('#digit2').focus();
                                      return false;
                                 }
                                 
                                  var digit3 = $('#digit3').val();
                                 var expprod3 = document.getElementById("expprod3").value;
                                 if (parseFloat(digit3) > parseFloat(expprod3))

                                 {
                                     alert("greater than  Expected value");
                                     
                                     $('#digit3').val("");
                                      $('#digit3').focus();
                                  return false;
                                 }
                                  var digit4 = $('#digit4').val();
                                 var expprod4 = document.getElementById("expprod4").value;
                                 if (parseFloat(digit4) > parseFloat(expprod4))

                                 {
                                     alert("greater than  Expected value");
                                     $('#digit4').val("");
                                      $('#digit4').focus();
                                 return false;
                                 }
                                  var digit5 = $('#digit5').val();
                                 var expprod5 = document.getElementById("expprod5").value;
                                 if (parseFloat(digit5) > parseFloat(expprod5))

                                 {
                                     alert("greater than  Expected value");
                                     $('#digit5').val("");
                                      $('#digit5').focus();
                                  return false;
                                 }
                                 var digit6 = $('#digit6').val();
                                 var expprod6 = document.getElementById("expprod6").value;
                                 if (parseFloat(digit6) > parseFloat(expprod6))

                                 {
                                     alert("greater than  Expected value");
                                     $('#digit6').val("");
                                      $('#digit6').focus();
                                      return false;
                                 } 
                                 
                                  var x=$("#totalPrice1").val();
        var y=$("#totalPrice2").val();
      
   if((x==='0'||y==='0')||(($("#totalPrice1").val()).length===0 ||($("#totalPrice2").val()).length===0||($("#eff7").val()).length===0)){
        alert("Please fill Openend Material Data");
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
                addNum();
                addNum2();
                 addNum3();
                  addNum4();
                   addNum5();
                    addNum6();
        }
         var content = $('#vals1').val();
         $('#vals1').keyup(function() { 
        if ($('#vals1').val() !== content) {
             addNumbers();
              efficiency1();
                  addNum();
        }
});
 var content = $('#valu1').val();
         $('#valu1').keyup(function() { 
        if ($('#valu1').val() !== content) {
             addNumbers();
              efficiency1();
                  addNum();
        }
});
 var content = $('#valu2').val();
         $('#valu2').keyup(function() { 
        if ($('#valu2').val() !== content) {
             addNumbers();
              efficiency1();
                  addNum();
        }
});

 var content = $('#valu3').val();
         $('#valu3').keyup(function() { 
        if ($('#valu3').val() !== content) {
             addNumbers();
              efficiency1();
                  addNum();
        }
});
 var content = $('#vals11').val();
    $('#vals11').keyup(function() { 
        if ($('#vals11').val() !== content) {
             addNumbers2();
              efficiency2();
                  addNum2();
        }
});
 var content = $('#valu11').val();
    $('#valu11').keyup(function() { 
        if ($('#valu11').val() !== content) {
             addNumbers2();
              efficiency2();
                  addNum2();
        }
});
 var content = $('#valu21').val();
    $('#valu21').keyup(function() { 
        if ($('#valu21').val() !== content) {
             addNumbers2();
              efficiency2();
                  addNum2();
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
 var content = $('#vals12').val();
    $('#vals12').keyup(function() { 
        if ($('#vals12').val() !== content) {
             addNumbers3();
              efficiency3();
                  addNum3();
                   }
       });
        var content = $('#valu12').val();
    $('#valu12').keyup(function() { 
        if ($('#valu12').val() !== content) {
             addNumbers3();
              efficiency3();
                  addNum3();
                   }
       });
        var content = $('#valu22').val();
    $('#valu22').keyup(function() { 
        if ($('#valu22').val() !== content) {
             addNumbers3();
              efficiency3();
                  addNum3();
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
        var content = $('#vals13').val();
    $('#vals13').keyup(function() { 
        if ($('#vals13').val() !== content) {
             addNumbers4();
              efficiency4();
                  addNum4();
                   }
       });
        var content = $('#valu13').val();
    $('#valu13').keyup(function() { 
        if ($('#valu13').val() !== content) {
             addNumbers4();
              efficiency4();
                  addNum4();
                   }
       });
        var content = $('#valu23').val();
    $('#valu23').keyup(function() { 
        if ($('#valu23').val() !== content) {
             addNumbers4();
              efficiency4();
                  addNum4();
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
       var content = $('#vals14').val();
    $('#vals14').keyup(function() { 
        if ($('#vals14').val() !== content) {
             addNumbers5();
              efficiency5();
                  addNum5();
                   }
       });
       var content = $('#valu14').val();
    $('#valu14').keyup(function() { 
        if ($('#valu14').val() !== content) {
             addNumbers5();
              efficiency5();
                  addNum5();
                   }
       });
       var content = $('#valu24').val();
    $('#valu24').keyup(function() { 
        if ($('#valu24').val() !== content) {
             addNumbers5();
              efficiency5();
                  addNum5();
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
       var content = $('#vals15').val();
       $('#vals15').keyup(function() { 
        if ($('#vals15').val() !== content) {
             addNumbers6();
              efficiency6();
                  addNum6();
                   }
       });
        var content = $('#valu15').val();
         $('#valu15').keyup(function() { 
        if ($('#valu15').val() !== content) {
             addNumbers6();
              efficiency6();
                  addNum6();
                   }
       });
        var content = $('#valu25').val();
         $('#valu25').keyup(function() { 
        if ($('#valu25').val() !== content) {
             addNumbers6();
              efficiency6();
                  addNum6();
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
               
                var sum = 0;

                // we use jQuery each() to loop through all the textbox with 'price' class
                // and compute the sum for each loop
                $('.price5').each(function () {
                    sum += Number($(this).val());
                });

                // set the computed value to 'totalPrice' textbox
                $('#totalPrice5').val(sum);

            }
        
        
        
        
    $(document).ready(function () {
        yourFunction();
        $('.one').attr("readonly", true);
         $('.two').attr("readonly", true);
         $('.three').attr("readonly", true);
         $('.four').attr("readonly", true);
         $('.five').attr("readonly", true);
         $('.six').attr("readonly", true);
         $('.seven').attr("readonly", true);
         $('.eight').attr("readonly", true);
         $('.nine').attr("readonly", true);
         $('.esp').attr("readonly", true);
   
        $("#emp").keyup(function() { 
            var regx = /^[0-9]+$/;
    if (!regx.test($('#emp').val()))  
    {
       alert("Only Numberics are allowed !");
        $('#emp').val("");
    }
              if(($("#emp").val()).length===0){
                  $('.one').attr("readonly", true);
         $('.two').attr("readonly", true);
         $('.three').attr("readonly", true);
         $('.four').attr("readonly", true);
         $('.five').attr("readonly", true);
         $('.six').attr("readonly", true);
         $('.seven').attr("readonly", true);
         $('.eight').attr("readonly", true);
         $('.nine').attr("readonly", true);
          $('.esp').attr("readonly", true);
          
               $('.esp').val("");
                $('.two').val("");
                $('.three').val("");
                 $('.four').val("");
                $('.five').val("");
                $('.six').val("");
                $('.seven').val("");
                $('.eight').val("");
                $('.nine').val("");
            }
        });
         
 $('#emp').blur(function(){
        if(($('#emp').val()).length!==0){
            var a=parseInt($('#emp').val());
            var a1=new Array();
     a1=<s:property value="elist"/>;
     var b=a1[0];
     var a2=a1.length;
    
     if(a2===0){
          alert("Please Add Employee Id");
             $("#valu5").attr("readonly", true);
		     $("#valu6").attr("readonly", true);
			 $("#vals1").attr("readonly", true);
                 
                    $("#valu1").val("");
                  $("#vals1").val("");
                  $("#valu5").val("");
                $("#valu5").attr("readonly", true);
                $("#valu6").val("");
                $("#valu6").attr("readonly", true);
                
                $("#vals1").attr("readonly", true);
                 $("#valu1").val("");
                $("#valu1").attr("readonly", true);
                 $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);   
                    
                  $(this).val("");
             $(this).focus();
    }
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
             $("#valu5").attr("readonly", false);
       $("#valu5").focus();
       $("#valu6").attr("readonly", false);
       $("#valu6").focus();
        $("#vals1").attr("readonly", false);
       $("#vals1").focus();
       
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $("#valu5").attr("readonly", true);
		     $("#valu6").attr("readonly", true);
			 $("#vals1").attr("readonly", true);
                 
                    $("#valu1").val("");
                  $("#vals1").val("");
                  $("#valu5").val("");
                $("#valu5").attr("readonly", true);
                $("#valu6").val("");
                $("#valu6").attr("readonly", true);
                
                $("#vals1").attr("readonly", true);
                 $("#valu1").val("");
                $("#valu1").attr("readonly", true);
                 $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);   
                    
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
            var a=parseFloat($('#vals1').val());
           
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
    
     if(a2===0){
         alert("Please Create OE Count");
          $("#vals1").val("");
             $("#vals1").focus();
              $("#valu1").val("");
                $("#valu1").attr("readonly", true);
                 $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);   
         
     }
      else{
     for(var i=0;i<a2;i++){
         var a3=parseFloat(a1[i]);
         var b;
        // alert("---------"+a3);
         if(a.valueOf()===a3.valueOf()){
              b="hello";
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Count");
             $("#vals1").val("");
             $("#vals1").focus();
              $("#valu1").val("");
                $("#valu1").attr("readonly", true);
                 $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);          
                }
            }}}}}
        
                         
                         
        $("#emp").focus(function () {
            
            $("#emp").keyup(function() { 
              if(($("#emp").val()).length===0){
                $("#vals1").val("");
                $("#vals1").attr("readonly", true);
                 $("#valu1").val("");
                $("#valu1").attr("readonly", true);
                 $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
                $("#valu5").val("");
                $("#valu5").attr("readonly", true);
                $("#valu6").val("");
                $("#valu6").attr("readonly", true);
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);
                
            }
        });
            
        });
   
       
        
 if(($("#vals1").val()).length!==0){
       $("#valu1").attr("readonly", false);
       $("#valu1").focus();
        }
});


$("#valu1").blur(function(){
        $("#vals1").focus(function () {
            
            $("#vals1").keyup(function() { 
              if(($("#vals1").val()).length===0){
                $("#valu1").val("");
                $("#valu1").attr("readonly", true);
                 $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
                              
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                 $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu1").val()).length!==0){
       $("#valu2").attr("readonly", false);
       $("#valu2").focus();
        }
});

$("#valu2").blur(function(){
        $("#valu1").focus(function () {
            
            $("#valu1").keyup(function() { 
              if(($("#valu1").val()).length===0){
                $("#valu2").val("");
                $("#valu2").attr("readonly", true);
                $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                 $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu2").val()).length!==0){
       $("#valu3").attr("readonly", false);
       $("#valu3").focus();
        }
});

$("#valu3").blur(function(){
        $("#valu2").focus(function () {
            $("#valu2").keyup(function() { 
              if(($("#valu2").val()).length===0){
                  $("#valu3").val("");
                $("#valu3").attr("readonly", true);
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
                
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                 $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);
              }
          });
        });


if(($("#valu3").val()).length!==0){
       $("#valu4").attr("readonly", false);
       $("#valu4").focus();
        }
});

$("#valu4").blur(function(){
        $("#valu3").focus(function () {
            $("#valu3").keyup(function() { 
              if(($("#valu3").val()).length===0){
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                 $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);
              }
          });
        });


if(($("#valu4").val()).length!==0){
       $("#expprod").attr("readonly", true);
       $("#expprod").focus();
        }
});

$("#expprod").blur(function(){
        $("#valu4").focus(function () {
            
            $("#valu4").keyup(function() { 
              if(($("#valu4").val()).length===0){
                  $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#expprod").val()).length!==0){
       $("#digit1").attr("readonly", false);
       $("#digit1").focus();
        }
});
$("#digit1").blur(function(){
        $("#expprod").focus(function () {
            
            $("#expprod").keyup(function() { 
              if(($("#expprod").val()).length===0){
                  $("#valu5").val("");
                $("#valu5").attr("readonly", true);
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#eff").val("");
                $("#eff").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
            }
        });
            
        });
if(($("#digit1").val()).length!==0){
       $("#eff").attr("readonly", true);
       $("#eff").focus();
        }
});
$("#eff").blur(function(){
        $("#digit1").focus(function () {
            
            $("#digit1").keyup(function() { 
              if(($("#digit1").val()).length===0){
                  
                $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#eff").val("");
                $("#eff").attr("readonly", true);
                $("#digit1").val("");
                $("#digit1").attr("readonly", false);
            }
        });
            
        });
        });
        
        
       $('.one2').attr("readonly", true);
         $('.two2').attr("readonly", true);
         $('.three2').attr("readonly", true);
         $('.four2').attr("readonly", true);
         $('.five2').attr("readonly", true);
         $('.six2').attr("readonly", true);
         $('.seven2').attr("readonly", true);
         $('.eight2').attr("readonly", true);
         $('.nine2').attr("readonly", true);
         $('.esp2').attr("readonly", true);
   
        $("#emp2").keyup(function() { 
            var regx = /^[0-9]+$/;
    if (!regx.test($('#emp2').val()))  
    {
       alert("Only Numerics are allowed !");
        $('#emp2').val("");
    }
              if(($("#emp2").val()).length===0){
                  $('.one2').attr("readonly", true);
         $('.two2').attr("readonly", true);
         $('.three2').attr("readonly", true);
         $('.four2').attr("readonly", true);
         $('.five2').attr("readonly", true);
         $('.six2').attr("readonly", true);
         $('.seven2').attr("readonly", true);
         $('.eight2').attr("readonly", true);
         $('.nine2').attr("readonly", true);
          $('.esp2').attr("readonly", true);
          
               $('.esp2').val("");
                $('.two2').val("");
                $('.three2').val("");
                 $('.four2').val("");
                $('.five2').val("");
                $('.six2').val("");
                $('.seven2').val("");
                $('.eight2').val("");
                $('.nine2').val("");
            }
        });
         
 $('#emp2').blur(function(){
        if(($('#emp2').val()).length!==0){
            var a=parseInt($('#emp2').val());
             var a1=new Array();
     a1=<s:property value="elist"/>;
     var b=a1[0];
     var a2=a1.length;
    
     if(a2===0){
          alert("Please Add Employee Id");
         $(this).val("");
             $(this).focus();
              $("#vals11").attr("readonly", true);
		  $("#valu52").attr("readonly", true);
			 $("#valu62").attr("readonly", true);
                         
                           $("#vals11").val("");
                $("#vals11").attr("readonly", true);
                 $("#valu11").val("");
                $("#valu11").attr("readonly", true);
                 $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#valu52").val("");
                $("#valu52").attr("readonly", true);
                $("#valu62").val("");
                $("#valu62").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
       $("#valu52").attr("readonly", false);
       $("#valu52").focus();
       $("#valu62").attr("readonly", false);
       $("#valu62").focus();
       $("#vals11").attr("readonly", false);
       $("#vals11").focus();
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
              $("#vals11").attr("readonly", true);
		  $("#valu52").attr("readonly", true);
			 $("#valu62").attr("readonly", true);
                         
                           $("#vals11").val("");
                $("#vals11").attr("readonly", true);
                 $("#valu11").val("");
                $("#valu11").attr("readonly", true);
                 $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#valu52").val("");
                $("#valu52").attr("readonly", true);
                $("#valu62").val("");
                $("#valu62").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
                       
         }
         }
         }
     }
     
        }
        
    });
 
 $("#vals11").blur(function(){
  if(($('#vals11').val()).length!==0){
            var a=parseFloat($('#vals11').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
          alert("Please Create OE Count");
                 
                           $("#vals11").val("");
             $("#vals11").focus();
                 $("#valu11").val("");
                $("#valu11").attr("readonly", true);
                 $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#valu52").val("");
                $("#valu52").attr("readonly", true);
                $("#valu62").val("");
                $("#valu62").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseFloat(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
      
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Count");
                 
                           $("#vals11").val("");
             $("#vals11").focus();
                 $("#valu11").val("");
                $("#valu11").attr("readonly", true);
                 $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#valu52").val("");
                $("#valu52").attr("readonly", true);
                $("#valu62").val("");
                $("#valu62").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
                 }}}}}    
 
        $("#emp2").focus(function () {
            
            $("#emp2").keyup(function() { 
              if(($("#emp2").val()).length===0){
                $("#vals11").val("");
                $("#vals11").attr("readonly", true);
                 $("#valu11").val("");
                $("#valu11").attr("readonly", true);
                 $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#valu52").val("");
                $("#valu52").attr("readonly", true);
                $("#valu62").val("");
                $("#valu62").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#vals11").val()).length!==0){
       $("#valu11").attr("readonly", false);
       $("#valu11").focus();
        }
});


$("#valu11").blur(function(){
        $("#vals11").focus(function () {
            
            $("#vals11").keyup(function() { 
              if(($("#vals11").val()).length===0){
                $("#valu11").val("");
                $("#valu11").attr("readonly", true);
                 $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                              
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                 $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu11").val()).length!==0){
       $("#valu21").attr("readonly", false);
       $("#valu21").focus();
        }
});

$("#valu21").blur(function(){
        $("#valu11").focus(function () {
            
            $("#valu11").keyup(function() { 
              if(($("#valu11").val()).length===0){
                $("#valu21").val("");
                $("#valu21").attr("readonly", true);
                $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                 $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu21").val()).length!==0){
       $("#valu31").attr("readonly", false);
       $("#valu31").focus();
        }
});

$("#valu31").blur(function(){
        $("#valu21").focus(function () {
            $("#valu21").keyup(function() { 
              if(($("#valu21").val()).length===0){
                  $("#valu31").val("");
                $("#valu31").attr("readonly", true);
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                 $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
              }
          });
        });


if(($("#valu31").val()).length!==0){
       $("#valu41").attr("readonly", false);
       $("#valu41").focus();
        }
});

$("#valu41").blur(function(){
        $("#valu31").focus(function () {
            $("#valu31").keyup(function() { 
              if(($("#valu31").val()).length===0){
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                 $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
              }
          });
        });


if(($("#valu41").val()).length!==0){
       $("#expprod2").attr("readonly", true);
       $("#expprod2").focus();
        }
});

$("#expprod2").blur(function(){
        $("#valu41").focus(function () {
            
            $("#valu41").keyup(function() { 
              if(($("#valu41").val()).length===0){
                  $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#expprod2").val()).length!==0){
       $("#digit2").attr("readonly", false);
       $("#digit2").focus();
        }
});
$("#digit2").blur(function(){
        $("#expprod2").focus(function () {
            
            $("#expprod2").keyup(function() { 
              if(($("#expprod2").val()).length===0){
                  $("#valu52").val("");
                $("#valu52").attr("readonly", true);
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#eff2").val("");
                $("#eff2").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
            }
        });
            
        });
if(($("#digit2").val()).length!==0){
       $("#eff2").attr("readonly", true);
       $("#eff2").focus();
        }
});
$("#eff2").blur(function(){
        $("#digit2").focus(function () {
            
            $("#digit2").keyup(function() { 
              if(($("#digit2").val()).length===0){
                  
                $("#expproduce2").val("");
                $("#expproduce2").attr("readonly", true);
                $("#eff2").val("");
                $("#eff2").attr("readonly", true);
                $("#digit2").val("");
                $("#digit2").attr("readonly", false);
            }
        });
            
        });
        }); 
        
       
         $('.one3').attr("readonly", true);
         $('.two3').attr("readonly", true);
         $('.three3').attr("readonly", true);
         $('.four3').attr("readonly", true);
         $('.five3').attr("readonly", true);
         $('.six3').attr("readonly", true);
         $('.seven3').attr("readonly", true);
         $('.eight3').attr("readonly", true);
         $('.nine3').attr("readonly", true);
         $('.esp3').attr("readonly", true);
   
        $("#emp3").keyup(function() {
              var regx = /^[0-9]+$/;
    if (!regx.test($('#emp3').val()))  
    {
       alert("Only Numerics are allowed !");
        $('#emp3').val("");
    }

              if(($("#emp3").val()).length===0){
                  $('.one3').attr("readonly", true);
         $('.two3').attr("readonly", true);
         $('.three3').attr("readonly", true);
         $('.four3').attr("readonly", true);
         $('.five3').attr("readonly", true);
         $('.six3').attr("readonly", true);
         $('.seven3').attr("readonly", true);
         $('.eight3').attr("readonly", true);
         $('.nine3').attr("readonly", true);
          $('.esp3').attr("readonly", true);
          
               $('.esp3').val("");
                $('.two3').val("");
                $('.three3').val("");
                 $('.four3').val("");
                $('.five3').val("");
                $('.six3').val("");
                $('.seven3').val("");
                $('.eight3').val("");
                $('.nine3').val("");
            }
        });
         
 $('#emp3').blur(function(){
        if(($('#emp3').val()).length!==0){
            var a=parseInt($('#emp3').val());
             var a1=new Array();
     a1=<s:property value="elist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
          alert("Please Add Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals12").attr("readonly", true);
		     $("#valu53").attr("readonly", true);
			 $("#valu63").attr("readonly", true);
                         
                     $("#vals12").val("");
                $("#vals12").attr("readonly", true);
                 $("#valu12").val("");
                $("#valu12").attr("readonly", true);
                 $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#valu53").val("");
                $("#valu53").attr("readonly", true);
                $("#valu63").val("");
                $("#valu63").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);  
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
        $("#valu53").attr("readonly", false);
       $("#valu53").focus();
       $("#valu63").attr("readonly", false);
       $("#valu63").focus();
	   $("#vals12").attr("readonly", false);
       $("#vals12").focus();
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals12").attr("readonly", true);
		     $("#valu53").attr("readonly", true);
			 $("#valu63").attr("readonly", true);
                         
                     $("#vals12").val("");
                $("#vals12").attr("readonly", true);
                 $("#valu12").val("");
                $("#valu12").attr("readonly", true);
                 $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#valu53").val("");
                $("#valu53").attr("readonly", true);
                $("#valu63").val("");
                $("#valu63").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);   
         }
         }
         }
     }
     
        }
        
    });

 
 $("#vals12").blur(function(){
  if(($('#vals12').val()).length!==0){
            var a=parseFloat($('#vals12').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
         alert("Please Create OE Count");
              $("#vals12").val("");
                $("#vals12").focus();
                 $("#valu12").val("");
                $("#valu12").attr("readonly", true);
                 $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#valu53").val("");
                $("#valu53").attr("readonly", true);
                $("#valu63").val("");
                $("#valu63").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true); 
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseFloat(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
      
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Count");
              $("#vals12").val("");
                $("#vals12").focus();
                 $("#valu12").val("");
                $("#valu12").attr("readonly", true);
                 $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#valu53").val("");
                $("#valu53").attr("readonly", true);
                $("#valu63").val("");
                $("#valu63").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);   
         }
     }
 }
     }
 }
        $("#emp3").focus(function () {
            
            $("#emp3").keyup(function() { 
              if(($("#emp3").val()).length===0){
                $("#vals12").val("");
                $("#vals12").attr("readonly", true);
                 $("#valu12").val("");
                $("#valu12").attr("readonly", true);
                 $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#valu53").val("");
                $("#valu53").attr("readonly", true);
                $("#valu63").val("");
                $("#valu63").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#vals12").val()).length!==0){
       $("#valu12").attr("readonly", false);
       $("#valu12").focus();
        }
});


$("#valu12").blur(function(){
        $("#vals12").focus(function () {
            
            $("#vals12").keyup(function() { 
              if(($("#vals12").val()).length===0){
                $("#valu12").val("");
                $("#valu12").attr("readonly", true);
                 $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                              
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                 $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu12").val()).length!==0){
       $("#valu22").attr("readonly", false);
       $("#valu22").focus();
        }
});

$("#valu22").blur(function(){
        $("#valu12").focus(function () {
            
            $("#valu12").keyup(function() { 
              if(($("#valu12").val()).length===0){
                $("#valu22").val("");
                $("#valu22").attr("readonly", true);
                $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                 $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu22").val()).length!==0){
       $("#valu32").attr("readonly", false);
       $("#valu32").focus();
        }
});

$("#valu32").blur(function(){
        $("#valu22").focus(function () {
            $("#valu22").keyup(function() { 
              if(($("#valu22").val()).length===0){
                  $("#valu32").val("");
                $("#valu32").attr("readonly", true);
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                 $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);
              }
          });
        });


if(($("#valu32").val()).length!==0){
       $("#valu42").attr("readonly", false);
       $("#valu42").focus();
        }
});

$("#valu42").blur(function(){
        $("#valu32").focus(function () {
            $("#valu32").keyup(function() { 
              if(($("#valu32").val()).length===0){
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                 $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);
              }
          });
        });


if(($("#valu42").val()).length!==0){
       $("#expprod3").attr("readonly", true);
       $("#expprod3").focus();
        }
});

$("#expprod3").blur(function(){
        $("#valu42").focus(function () {
            
            $("#valu42").keyup(function() { 
              if(($("#valu42").val()).length===0){
                  $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#expprod3").val()).length!==0){
       $("#digit3").attr("readonly", false);
       $("#digit3").focus();
        }
});
$("#digit3").blur(function(){
        $("#expprod3").focus(function () {
            
            $("#expprod3").keyup(function() { 
              if(($("#expprod3").val()).length===0){
                  $("#valu53").val("");
                $("#valu53").attr("readonly", true);
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#eff3").val("");
                $("#eff3").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
            }
        });
            
        });
if(($("#digit3").val()).length!==0){
       $("#eff3").attr("readonly", true);
       $("#eff3").focus();
        }
});
$("#eff3").blur(function(){
        $("#digit3").focus(function () {
            
            $("#digit3").keyup(function() { 
              if(($("#digit3").val()).length===0){
                  
                $("#expproduce3").val("");
                $("#expproduce3").attr("readonly", true);
                $("#eff3").val("");
                $("#eff3").attr("readonly", true);
                $("#digit3").val("");
                $("#digit3").attr("readonly", false);
            }
        });
            
        });
        });
        
   //ttttttttgfgsdg656s5xd6v5x6fg5v65df6gvb56fdg56dxfg56df5ggfg
      $('.one4').attr("readonly", true);
         $('.two4').attr("readonly", true);
         $('.three4').attr("readonly", true);
         $('.four4').attr("readonly", true);
         $('.five4').attr("readonly", true);
         $('.six4').attr("readonly", true);
         $('.seven4').attr("readonly", true);
         $('.eight4').attr("readonly", true);
         $('.nine4').attr("readonly", true);
         $('.esp4').attr("readonly", true);
   
        $("#emp4").keyup(function() { 
             var regx = /^[A-Za-z0-9]+$/;
    if (!regx.test($('#emp4').val()))  
    {
       alert("Only Numerics are allowed !");
        $('#emp4').val("");
    }
              if(($("#emp4").val()).length===0){
                  $('.one4').attr("readonly", true);
         $('.two4').attr("readonly", true);
         $('.three4').attr("readonly", true);
         $('.four4').attr("readonly", true);
         $('.five4').attr("readonly", true);
         $('.six4').attr("readonly", true);
         $('.seven4').attr("readonly", true);
         $('.eight4').attr("readonly", true);
         $('.nine4').attr("readonly", true);
          $('.esp4').attr("readonly", true);
          
               $('.esp4').val("");
                $('.two4').val("");
                $('.three4').val("");
                 $('.four4').val("");
                $('.five4').val("");
                $('.six4').val("");
                $('.seven4').val("");
                $('.eight4').val("");
                $('.nine4').val("");
            }
        });
         
$('#emp4').blur(function(){
        if(($('#emp4').val()).length!==0){
            var a=parseInt($('#emp4').val());
             var a1=new Array();
     a1=<s:property value="elist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
          alert("Please Add Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals13").attr("readonly", true);
		     $("#valu54").attr("readonly", true);
			 $("#valu64").attr("readonly", true);
			 
			  $("#vals13").val("");
                $("#vals13").attr("readonly", true);
                 $("#valu13").val("");
                $("#valu13").attr("readonly", true);
                 $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#valu54").val("");
                $("#valu54").attr("readonly", true);
                $("#valu64").val("");
                $("#valu64").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
       $("#valu54").attr("readonly", false);
       $("#valu54").focus();
       $("#valu64").attr("readonly", false);
       $("#valu64").focus();
	   $("#vals13").attr("readonly", false);
       $("#vals13").focus();
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals13").attr("readonly", true);
		     $("#valu54").attr("readonly", true);
			 $("#valu64").attr("readonly", true);
			 
			  $("#vals13").val("");
                $("#vals13").attr("readonly", true);
                 $("#valu13").val("");
                $("#valu13").attr("readonly", true);
                 $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#valu54").val("");
                $("#valu54").attr("readonly", true);
                $("#valu64").val("");
                $("#valu64").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
			 
         }
         }
         }
     }
     
        }
        
    });
 
 
 $("#vals13").blur(function(){
 if(($('#vals13').val()).length!==0){
            var a=parseFloat($('#vals13').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
           alert("Please Create OE Count");
              
			  $("#vals13").val("");
                $("#vals13").focus();
                 $("#valu13").val("");
                $("#valu13").attr("readonly", true);
                 $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#valu54").val("");
                $("#valu54").attr("readonly", true);
                $("#valu64").val("");
                $("#valu64").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseFloat(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
      
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Count");
              
			  $("#vals13").val("");
                $("#vals13").focus();
                 $("#valu13").val("");
                $("#valu13").attr("readonly", true);
                 $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#valu54").val("");
                $("#valu54").attr("readonly", true);
                $("#valu64").val("");
                $("#valu64").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
         }
     }
 }
     }
 }
        $("#emp4").focus(function () {
            
            $("#emp4").keyup(function() { 
              if(($("#emp4").val()).length===0){
                $("#vals13").val("");
                $("#vals13").attr("readonly", true);
                 $("#valu13").val("");
                $("#valu13").attr("readonly", true);
                 $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#valu54").val("");
                $("#valu54").attr("readonly", true);
                $("#valu64").val("");
                $("#valu64").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#vals13").val()).length!==0){
       $("#valu13").attr("readonly", false);
       $("#valu13").focus();
        }
});


$("#valu13").blur(function(){
        $("#vals13").focus(function () {
            
            $("#vals13").keyup(function() { 
              if(($("#vals13").val()).length===0){
                $("#valu13").val("");
                $("#valu13").attr("readonly", true);
                 $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                              
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                 $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu13").val()).length!==0){
       $("#valu23").attr("readonly", false);
       $("#valu23").focus();
        }
});

$("#valu23").blur(function(){
        $("#valu13").focus(function () {
            
            $("#valu13").keyup(function() { 
              if(($("#valu13").val()).length===0){
                $("#valu23").val("");
                $("#valu23").attr("readonly", true);
                $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                 $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu23").val()).length!==0){
       $("#valu33").attr("readonly", false);
       $("#valu33").focus();
        }
});

$("#valu33").blur(function(){
        $("#valu23").focus(function () {
            $("#valu23").keyup(function() { 
              if(($("#valu23").val()).length===0){
                  $("#valu33").val("");
                $("#valu33").attr("readonly", true);
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                 $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
              }
          });
        });


if(($("#valu33").val()).length!==0){
       $("#valu43").attr("readonly", false);
       $("#valu43").focus();
        }
});

$("#valu43").blur(function(){
        $("#valu33").focus(function () {
            $("#valu33").keyup(function() { 
              if(($("#valu33").val()).length===0){
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                 $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
              }
          });
        });


if(($("#valu43").val()).length!==0){
       $("#expprod4").attr("readonly", true);
       $("#expprod4").focus();
        }
});

$("#expprod4").blur(function(){
        $("#valu43").focus(function () {
            
            $("#valu43").keyup(function() { 
              if(($("#valu43").val()).length===0){
                  $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#expprod4").val()).length!==0){
       $("#digit4").attr("readonly", false);
       $("#digit4").focus();
        }
});
$("#digit4").blur(function(){
        $("#expprod4").focus(function () {
            
            $("#expprod4").keyup(function() { 
              if(($("#expprod4").val()).length===0){
                  $("#valu54").val("");
                $("#valu54").attr("readonly", true);
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#eff4").val("");
                $("#eff4").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
            }
        });
            
        });
if(($("#digit4").val()).length!==0){
       $("#eff4").attr("readonly", true);
       $("#eff4").focus();
        }
});
$("#eff4").blur(function(){
        $("#digit4").focus(function () {
            
            $("#digit4").keyup(function() { 
              if(($("#digit4").val()).length===0){
                  
                $("#expproduce4").val("");
                $("#expproduce4").attr("readonly", true);
                $("#eff4").val("");
                $("#eff4").attr("readonly", true);
                $("#digit4").val("");
                $("#digit4").attr("readonly", false);
            }
        });
            
        });
        });
        
   //22222222222222232323232323222222323232323222332
   
   $('.one5').attr("readonly", true);
         $('.two5').attr("readonly", true);
         $('.three5').attr("readonly", true);
         $('.four5').attr("readonly", true);
         $('.five5').attr("readonly", true);
         $('.six5').attr("readonly", true);
         $('.seven5').attr("readonly", true);
         $('.eight5').attr("readonly", true);
         $('.nine5').attr("readonly", true);
         $('.esp5').attr("readonly", true);
   
        $("#emp5").keyup(function() { 
             var regx = /^[A-Za-z0-9]+$/;
    if (!regx.test($('#emp5').val()))  
    {
       alert("Only Numerics are allowed !");
        $('#emp5').val("");
    }
              if(($("#emp5").val()).length===0){
                  $('.one5').attr("readonly", true);
         $('.two5').attr("readonly", true);
         $('.three5').attr("readonly", true);
         $('.four5').attr("readonly", true);
         $('.five5').attr("readonly", true);
         $('.six5').attr("readonly", true);
         $('.seven5').attr("readonly", true);
         $('.eight5').attr("readonly", true);
         $('.nine5').attr("readonly", true);
          $('.esp5').attr("readonly", true);
          
               $('.esp5').val("");
                $('.two5').val("");
                $('.three5').val("");
                 $('.four5').val("");
                $('.five5').val("");
                $('.six5').val("");
                $('.seven5').val("");
                $('.eight5').val("");
                $('.nine5').val("");
            }
        });
         
 $('#emp5').blur(function(){
        if(($('#emp5').val()).length!==0){
            var a=parseInt($('#emp5').val());
             var a1=new Array();
     a1=<s:property value="elist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
        alert("Please Add Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals14").attr("readonly", true);
		     $("#valu55").attr("readonly", true);
			 $("#valu65").attr("readonly", true);
			 
			   $("#vals14").val("");
                $("#vals14").attr("readonly", true);
                 $("#valu14").val("");
                $("#valu14").attr("readonly", true);
                 $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#valu55").val("");
                $("#valu55").attr("readonly", true);
                $("#valu65").val("");
                $("#valu65").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true); 
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
       $("#valu55").attr("readonly", false);
       $("#valu55").focus();
       $("#valu65").attr("readonly", false);
       $("#valu65").focus();
	   $("#vals14").attr("readonly", false);
       $("#vals14").focus();
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals14").attr("readonly", true);
		     $("#valu55").attr("readonly", true);
			 $("#valu65").attr("readonly", true);
			 
			   $("#vals14").val("");
                $("#vals14").attr("readonly", true);
                 $("#valu14").val("");
                $("#valu14").attr("readonly", true);
                 $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#valu55").val("");
                $("#valu55").attr("readonly", true);
                $("#valu65").val("");
                $("#valu65").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
			 
         }
         }
         }
     }
       }
   });
 
 
 $("#vals14").blur(function(){
 if(($('#vals14').val()).length!==0){
            var a=parseFloat($('#vals14').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
           alert("Please Create OE Count");
              
			   $("#vals14").val("");
                $("#vals14").focus();
                 $("#valu14").val("");
                $("#valu14").attr("readonly", true);
                 $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#valu55").val("");
                $("#valu55").attr("readonly", true);
                $("#valu65").val("");
                $("#valu65").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
    }
      
     for(var i=0;i<a2;i++){
         var a3=parseFloat(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
      
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Count");
              
			   $("#vals14").val("");
                $("#vals14").focus();
                 $("#valu14").val("");
                $("#valu14").attr("readonly", true);
                 $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#valu55").val("");
                $("#valu55").attr("readonly", true);
                $("#valu65").val("");
                $("#valu65").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
         }
     }
 }
     }
 }
        $("#emp5").focus(function () {
            
            $("#emp5").keyup(function() { 
              if(($("#emp5").val()).length===0){
                $("#vals14").val("");
                $("#vals14").attr("readonly", true);
                 $("#valu14").val("");
                $("#valu14").attr("readonly", true);
                 $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#valu55").val("");
                $("#valu55").attr("readonly", true);
                $("#valu65").val("");
                $("#valu65").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#vals14").val()).length!==0){
       $("#valu14").attr("readonly", false);
       $("#valu14").focus();
        }
});


$("#valu14").blur(function(){
        $("#vals14").focus(function () {
            
            $("#vals14").keyup(function() { 
              if(($("#vals14").val()).length===0){
                $("#valu14").val("");
                $("#valu14").attr("readonly", true);
                 $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                              
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                 $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu14").val()).length!==0){
       $("#valu24").attr("readonly", false);
       $("#valu24").focus();
        }
});

$("#valu24").blur(function(){
        $("#valu14").focus(function () {
            
            $("#valu14").keyup(function() { 
              if(($("#valu14").val()).length===0){
                $("#valu24").val("");
                $("#valu24").attr("readonly", true);
                $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                 $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu24").val()).length!==0){
       $("#valu34").attr("readonly", false);
       $("#valu34").focus();
        }
});

$("#valu34").blur(function(){
        $("#valu24").focus(function () {
            $("#valu24").keyup(function() { 
              if(($("#valu24").val()).length===0){
                  $("#valu34").val("");
                $("#valu34").attr("readonly", true);
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                 $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
              }
          });
        });


if(($("#valu34").val()).length!==0){
       $("#valu44").attr("readonly", false);
       $("#valu44").focus();
        }
});

$("#valu44").blur(function(){
        $("#valu34").focus(function () {
            $("#valu34").keyup(function() { 
              if(($("#valu34").val()).length===0){
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                 $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
              }
          });
        });


if(($("#valu44").val()).length!==0){
       $("#expprod5").attr("readonly", true);
       $("#expprod5").focus();
        }
});

$("#expprod5").blur(function(){
        $("#valu44").focus(function () {
            
            $("#valu44").keyup(function() { 
              if(($("#valu44").val()).length===0){
                  $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#expprod5").val()).length!==0){
       $("#digit5").attr("readonly", false);
       $("#digit5").focus();
        }
});
$("#digit5").blur(function(){
        $("#expprod5").focus(function () {
            
            $("#expprod5").keyup(function() { 
              if(($("#expprod5").val()).length===0){
                  $("#valu55").val("");
                $("#valu55").attr("readonly", true);
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#eff5").val("");
                $("#eff5").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
            }
        });
            
        });
if(($("#digit5").val()).length!==0){
       $("#eff5").attr("readonly", true);
       $("#eff5").focus();
        }
});
$("#eff5").blur(function(){
        $("#digit5").focus(function () {
            
            $("#digit5").keyup(function() { 
              if(($("#digit5").val()).length===0){
                  
                $("#expproduce5").val("");
                $("#expproduce5").attr("readonly", true);
                $("#eff5").val("");
                $("#eff5").attr("readonly", true);
                $("#digit5").val("");
                $("#digit5").attr("readonly", false);
            }
        });
            
        });
        });
        
        //adaaaaaaaaaaaaaaaddsdsfdgdfgdfgsdggggggggggsgsdgasdfg
        
         $('.one6').attr("readonly", true);
         $('.two6').attr("readonly", true);
         $('.three6').attr("readonly", true);
         $('.four6').attr("readonly", true);
         $('.five6').attr("readonly", true);
         $('.six6').attr("readonly", true);
         $('.seven6').attr("readonly", true);
         $('.eight6').attr("readonly", true);
         $('.nine6').attr("readonly", true);
         $('.esp6').attr("readonly", true);
   
        $("#emp6").keyup(function() { 
             var regx = /^[A-Za-z0-9]+$/;
    if (!regx.test($('#emp6').val()))  
    {
       alert("Only Numerics are allowed !");
        $('#emp6').val("");
    }
              if(($("#emp6").val()).length===0){
                  $('.one6').attr("readonly", true);
         $('.two6').attr("readonly", true);
         $('.three6').attr("readonly", true);
         $('.four6').attr("readonly", true);
         $('.five6').attr("readonly", true);
         $('.six6').attr("readonly", true);
         $('.seven6').attr("readonly", true);
         $('.eight6').attr("readonly", true);
         $('.nine6').attr("readonly", true);
          $('.esp6').attr("readonly", true);
          
               $('.esp6').val("");
                $('.two6').val("");
                $('.three6').val("");
                 $('.four6').val("");
                $('.five6').val("");
                $('.six6').val("");
                $('.seven6').val("");
                $('.eight6').val("");
                $('.nine6').val("");
            }
        });
         
 $('#emp6').blur(function(){
        if(($('#emp6').val()).length!==0){
            var a=parseInt($('#emp6').val());
             var a1=new Array();
     a1=<s:property value="elist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
          alert("Please Add Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals15").attr("readonly", true);
		     $("#valu56").attr("readonly", true);
			 $("#valu66").attr("readonly", true);
			 
			    $("#vals15").val("");
                $("#vals15").attr("readonly", true);
                $("#valu15").val("");
                $("#valu15").attr("readonly", true);
                $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#valu56").val("");
                $("#valu56").attr("readonly", true);
                $("#valu66").val("");
                $("#valu66").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                $("#eff6").val("");
                $("#eff6").attr("readonly", true); 
     }
      
     for(var i=0;i<a2;i++){
         var a3=parseInt(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
       $("#valu56").attr("readonly", false);
       $("#valu56").focus();
       $("#valu66").attr("readonly", false);
       $("#valu66").focus();
       $("#vals15").attr("readonly", false);
       $("#vals15").focus();
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Employee Id");
             $(this).val("");
             $(this).focus();
             $("#vals15").attr("readonly", true);
		     $("#valu56").attr("readonly", true);
			 $("#valu66").attr("readonly", true);
			 
			    $("#vals15").val("");
                $("#vals15").attr("readonly", true);
                $("#valu15").val("");
                $("#valu15").attr("readonly", true);
                $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#valu56").val("");
                $("#valu56").attr("readonly", true);
                $("#valu66").val("");
                $("#valu66").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                $("#eff6").val("");
                $("#eff6").attr("readonly", true);
			 
         }
         }
         }
     }
       }
   });
 
 $("#vals15").blur(function(){
  if(($('#vals15').val()).length!==0){
            var a=parseFloat($('#vals15').val());
            var a1=new Array();
     a1=<s:property value="colist"/>;
     var b=a1[0];
     var a2=a1.length;
     if(a2===0){
          alert("Please Create OE Count");
              $("#vals15").val("");
                $("#vals15").focus();
                $("#valu15").val("");
                $("#valu15").attr("readonly", true);
                $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#valu56").val("");
                $("#valu56").attr("readonly", true);
                $("#valu66").val("");
                $("#valu66").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                $("#eff6").val("");
                $("#eff6").attr("readonly", true);
    }
      
     for(var i=0;i<a2;i++){
         var a3=parseFloat(a1[i]);
         var b;
         if(a.valueOf()===a3.valueOf()){
              b="hello";
      
         }
         else{
             if(i===(a2.valueOf()-1)){
                 if(b.valueOf()!=="hello"){
             alert("Please enter valid Count");
              $("#vals15").val("");
                $("#vals15").focus();
                $("#valu15").val("");
                $("#valu15").attr("readonly", true);
                $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#valu56").val("");
                $("#valu56").attr("readonly", true);
                $("#valu66").val("");
                $("#valu66").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                $("#eff6").val("");
                $("#eff6").attr("readonly", true);
         }
     }
 }
     }
 }
        $("#emp6").focus(function () {
            
            $("#emp6").keyup(function() { 
              if(($("#emp6").val()).length===0){
                $("#vals15").val("");
                $("#vals15").attr("readonly", true);
                 $("#valu15").val("");
                $("#valu15").attr("readonly", true);
                 $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#valu56").val("");
                $("#valu56").attr("readonly", true);
                $("#valu66").val("");
                $("#valu66").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#vals15").val()).length!==0){
       $("#valu15").attr("readonly", false);
       $("#valu15").focus();
        }
});


$("#valu15").blur(function(){
        $("#vals15").focus(function () {
            
            $("#vals15").keyup(function() { 
              if(($("#vals15").val()).length===0){
                $("#valu15").val("");
                $("#valu15").attr("readonly", true);
                 $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                              
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                 $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu15").val()).length!==0){
       $("#valu25").attr("readonly", false);
       $("#valu25").focus();
        }
});

$("#valu25").blur(function(){
        $("#valu15").focus(function () {
            
            $("#valu15").keyup(function() { 
              if(($("#valu15").val()).length===0){
                $("#valu25").val("");
                $("#valu25").attr("readonly", true);
                $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                 $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true);
            }
        });
            
        });
          
        
 if(($("#valu25").val()).length!==0){
       $("#valu35").attr("readonly", false);
       $("#valu35").focus();
        }
});

$("#valu35").blur(function(){
        $("#valu25").focus(function () {
            $("#valu25").keyup(function() { 
              if(($("#valu25").val()).length===0){
                  $("#valu35").val("");
                $("#valu35").attr("readonly", true);
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                 $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true);
              }
          });
        });


if(($("#valu35").val()).length!==0){
       $("#valu45").attr("readonly", false);
       $("#valu45").focus();
        }
});

$("#valu45").blur(function(){
        $("#valu35").focus(function () {
            $("#valu35").keyup(function() { 
              if(($("#valu35").val()).length===0){
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                 $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true);
              }
          });
        });


if(($("#valu45").val()).length!==0){
       $("#expprod6").attr("readonly", true);
       $("#expprod6").focus();
        }
});

$("#expprod6").blur(function(){
        $("#valu45").focus(function () {
            
            $("#valu45").keyup(function() { 
              if(($("#valu45").val()).length===0){
                  $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true);
                
            }
        });
            
        });
          
        
 if(($("#expprod6").val()).length!==0){
       $("#digit6").attr("readonly", false);
       $("#digit6").focus();
        }
});
$("#digit6").blur(function(){
        $("#expprod6").focus(function () {
            
            $("#expprod6").keyup(function() { 
              if(($("#expprod6").val()).length===0){
                  $("#valu56").val("");
                $("#valu56").attr("readonly", true);
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#eff6").val("");
                $("#eff6").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
            }
        });
            
        });
if(($("#digit6").val()).length!==0){
       $("#eff6").attr("readonly", true);
       $("#eff6").focus();
        }
});
$("#eff6").blur(function(){
        $("#digit6").focus(function () {
            
            $("#digit6").keyup(function() { 
              if(($("#digit6").val()).length===0){
                  
                $("#expproduce6").val("");
                $("#expproduce6").attr("readonly", true);
                $("#eff6").val("");
                $("#eff6").attr("readonly", true);
                $("#digit6").val("");
                $("#digit6").attr("readonly", false);
            }
        });
            
        });
        });
        
    });
          </script>
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">

    $(document).ready(function () {
        yourFunction();
    });
function yourFunction(){
    var x=parseFloat(document.getElementById("check1").value);
 if(x===12345||isNaN(x)){
     $("#one1").find("input,button,textarea,select").attr("disabled", "disabled");
     $("#two").find("input,button,textarea,select").attr("disabled", "disabled");
    
 }
 else{
     $("#goButton").hide();
      $("#part1").find("input,button,textarea,select").attr("disabled", "disabled");
 }
}
</script>
<script language="javascript">
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
                  // n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("expprod");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
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
                   n=Math.round(sum);
                    var z = document.getElementById("expprod2");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
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
                   n=Math.round(sum);
                    var z = document.getElementById("expprod3");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
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
                   n=Math.round(sum);
                    var z = document.getElementById("expprod4");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
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
                   n=Math.round(sum);
                    var z = document.getElementById("expprod5");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
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
                   n=Math.round(sum);
                    var z = document.getElementById("expprod6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
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
                        n = "";
                    z.value =n;
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
                        n = "";
                    z.value =n;
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
                        n = "";
                    z.value =n;
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
                        n = "";
                    z.value =n;
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
                        n = "";
                    z.value =n;
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
                        n = "";
                    z.value =n;
                }
                
             

    
    function efficiency1(){
    var x=parseFloat(document.getElementById("expprod").value);
    var y=parseFloat(document.getElementById("digit1").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n))
        z="";
    var res=document.getElementById("eff");
    res.value=z;
}
function efficiency2(){
    var x=parseFloat(document.getElementById("expprod2").value);
    var y=parseFloat(document.getElementById("digit2").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n))
        z="";
    var res=document.getElementById("eff2");
    res.value=z;
}
function efficiency3(){
    var x=parseFloat(document.getElementById("expprod3").value);
    var y=parseFloat(document.getElementById("digit3").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n))
        z="";
    var res=document.getElementById("eff3");
    res.value=z;
}
function efficiency4(){
    var x=parseFloat(document.getElementById("expprod4").value);
    var y=parseFloat(document.getElementById("digit4").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n))
        z="";
    var res=document.getElementById("eff4");
    res.value=z;
}
function efficiency5(){
    var x=parseFloat(document.getElementById("expprod5").value);
    var y=parseFloat(document.getElementById("digit5").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n))
        z="";
    var res=document.getElementById("eff5");
    res.value=z;
}
function efficiency6(){
    var x=parseFloat(document.getElementById("expprod6").value);
    var y=parseFloat(document.getElementById("digit6").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
     if(isNaN(n))
        z="";
    var res=document.getElementById("eff6");
    res.value=z;
}

  function efficiency7(){
    var x=parseFloat(document.getElementById("totalPrice1").value);
    var y=parseFloat(document.getElementById("totalPrice2").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n))
        z="";
    var res=document.getElementById("eff7");
    res.value=z;
}  
    
    
    
    
    
    
// we used jQuery 'keyup' to trigger the computation as the user type
$('.price').mouseenter(function () {
 
    // initialize the sum (total price) to zero
    var sum = 0;
     
    // we use jQuery each() to loop through all the textbox with 'price' class
    // and compute the sum for each loop
    $('.price').each(function() {
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
    $('.price2').each(function() {
        sum += Number($(this).val());
    });
     
    // set the computed value to 'totalPrice' textbox
    $('#totalPrice2').val(sum);
     
});
$('.price3').mouseenter(function () {
 
    efficiency7();
     
});

$('.price5').keyup(function () {
 
    // initialize the sum (total price) to zero
    var sum = 0;
     
    // we use jQuery each() to loop through all the textbox with 'price' class
    // and compute the sum for each loop
    $('.price5').each(function() {
        sum += Number($(this).val());
    });
     
    // set the computed value to 'totalPrice' textbox
    $('#totalPrice5').val(sum);
     
});
$( ".digit1" ).change(function() {
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
$( ".digit2" ).change(function() {
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
$( ".digit3" ).change(function() {
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
$( ".digit4" ).change(function() {
  var digit4 = $(this).val();
    var expprod4= document.getElementById("expprod4").value;
    if (parseFloat(digit4) > parseFloat(expprod4))

    {
        alert("Actual Production must be less than Expected Production");
        $(this).val("");
        $(this).focus();
    } else {
        // do something
    }
});
$( ".digit5" ).change(function() {
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
$( ".digit6" ).change(function() {
  var digit6 = $(this).val();
    var expprod6 = document.getElementById("expprod6").value;
    if (parseFloat(digit6) > parseIparseFloatnt(expprod6))

    {
       alert("Actual Production must be less than Expected Production");
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
        alert("Count Maintained must be between "+ac5+" and "+anu+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu15) > parseInt(anu))

    {
         alert("Count Maintained must be between "+ac5+" and "+anu+".999....");
        $("#valu25").val("");
          $("#valu25").attr("readonly", true);
               $("#valu35").attr("readonly", true);
                 $("#valu35").val("");
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true); 
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
        alert("Count Maintained must be between "+ac4+" and "+anu1+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu14) > parseInt(anu1))

    {
         alert("Count Maintained must be between "+ac4+" and "+anu1+".999....");
         $("#valu24").val("");
          $("#valu24").attr("readonly", true);
                $("#valu34").attr("readonly", true);
                $("#valu34").val("");
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true); 
                $(this).val("");
                 $(this).focus();
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
         alert("Count Maintained must be between "+ac3+" and "+anu2+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu13) > parseInt(anu2))

    {
         alert("Count Maintained must be between "+ac3+" and "+anu2+".999....");
        $("#valu23").val("");
         $("#valu23").attr("readonly", true);
                $("#valu33").attr("readonly", true);
                $("#valu33").val("");
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true); 
                $(this).val("");
                 $(this).focus();
        $(this).val("");
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
         alert("Count Maintained must be between "+ac2+" and "+anu3+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu12) > parseInt(anu3))

    {
        alert("Count Maintained must be between "+ac2+" and "+anu3+".999....");
          $("#valu22").val("");
        $("#valu22").attr("readonly", true);
               $("#valu32").attr("readonly", true);
                $("#valu32").val("");
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true); 
                $(this).val("");
                 $(this).focus();
        $(this).val("");
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
        alert("Count Maintained must be between "+ac1+" and "+anu4+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu11) > parseInt(anu4))

    {
        alert("Count Maintained must be between "+ac1+" and "+anu4+".999....");
          $("#valu21").val("");
           $("#valu21").attr("readonly", true);
                $("#valu31").attr("readonly", true);
                $("#valu31").val("");
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true); 
                $(this).val("");
                 $(this).focus();
        $(this).val("");
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
        alert("Count Maintained must be between "+ac+" and "+anu5+".999....");
        $(this).val("");
         $(this).focus();
    } 
    
     else if (parseInt(valu1) > parseInt(anu5))

    {
         alert("Count Maintained must be between "+ac+" and "+anu5+".999....");
       
             $("#valu2").attr("readonly", true);
                $("#valu2").val("");
                $("#valu3").attr("readonly", true);
                $("#valu3").val("");
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true); 
        $(this).val("");
        $(this).focus();
    } 
        else {
        // do something
    }
});


$( ".acp6" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=70000 && parseInt(a1)<=110000))

    {
        alert("Must be in 70000 and 110000");
        $("#valu25").val("");
               $("#valu35").attr("readonly", true);
                 $("#valu35").val("");
                $("#valu45").val("");
                $("#valu45").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true); 
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
       $("#valu24").val("");
                $("#valu34").attr("readonly", true);
                $("#valu34").val("");
                $("#valu44").val("");
                $("#valu44").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true); 
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
         $("#valu23").val("");
                $("#valu33").attr("readonly", true);
                $("#valu33").val("");
                $("#valu43").val("");
                $("#valu43").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true); 
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
        $("#valu22").val("");
         $("#valu32").attr("readonly", true);
                $("#valu32").val("");
                $("#valu42").val("");
                $("#valu42").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true); 
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
          $("#valu21").val("");
                $("#valu31").attr("readonly", true);
                $("#valu31").val("");
                $("#valu41").val("");
                $("#valu41").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true); 
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
                $("#valu3").attr("readonly", true);
                $("#valu3").val("");
                $("#valu4").val("");
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true); 
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
                $("#valu4").attr("readonly", true);
               $("#expproduce").val("");
                $("#expproduce").attr("readonly", true);
                $("#expprod").val("");
                $("#expprod").attr("readonly", true);
                 $("#digit1").val("");
                $("#digit1").attr("readonly", true);
                 $("#eff").val("");
                $("#eff").attr("readonly", true); 
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
                $("#valu41").attr("readonly", true);
                $("#expprod2").val("");
                $("#expprod2").attr("readonly", true);
                 $("#digit2").val("");
                $("#digit2").attr("readonly", true);
                 $("#eff2").val("");
                $("#eff2").attr("readonly", true); 
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
                $("#valu42").attr("readonly", true);
                $("#expprod3").val("");
                $("#expprod3").attr("readonly", true);
                 $("#digit3").val("");
                $("#digit3").attr("readonly", true);
                 $("#eff3").val("");
                $("#eff3").attr("readonly", true); 
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
                $("#valu43").attr("readonly", true);
                $("#expprod4").val("");
                $("#expprod4").attr("readonly", true);
                 $("#digit4").val("");
                $("#digit4").attr("readonly", true);
                 $("#eff4").val("");
                $("#eff4").attr("readonly", true); 
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
                $("#valu44").attr("readonly", true);
                $("#expprod5").val("");
                $("#expprod5").attr("readonly", true);
                 $("#digit5").val("");
                $("#digit5").attr("readonly", true);
                 $("#eff5").val("");
                $("#eff5").attr("readonly", true); 
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
                $("#valu45").attr("readonly", true);
                $("#expprod6").val("");
                $("#expprod6").attr("readonly", true);
                 $("#digit6").val("");
                $("#digit6").attr("readonly", true);
                 $("#eff6").val("");
                $("#eff6").attr("readonly", true); 
        $(this).val("");
         $(this).focus();
    } else {
        // do something
    }
});
</script>
</body>
</html>