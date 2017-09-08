<%-- 
    Document   : qualityHome
    Created on : Dec 15, 2016, 4:47:18 PM
    Author     : NSG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%!
    public String name = "";
%> 
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sri Mouli Textiles Private Limited</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/Srimouli.css" rel="stylesheet">
        <link href="css/newcss.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>    
     <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>
<sj:head/>
<s:head/>


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
                   
                if((evt.charCode>= 48 && evt.charCode <= 57) || evt.charCode=== 46 ||evt.charCode === 0){
                if(el.value.indexOf('.') > -1){
                if(evt.charCode=== 46)
                evt.preventDefault();
                }
                }else
                evt.preventDefault();
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
    <s:if test="%{shift_date!=null}">
       <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property>  </marquee>
    </s:if>
    <s:else>
        <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>  
    </s:else>
  <s:iterator value="ulist" var="myobj">   
            <%@include file="Upperpage2.jsp" %>                  
        </s:iterator>
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Quality Data</h1>
            </div>
        </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->

    <div class="container-fluid">
        <div class="row">
            
            <center>
            
                <s:form action="qualityInsert" method="post" class="form-horizontal">
  <table id="part1">
           
      <td><s:hidden name="id" value="%{id}" /></td>
      <td><sj:datepicker readonly="true" id="i"  maxDate= "now" name="form.date" changeMonth="true" changeYear="true"  label="Date "  size="90"  displayFormat="dd-mm-yy" cssClass="lab" placeholder="dd-mm-yyyy"/> </td>
     
          <!--  <td><s:select name="form.superViser" id="i" cssClass="form-control " label="Supervisor"  list="superList" headerKey="-1" headerValue="-- Select Supervisor --"/></td> -->
      <td><s:textfield  label="QAD" name="form.superViser" size="90" onkeypress="return isDecimalKey(event)" id="i" placeholder="Enter QAD" cssClass="form-control"></s:textfield></td> 
            
            <td><s:select id="i"  name="form.shifts" list="{'M/C Testing','Samples'}"  label="Test Type" headerKey="-1" headerValue=" --Select Type-- " cssClass="form-control"/></td>
           <%-- <td><s:select id="i"  name="form.shifts" list="{'Shift1','Shift2','Shift3'}" onchange="findval(this.value)" label="Select Shift" headerKey="-1" headerValue=" --Select Shift-- " cssClass="form-control shift"/></td> --%>
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
 <s:form action="qualityInsertReal" enctype="multipart/form-data" method="post" onsubmit="return validateForm()">        
    <div class="col-sm-12 text-center"><h3>Quality Report Data</h3></div>
      <div class="tab1">
      <div class="col-lg-12 tab1 table-responsive">
          <table class="table table-bordered table-responsive" id="one1">
      <tr>
          <s:if test="%{shifts=='M/C Testing' || shifts==null}">
            <th>Machines</th>
            <th>Count Number</th>
            <th>Count Maintained</th>
            <th>CSP</th>
            <th>CV</th>
            <th>Strength CV</th>
            <th>-50 (Every Day)</th>
            <th>+50 (Every Day)</th>
            <th>+280 (Every Day)</th>
            <th>IPI (Every Day) Test-1</th>
            <th>Remarks</th>
           
    </tr>
    
    <tr>
          <s:hidden name="form.id" value="%{id}" />
<td><s:textfield value="M/C-1" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td style="width:8em;"><s:select name="form.count" id="vals15" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu15" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu15 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="anu" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="anu1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="anu2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="anu3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="anu4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="anu5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onmousemove="javascript:addNumbers()"  id="anu6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="anu7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>

<tr>
<td><s:textfield value="M/C-2" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td style="width:8em;"><s:select name="form.count" id="vals14" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu14" placeholder="Enter Count Maintain"  onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu14 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="swa" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="swa1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="swa2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay"  id="swa3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay"  id="swa4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay"  id="swa5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onmousemove="javascript:addNumbers1()" placeholder="Enter IPI"  id="swa6" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks"  id="swa7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>

<tr>
<td><s:textfield value="M/C-3" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals13" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu13" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu13 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="trivs" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="trivs1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="trivs2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="trivs3" placeholder=" Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="trivs4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="trivs5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onmousemove="javascript:addNumbers2()" id="trivs6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="trivs7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>

