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

        </script>    
        <sj:head/>
        <s:head/>
   <body style="background-color: #EEEEEE">     
    <%--    <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage4.jsp" %>                  
</s:iterator>  --%>
    <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage4.jsp" %>
                    </s:if>
                </s:iterator>

        <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Sri Mouli Textiles Private Limited Drawing Update</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <center>
                <s:form action="drawingUpdate" enctype="multipart/form-data" method="post" onsubmit="return updateAll()">
                    <s:iterator value="dlist">
                        <table id="part1">
                            <td><s:hidden name="id" value="%{id}" /></td>
                            <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield readonly="true" displayFormat="dd-mm-yy" id="i" name="form.date" value="%{date1}"  label="Date "  size="90"  cssClass="form-control" /> </td>
                            <td><s:textfield readonly="true" name="form.superviser" id="i" cssClass="form-control" value="%{superviser}" label="Supervisor" /></td>
                            <td><s:textfield readonly="true" id="i"  name="form.shifts" value="%{shifts}" onchange="findval(this.value)" label="Select Shift" cssClass="form-control shift shitr"/></td>
                            <s:hidden value="%{status}" id="check1" />

                        </table>
                    </s:iterator>
                    <br/>
                    <div class="col-sm-12 text-center"><h3>Drawing Material Data</h3></div>
                    <br/><br/><br/><br/>
                    <div class="tab1">
                        <table class="table table-bordered table-responsive" >
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
                            <s:iterator value="dlist1">
                                <tr>    
                                    <td><s:textfield cssClass="form-control"  theme="simple" value="MC-1" name="form.carding" readonly="true"/></td>
                                    <td><s:textfield name="form.empId" cssClass="form-control" id="emp" value="%{empId}"  theme="simple" placeholder="Employee id" ></s:textfield></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{deliveryHank}" name="form.deliveryHank" id="value1" cssClass="form-control hank"  theme="simple" placeholder="Enter MC-1 Delivery Hank" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcSpeed}" name="form.mcSpeed" id="value2" cssClass="form-control two"  theme="simple" placeholder="Enter MC-1 M/C Speed" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcRunning}" name="form.mcRunning" id="mid1" cssClass="form-control run mcspeed1 three"   theme="simple" placeholder="Enter MC-1 M/C Running" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{expectedProduction}" readonly="true" name="form.expectedProduction" id="expect" onmousemove="javascript:addNumbers()" cssClass="form-control exp esp"  theme="simple" placeholder="Enter MC-1 Expected Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{actualProduction}" name="form.actualProduction" id="actual" cssClass="form-control acp acp1 four"   theme="simple" placeholder="Enter MC-1 Actual Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{efficiency}" readonly="true" name="form.efficiency" id="eff" onmousemove="javascript:efficiency()" cssClass="form-control"  theme="simple" placeholder="Enter MC-1 Efficiency" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{breakedInShifts}" name="form.breakedInShifts" cssClass="form-control"  theme="simple" placeholder="Enter MC-1 Breacked in Shifts" /></td>
                                    <td><s:textfield cssClass="form-control" name="form.remarks" value="%{remarks}" theme="simple" placeholder="Enter MC-1 Remarks" /></td>
                                </tr> 
                            </s:iterator>
                            <s:iterator value="dlist2">
                                <tr>    
                                    <td><s:textfield cssClass="form-control"  theme="simple" value="MC-2" name="form.carding" readonly="true"/></td>
                                    <td><s:textfield name="form.empId" cssClass="form-control" id="emp1" value="%{empId}" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{deliveryHank}" name="form.deliveryHank" id="value3" cssClass="form-control"  theme="simple" placeholder="Enter MC-2 Delivery Hank" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcSpeed}" name="form.mcSpeed" id="value4" cssClass="form-control two1"  theme="simple" placeholder="Enter MC-2 M/C Speed" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcRunning}" name="form.mcRunning" id="mid2" cssClass="form-control run mcspeed2 three1"  theme="simple" placeholder="Enter MC-2 M/C Running" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{expectedProduction}" readonly="true" name="form.expectedProduction" id="expect1" onmousemove="javascript:addNumbers1()" cssClass="form-control exp esp1"  theme="simple" placeholder="Enter MC-2 Expected Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{actualProduction}" name="form.actualProduction" id="actual1" cssClass="form-control acp acp2 four1"  theme="simple" placeholder="Enter MC-2 Actual Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{efficiency}" readonly="true" name="form.efficiency" id="eff1" onmousemove="javascript:efficiency1()" cssClass="form-control"  theme="simple" placeholder="Enter MC-2 Efficiency" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{breakedInShifts}" name="form.breakedInShifts" cssClass="form-control"  theme="simple" placeholder="Enter MC-2 Breacked in Shifts" /></td>
                                    <td><s:textfield cssClass="form-control" name="form.remarks" value="%{remarks}" theme="simple" placeholder="Enter MC-2 Remarks" /></td>
                                </tr> 
                            </s:iterator>
                            <s:iterator value="dlist3">
                                <tr>
                                    <td><s:textfield cssClass="form-control"  theme="simple" value="MC-3" name="form.carding" readonly="true"/></td>
                                    <td><s:textfield name="form.empId" cssClass="form-control" id="emp2" value="%{empId}" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{deliveryHank}" name="form.deliveryHank" id="value5" cssClass="form-control"  theme="simple" placeholder="Enter MC-3 Delivery Hank" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcSpeed}" name="form.mcSpeed" id="value6" cssClass="form-control two2"  theme="simple" placeholder="Enter MC-3 M/C Speed" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcRunning}" name="form.mcRunning" id="mid3" cssClass="form-control run mcspeed3 three2"  theme="simple" placeholder="Enter MC-3 M/C Running" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{expectedProduction}" readonly="true" name="form.expectedProduction" id="expect2" onmousemove="javascript:addNumbers2()" cssClass="form-control exp esp2"  theme="simple" placeholder="Enter MC-3 Expected Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{actualProduction}" name="form.actualProduction" id="actual2" cssClass="form-control acp acp3 four2"  theme="simple" placeholder="Enter MC-3 Actual Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{efficiency}" readonly="true" name="form.efficiency" id="eff2" onmousemove="javascript:efficiency2()" cssClass="form-control"  theme="simple" placeholder="Enter MC-3 Efficiency" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{breakedInShifts}" name="form.breakedInShifts" cssClass="form-control"  theme="simple" placeholder="Enter MC-3 Breacked in Shifts" /></td>
                                    <td><s:textfield cssClass="form-control" name="form.remarks" value="%{remarks}" theme="simple" placeholder="Enter MC-3 Remarks" /></td> 


                                </tr> 
                            </s:iterator>
                            <s:iterator value="dlist4">
                                <tr>

                                    <td><s:textfield cssClass="form-control"  theme="simple" value="MC-4" name="form.carding" readonly="true"/></td>
                                    <td><s:textfield name="form.empId" cssClass="form-control" id="emp3" value="%{empId}" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{deliveryHank}" name="form.deliveryHank" id="value7" cssClass="form-control"  theme="simple" placeholder="Enter MC-4 Delivery Hank" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcSpeed}" name="form.mcSpeed" id="value8" cssClass="form-control two3"  theme="simple" placeholder="Enter MC-4 M/C Speed" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcRunning}" name="form.mcRunning" id="mid4" cssClass="form-control run mcspeed4 three3"  theme="simple" placeholder="Enter MC-4 M/C Running" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{expectedProduction}" readonly="true" name="form.expectedProduction" id="expect3" onmousemove="javascript:addNumbers3()" cssClass="form-control exp esp3"  theme="simple" placeholder="Enter MC-4 Expected Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{actualProduction}" name="form.actualProduction" id="actual3" cssClass="form-control acp acp4 four3"  theme="simple" placeholder="Enter MC-4 Actual Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{efficiency}" readonly="true" name="form.efficiency" id="eff3" onmousemove="javascript:efficiency3()" cssClass="form-control"  theme="simple" placeholder="Enter MC-4 Efficiency" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{breakedInShifts}" name="form.breakedInShifts" cssClass="form-control"  theme="simple" placeholder="Enter MC-4 Breacked in Shifts" /></td>
                                    <td><s:textfield cssClass="form-control" name="form.remarks" value="%{remarks}" theme="simple" placeholder="Enter MC-4 Remarks" /></td>

                                </tr> 
                            </s:iterator>
                            <s:iterator value="dlist5">
                                <tr>

                                    <td><s:textfield cssClass="form-control"  theme="simple" value="MC-5" name="form.carding" readonly="true"/></td>
                                    <td><s:textfield name="form.empId" cssClass="form-control" id="emp4" value="%{empId}" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{deliveryHank}" name="form.deliveryHank" id="value9" cssClass="form-control"  theme="simple" placeholder="Enter MC-5 Delivery Hank" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcSpeed}" name="form.mcSpeed" id="value10" cssClass="form-control two4"  theme="simple" placeholder="Enter MC-5 M/C Speed" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{mcRunning}" name="form.mcRunning" id="mid5" cssClass="form-control run mcspeed5 three4"  theme="simple" placeholder="Enter MC-5 M/C Running" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{expectedProduction}" readonly="true" name="form.expectedProduction" id="expect4" onmousemove="javascript:addNumbers4()" cssClass="form-control exp esp4"  theme="simple" placeholder="Enter MC-5 Expected Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{actualProduction}" name="form.actualProduction" id="actual4" cssClass="form-control acp acp5 four4"  theme="simple" placeholder="Enter MC-5 Actual Production" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{efficiency}" readonly="true" name="form.efficiency" id="eff4" onmousemove="javascript:efficiency4()" cssClass="form-control price"  theme="simple" placeholder="Enter MC-5 Efficiency" /></td>
                                    <td><s:textfield onkeypress="return isNumberKey(event)" value="%{breakedInShifts}" name="form.breakedInShifts" cssClass="form-control"  theme="simple" placeholder="Enter MC-5 Breacked in Shifts" /></td>
                                    <td><s:textfield cssClass="form-control" name="form.remarks" value="%{remarks}"  theme="simple" placeholder="Enter MC-5 Remarks" /></td>

                                </tr> 
                            </s:iterator>
                            <s:iterator value="dlist">
                                <tr>

                                    <td colspan="5" class="text-center"><b>Total Production</b></td>
                                    <td><b><s:textfield id="total2" readonly="true" value="%{totalEp}" name="form.totalEp" theme="simple" cssClass="form-control" /></b></td>
                                    <td><b><s:textfield id="total3" readonly="true" value="%{totalAp}" name="form.totalAp" theme="simple" cssClass="form-control" /></b></td>
                                    <td><b><s:textfield id="eff5"  value="%{totalEfficiency}" name="form.totalEfficiency" readonly="true" theme="simple"   cssClass="form-control" /></b></td>
                                    <td colspan="2" />

                                </tr>
                            </s:iterator>
                        </table>
                    </div>
                    <br/>
                    <div class="form-group">
                        <div class="col-sm-6 text-center">
                            <s:submit value="Update"  cssClass="btn btn-primary" align="center"></s:submit> 

                            </div>
                            <div class="col-sm-6 text-center">
                                <button type="reset" class="btn btn-primary" >Cancel</button>
                        </div>
                    </div>

                </s:form>
            </center>

            <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                
 function updateAll()
 {
       var e=document.getElementById("emp").value;
       var d=document.getElementById("value1").value;  var d1=document.getElementById("value2").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp').focus();
              return false;
           }
       }
       var e=document.getElementById("emp1").value;
        var d=document.getElementById("value3").value;  var d1=document.getElementById("value4").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
              alert("Employee Id should not be empty");
              $('#emp1').val("");
              $('#emp1').focus();
              return false;
           }
       }
       var e=document.getElementById("emp2").value;
        var d=document.getElementById("value5").value;  var d1=document.getElementById("value6").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
              alert("Employee Id should not be empty");
              $('#emp2').val("");
              $('#emp2').focus();
              return false;
           }
       }
       var e=document.getElementById("emp3").value;
        var d=document.getElementById("value7").value;  var d1=document.getElementById("value8").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
              alert("Employee Id should not be empty");
              $('#emp3').val("");
              $('#emp3').focus();
              return false;
           }
       }
        var e=document.getElementById("emp4").value;
        var d=document.getElementById("value9").value;  var d1=document.getElementById("value10").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
              alert("Employee Id should not be empty");
              $('#emp4').val("");
              $('#emp4').focus();
              return false;
           }
       }
         var expect = $('.acp1').val();
         var expprod6 = document.getElementById("expect").value;
        if (parseFloat(expect) > parseFloat(expprod6))
         {
              alert("Actual Actual Production must be less than Expected Production");
              $('.acp1').val("");
              $('.acp1').focus();
              return false;
         } 
         var expect1 = $('.acp2').val();
         var expprod6 = document.getElementById("expect1").value;
        if (parseInt(expect1) > parseInt(expprod6))
         {
              alert("Actual Actual Production must be less than Expected Production");
              $('.acp2').val("");
              $('.acp2').focus();
              return false;
         } 
         var expect2 = $('.acp3').val();
         var expprod6 = document.getElementById("expect2").value;
        if (parseInt(expect2) > parseInt(expprod6))
         {
              alert("Actual Actual Production must be less than Expected Production");
              $('.acp3').val("");
              $('.acp3').focus();
              return false;
         } 
         var expect2 = $('.acp4').val();
         var expprod6 = document.getElementById("expect3").value;
        if (parseInt(expect2) > parseInt(expprod6))
         {
              alert("Actual Actual Production must be less than Expected Production");
              $('.acp4').val("");
              $('.acp4').focus();
              return false;
         } 
         var expect2 = $('.acp5').val();
         var expprod6 = document.getElementById("expect4").value;
        if (parseInt(expect2) > parseInt(expprod6))
         {
              alert("Actual Actual Production must be less than Expected Production");
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
             efficiency5(); 
       
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

           
           
                  $(document).ready(function () {
                      yourFunction();
                      name=$('.shitr').val();
                     
                  });
                  function yourFunction() {
                      var x = parseFloat(document.getElementById("check1").value);
                      if (x === 12345 || isNaN(x)) {
                          $("#one1").find("input,button,textarea,select").attr("disabled", "disabled");


                      } else {
                          $("#goButton").hide();
                          $("#part1").find("input,button,textarea,select").attr("disabled", "disabled");
                      }
                  }
                  
                  $(document).ready(function () {
                      
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
                                      
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");
                                              $('#emp').val("");
                                              $('#emp').focus();
                                             
                                          }
                                      }
                                  }
                              }

                          }

                      });
                      
                      
                      
                      $('#emp1').blur(function () {
                          if (($('#emp1').val()).length !== 0) {
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
                                      
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {                                          
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");
                                              $('#emp1').val("");
                                              $('#emp1').focus();
                                          }
                                      }
                                  }
                              }

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
                                      
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");
                                               $('#emp2').val("");
                                              $('#emp2').focus();
                                          }
                                      }
                                  }
                              }

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
                                      
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");
                                               $('#emp3').val("");
                                              $('#emp3').focus();
                                          }
                                      }
                                  }
                              }

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
                                      
                                  } else {
                                      if (i === (a2.valueOf() - 1)) {
                                          if (b.valueOf() !== "hello") {
                                              alert("Please enter valid Employee Id");
                                              $('#emp4').val("");
                                              $('#emp4').focus();
                                          }
                                      }
                                  }
                              }

                          }

                      });
                      });
                  
                  
                  
                  
                  
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
                        n = 0;
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
                        n = 0;
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
                        n = 0;
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
                        n = 0;
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
                        n = 0;
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
                        n = 0;
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
//                            $("#expect").val("");
//                            $("#expect").attr("readonly", true);
//                            $("#actual").val("");
//                            $("#actual").attr("readonly", true);
//                            $("#eff").val("");
//                            $("#eff").attr("readonly", true);
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
//                            $("#expect").val("");
//                            $("#expect").attr("readonly", true);
//                            $("#actual").val("");
//                            $("#actual").attr("readonly", true);
//                            $("#eff").val("");
//                            $("#eff").attr("readonly", true);
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
//                            $("#expect1").val("");
//                            $("#expect1").attr("readonly", true);
//                            $("#actual1").val("");
//                            $("#actual1").attr("readonly", true);
//                            $("#eff1").val("");
//                            $("#eff1").attr("readonly", true);
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
//                            $("#expect1").val("");
//                            $("#expect1").attr("readonly", true);
//                            $("#actual1").val("");
//                            $("#actual1").attr("readonly", true);
//                            $("#eff1").val("");
//                            $("#eff1").attr("readonly", true);
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
//                            $("#expect2").val("");
//                            $("#expect2").attr("readonly", true);
//                            $("#actual2").val("");
//                            $("#actual2").attr("readonly", true);
//                            $("#eff2").val("");
//                            $("#eff2").attr("readonly", true);
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
//                            $("#expect2").val("");
//                            $("#expect2").attr("readonly", true);
//                            $("#actual2").val("");
//                            $("#actual2").attr("readonly", true);
//                            $("#eff2").val("");
//                            $("#eff2").attr("readonly", true);
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
//                            $("#expect3").val("");
//                            $("#expect3").attr("readonly", true);
//                            $("#actual3").val("");
//                            $("#actual3").attr("readonly", true);
//                            $("#eff3").val("");
//                            $("#eff3").attr("readonly", true);
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
//                            $("#expect3").val("");
//                            $("#expect3").attr("readonly", true);
//                            $("#actual3").val("");
//                            $("#actual3").attr("readonly", true);
//                            $("#eff3").val("");
//                            $("#eff3").attr("readonly", true);
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
//                            $("#expect4").val("");
//                            $("#expect4").attr("readonly", true);
//                            $("#actual4").val("");
//                            $("#actual4").attr("readonly", true);
//                            $("#eff4").val("");
//                            $("#eff4").attr("readonly", true);
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
//                            $("#expect4").val("");
//                            $("#expect4").attr("readonly", true);
//                            $("#actual4").val("");
//                            $("#actual4").attr("readonly", true);
//                            $("#eff4").val("");
//                            $("#eff4").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();

                            // $(this).val("");
                        }
                    }
                });
                $('.acp').mouseenter(function () {

                    var sum = 0;
                    $('.acp').each(function () {
                        sum += Number($(this).val());
                    });

                    $('#total3').val(sum);

                });
                $(".acp1").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect").value;
                    if (parseInt(digit6) > parseInt(expprod6))

                    {
                        alert("Actual Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                        
                    } else {
                        // do something
                    }
                });
                $(".acp2").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect1").value;
                    if (parseInt(digit6) > parseInt(expprod6))

                    {
                        alert("Actual Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp3").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect2").value;
                    if (parseInt(digit6) > parseInt(expprod6))

                    {
                        alert("Actual Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp4").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect3").value;
                    if (parseInt(digit6) > parseInt(expprod6))

                    {
                        alert("Actual Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".acp5").change(function () {
                    var digit6 = $(this).val();
                    var expprod6 = document.getElementById("expect4").value;
                    if (parseInt(digit6) > parseInt(expprod6))

                    {
                        alert("Actual Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
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
        $('.three').attr("readonly", false);
                              $('.four').attr("readonly", false);
                              $('.esp').attr("readonly", false);
                                $("#eff").attr("readonly", false);
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
         $('.three1').attr("readonly", false);
                              $('.four1').attr("readonly", false);
                              $('.esp1').attr("readonly", false);
                                $("#eff1").attr("readonly", false);
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
         $('.three2').attr("readonly", false);
                              $('.four2').attr("readonly", false);
                              $('.esp2').attr("readonly", false);
                                $("#eff2").attr("readonly", false);
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
         $('.three3').attr("readonly", false);
                              $('.four3').attr("readonly", false);
                              $('.esp3').attr("readonly", false);
                                $("#eff3").attr("readonly", false);
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
         $('.three4').attr("readonly", false);
                              $('.four4').attr("readonly", false);
                              $('.esp4').attr("readonly", false);
                                $("#eff4").attr("readonly", false);
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