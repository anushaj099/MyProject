<%-- 
    Document   : drawingHome
    Created on : Dec 17, 2016, 12:14:53 PM
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
            <SCRIPT language=Javascript>

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
            </SCRIPT>  
       
        <sj:head/>
        <s:head/>
        
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

    <body style="background-color: #EEEEEE">     
   <%-- <s:iterator value="ulist" var="myobj" >   
        <%@include file="Upperpage2.jsp" %>                  
</s:iterator>  --%>
   
    <s:if test="%{shift_date!=null}">
            <s:if test="%{datelist.size==2}">
                <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have one more shift to insert </marquee>
          </s:if>
          <s:elseif test="%{datelist.size==1}">
                <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have two more shifts to insert </marquee>
                </s:elseif>
                <s:else>
            <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have inserted all the shifts  </marquee>
           </s:else>
        </s:if>
           <s:else>
           <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>
         </s:else>
   <s:iterator value="ulist" status="stat" var="myobj"> 
           <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage2.jsp" %>
           </s:if>
   </s:iterator>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Sri Mouli Textiles Private Limited Drawing Data</h1>
            </div>
        </div>
<div class="row">
<center>
<s:form action="drawingInsert" enctype="multipart/form-data" method="post">
    <table id="part1">
        <td><s:hidden name="id" value="%{id}" /></td>
        <td><sj:datepicker readonly="true" maxDate="true" id="i" name="form.date" changeMonth="true" changeYear="true"  label="Date "  size="90"  displayFormat="dd-mm-yy" cssClass="lab" placeholder="dd-mm-yyyy"/> </td>
        <td><s:select name="form.superviser" id="i" cssClass="form-control " label="Supervisor"  list="superList" headerKey="-1" headerValue="-- Select Supervisor --"/></td>
        <td><s:select id="i"  name="form.shifts" list="{'Shift1','Shift2','Shift3'}" onchange="findval(this.value)" label="Select Shift" headerKey="-1" headerValue=" --Select Shift-- " cssClass="form-control shift"/></td>
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
    </div>
</s:form>
<s:form action="drawingInsertReal" enctype="multipart/form-data" method="post" onsubmit="return addAll()">
    <div class="col-sm-12 text-center"><h3>Drawing Material Data</h3></div>
    <div class="tab1">
    <table class="table table-bordered table-responsive" id="one1">
        <tr>
               <th>Carding</th>
               <th>Employee Id</th>
               <th>Delivery Hank</th>
               <th>M/C Speed</th>
               <th>M/C Running</th>
               <th>Expected Production (in Kgs)</th>
               <th>Actual Production (in Kgs)</th>
               <th>Efficiency</th>
               <th>No of Breaks</th>
               <th>Remarks</th>
        </tr>
<tr>
<td><s:textfield cssClass="form-control"  theme="simple" value="MC-1" name="form.carding" readonly="true"/></td>
<td><s:textfield name="form.empId" id="emp"  cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.deliveryHank" id="value1" cssClass="form-control one field1"  theme="simple" placeholder="Enter MC-1 Delivery Hank" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcSpeed" id="value2" cssClass="form-control  two field2"  theme="simple" placeholder="Enter MC-1 M/C Speed" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcRunning" id="mid1" cssClass="form-control mcspeed1 run three field3 mcr1" theme="simple" placeholder="Enter MC-1 M/C Running" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)"  name="form.expectedProduction" id="expect" onfocus="javascript:addNumbers()" cssClass="form-control exp esp"  theme="simple" placeholder="Enter MC-1 Expected Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.actualProduction" id="actual" cssClass="form-control acp acp1 four field4"   theme="simple" placeholder="Enter MC-1 Actual Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.efficiency" id="eff" onfocus="javascript:efficiency()" cssClass="form-control price"  theme="simple" placeholder="Enter MC-1 Efficiency" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.breakedInShifts" cssClass="form-control five"  theme="simple" placeholder="Enter MC-1 Breacked in Shifts" /></td>
<td><s:textfield cssClass="form-control six" name="form.remarks" theme="simple" placeholder="Enter MC-1 Remarks" /></td>
</tr> 

<tr>
<td><s:textfield cssClass="form-control"  theme="simple" value="MC-2" name="form.carding" readonly="true"/></td>
<td><s:textfield name="form.empId" id="emp1"  cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.deliveryHank" id="value3" cssClass="form-control one1 field1"  theme="simple" placeholder="Enter MC-2 Delivery Hank" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcSpeed" id="value4"  cssClass="form-control  two1 field2"  theme="simple" placeholder="Enter MC-2 M/C Speed" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcRunning" id="mid2" cssClass="form-control mcspeed2 run three1 field3 mcr2"  theme="simple" placeholder="Enter MC-2 M/C Running" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.expectedProduction" id="expect1" onfocus="javascript:addNumbers1()" cssClass="form-control exp esp1"  theme="simple" placeholder="Enter MC-2 Expected Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.actualProduction" id="actual1" cssClass="form-control acp acp2 four1 field4"  theme="simple" placeholder="Enter MC-2 Actual Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.efficiency" id="eff1" onfocus="javascript:efficiency1()" cssClass="form-control price"  theme="simple" placeholder="Enter MC-2 Efficiency" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.breakedInShifts" cssClass="form-control five"  theme="simple" placeholder="Enter MC-2 Breacked in Shifts" /></td>
<td><s:textfield cssClass="form-control six" name="form.remarks" theme="simple" placeholder="Enter MC-2 Remarks" /></td>
</tr> 

<tr>
<td><s:textfield cssClass="form-control"  theme="simple" value="MC-3" name="form.carding" readonly="true"/></td>
<td><s:textfield name="form.empId" id="emp2" cssClass="form-control"  theme="simple" placeholder="Employee id" ></s:textfield></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.deliveryHank" id="value5" cssClass="form-control one2 field1"  theme="simple" placeholder="Enter MC-3 Delivery Hank" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcSpeed" id="value6" cssClass="form-control  two2 field2"  theme="simple" placeholder="Enter MC-3 M/C Speed" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcRunning" id="mid3" cssClass="form-control mcspeed3 run three2 field3 mcr3"  theme="simple" placeholder="Enter MC-3 M/C Running" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.expectedProduction" id="expect2" onfocus="javascript:addNumbers2()" cssClass="form-control exp esp2"  theme="simple" placeholder="Enter MC-3 Expected Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.actualProduction" id="actual2" cssClass="form-control acp acp3 four2 field4"  theme="simple" placeholder="Enter MC-3 Actual Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.efficiency" id="eff2" onfocus="javascript:efficiency2()" cssClass="form-control price"  theme="simple" placeholder="Enter MC-3 Efficiency" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.breakedInShifts" cssClass="form-control five"  theme="simple" placeholder="Enter MC-3 Breacked in Shifts" /></td>
<td><s:textfield cssClass="form-control six" name="form.remarks" theme="simple" placeholder="Enter MC-3 Remarks" /></td>
</tr> 