<tr>
<td><s:textfield value="M/C-4" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals12" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu12" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu12 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="saran" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="saran1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="saran2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="saran3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="saran4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="saran5" placeholder="Enter Plus 280 Everyday"  onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onmousemove="javascript:addNumbers3()" id="saran6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="saran7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>

<tr>
<td><s:textfield value="M/C-5" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals11" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu11" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu11 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="saranya" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="saranya1"  placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="saranya2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="saranya3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="saranya4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="saranya5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onmousemove="javascript:addNumbers4()" id="saranya6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="saranya7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>

<tr>
<td><s:textfield value="M/C-6" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals10" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu10" placeholder="Enter Count Maintain"  onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu10 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="mouni" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="mouni1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="mouni2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="mouni3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="mouni4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="mouni5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onmousemove="javascript:addNumbers5()" id="mouni6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="mouni7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>


 </s:if>


 
<s:if test="%{shifts=='Samples'}">
              <th>Samples</th>
            <th>Count Number</th>
            <th>Count Maintained</th>
            <th>CSP</th>
            <th>CV</th>
            <th>Strength CV</th>
            <th>-50 (Every Day)</th>
            <th>+50 (Every Day)</th>
            <th>+280 (Every Day)</th>
            <th>IPI (Every Day) Test-1</th>
            <th>Remarks</th>
           
    </tr>
    
  <tr>
          <s:hidden name="form.id" value="%{id}" />
<td><s:textfield value="Sample1" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td style="width:8em;"><s:select name="form.count" id="vals15" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu15" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu15 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="anu" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="anu1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="anu2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="anu3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="anu4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="anu5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onfocus="javascript:addNumbers()"  id="anu6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="anu7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>


<tr>
<td><s:textfield value="Sample2" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td style="width:8em;"><s:select name="form.count" id="vals14" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu14" placeholder="Enter Count Maintain"  onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu14 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="swa" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="swa1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="swa2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay"  id="swa3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay"  id="swa4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay"  id="swa5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onfocus="javascript:addNumbers1()" placeholder="Enter IPI"  id="swa6" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks"  id="swa7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>


<tr>
<td><s:textfield value="Sample3" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals13" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu13" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu13 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="trivs" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="trivs1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="trivs2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="trivs3" placeholder=" Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="trivs4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="trivs5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onfocus="javascript:addNumbers2()" id="trivs6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="trivs7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>


<tr>
<td><s:textfield value="Sample4" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals12" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu12" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu12 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="saran" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="saran1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="saran2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="saran3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="saran4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="saran5" placeholder="Enter Plus 280 Everyday"  onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onfocus="javascript:addNumbers3()" id="saran6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="saran7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>


<tr>
<td><s:textfield value="Sample5" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals11" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu11" placeholder="Enter Count Maintain" onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu11 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="saranya" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="saranya1"  placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="saranya2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="saranya3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="saranya4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="saranya5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onfocus="javascript:addNumbers4()" id="saranya6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="saranya7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>

<tr>
<td><s:textfield value="Sample6" name="form.machines" cssClass="form-control" theme="simple" readonly="true"></s:textfield></td>
<td><s:select name="form.count" id="vals10" onkeypress="return isNumberKey(this,event)" list="countList" cssClass="form-control step ip" theme="simple" headerKey="" headerValue="Count"></s:select></td>
<td><s:textfield name="form.countmaintained" id="valu10" placeholder="Enter Count Maintain"  onkeypress="return isNumberKey(this,event)"  cssClass="form-control valu10 ip" theme="simple" /></td>
<td><s:textfield name="form.csp" id="mouni" placeholder="Enter CSP" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.cv" id="mouni1" placeholder="Enter CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.strengthCv" id="mouni2" placeholder="Enter Strengh CV" onkeypress="return isNumberKey(this,event)"  cssClass="form-control ip" theme="simple"/></td>
<td><s:textfield name="form.minus50EveryDay" id="mouni3" placeholder="Enter Minus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus50EveryDay" id="mouni4" placeholder="Enter Plus 50 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.plus280everyDay" id="mouni5" placeholder="Enter Plus 280 Everyday" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.ipi" readonly="true" onfocus="javascript:addNumbers5()" id="mouni6" placeholder="Enter IPI" onkeypress="return isNumberKey(this,event)" cssClass="form-control ip" theme="simple" /></td>
<td><s:textfield name="form.remarks" id="mouni7" placeholder="Enter Remarks" cssClass="form-control ip" theme="simple" /></td>
</tr>


 </s:if>
      