<tr>
<td><s:textfield cssClass="form-control"  theme="simple" value="MC-4" name="form.carding" readonly="true"/></td>
<td><s:textfield name="form.empId" cssClass="form-control" id="emp3"  theme="simple" placeholder="Employee id" ></s:textfield></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.deliveryHank" id="value7" cssClass="form-control one3 field1"  theme="simple" placeholder="Enter MC-4 Delivery Hank" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcSpeed" id="value8" cssClass="form-control  two3 field2"  theme="simple" placeholder="Enter MC-4 M/C Speed" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcRunning" id="mid4" cssClass="form-control mcspeed4 run three3 field3 mcr4"  theme="simple" placeholder="Enter MC-4 M/C Running" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.expectedProduction" id="expect3" onfocus="javascript:addNumbers3()" cssClass="form-control exp esp3"  theme="simple" placeholder="Enter MC-4 Expected Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.actualProduction" id="actual3" cssClass="form-control acp acp4 four3 field4"  theme="simple" placeholder="Enter MC-4 Actual Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.efficiency" id="eff3" onfocus="javascript:efficiency3()" cssClass="form-control price"  theme="simple" placeholder="Enter MC-4 Efficiency" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.breakedInShifts" cssClass="form-control five"  theme="simple" placeholder="Enter MC-4 Breacked in Shifts" /></td>
<td><s:textfield cssClass="form-control six" name="form.remarks" theme="simple" placeholder="Enter MC-4 Remarks" /></td>
</tr> 
<tr>
<td><s:textfield cssClass="form-control"  theme="simple" value="MC-5" name="form.carding" readonly="true"/></td>
<td><s:textfield name="form.empId" cssClass="form-control" id="emp4"  theme="simple" placeholder="Employee id" ></s:textfield></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.deliveryHank" id="value9" cssClass="form-control one4 field1"  theme="simple" placeholder="Enter MC-5 Delivery Hank" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcSpeed" id="value10" cssClass="form-control  two4 field2"  theme="simple" placeholder="Enter MC-5 M/C Speed" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.mcRunning" id="mid5" cssClass="form-control mcspeed5 run three4 mcr5"  theme="simple" placeholder="Enter MC-5 M/C Running" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.expectedProduction" id="expect4" onfocus="javascript:addNumbers4()" cssClass="form-control exp esp4"  theme="simple" placeholder="Enter MC-5 Expected Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.actualProduction" id="actual4" cssClass="form-control acp acp5 four4 field4"  theme="simple" placeholder="Enter MC-5 Actual Production" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" readonly="true" name="form.efficiency" id="eff4" onfocus="javascript:efficiency4()" cssClass="form-control price"  theme="simple" placeholder="Enter MC-5 Efficiency" /></td>
<td><s:textfield onkeypress="return isNumberKey(event)" name="form.breakedInShifts" cssClass="form-control five"  theme="simple" placeholder="Enter MC-5 Breacked in Shifts" /></td>
<td><s:textfield cssClass="form-control six" name="form.remarks"  theme="simple" placeholder="Enter MC-5 Remarks" /></td>
</tr> 

<tr>
<td colspan="5" class="text-center"><b>Total Production</b></td>
<td><b><s:textfield id="total2" name="form.totalEp" theme="simple" readonly="true" cssClass="form-control" /></b></td>
<td><b><s:textfield id="total3" name="form.totalAp" theme="simple" readonly="true" cssClass="form-control" /></b></td>
<td><b><s:textfield id="eff5" name="form.totalEfficiency" readonly="true" theme="simple"  onclick="javascript:efficiency5()" cssClass="form-control" /></b></td>
<td colspan="2" />
</tr>
</table>
</div>
<br/>

<div class="form-group">
<div class="col-sm-6 text-center" id="two">
    <s:submit  label="Submit"   cssClass="btn btn-primary" align="center" ></s:submit>
</div>
<div class="col-sm-6 text-center">
    <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
</div>
</div> 
</s:form>
</center>
            
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
function addAll(){
    var expect = $('.acp1').val();
    var expprod6 = document.getElementById("expect").value;
    if (parseFloat(expect) > parseFloat(expprod6))
    {
              alert("Actual Production must be less than Expected Production");
              $('.acp1').val("");
              $('.acp1').focus();
              return false;
    } 
    var expect1 = $('.acp2').val();
    var expprod6 = document.getElementById("expect1").value;
    if (parseInt(expect1) > parseInt(expprod6))
    {
              alert("Actual Production must be less than Expected Production");
              $('.acp2').val("");
              $('.acp2').focus();
              return false;
    } 
    var expect2 = $('.acp3').val();
    var expprod6 = document.getElementById("expect2").value;
    if (parseInt(expect2) > parseInt(expprod6))
    {
              alert("Actual Production must be less than Expected Production");
              $('.acp3').val("");
              $('.acp3').focus();
              return false;
    } 
    var expect2 = $('.acp4').val();
    var expprod6 = document.getElementById("expect3").value;
    if (parseInt(expect2) > parseInt(expprod6))
    {
              alert("Actual Production must be less than Expected Production");
              $('.acp4').val("");
              $('.acp4').focus();
              return false;
    } 
    var expect2 = $('.acp5').val();
    var expprod6 = document.getElementById("expect4").value;
    if (parseInt(expect2) > parseInt(expprod6))
    {
              alert("Actual Production must be less than Expected Production");
              $('.acp5').val("");
              $('.acp5').focus();
              return false;
    } 
    
    
     addNumbers();  addNumbers1();  addNumbers2();  addNumbers3();  addNumbers4(); 
         efficiency();
         efficiency1();
         efficiency2();
         efficiency3();
         efficiency4();
         efficiency5(); 
    
    var sum = 0;
    $('.exp').each(function () {
        sum += Number($(this).val());
    });
    $('#total2').val(sum);
    var sum = 0;
    $('.acp').each(function () {
        sum += Number($(this).val());
    });
    $('#total3').val(sum);
        
         
          
                      var x = $("#total2").val();
                      var y = $("#total3").val();
                      var z = $("#eff5").val();

                      if ((x === '0' || y === '0' || z === '0') || (($("#total2").val()).length === 0 || ($("#total3").val()).length === 0 || ($("#eff5").val()).length === 0)) {
                          alert("Please fill Drawing Material Data");
                          $('#emp').focus();
                          return false;
                      }
                  }
                
var content = $('#value1').val();
$('#value1').keyup(function() { 
        if ($('#value1').val() !== content) {
             addNumbers();
              efficiency();
          }
});
var content = $('#value3').val();
$('#value3').keyup(function() { 
        if ($('#value3').val() !== content) {
             addNumbers1();
              efficiency1();
              
        }
});
var content = $('#value5').val();
$('#value5').keyup(function() { 
        if ($('#value5').val() !== content) {
             addNumbers2();
              efficiency2();
              
        }
});
var content = $('#value7').val();
$('#value7').keyup(function() { 
        if ($('#value7').val() !== content) {
             addNumbers3();
              efficiency3();
              
        }
});
var content = $('#value9').val();
$('#value9').keyup(function() { 
        if ($('#value9').val() !== content) {
             addNumbers4();
              efficiency4();
              
        }
});
var content = $('#value2').val();
$('#value2').keyup(function() { 
        if ($('#value2').val() !== content) {
             addNumbers();
             efficiency();
              
        }
});
var content = $('#value4').val();
$('#value4').keyup(function() { 
        if ($('#value4').val() !== content) {
             addNumbers1();
             efficiency1();
              
        }
});
var content = $('#value6').val();
$('#value6').keyup(function() { 
        if ($('#value6').val() !== content) {
             addNumbers2();
             efficiency2();
        }
});
var content = $('#value8').val();
$('#value8').keyup(function() { 
        if ($('#value8').val() !== content) {
             addNumbers3();
             efficiency3();
              
        }
});
var content = $('#value10').val();
$('#value10').keyup(function() { 
        if ($('#value10').val() !== content) {
             addNumbers4();
             efficiency4();
              
        }
});

                
                
                  var resetForm = function () {
                      $('.field1').attr("readonly", true);
                      $('.field2').attr("readonly", true);
                      $('.field3').attr("readonly", true);
                      $('.field4').attr("readonly", true);
                  };
            //or this is probably better
            //var resetForm = function(){ $('input,select,textarea').not('[readonly],[disabled],:button').val(''); }

                
                  $(document).ready(function () {
                      yourFunction();
                      $('.one').attr("readonly", true);
                      $('.two').attr("readonly", true);
                      $('.three').attr("readonly", true);
                      $('.four').attr("readonly", true);
                      $('.esp').attr("readonly", true);
                      
     $( ".two" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=400 && parseInt(a1)<=700))

    {
        alert("M/C Speed must be in 400 to 700");
         $('.three').attr("readonly", true);
                              $('.four').attr("readonly", true);
                              $('.esp').attr("readonly", true);
                              $('.esp').val("");
                              $('.two').val("");
                              $('.three').val("");
                              $('.four').val("");
                               $("#eff").val("");
                             $("#eff").attr("readonly", true);
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});

$( ".two1" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=400 && parseInt(a1)<=700))

    {
        alert("M/C Speed must be in 400 to 700");
         $('.three1').attr("readonly", true);
                              $('.four1').attr("readonly", true);
                              $('.esp1').attr("readonly", true);
                              $('.esp1').val("");
                              $('.three1').val("");
                              $('.four1').val("");
                               $("#eff1").val("");
                             $("#eff1").attr("readonly", true);
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});