</table>
     </div>
     </div>
  
    <div class="form-group">
      <div class="col-sm-6 col-xs-6 text-center" id="two">
          <s:submit value="Submit" cssClass="btn btn-primary" align="center"></s:submit>
      </div>

      <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center"  cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
      </div>
    </div>
</s:form>

            <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    
 function validateForm() {
       var x=$("#vals15").val();
       var y=$("#vals14").val();
      
   if(x===''&&y===''&&$("#vals13").val()===''&&$("#vals12").val()===''&&$("#vals11").val()===''&&$("#vals10").val()===''){
        alert("Please fill Quality Material Data");
      
        
        return false;
    }
}
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
  
  
//  $(document).ready(function() {
//     
//     $("#vals15").focus();
//     
//     var error_message = "Select count first";
//     
//      $("#vals15").blur(function() {
//          if ($(this).val() !== '')
//          {
//              $("#valu15").removeAttr("disabled");    
//              $("#message").html("");      
//          }
//     else {              
//              $("#valu15").attr("disabled", "disabled");  
//              $("#message").append(error_message);      
//          }         
//     
//      });
// });
 
 
 /*$(document).ready(function() {
     
     $("#vals14").focus();
     
     var error_message = "Select count first";
     
      $("#vals14").blur(function() {
          if ($(this).val() !== '')
          {
              $("#valu14").removeAttr("disabled");    
              $("#message").html("");      
          }
     else {              
              $("#valu14").attr("disabled", "disabled");  
              $("#message").append(error_message);      
          }         
     
      });
 });*/
 
 
 /*$(document).ready(function() {
     
     $("#vals13").focus();
     
     var error_message = "Select count first";
     
      $("#vals13").blur(function() {
          if ($(this).val() !== '')
          {
              $("#valu13").removeAttr("disabled");    
              $("#message").html("");      
          }
     else {              
              $("#valu13").attr("disabled", "disabled");  
              $("#message").append(error_message);      
          }         
     
      });
 });
 
 
 
 $(document).ready(function() {
     
     $("#vals12").focus();
     
     var error_message = "Select count first";
     
      $("#vals12").blur(function() {
          if ($(this).val() !== '')
          {
              $("#valu12").removeAttr("disabled");    
              $("#message").html("");      
          }
     else {              
              $("#valu12").attr("disabled", "disabled");  
              $("#message").append(error_message);      
          }         
     
      });
 });
 
 
 $(document).ready(function() {
     
     $("#vals11").focus();
     
     var error_message = "Select count first";
     
      $("#vals11").blur(function() {
          if ($(this).val() !== '')
          {
              $("#valu11").removeAttr("disabled");    
              $("#message").html("");      
          }
     else {              
              $("#valu11").attr("disabled", "disabled");  
              $("#message").append(error_message);      
          }         
     
      });
 });*/
 
 
// $(document).ready(function() {
//     
//     $("#vals10").focus();
//     
//     var error_message = "Select count first";
//     
//      $("#vals10").blur(function() {
//          if ($(this).val() != '')
//          {
//              $("#valu10").removeAttr("disabled");    
//              $("#message").html("");      
//          }
//     else {              
//              $("#valu10").attr("disabled", "disabled");  
//              $("#message").append(error_message);      
//          }         
//     
//      });
// });
 
 
 

</script>
<script>
    $( ".valu15" ).change(function() {
var valu15 = $(this).val();
 // $(this).val("");
    var ans = document.getElementById("vals15").value;
      var ac5=parseFloat(ans-0.9);
    if (parseFloat(valu15) < parseFloat(ans-0.9))

    {
        alert("Count Maintained must be between "+ac5+" and "+ans+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu15) > parseInt(ans))

    {
         alert("Count Maintained must be between "+ac5+" and "+ans+".999....");
       
                $(this).val("");
                 $(this).focus();
    } 
        else {
        // do something
    }
});



 $( ".valu14" ).change(function() {
var valu14 = $(this).val();
 // $(this).val("");
    var ans1 = document.getElementById("vals14").value;
      var ac5=parseFloat(ans1-0.9);
    if (parseFloat(valu14) < parseFloat(ans1-0.9))

    {
        alert("Count Maintained must be between "+ac5+" and "+ans1+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu14) > parseInt(ans1))

    {
         alert("Count Maintained must be between "+ac5+" and "+ans1+".999....");
       
                $(this).val("");
                 $(this).focus();
    } 
        else {
        // do something
    }
});