$( ".two2" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=400 && parseInt(a1)<=700))

    {
        alert("M/C Speed must be in 400 to 700");
         $('.three2').attr("readonly", true);
                              $('.four2').attr("readonly", true);
                              $('.esp2').attr("readonly", true);
                              $('.esp2').val("");
                              $('.three2').val("");
                              $('.four2').val("");
                               $("#eff2").val("");
                             $("#eff2").attr("readonly", true);
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});
$( ".two3" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=400 && parseInt(a1)<=700))

    {
        alert("M/C Speed must be in 400 to 700");
         $('.three3').attr("readonly", true);
                              $('.four3').attr("readonly", true);
                              $('.esp3').attr("readonly", true);
                              $('.esp3').val("");
                              $('.three3').val("");
                              $('.four3').val("");
                               $("#eff3").val("");
                             $("#eff3").attr("readonly", true);
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});
$( ".two4" ).change(function() {
  var a1 = $(this).val();
    //var expprod6 = document.getElementById("expect2").value;
    if (!(parseInt(a1) >=400 && parseInt(a1)<=700))

    {
        alert("M/C Speed must be in 400 to 700");
         $('.three4').attr("readonly", true);
                              $('.four4').attr("readonly", true);
                              $('.esp4').attr("readonly", true);
                              $('.esp4').val("");
                              $('.three4').val("");
                              $('.four4').val("");
                               $("#eff4").val("");
                             $("#eff4").attr("readonly", true);
                $(this).val("");
                 $(this).focus();
        
    } else {
        // do something
    }
});
                      

                      $("#emp").keyup(function () {
                          var regx = /^[0-9]+$/;
                          if (!regx.test($('#emp').val()))
                          {
                              alert("Only Numerics are allowed !");
                              $('#emp').val("");
                          }
                          if (($("#emp").val()).length === 0) {
                              $('.one').attr("readonly", true);
                              $('.two').attr("readonly", true);
                              $('.three').attr("readonly", true);
                              $('.four').attr("readonly", true);
                              $('.esp').attr("readonly", true);
                              $('.esp').val("");
                              $('.two').val("");
                              $('.three').val("");
                              $('.four').val("");
                          }
                      });

                      $('#emp').blur(function () {
                          if (($('#emp').val()).length !== 0) {
                              var a = parseInt($('#emp').val());
                              var a1 = new Array();
                              a1 =<s:property value="elist"/>;
                             
                              var b = a1[0];
                              var a2 = a1.length;

                              for (var i = 0; i < a2; i++) {
                                  var a3 = parseInt(a1[i]);
                                  var b;
                                  if (a.valueOf() === a3.valueOf()) {
                                      b = "hello";
                                      $("#value1").attr("readonly", false);
                                      $("#value1").focus();
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");

                                              $("#value1").val("");
                                              $("#value1").attr("readonly", true);
                                              $("#value2").val("");
                                              $("#value2").attr("readonly", true);
                                              $("#mid1").val("");
                                              $("#mid1").attr("readonly", true);
                                              $("#expect").val("");
                                              $("#expect").attr("readonly", true);
                                              $("#actual").val("");
                                              $("#actual").attr("readonly", true);
                                              $("#eff").val("");
                                              $("#eff").attr("readonly", true);


                                              $(this).val("");
                                              $(this).focus();
                                              $("#value1").attr("readonly", true);



                                          }
                                      }
                                  }
                              }

                          }

                      });

                      $("#value1").blur(function () {
                          $("#emp").focus(function () {

                              $("#emp").keyup(function () {
                                  if (($("#emp").val()).length === 0) {
                                      $("#value1").val("");
                                      $("#value1").attr("readonly", true);
                                      $("#value2").val("");
                                      $("#value2").attr("readonly", true);
                                      $("#mid1").val("");
                                      $("#mid1").attr("readonly", true);
                                      $("#expect").val("");
                                      $("#expect").attr("readonly", true);
                                      $("#actual").val("");
                                      $("#actual").attr("readonly", true);
                                      $("#eff").val("");
                                      $("#eff").attr("readonly", true);

                                  }
                              });

                          });


                          if (($("#value1").val()).length !== 0) {
                              $("#value2").attr("readonly", false);
                              $("#value2").focus();
                          }
                      });


                      $("#value2").blur(function () {
                          $("#value1").focus(function () {

                              $("#value1").keyup(function () {
                                  if (($("#value1").val()).length === 0) {
                                      $("#value2").val("");
                                      $("#value2").attr("readonly", true);
                                      $("#mid1").val("");
                                      $("#mid1").attr("readonly", true);
                                      $("#expect").val("");
                                      $("#expect").attr("readonly", true);
                                      $("#actual").val("");
                                      $("#actual").attr("readonly", true);
                                      $("#eff").val("");
                                      $("#eff").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#value2").val()).length !== 0) {
                              $("#mid1").attr("readonly", false);
                              $("#mid1").focus();
                          }
                      });

                      $("#mid1").blur(function () {
                          $("#value2").focus(function () {

                              $("#value2").keyup(function () {
                                  if (($("#value2").val()).length === 0) {
                                      $("#mid1").val("");
                                      $("#mid1").attr("readonly", true);
                                      $("#expect").val("");
                                      $("#expect").attr("readonly", true);
                                      $("#actual").val("");
                                      $("#actual").attr("readonly", true);
                                      $("#eff").val("");
                                      $("#eff").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#mid1").val()).length !== 0) {
                              $("#expect").attr("readonly", true);
                              $("#expect").focus();
                          }
                      });

                      $("#expect").blur(function () {
                          $("#mid1").focus(function () {

                              $("#mid1").keyup(function () {
                                  if (($("#mid1").val()).length === 0) {
                                      $("#expect").val("");
                                      $("#expect").attr("readonly", true);
                                      $("#actual").val("");
                                      $("#actual").attr("readonly", true);
                                      $("#eff").val("");
                                      $("#eff").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#expect").val()).length !== 0) {
                              $("#actual").attr("readonly", false);
                              $("#actual").focus();
                          }
                      });
                      $("#actual").blur(function () {
                          $("#expect").focus(function () {

                              $("#expect").keyup(function () {
                                  if (($("#expect").val()).length === 0) {
                                      $("#eff").val("");
                                      $("#eff").attr("readonly", true);
                                      $("#expect").val("");
                                      $("#expect").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#actual").val()).length !== 0) {
                              $("#eff").attr("readonly", true);
                              $("#eff").focus();
                          }
                      });
                      $("#eff").blur(function () {
                          $("#actual").focus(function () {

                              $("#actual").keyup(function () {
                                  if (($("#actual").val()).length === 0) {
                                      $("#eff").val("");
                                      $("#eff").attr("readonly", true);
                                      $("#actual").val("");
                                      $("#actual").attr("readonly", false);
                                  }
                              });

                          });


            // if(($("#eff").val()).length!==0){
            //       $("#eff").attr("readonly", true);
            //       $("#eff").focus();
            //        }
                      });

                      $('.one1').attr("readonly", true);
                      $('.two1').attr("readonly", true);
                      $('.three1').attr("readonly", true);
                      $('.four1').attr("readonly", true);
                      $('.esp1').attr("readonly", true);

                      $("#emp1").keyup(function () {
                          var regx = /^[0-9]+$/;
                          if (!regx.test($('#emp1').val()))
                          {
                              alert("Only Numerics are allowed !");
                              $('#emp1').val("");
                          }

                          if (($("#emp1").val()).length === 0) {
                              $('.one1').attr("readonly", true);
                              $('.two1').attr("readonly", true);
                              $('.three1').attr("readonly", true);
                              $('.four1').attr("readonly", true);
                              $('.esp1').attr("readonly", true);
                              $('.esp1').val("");
                              $('.two1').val("");
                              $('.three1').val("");
                              $('.four1').val("");
                          }
                      });

                      $('#emp1').blur(function () {
                          if (($('#emp1').val()).length !== 0) {
                              //alert("hhhhhhh");
                              var a = parseInt($('#emp1').val());
                              var a1 = new Array();
                              a1 =<s:property value="elist"/>;
                              var b = a1[0];
                              var a2 = a1.length;

                              for (var i = 0; i < a2; i++) {
                                  var a3 = parseInt(a1[i]);
                                  var b;
                                  if (a.valueOf() === a3.valueOf()) {
                                      b = "hello";
                                      $("#value3").attr("readonly", false);
                                      $("#value3").focus();
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");

                                              $("#value3").val("");
                                              $("#value3").attr("readonly", true);
                                              $("#value4").val("");
                                              $("#value4").attr("readonly", true);
                                              $("#mid2").val("");
                                              $("#mid2").attr("readonly", true);
                                              $("#expect1").val("");
                                              $("#expect1").attr("readonly", true);
                                              $("#actual1").val("");
                                              $("#actual1").attr("readonly", true);
                                              $("#eff1").val("");
                                              $("#eff1").attr("readonly", true);
                                              $(this).val("");
                                              $(this).focus();
                                              $("#value3").attr("readonly", true);
                                          }
                                      }
                                  }
                              }

                          }

                      });

                      $("#value3").blur(function () {
                          $("#emp1").focus(function () {

                              $("#emp1").keyup(function () {
                                  if (($("#emp1").val()).length === 0) {
                                      $("#value3").val("");
                                      $("#value3").attr("readonly", true);
                                      $("#value4").val("");
                                      $("#value4").attr("readonly", true);
                                      $("#mid2").val("");
                                      $("#mid2").attr("readonly", true);
                                      $("#expect1").val("");
                                      $("#expect1").attr("readonly", true);
                                      $("#actual1").val("");
                                      $("#actual1").attr("readonly", true);
                                      $("#eff1").val("");
                                      $("#eff1").attr("readonly", true);

                                  }
                              });

                          });


                          if (($("#value3").val()).length !== 0) {
                              $("#value4").attr("readonly", false);
                              $("#value4").focus();
                          }
                      });


                      $("#value4").blur(function () {
                          $("#value3").focus(function () {

                              $("#value3").keyup(function () {
                                  if (($("#value3").val()).length === 0) {
                                      $("#value4").val("");
                                      $("#value4").attr("readonly", true);
                                      $("#mid2").val("");
                                      $("#mid2").attr("readonly", true);
                                      $("#expect1").val("");
                                      $("#expect1").attr("readonly", true);
                                      $("#actual1").val("");
                                      $("#actual1").attr("readonly", true);
                                      $("#eff1").val("");
                                      $("#eff1").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#value4").val()).length !== 0) {
                              $("#mid2").attr("readonly", false);
                              $("#mid2").focus();
                          }
                      });

                      $("#mid2").blur(function () {
                          $("#value4").focus(function () {

                              $("#value4").keyup(function () {
                                  if (($("#value4").val()).length === 0) {
                                      $("#mid2").val("");
                                      $("#mid2").attr("readonly", true);
                                      $("#expect1").val("");
                                      $("#expect1").attr("readonly", true);
                                      $("#actual1").val("");
                                      $("#actual1").attr("readonly", true);
                                      $("#eff1").val("");
                                      $("#eff1").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#mid2").val()).length !== 0) {
                              $("#expect1").attr("readonly", true);
                              $("#expect1").focus();
                          }
                      });

                      $("#expect1").blur(function () {
                          $("#mid2").focus(function () {

                              $("#mid2").keyup(function () {
                                  if (($("#mid2").val()).length === 0) {
                                      $("#expect1").val("");
                                      $("#expect1").attr("readonly", true);
                                      $("#actual1").val("");
                                      $("#actual1").attr("readonly", true);
                                      $("#eff1").val("");
                                      $("#eff1").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#expect1").val()).length !== 0) {
                              $("#actual1").attr("readonly", false);
                              $("#actual1").focus();
                          }
                      });
                      $("#actual1").blur(function () {
                          $("#expect1").focus(function () {

                              $("#expect1").keyup(function () {
                                  if (($("#expect1").val()).length === 0) {
                                      $("#eff1").val("");
                                      $("#eff1").attr("readonly", true);
                                      $("#expect1").val("");
                                      $("#expect1").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#actual1").val()).length !== 0) {
                              $("#eff1").attr("readonly", true);
                              $("#eff1").focus();
                          }
                      });
                      $("#eff1").blur(function () {
                          $("#actual1").focus(function () {

                              $("#actual1").keyup(function () {
                                  if (($("#actual1").val()).length === 0) {
                                      $("#eff1").val("");
                                      $("#eff1").attr("readonly", true);
                                      $("#actua1l").val("");
                                      $("#actual1").attr("readonly", false);
                                  }
                              });

                          });


                      });
                      $('.one2').attr("readonly", true);
                      $('.two2').attr("readonly", true);
                      $('.three2').attr("readonly", true);
                      $('.four2').attr("readonly", true);
                      $('.esp2').attr("readonly", true);

                      $("#emp2").keyup(function () {
                          var regx = /^[0-9]+$/;
                          if (!regx.test($('#emp2').val()))
                          {
                              alert("Only Numerics are allowed !");
                              $('#emp2').val("");
                          }
                          if (($("#emp").val()).length === 0) {
                              $('.one2').attr("readonly", true);
                              $('.two2').attr("readonly", true);
                              $('.three2').attr("readonly", true);
                              $('.four2').attr("readonly", true);
                              $('.esp2').attr("readonly", true);
                              $('.esp2').val("");
                              $('.two2').val("");
                              $('.three2').val("");
                              $('.four2').val("");
                          }
                      });

                      $('#emp2').blur(function () {
                          if (($('#emp2').val()).length !== 0) {
                              var a = parseInt($('#emp2').val());
                              var a1 = new Array();
                              a1 =<s:property value="elist"/>;
                              var b = a1[0];
                              var a2 = a1.length;

                              for (var i = 0; i < a2; i++) {
                                  var a3 = parseInt(a1[i]);
                                  var b;
                                  if (a.valueOf() === a3.valueOf()) {
                                      b = "hello";
                                      $("#value5").attr("readonly", false);
                                      $("#value5").focus();
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");

                                              $("#value5").val("");
                                              $("#value5").attr("readonly", true);
                                              $("#value6").val("");
                                              $("#value6").attr("readonly", true);
                                              $("#mid3").val("");
                                              $("#mid3").attr("readonly", true);
                                              $("#expect2").val("");
                                              $("#expect2").attr("readonly", true);
                                              $("#actual2").val("");
                                              $("#actual2").attr("readonly", true);
                                              $("#eff2").val("");
                                              $("#eff2").attr("readonly", true);
                                              $(this).val("");
                                              $(this).focus();
                                              $("#value5").attr("readonly", true);
                                          }
                                      }
                                  }
                              }

                          }

                      });

                      $("#value5").blur(function () {
                          $("#emp2").focus(function () {

                              $("#emp2").keyup(function () {
                                  if (($("#emp2").val()).length === 0) {
                                      $("#value5").val("");
                                      $("#value5").attr("readonly", true);
                                      $("#value6").val("");
                                      $("#value6").attr("readonly", true);
                                      $("#mid3").val("");
                                      $("#mid3").attr("readonly", true);
                                      $("#expect2").val("");
                                      $("#expect2").attr("readonly", true);
                                      $("#actual2").val("");
                                      $("#actual2").attr("readonly", true);
                                      $("#eff2").val("");
                                      $("#eff2").attr("readonly", true);

                                  }
                              });

                          });


                          if (($("#value5").val()).length !== 0) {
                              $("#value6").attr("readonly", false);
                              $("#value6").focus();
                          }
                      });


                      $("#value6").blur(function () {
                          $("#value5").focus(function () {

                              $("#value5").keyup(function () {
                                  if (($("#value5").val()).length === 0) {
                                      $("#value6").val("");
                                      $("#value6").attr("readonly", true);
                                      $("#mid3").val("");
                                      $("#mid3").attr("readonly", true);
                                      $("#expect2").val("");
                                      $("#expect2").attr("readonly", true);
                                      $("#actual2").val("");
                                      $("#actual2").attr("readonly", true);
                                      $("#eff2").val("");
                                      $("#eff2").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#value6").val()).length !== 0) {
                              $("#mid3").attr("readonly", false);
                              $("#mid3").focus();
                          }
                      });

                      $("#mid3").blur(function () {
                          $("#value6").focus(function () {

                              $("#value6").keyup(function () {
                                  if (($("#value6").val()).length === 0) {
                                      $("#mid3").val("");
                                      $("#mid3").attr("readonly", true);
                                      $("#expect2").val("");
                                      $("#expect2").attr("readonly", true);
                                      $("#actual2").val("");
                                      $("#actual2").attr("readonly", true);
                                      $("#eff2").val("");
                                      $("#eff2").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#mid3").val()).length !== 0) {
                              $("#expect2").attr("readonly", true);
                              $("#expect2").focus();
                          }
                      });

                      $("#expect2").blur(function () {
                          $("#mid3").focus(function () {

                              $("#mid3").keyup(function () {
                                  if (($("#mid3").val()).length === 0) {
                                      $("#expect2").val("");
                                      $("#expect2").attr("readonly", true);
                                      $("#actual2").val("");
                                      $("#actual2").attr("readonly", true);
                                      $("#eff2").val("");
                                      $("#eff2").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#expect2").val()).length !== 0) {
                              $("#actual2").attr("readonly", false);
                              $("#actual2").focus();
                          }
                      });
                      $("#actual2").blur(function () {
                          $("#expect2").focus(function () {

                              $("#expect2").keyup(function () {
                                  if (($("#expect2").val()).length === 0) {
                                      $("#eff2").val("");
                                      $("#eff2").attr("readonly", true);
                                      $("#expect2").val("");
                                      $("#expect2").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#actual2").val()).length !== 0) {
                              $("#eff2").attr("readonly", true);
                              $("#eff2").focus();
                          }
                      });
                      $("#eff2").blur(function () {
                          $("#actual2").focus(function () {

                              $("#actual2").keyup(function () {
                                  if (($("#actual2").val()).length === 0) {
                                      $("#eff2").val("");
                                      $("#eff2").attr("readonly", true);
                                      $("#actual2").val("");
                                      $("#actual2").attr("readonly", false);
                                  }
                              });

                          });

                      });


                      $('.one3').attr("readonly", true);
                      $('.two3').attr("readonly", true);
                      $('.three3').attr("readonly", true);
                      $('.four3').attr("readonly", true);
                      $('.esp3').attr("readonly", true);

                      $("#emp3").keyup(function () {
                          var regx = /^[0-9]+$/;
                          if (!regx.test($('#emp3').val()))
                          {
                              alert("Only Numerics are allowed !");
                              $('#emp3').val("");
                          }
                          if (($("#emp3").val()).length === 0) {
                              $('.one3').attr("readonly", true);
                              $('.two3').attr("readonly", true);
                              $('.three3').attr("readonly", true);
                              $('.four3').attr("readonly", true);
                              $('.esp3').attr("readonly", true);
                              $('.esp3').val("");
                              $('.two3').val("");
                              $('.three3').val("");
                              $('.four3').val("");
                          }
                      });

                      $('#emp3').blur(function () {
                          if (($('#emp3').val()).length !== 0) {
                              var a = parseInt($('#emp3').val());
                              var a1 = new Array();
                              a1 =<s:property value="elist"/>;
                              var b = a1[0];
                              var a2 = a1.length;

                              for (var i = 0; i < a2; i++) {
                                  var a3 = parseInt(a1[i]);
                                  var b;
                                  if (a.valueOf() === a3.valueOf()) {
                                      b = "hello";
                                      $("#value7").attr("readonly", false);
                                      $("#value7").focus();
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");

                                              $("#value7").val("");
                                              $("#value7").attr("readonly", true);
                                              $("#value8").val("");
                                              $("#value8").attr("readonly", true);
                                              $("#mid4").val("");
                                              $("#mid4").attr("readonly", true);
                                              $("#expect3").val("");
                                              $("#expect3").attr("readonly", true);
                                              $("#actual3").val("");
                                              $("#actual3").attr("readonly", true);
                                              $("#eff3").val("");
                                              $("#eff3").attr("readonly", true);

                                              $(this).val("");
                                              $(this).focus();
                                              $("#value7").attr("readonly", true);
                                          }
                                      }
                                  }
                              }

                          }

                      });


                      $("#value7").blur(function () {
                          $("#emp3").focus(function () {

                              $("#emp3").keyup(function () {
                                  if (($("#emp3").val()).length === 0) {
                                      $("#value7").val("");
                                      $("#value7").attr("readonly", true);
                                      $("#value8").val("");
                                      $("#value8").attr("readonly", true);
                                      $("#mid4").val("");
                                      $("#mid4").attr("readonly", true);
                                      $("#expect3").val("");
                                      $("#expect3").attr("readonly", true);
                                      $("#actual3").val("");
                                      $("#actual3").attr("readonly", true);
                                      $("#eff3").val("");
                                      $("#eff3").attr("readonly", true);

                                  }
                              });

                          });


                          if (($("#value7").val()).length !== 0) {
                              $("#value8").attr("readonly", false);
                              $("#value8").focus();
                          }
                      });


                      $("#value8").blur(function () {
                          $("#value7").focus(function () {

                              $("#value7").keyup(function () {
                                  if (($("#value7").val()).length === 0) {
                                      $("#value8").val("");
                                      $("#value8").attr("readonly", true);
                                      $("#mid4").val("");
                                      $("#mid4").attr("readonly", true);
                                      $("#expect3").val("");
                                      $("#expect3").attr("readonly", true);
                                      $("#actual3").val("");
                                      $("#actual3").attr("readonly", true);
                                      $("#eff3").val("");
                                      $("#eff3").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#value8").val()).length !== 0) {
                              $("#mid4").attr("readonly", false);
                              $("#mid4").focus();
                          }
                      });

                      $("#mid4").blur(function () {
                          $("#value8").focus(function () {

                              $("#value8").keyup(function () {
                                  if (($("#value8").val()).length === 0) {
                                      $("#mid4").val("");
                                      $("#mid4").attr("readonly", true);
                                      $("#expect3").val("");
                                      $("#expect3").attr("readonly", true);
                                      $("#actual3").val("");
                                      $("#actual3").attr("readonly", true);
                                      $("#eff3").val("");
                                      $("#eff3").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#mid4").val()).length !== 0) {
                              $("#expect3").attr("readonly", true);
                              $("#expect3").focus();
                          }
                      });

                      $("#expect3").blur(function () {
                          $("#mid4").focus(function () {

                              $("#mid4").keyup(function () {
                                  if (($("#mid4").val()).length === 0) {
                                      $("#expect3").val("");
                                      $("#expect3").attr("readonly", true);
                                      $("#actual3").val("");
                                      $("#actual3").attr("readonly", true);
                                      $("#eff3").val("");
                                      $("#eff3").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#expect3").val()).length !== 0) {
                              $("#actual3").attr("readonly", false);
                              $("#actual3").focus();
                          }
                      });
                      $("#actual3").blur(function () {
                          $("#expect3").focus(function () {

                              $("#expect3").keyup(function () {
                                  if (($("#expect3").val()).length === 0) {
                                      $("#eff3").val("");
                                      $("#eff3").attr("readonly", true);
                                      $("#expect3").val("");
                                      $("#expect3").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#actual3").val()).length !== 0) {
                              $("#eff3").attr("readonly", true);
                              $("#eff3").focus();
                          }
                      });
                      $("#eff3").blur(function () {
                          $("#actual3").focus(function () {

                              $("#actual3").keyup(function () {
                                  if (($("#actual3").val()).length === 0) {
                                      $("#eff3").val("");
                                      $("#eff3").attr("readonly", true);
                                      $("#actual3").val("");
                                      $("#actual3").attr("readonly", false);
                                  }
                              });

                          });


                      });


                      $('.one4').attr("readonly", true);
                      $('.two4').attr("readonly", true);
                      $('.three4').attr("readonly", true);
                      $('.four4').attr("readonly", true);
                      $('.esp4').attr("readonly", true);

                      $("#emp4").keyup(function () {
                          var regx = /^[0-9]+$/;
                          if (!regx.test($('#emp4').val()))
                          {
                              alert("Only Numerics are allowed !");
                              $('#emp4').val("");
                          }
                          if (($("#emp4").val()).length === 0) {
                              $('.one4').attr("readonly", true);
                              $('.two4').attr("readonly", true);
                              $('.three4').attr("readonly", true);
                              $('.four4').attr("readonly", true);
                              $('.esp4').attr("readonly", true);
                              $('.esp4').val("");
                              $('.two4').val("");
                              $('.three4').val("");
                              $('.four4').val("");
                          }
                      });

                      $('#emp4').blur(function () {
                          if (($('#emp4').val()).length !== 0) {
                              var a = parseInt($('#emp4').val());
                              var a1 = new Array();
                              a1 =<s:property value="elist"/>;
                              var b = a1[0];
                              var a2 = a1.length;

                              for (var i = 0; i < a2; i++) {
                                  var a3 = parseInt(a1[i]);
                                  var b;
                                  if (a.valueOf() === a3.valueOf()) {
                                      b = "hello";
                                      $("#value9").attr("readonly", false);
                                      $("#value9").focus();
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");

                                              $("#value9").val("");
                                              $("#value9").attr("readonly", true);
                                              $("#value10").val("");
                                              $("#value10").attr("readonly", true);
                                              $("#mid5").val("");
                                              $("#mid5").attr("readonly", true);
                                              $("#expect4").val("");
                                              $("#expect4").attr("readonly", true);
                                              $("#actual4").val("");
                                              $("#actual4").attr("readonly", true);
                                              $("#eff4").val("");
                                              $("#eff4").attr("readonly", true);

                                              $(this).val("");
                                              $(this).focus();
                                              $("#value9").attr("readonly", true);
                                          }
                                      }
                                  }
                              }

                          }

                      });
                      $("#value9").blur(function () {
                          $("#emp10").focus(function () {

                              $("#emp4").keyup(function () {
                                  if (($("#emp4").val()).length === 0) {
                                      $("#value9").val("");
                                      $("#value9").attr("readonly", true);
                                      $("#value10").val("");
                                      $("#value10").attr("readonly", true);
                                      $("#mid5").val("");
                                      $("#mid5").attr("readonly", true);
                                      $("#expect4").val("");
                                      $("#expect4").attr("readonly", true);
                                      $("#actual4").val("");
                                      $("#actual4").attr("readonly", true);
                                      $("#eff4").val("");
                                      $("#eff4").attr("readonly", true);

                                  }
                              });

                          });


                          if (($("#value9").val()).length !== 0) {
                              $("#value10").attr("readonly", false);
                              $("#value10").focus();
                          }
                      });


                      $("#value10").blur(function () {
                          $("#value9").focus(function () {

                              $("#value9").keyup(function () {
                                  if (($("#value9").val()).length === 0) {
                                      $("#value10").val("");
                                      $("#value10").attr("readonly", true);
                                      $("#mid5").val("");
                                      $("#mid5").attr("readonly", true);
                                      $("#expect4").val("");
                                      $("#expect4").attr("readonly", true);
                                      $("#actual4").val("");
                                      $("#actual4").attr("readonly", true);
                                      $("#eff4").val("");
                                      $("#eff4").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#value10").val()).length !== 0) {
                              $("#mid5").attr("readonly", false);
                              $("#mid5").focus();
                          }
                      });

                      $("#mid5").blur(function () {
                          $("#value10").focus(function () {

                              $("#value10").keyup(function () {
                                  if (($("#value10").val()).length === 0) {
                                      $("#mid5").val("");
                                      $("#mid5").attr("readonly", true);
                                      $("#expect4").val("");
                                      $("#expect4").attr("readonly", true);
                                      $("#actual4").val("");
                                      $("#actual4").attr("readonly", true);
                                      $("#eff4").val("");
                                      $("#eff4").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#mid5").val()).length !== 0) {
                              $("#expect4").attr("readonly", true);
                              $("#expect4").focus();
                          }
                      });

                      $("#expect4").blur(function () {
                          $("#mid5").focus(function () {

                              $("#mid5").keyup(function () {
                                  if (($("#mid5").val()).length === 0) {
                                      $("#expect4").val("");
                                      $("#expect4").attr("readonly", true);
                                      $("#actual4").val("");
                                      $("#actual4").attr("readonly", true);
                                      $("#eff4").val("");
                                      $("#eff4").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#expect4").val()).length !== 0) {
                              $("#actual4").attr("readonly", false);
                              $("#actual4").focus();
                          }
                      });
                      $("#actual4").blur(function () {
                          $("#expect4").focus(function () {

                              $("#expect4").keyup(function () {
                                  if (($("#expect4").val()).length === 0) {
                                      $("#eff4").val("");
                                      $("#eff4").attr("readonly", true);
                                      $("#expect4").val("");
                                      $("#expect4").attr("readonly", true);
                                  }
                              });

                          });


                          if (($("#actual4").val()).length !== 0) {
                              $("#eff4").attr("readonly", true);
                              $("#eff4").focus();
                          }
                      });
                      $("#eff4").blur(function () {
                          $("#actual4").focus(function () {

                              $("#actual4").keyup(function () {
                                  if (($("#actual4").val()).length === 0) {
                                      $("#eff4").val("");
                                      $("#eff4").attr("readonly", true);
                                      $("#actual4").val("");
                                      $("#actual4").attr("readonly", false);
                                  }
                              });

                          });


                      });


                  });
                  function yourFunction() {
                      var x = parseFloat(document.getElementById("check1").value);
                      if (x === 12345 || isNaN(x)) {
                          $("#one1").find("input,button,textarea,select").attr("disabled", "disabled");
                          $("#two").find("input,button,textarea,select").attr("disabled", "disabled");

                      } else {
                          $("#goButton").hide();
                          $("#part1").find("input,button,textarea,select").attr("disabled", "disabled");
                      }
                  }
            </script>
            <script>
           // When the user clicks on <div>, open the popup
                function myFunction() {
                    window.alert("Data Inserted Successfully !!!");
                }

                function isNumberKey(key)
                {
                    var keycode = (key.which) ? key.which : key.keyCode;
                    if (!(keycode === 8 || keycode === 46) && (keycode < 48 || keycode > 57))
                        return false;
                    else
                    {
                        var parts = key.srcElement.value.split('.');
                        if (parts.length > 1 && keycode === 46)
                            return false;
                        return true;
                    }
                }

                function findval(item) {
                    name = item;
                }
                
              /*   $( ".mcr1" ).change(function() {
    
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
      });*/

                function addNumbers()
                {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("value1").value);
                    var y = parseFloat(document.getElementById("value2").value);
                    var p = parseFloat(document.getElementById("mid1").value);
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        
                        sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3')
                    {
                        sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expect");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }

                function addNumbers1()
                {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("value3").value);
                    var y = parseFloat(document.getElementById("value4").value);
                     var p = parseFloat(document.getElementById("mid2").value);
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                         sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3')
                    {
                         sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expect1");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }

                function addNumbers2()
                {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("value5").value);
                    var y = parseFloat(document.getElementById("value6").value);
                     var p = parseFloat(document.getElementById("mid3").value);
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                         sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3')
                    {
                          sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expect2");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }

                function addNumbers3()
                {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("value7").value);
                    var y = parseFloat(document.getElementById("value8").value);
                     var p = parseFloat(document.getElementById("mid4").value);
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                          sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3')
                    {
                          sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expect3");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }

                function addNumbers4()
                {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("value9").value);
                    var y = parseFloat(document.getElementById("value10").value);
                     var p = parseFloat(document.getElementById("mid5").value);
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3')
                    {
                       sum = ((((0.2836*y)/x)/8/60)*p);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expect4");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }

            </script>
            <script>
                function efficiency()
                {
                    var a = parseFloat(document.getElementById("expect").value);
                    var b = parseFloat(document.getElementById("actual").value);
                    var sum = 0, n;
                    sum = (b / a) * 100;
                    n = sum.toFixed(3);
                    var z = document.getElementById("eff");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function efficiency1()
                {
                    var a = parseFloat(document.getElementById("expect1").value);
                    var b = parseFloat(document.getElementById("actual1").value);
                    var sum = 0;
                    sum = (b / a) * 100;
                    n = sum.toFixed(3);
                    var z = document.getElementById("eff1");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function efficiency2()
                {
                    var a = parseFloat(document.getElementById("expect2").value);
                    var b = parseFloat(document.getElementById("actual2").value);
                    var sum = 0;
                    sum = (b / a) * 100;
                    n = sum.toFixed(3);
                    var z = document.getElementById("eff2");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function efficiency3()
                {
                    var a = parseFloat(document.getElementById("expect3").value);
                    var b = parseFloat(document.getElementById("actual3").value);
                    var sum = 0;
                    sum = (b / a) * 100;
                    n = sum.toFixed(3);
                    var z = document.getElementById("eff3");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function efficiency4()
                {
                    var a = parseFloat(document.getElementById("expect4").value);
                    var b = parseFloat(document.getElementById("actual4").value);
                    var sum = 0;
                    sum = (b / a) * 100;
                    n = sum.toFixed(3);
                    var z = document.getElementById("eff4");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function efficiency5()
                {
                    var a = parseFloat(document.getElementById("total2").value);
                    var b = parseFloat(document.getElementById("total3").value);
                    var sum = 0;
                    sum = (b / a) * 100;
                    n = sum.toFixed(3);
                    var z = document.getElementById("eff5");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
            </script>
            <script>
                $('.price').mouseenter(function () {
                    efficiency5();
                });
                $('.exp').mouseenter(function () {

                    var sum = 0;
                    $('.exp').each(function () {
                        sum += Number($(this).val());
                    });

                    $('#total2').val(sum);


                });
                $('.acp').mouseenter(function () {

                    var sum = 0;
                    $('.acp').each(function () {
                        sum += Number($(this).val());
                    });

                    $('#total3').val(sum);

                });


                $(".mcspeed1").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("M/C Running must be lessthan 510");
//                            $("#value2").val("");
//                            $("#value2").attr("readonly", false);
//                            $("#mid1").val("");
//                            $("#mid1").attr("readonly", true);
                            $("#expect").val("");
                            $("#expect").attr("readonly", true);
                            $("#actual").val("");
                            $("#actual").attr("readonly", true);
                            $("#eff").val("");
                            $("#eff").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();

                            //  $(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("M/C Running must be lessthan 420");

//                            $("#value2").val("");
//                            $("#value2").attr("readonly", false);
//                            $("#mid1").val("");
//                            $("#mid1").attr("readonly", true);
                            $("#expect").val("");
                            $("#expect").attr("readonly", true);
                            $("#actual").val("");
                            $("#actual").attr("readonly", true);
                            $("#eff").val("");
                            $("#eff").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                            //$(this).val("");
                        }
                    }
                });
                $(".mcspeed2").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("M/C Running must be lessthan 510");
//                            $("#value4").val("");
//                            $("#value4").attr("readonly", false);
//                            $("#mid2").val("");
//                            $("#mid2").attr("readonly", true);
                            $("#expect1").val("");
                            $("#expect1").attr("readonly", true);
                            $("#actual1").val("");
                            $("#actual1").attr("readonly", true);
                            $("#eff1").val("");
                            $("#eff1").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                            // $(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("M/C Running must be lessthan 420");
//                            $("#value4").val("");
//                            $("#value4").attr("readonly", false);
//                            $("#mid2").val("");
//                            $("#mid2").attr("readonly", true);
                            $("#expect1").val("");
                            $("#expect1").attr("readonly", true);
                            $("#actual1").val("");
                            $("#actual1").attr("readonly", true);
                            $("#eff1").val("");
                            $("#eff1").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
            //        $(this).val("");
                        }
                    }
                });
                $(".mcspeed3").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("M/C Running must be lessthan 510");

//                            $("#value6").val("");
//                            $("#value6").attr("readonly", false);
//                            $("#mid3").val("");
//                            $("#mid3").attr("readonly", true);
                            $("#expect2").val("");
                            $("#expect2").attr("readonly", true);
                            $("#actual2").val("");
                            $("#actual2").attr("readonly", true);
                            $("#eff2").val("");
                            $("#eff2").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();

                            //$(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("M/C Running must be lessthan 420");

//                            $("#value6").val("");
//                            $("#value6").attr("readonly", false);
//                            $("#mid3").val("");
//                            $("#mid3").attr("readonly", true);
                            $("#expect2").val("");
                            $("#expect2").attr("readonly", true);
                            $("#actual2").val("");
                            $("#actual2").attr("readonly", true);
                            $("#eff2").val("");
                            $("#eff2").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
            //        $(this).val("");
                        }
                    }
                });
                $(".mcspeed4").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("M/C Running must be lessthan 510");


//                            $("#value8").val("");
//                            $("#value8").attr("readonly", false);
//                            $("#mid4").val("");
//                            $("#mid4").attr("readonly", true);
                            $("#expect3").val("");
                            $("#expect3").attr("readonly", true);
                            $("#actual3").val("");
                            $("#actual3").attr("readonly", true);
                            $("#eff3").val("");
                            $("#eff3").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();

                            //$(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("M/C Running must be lessthan 420");

//                            $("#value8").val("");
//                            $("#value8").attr("readonly", false);
//                            $("#mid4").val("");
//                            $("#mid4").attr("readonly", true);
                            $("#expect3").val("");
                            $("#expect3").attr("readonly", true);
                            $("#actual3").val("");
                            $("#actual3").attr("readonly", true);
                            $("#eff3").val("");
                            $("#eff3").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();

                            //$(this).val("");
                        }
                    }
                });
                $(".mcspeed5").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("M/C Running must be lessthan 510");
//                            $("#value10").val("");
//                            $("#value10").attr("readonly", false);
//                            $("#mid5").val("");
//                            $("#mid5").attr("readonly", true);
                            $("#expect4").val("");
                            $("#expect4").attr("readonly", true);
                            $("#actual4").val("");
                            $("#actual4").attr("readonly", true);
                            $("#eff4").val("");
                            $("#eff4").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
            //        $(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("M/C Running must be lessthan 420");

//                            $("#value10").val("");
//                            $("#value10").attr("readonly", false);
//                            $("#mid5").val("");
//                            $("#mid5").attr("readonly", true);
                            $("#expect4").val("");
                            $("#expect4").attr("readonly", true);
                            $("#actual4").val("");
                            $("#actual4").attr("readonly", true);
                            $("#eff4").val("");
                            $("#eff4").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();

                            // $(this).val("");
                        }
                    }
                });


                $(".acp1").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect").value;
                    if (parseFloat(digit6) > parseFloat(expprod6))

                    {
                        alert("Actual Actual Production must be less than Expected Production");
                        $("#eff").val("");
                            $("#eff").attr("readonly", true);
                        $("#actual").val("");
                            $("#actual").attr("readonly", false);
                            $(this).val("");
                            $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp2").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect1").value;
                    if (parseFloat(digit6) > parseFloat(expprod6))

                    {
                        alert("Actual Production must be less than Expected Production");
                         $("#eff1").val("");
                            $("#eff1").attr("readonly", true);
                        $("#actual1").val("");
                            $("#actual1").attr("readonly", false);
                            $(this).val("");
                            $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp3").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect2").value;
                    if (parseFloat(digit6) > parseFloat(expprod6))

                    {
                        alert("Actual Production must be less than Expected Production");
                         $("#eff2").val("");
                            $("#eff2").attr("readonly", true);
                        $("#actual2").val("");
                            $("#actual2").attr("readonly", false);
                            $(this).val("");
                            $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp4").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect3").value;
                    if (parseFloat(digit6) > parseFloat(expprod6))

                    {
                        alert("Actual Production must be less than Expected Production");
                         $("#eff3").val("");
                            $("#eff3").attr("readonly", true);
                        $("#actual3").val("");
                            $("#actual3").attr("readonly", false);
                            $(this).val("");
                            $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp5").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect4").value;
                    if (parseFloat(digit6) > parseFloat(expprod6))

                    {
                        alert("Actual Production must be less than Expected Production");
                         $("#eff4").val("");
                            $("#eff4").attr("readonly", true);
                       $("#actual4").val("");
                            $("#actual4").attr("readonly", false);
                            $(this).val("");
                            $(this).focus();
                    } else {
                        // do something
                    }
                });
            </script>
            <!-- /.row -->

            <br/><br/>

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