$( ".valu13" ).change(function() {
var valu13 = $(this).val();
 // $(this).val("");
    var ans2 = document.getElementById("vals13").value;
      var ac5=parseFloat(ans2-0.9);
    if (parseFloat(valu13) < parseFloat(ans2-0.9))

    {
        alert("Count Maintained must be between "+ac5+" and "+ans2+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu13) > parseInt(ans2))

    {
         alert("Count Maintained must be between "+ac5+" and "+ans2+".999....");
       
                $(this).val("");
                 $(this).focus();
    } 
        else {
        // do something
    }
});


$( ".valu12" ).change(function() {
var valu12 = $(this).val();
 // $(this).val("");
    var ans3 = document.getElementById("vals12").value;
      var ac5=parseFloat(ans3-0.9);
    if (parseFloat(valu12) < parseFloat(ans3-0.9))

    {
        alert("Count Maintained must be between "+ac5+" and "+ans3+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu12) > parseInt(ans3))

    {
         alert("Count Maintained must be between "+ac5+" and "+ans3+".999....");
       
                $(this).val("");
                 $(this).focus();
    } 
        else {
        // do something
    }
});


$( ".valu11" ).change(function() {
var valu11 = $(this).val();
 // $(this).val("");
    var ans4 = document.getElementById("vals11").value;
      var ac5=parseFloat(ans4-0.9);
    if (parseFloat(valu11) < parseFloat(ans4-0.9))

    {
        alert("Count Maintained must be between "+ac5+" and "+ans4+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu11) > parseInt(ans4))

    {
         alert("Count Maintained must be between "+ac5+" and "+ans4+".999....");
       
                $(this).val("");
                 $(this).focus();
    } 
        else {
        // do something
    }
});


$( ".valu10" ).change(function() {
var valu10 = $(this).val();
 // $(this).val("");
    var ans5 = document.getElementById("vals10").value;
      var ac5=parseFloat(ans5-0.9);
    if (parseFloat(valu10) < parseFloat(ans5-0.9))

    {
        alert("Count Maintained must be between "+ac5+" and "+ans5+".999....");
        $(this).val("");
        $(this).focus();
    } 
    
     else if (parseInt(valu10) > parseInt(ans5))

    {
         alert("Count Maintained must be between "+ac5+" and "+ans5+".999....");
       
                $(this).val("");
                 $(this).focus();
    } 
        else {
        // do something
    }
});
    
    </script>
    <script>
         function addNumbers() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("anu3").value);
                    var y = parseFloat(document.getElementById("anu4").value);
                    var a = parseFloat(document.getElementById("anu5").value);
                    
                        sum = x+y+a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("anu6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
                }
                 function addNumbers1() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("swa3").value);
                    var y = parseFloat(document.getElementById("swa4").value);
                    var a = parseFloat(document.getElementById("swa5").value);
                    
                        sum = x+y+a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("swa6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
                }
                 function addNumbers2() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("trivs3").value);
                    var y = parseFloat(document.getElementById("trivs4").value);
                    var a = parseFloat(document.getElementById("trivs5").value);
                    
                        sum = x+y+a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("trivs6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
                }
                 function addNumbers3() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("saran3").value);
                    var y = parseFloat(document.getElementById("saran4").value);
                    var a = parseFloat(document.getElementById("saran5").value);
                    
                        sum = x+y+a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("saran6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
                }
                 function addNumbers4() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("saranya3").value);
                    var y = parseFloat(document.getElementById("saranya4").value);
                    var a = parseFloat(document.getElementById("saranya5").value);
                    
                        sum = x+y+a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("saranya6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
                }
                 function addNumbers5() {
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("mouni3").value);
                    var y = parseFloat(document.getElementById("mouni4").value);
                    var a = parseFloat(document.getElementById("mouni5").value);
                    
                        sum = x+y+a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("mouni6");
                    if (isNaN(n))
                        n = "";
                    z.value =n;
                }
        </script>
       <br/><br/>
<br/>
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


</body>
</html>
