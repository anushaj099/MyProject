<%-- 
    Document   : CardingView
    Created on : Dec 26, 2016, 12:04:29 PM
    Author     : nsg
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
  <%--      <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage4.jsp" %>                  
        </s:iterator>
  --%>
  <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage4.jsp" %>
                    </s:if>
                </s:iterator>
        
        <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Carding Update</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>
                        
                        <s:form action="cardingUpdate" method="post" class="form-horizontal" onsubmit="return updateAll()">
                            <table>
                                <s:iterator value="list">
                                    <td><s:hidden name="pcard.id" value="%{id}" /></td>
                                    <td><s:hidden name="pcard.idc" value="%{idc}" /></td>
                                <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield name="pcard.date" id="i" readonly="true" label="Date" value="%{date1}" size="90" cssClass="form-control form-group" displayFormat="dd-mm-yy" /></td>
                                <td><s:textfield  name="pcard.superviser" value="%{superviser}" id="i" cssClass="form-control form-group" label="Supervisor" readonly="true" /></td>
                                <td><s:textfield id="i" name="pcard.shifts"  value="%{shifts}" cssClass="form-control shitr" onchange="findval(this.value)" label="Select Shift" requiredLabel="true" requiredPosition="left" readonly="true"/></td>
                                </s:iterator>
                            </table>


                            <div class="col-sm-12 text-center"><h3>Carding Material Data</h3></div>
                            <br/><br/><br/><br/>

                            <div class="tab1">
                                <table class="table table-bordered table-responsive">
                                    <tr>
                                        
                                        <th >Carding</th>
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
                                    <s:iterator value="glist2" status="rowstatus" var="obj1">
                                   <tr>
                                       <td><s:textfield name="pcard.carding" cssClass="form-control"  value="MC-1" theme="simple" readonly="true"></s:textfield></td>
                                      
                                           <td><s:textfield name="pcard.emId" id="emp" cssClass="form-control"  value="%{emId}" theme="simple"  placeholder="Employee id" readonly="true" ></s:textfield></td>
                                      
                                        <td><s:textfield name="pcard.hank" cssClass="form-control itema" value="%{deliveryHank}" onkeypress="return isNumberKey(this,event)" id="valu1" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control"  value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu2" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item2"  value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" id="expprod" cssClass="form-control price"  value="%{expectedProduction}" readonly="true" onmousemove="javascript:addNumbers()" onkeypress="return isNumberKey(this,event)" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act1 price2" value="%{actualProduction}" onkeypress="return isNumberKey(this,event)" id="digit1" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3"  value="%{efficiency}" readonly="true" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency1()" id="data1" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}" onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control"  value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                         </s:iterator>
                                        
                                        <s:iterator value="glist3" > 
                                        <tr>
                                        
                                        <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-2" theme="simple" readonly="true"></s:textfield></td>
                                      
                                                <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp1"  value="%{emId}"  theme="simple" placeholder="Employee id" ></s:textfield></td>
                                           
                                            <td><s:textfield name="pcard.hank" cssClass="form-control"  value="%{deliveryHank}"  onkeypress="return isNumberKey(this,event)" id="valu21" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control"  value="%{mcSpeed}"  onkeypress="return isNumberKey(this,event)" id="valu22" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item3"  value="%{mcRunning}"  onkeypress="return isNumberKey(this,event)" id="noBales1" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price"  value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers2()" id="expprod2" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act2 price2"  value="%{actualProduction}"   onkeypress="return isNumberKey(this,event)" id="digit2" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3"    value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency2()" id="data2" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control"  value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control"  value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>   
                                        </s:iterator> 
                                        
                                        <s:iterator value="glist4"  status="rowstatus" var="obj3">
                                        <tr> 
                                           
                                        <td><s:textfield name="pcard.carding" cssClass="form-control"    value="MC-3" theme="simple" readonly="true"></s:textfield></td>
                                        
                                                <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp2" value="%{emId}" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                          
                                            <td><s:textfield name="pcard.hank" cssClass="form-control"  value="%{deliveryHank}" onkeypress="return isNumberKey(this,event)" id="valu31" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu32" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item4" value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales2" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers3()" id="expprod3" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act3 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit3" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency3()" id="data3" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}"  placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                       </tr>
                                        </s:iterator>
                                        
                                        
                                       <s:iterator value="glist5" status="rowstatus" var="obj4">
                                        <tr>
                                             
                                      
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-4" theme="simple" readonly="true"></s:textfield></td>
                                       
                                                 <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp3"  value="%{emId}"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                          
                                                <td><s:textfield name="pcard.hank" cssClass="form-control" value="%{deliveryHank}"  onkeypress="return isNumberKey(this,event)" id="valu41" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu42" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item5" value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales3" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers4()" id="expprod4" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act4 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit4" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3"  value="%{efficiency}" readonly="true" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency4()" id="data4" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                </s:iterator>
                                        
                                        
                                        <s:iterator value="glist6" status="rowstatus" var="obj5">
                                        <tr>
                                              
                                       
                                            <td><s:textfield name="pcard.carding" cssClass="form-control"    value="MC-5" theme="simple" readonly="true"></s:textfield></td>
                                       
                                                <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp4" value="%{emId}"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                           
                                                <td><s:textfield name="pcard.hank" cssClass="form-control" value="%{deliveryHank}" onkeypress="return isNumberKey(this,event)" id="valu51" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu52" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item6" value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales4" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers5()" id="expprod5" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act5 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit5" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency5()" id="data5" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                </s:iterator>
                                        
                                        
                                            <s:iterator value="glist7" status="rowstatus" var="obj6">
                                        <tr>
                                            
                                        
                                            <td><s:textfield name="pcard.carding" cssClass="form-control"  value="MC-6" theme="simple" readonly="true"></s:textfield></td>
                                        
                                               <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp5" value="%{emId}"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                           
                                                <td><s:textfield name="pcard.hank" cssClass="form-control"  value="%{deliveryHank}"  onkeypress="return isNumberKey(this,event)" id="valu61" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu62" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item7" value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales5" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers6()" id="expprod6" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act6 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit6" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency6()" id="data6" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                </s:iterator>
                                        
                                        <s:iterator value="glist8" status="rowstatus" var="obj7">
                                        <tr>
                                            
                                       
                                            <td><s:textfield name="pcard.carding" cssClass="form-control"   value="MC-7" theme="simple" readonly="true"></s:textfield></td>
                                        
                                                <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp6" value="%{emId}"  theme="simple" placeholder="Employee id" ></s:textfield></td>
                                           
                                                <td><s:textfield name="pcard.hank" cssClass="form-control"  value="%{deliveryHank}" onkeypress="return isNumberKey(this,event)" id="valu71" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu72" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item8" value="%{mcRunning}"  onkeypress="return isNumberKey(this,event)" id="noBales6" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers7()" id="expprod7" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act7 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit7" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency7()" id="data7" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                </s:iterator>
                                        
                                        
                                        
                                        
                                        <s:iterator value="glist9" status="rowstatus" var="obj8">
                                        <tr>
                                            
                                       
                                            <td><s:textfield name="pcard.carding" cssClass="form-control"   value="MC-8" theme="simple" readonly="true"></s:textfield></td>
                                      
                                                <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp7" value="%{emId}"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                           
                                                <td><s:textfield name="pcard.hank" cssClass="form-control"  value="%{deliveryHank}"  onkeypress="return isNumberKey(this,event)" id="valu81" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu82" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item9" value="%{mcRunning}"  onkeypress="return isNumberKey(this,event)" id="noBales7" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers8()" id="expprod8" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act8 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit8" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency8()" id="data8" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"   onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}"  placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                </s:iterator>
                                        
                                        
                                        <s:iterator value="glist10" status="rowstatus" var="obj9">
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control"  value="MC-9" theme="simple" readonly="true"></s:textfield></td>
                                        
                                                 <td><s:textfield name="pcard.emId" id="emp8" cssClass="form-control" value="%{emId}"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                           
                                                <td><s:textfield name="pcard.hank" cssClass="form-control" value="%{deliveryHank}"  onkeypress="return isNumberKey(this,event)" id="valu91" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu92" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item10" value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales8" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers9()" id="expprod9" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act9 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit9" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency9()" id="data9" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                </s:iterator>
                                        
                                        
                                        <s:iterator value="glist11" status="rowstatus" var="obj10">
                                        <tr>
                                              
                                        
                                            <td><s:textfield name="pcard.carding" cssClass="form-control"   value="MC-10" theme="simple" readonly="true"></s:textfield></td>
                                      
                                                <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp9" value="%{emId}"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                          
                                                <td><s:textfield name="pcard.hank" cssClass="form-control" value="%{deliveryHank}"  onkeypress="return isNumberKey(this,event)" id="valu101" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control" value="%{mcSpeed}" onkeypress="return isNumberKey(this,event)" id="valu102" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control item11" value="%{mcRunning}" onkeypress="return isNumberKey(this,event)" id="noBales9" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" cssClass="form-control price" value="%{expectedProduction}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:addNumbers10()" id="expprod10" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control act10 price2" value="%{actualProduction}"  onkeypress="return isNumberKey(this,event)" id="digit10" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" cssClass="form-control price3" value="%{efficiency}" readonly="true"  onkeypress="return isNumberKey(this,event)" onmousemove="javascript:efficiency10()" id="data10" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control" value="%{breakedInShifts}"  onkeypress="return isDecimalKey(event)" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control" value="%{remarks}" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                </s:iterator>
                                        
                                        
                                        <s:iterator value="list" status="rowstatus">
                                                              <tr>
                                            <td colspan="5" class="text-center"><b>Total Production</b></td>
                                            <td><b><s:textfield name="pcard.totalExpectedProduction"  id="totalPrice1"  value="%{totalExpectedProduction}" readonly="true" cssClass="form-control" placeholder="Enter Total Expected production" theme="simple"></s:textfield>   </b></td>
                                            <td><b><s:textfield name="pcard.totalActualProduction" id="totalPrice2"  value="%{totalActualProduction}" readonly="true" cssClass="form-control" placeholder="Enter Total Actual production" theme="simple" onclick="javascript:addDigits()"></s:textfield> </b></td>
                                            <td><b><s:textfield name="pcard.totalEfficiency" id="totalPrice3" value="%{totalEfficiency}" readonly="true" cssClass="form-control" onclick="javascript:efficiency11()" placeholder="Enter Total Efficiency" theme="simple" ></s:textfield> </b></td>
                                            <td colspan="2" ></td>
                                        </tr>
                                        </s:iterator>

                                    </table>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-6 text-center">
                                    <s:submit value="Update" cssClass="btn btn-primary" align="center"></s:submit> 

                                    </div>
                                    <div class="col-sm-6 text-center">
                                    <button type="reset" class="btn btn-primary" >Cancel</button>
                                    </div>
                                </div>
                        </s:form>
                    </center>
 </div>
              
                    <script language="javascript">
                        
                function findval(item) {
                    name = item;
                }
              function addNumbers() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu1").value);
                    var y = parseFloat(document.getElementById("valu2").value);
                    var z = parseFloat(document.getElementById("noBales").value);
                    if (name === 'Shift1' || name === 'Shift2') {

                       sum = ((((0.2836*y)/x)/8/60)*z);
                     
                        n = sum.toFixed(3);
                     
                    } else if (name === 'Shift3') {

                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers2() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu21").value);
                    var y = parseFloat(document.getElementById("valu22").value);
                    var z = parseFloat(document.getElementById("noBales1").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod2");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers3() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu31").value);
                    var y = parseFloat(document.getElementById("valu32").value);
                    var z = parseFloat(document.getElementById("noBales2").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                       sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod3");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers4() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu41").value);
                    var y = parseFloat(document.getElementById("valu42").value);
                    var z = parseFloat(document.getElementById("noBales3").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                         sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod4");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers5() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu51").value);
                    var y = parseFloat(document.getElementById("valu52").value);
                    var z = parseFloat(document.getElementById("noBales4").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod5");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers6() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu61").value);
                    var y = parseFloat(document.getElementById("valu62").value);
                    var z = parseFloat(document.getElementById("noBales5").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                       sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                       sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod6");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers7() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu71").value);
                    var y = parseFloat(document.getElementById("valu72").value);
                    var z = parseFloat(document.getElementById("noBales6").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                         sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod7");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers8() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu81").value);
                    var y = parseFloat(document.getElementById("valu82").value);
                    var z = parseFloat(document.getElementById("noBales7").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod8");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers9() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu91").value);
                    var y = parseFloat(document.getElementById("valu92").value);
                    var z = parseFloat(document.getElementById("noBales8").value);
                    if (name === 'Shift1' || name === 'Shift2') {

                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                         sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod9");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
                function addNumbers10() {
                    var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu101").value);
                    var y = parseFloat(document.getElementById("valu102").value);
                    var z = parseFloat(document.getElementById("noBales9").value);
                    if (name === 'Shift1' || name === 'Shift2') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    } else if (name === 'Shift3') {
                        sum = ((((0.2836*y)/x)/8/60)*z);
                        n = sum.toFixed(3);
                    }
                    var z = document.getElementById("expprod10");
                    if (isNaN(n))
                        n = "";
                    z.value = n;
                }
 
$(".act1").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act2").change(function () {
                    var act2 = $(this).val();
                    var expprod1 = document.getElementById("expprod2").value;
                    if (parseFloat(act2) > parseFloat(expprod1))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act3").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod3").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act4").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod4").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act5").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod5").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act6").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod6").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                       alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act7").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod7").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act8").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod8").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act9").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod9").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                       alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                $(".act10").change(function () {
                    var act1 = $(this).val();
                    var expprod = document.getElementById("expprod10").value;
                    if (parseFloat(act1) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $(this).val("");
                        $(this).focus();
                    } else {
                        // do something
                    }
                });
                
                
                
               $(document).ready(function () {  
                   name=$('.shitr').val();
                  
                   
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
                                                        
                                                        $(this).val("");
                                                        $(this).focus();

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
                                                        $(this).val("");
                                                        $(this).focus();
                                                        
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
                                                        $(this).val("");
                                                        $(this).focus();
//                                                        $("#valu21").attr("readonly", true);
//                                                        $("#valu21").val("");
//                                                        $("#valu22").attr("readonly", true);
//                                                        $("#valu22").val("");
//                                                        $("#noBales1").val("");
//                                                        $("#noBales1").attr("readonly", true);
//                                                        $("#expprod2").val("");
//                                                        $("#expprod2").attr("readonly", true);
//                                                        $("#digit2").val("");
//                                                        $("#digit2").attr("readonly", true);
//                                                        $("#data2").val("");
//                                                        $("#data2").attr("readonly", true);
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
                                                $("#valu41").attr("readonly", false);
                                                $("#valu41").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
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
                                                $("#valu41").attr("readonly", false);
                                                $("#valu51").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });
                                
                                
                                $('#emp5').blur(function () {
                                    if (($('#emp5').val()).length !== 0) {
                                        var a = parseInt($('#emp5').val());
                                        var a1 = new Array();
                                        a1 =<s:property value="elist"/>;
                                        var b = a1[0];
                                        var a2 = a1.length;

                                        for (var i = 0; i < a2; i++) {
                                            var a3 = parseInt(a1[i]);
                                            var b;
                                            if (a.valueOf() === a3.valueOf()) {
                                                b = "hello";
                                                $("#valu41").attr("readonly", false);
                                                $("#valu61").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });
                                
                                
                                $('#emp6').blur(function () {
                                    if (($('#emp6').val()).length !== 0) {
                                        var a = parseInt($('#emp6').val());
                                        var a1 = new Array();
                                        a1 =<s:property value="elist"/>;
                                        var b = a1[0];
                                        var a2 = a1.length;

                                        for (var i = 0; i < a2; i++) {
                                            var a3 = parseInt(a1[i]);
                                            var b;
                                            if (a.valueOf() === a3.valueOf()) {
                                                b = "hello";
                                                $("#valu41").attr("readonly", false);
                                                $("#valu71").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });
$('#emp7').blur(function () {
                                    if (($('#emp7').val()).length !== 0) {
                                        var a = parseInt($('#emp7').val());
                                        var a1 = new Array();
                                        a1 =<s:property value="elist"/>;
                                        var b = a1[0];
                                        var a2 = a1.length;

                                        for (var i = 0; i < a2; i++) {
                                            var a3 = parseInt(a1[i]);
                                            var b;
                                            if (a.valueOf() === a3.valueOf()) {
                                                b = "hello";
                                                $("#valu41").attr("readonly", false);
                                                $("#valu81").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });



$('#emp8').blur(function () {
                                    if (($('#emp8').val()).length !== 0) {
                                        var a = parseInt($('#emp8').val());
                                        var a1 = new Array();
                                        a1 =<s:property value="elist"/>;
                                        var b = a1[0];
                                        var a2 = a1.length;

                                        for (var i = 0; i < a2; i++) {
                                            var a3 = parseInt(a1[i]);
                                            var b;
                                            if (a.valueOf() === a3.valueOf()) {
                                                b = "hello";
                                                $("#valu41").attr("readonly", false);
                                                $("#valu91").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });



$('#emp9').blur(function () {
                                    if (($('#emp9').val()).length !== 0) {
                                        var a = parseInt($('#emp9').val());
                                        var a1 = new Array();
                                        a1 =<s:property value="elist"/>;
                                        var b = a1[0];
                                        var a2 = a1.length;

                                        for (var i = 0; i < a2; i++) {
                                            var a3 = parseInt(a1[i]);
                                            var b;
                                            if (a.valueOf() === a3.valueOf()) {
                                                b = "hello";
                                                $("#valu41").attr("readonly", false);
                                                $("#valu101").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
//                                                        $("#valu41").val("");
//                                                        $("#valu41").attr("readonly", true);
//                                                        $("#valu42").val("");
//                                                        $("#valu42").attr("readonly", true);
//                                                        $("#noBales3").val("");
//                                                        $("#noBales3").attr("readonly", true);
//                                                        $("#expprod4").val("");
//                                                        $("#expprod4").attr("readonly", true);
//                                                        $("#digit4").val("");
//                                                        $("#digit4").attr("readonly", true);
//                                                        $("#data4").val("");
//                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });


                                });
                                
                                
                                
                                
                
                
                
function efficiency1(){
    var x=parseFloat(document.getElementById("expprod").value);
    var y=parseFloat(document.getElementById("digit1").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data1");
    res.value=z;
}
function efficiency2(){
    var x=parseFloat(document.getElementById("expprod2").value);
    var y=parseFloat(document.getElementById("digit2").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data2");
    res.value=z;
}
function efficiency3(){
    var x=parseFloat(document.getElementById("expprod3").value);
    var y=parseFloat(document.getElementById("digit3").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data3");
    res.value=z;
}
function efficiency4(){
    var x=parseFloat(document.getElementById("expprod4").value);
    var y=parseFloat(document.getElementById("digit4").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data4");
    res.value=z;
}
function efficiency5(){
    var x=parseFloat(document.getElementById("expprod5").value);
    var y=parseFloat(document.getElementById("digit5").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data5");
    res.value=z;
}
function efficiency6(){
    var x=parseFloat(document.getElementById("expprod6").value);
    var y=parseFloat(document.getElementById("digit6").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data6");
    res.value=z;
}
function efficiency7(){
    var x=parseFloat(document.getElementById("expprod7").value);
    var y=parseFloat(document.getElementById("digit7").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data7");
    res.value=z;
}
 function efficiency8(){
    var x=parseFloat(document.getElementById("expprod8").value);
    var y=parseFloat(document.getElementById("digit8").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data8");
    res.value=z;
} 
function efficiency9(){
    var x=parseFloat(document.getElementById("expprod9").value);
    var y=parseFloat(document.getElementById("digit9").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data9");
    res.value=z;
}
function efficiency10(){
    var x=parseFloat(document.getElementById("expprod10").value);
    var y=parseFloat(document.getElementById("digit10").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("data10");
    res.value=z;
}
function efficiency11(){
    var x=parseFloat(document.getElementById("totalPrice1").value);
    var y=parseFloat(document.getElementById("totalPrice2").value);
    var n=(y/x)*100;
    var z=n.toFixed(3);
    if(isNaN(n)||isNaN(y)||isNaN(x)||y===0||x===0)
        z=0;
    var res=document.getElementById("totalPrice3");
    res.value=z;
}
 $('.price3').mouseenter(function () {
                    efficiency11();
                });

$(".item2").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });

$(".item3").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });

$(".item4").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });
                
                
$(".item5").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });
$(".item6").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });                
       
$(".item7").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });
$(".item8").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });
$(".item9").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });  
$(".item10").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });
$(".item11").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            
                            $(this).val("");
                            $(this).focus();
                        }
                    }
                });
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
                
                
                 var content = $('#valu1').val();
$('#valu1').keyup(function() { 
        if ($('#valu1').val() !== content) {
             addNumbers();
              efficiency1();
          }
});
 
                 var content = $('#valu2').val();
$('#valu2').keyup(function() { 
        if ($('#valu2').val() !== content) {
             addNumbers();
              efficiency1();
          }
});
 var content = $('#valu21').val();
$('#valu21').keyup(function() { 
        if ($('#valu21').val() !== content) {
             addNumbers2();
              efficiency2();
          }
});
 var content = $('#valu22').val();
$('#valu22').keyup(function() { 
        if ($('#valu22').val() !== content) {
             addNumbers2();
              efficiency2();
          }
});
 var content = $('#valu31').val();
$('#valu31').keyup(function() { 
        if ($('#valu31').val() !== content) {
             addNumbers3();
              efficiency3();
          }
});
var content = $('#valu32').val();
$('#valu32').keyup(function() { 
        if ($('#valu32').val() !== content) {
             addNumbers3();
              efficiency3();
          }
});
var content = $('#valu41').val();
$('#valu41').keyup(function() { 
        if ($('#valu41').val() !== content) {
             addNumbers4();
              efficiency4();
          }
});
var content = $('#valu42').val();
$('#valu42').keyup(function() { 
        if ($('#valu42').val() !== content) {
             addNumbers4();
              efficiency4();
          }
});
var content = $('#valu51').val();
$('#valu51').keyup(function() { 
        if ($('#valu51').val() !== content) {
             addNumbers5();
              efficiency5();
          }
});
var content = $('#valu52').val();
$('#valu52').keyup(function() { 
        if ($('#valu52').val() !== content) {
             addNumbers5();
              efficiency5();
          }
});
var content = $('#valu61').val();
$('#valu61').keyup(function() { 
        if ($('#valu61').val() !== content) {
             addNumbers6();
              efficiency6();
          }
});
var content = $('#valu62').val();
$('#valu62').keyup(function() { 
        if ($('#valu62').val() !== content) {
             addNumbers6();
              efficiency6();
          }
});
var content = $('#valu71').val();
$('#valu71').keyup(function() { 
        if ($('#valu71').val() !== content) {
             addNumbers7();
              efficiency7();
          }
});
var content = $('#valu72').val();
$('#valu72').keyup(function() { 
        if ($('#valu72').val() !== content) {
             addNumbers7();
              efficiency7();
          }
});
var content = $('#valu81').val();
$('#valu81').keyup(function() { 
        if ($('#valu81').val() !== content) {
             addNumbers8();
              efficiency8();
          }
});
var content = $('#valu82').val();
$('#valu82').keyup(function() { 
        if ($('#valu82').val() !== content) {
             addNumbers8();
              efficiency8();
          }
});
var content = $('#valu91').val();
$('#valu91').keyup(function() { 
        if ($('#valu91').val() !== content) {
             addNumbers9();
              efficiency9();
          }
});
var content = $('#valu92').val();
$('#valu92').keyup(function() { 
        if ($('#valu92').val() !== content) {
             addNumbers9();
              efficiency9();
          }
});
var content = $('#valu101').val();
$('#valu101').keyup(function() { 
        if ($('#valu101').val() !== content) {
             addNumbers10();
              efficiency10();
          }
});
var content = $('#valu102').val();
$('#valu102').keyup(function() { 
        if ($('#valu102').val() !== content) {
             addNumbers10();
              efficiency10();
          }
});
      
      
      function updateAll()
 {
      var e=document.getElementById("emp").value;
       var d=document.getElementById("valu1").value;  var d1=document.getElementById("valu2").value;
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
       var d=document.getElementById("valu21").value;  var d1=document.getElementById("valu22").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp1').focus();
              return false;
           }
       }
       var e=document.getElementById("emp2").value;
       var d=document.getElementById("valu31").value;  var d1=document.getElementById("valu32").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp2').focus();
              return false;
           }
       }
        var e=document.getElementById("emp3").value;
       var d=document.getElementById("valu41").value;  var d1=document.getElementById("valu42").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp3').focus();
              return false;
           }
       }
        var e=document.getElementById("emp4").value;
       var d=document.getElementById("valu51").value;  var d1=document.getElementById("valu52").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp4').focus();
              return false;
           }
       }
       var e=document.getElementById("emp5").value;
       var d=document.getElementById("valu61").value;  var d1=document.getElementById("valu62").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp5').focus();
              return false;
           }
       }
        var e=document.getElementById("emp6").value;
       var d=document.getElementById("valu71").value;  var d1=document.getElementById("valu72").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp6').focus();
              return false;
           }
       }
        var e=document.getElementById("emp7").value;
       var d=document.getElementById("valu81").value;  var d1=document.getElementById("valu82").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp7').focus();
              return false;
           }
       }
       var e=document.getElementById("emp8").value;
       var d=document.getElementById("valu91").value;  var d1=document.getElementById("valu92").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp8').focus();
              return false;
           }
       }
       var e=document.getElementById("emp9").value;
       var d=document.getElementById("valu101").value;  var d1=document.getElementById("valu102").value;
        if(d.length!==0 || d1.length!==0)
        {
           if ((e === "" ) ||  (e.length ===0)) 
           {
             alert("Employee Id should not be empty");
             $('#emp9').focus();
              return false;
           }
       }
        var act1 = $('.act1').val();
         var expprod = document.getElementById("expprod").value;
        if (parseFloat(act1) > parseFloat(expprod))
         {
              alert("Actual Production must be less than Expected Production");
                        $('.act1').val("");
                        $('.act1').focus();
              return false;
         } 
         
          var act2 = $('.act2').val();
                    var expprod1 = document.getElementById("expprod2").value;
                    if (parseFloat(act2) > parseFloat(expprod1))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $('.act2').val("");
                        $('.act2').focus();
              return false;
                    } 
          var act3 = $('.act3').val();
                    var expprod = document.getElementById("expprod3").value;
                    if (parseFloat(act3) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $('.act3').val("");
                        $('.act3').focus();
              return false;
                    }
                     var act4 = $('.act4').val();
                    var expprod = document.getElementById("expprod4").value;
                    if (parseFloat(act4) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $('.act4').val("");
                        $('.act4').focus();
              return false;
                    }
                    var act5 = $('.act5').val();
                    var expprod = document.getElementById("expprod5").value;
                    if (parseFloat(act5) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $('.act5').val("");
                        $('.act5').focus();
              return false;
                    }
                    var act5 = $('.act6').val();
                    var expprod = document.getElementById("expprod6").value;
                    if (parseFloat(act5) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $('.act6').val("");
                        $('.act6').focus();
              return false;
                    }
                    var act5 = $('.act7').val();
                    var expprod = document.getElementById("expprod7").value;
                    if (parseFloat(act5) > parseFloat(expprod))

                    {
                         alert("Actual Production must be less than Expected Production");
                        $('.act7').val("");
                        $('.act7').focus();
              return false;
                    }
                    var act5 = $('.act8').val();
                    var expprod = document.getElementById("expprod8").value;
                    if (parseFloat(act5) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $('.act8').val("");
                        $('.act8').focus();
              return false;
                    }
                     var act5 = $('.act9').val();
                    var expprod = document.getElementById("expprod9").value;
                    if (parseFloat(act5) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $('.act9').val("");
                        $('.act9').focus();
              return false;
                    }
                    var act5 = $('.act10').val();
                    var expprod = document.getElementById("expprod10").value;
                    if (parseFloat(act5) > parseFloat(expprod))

                    {
                        alert("Actual Production must be less than Expected Production");
                        $('.act10').val("");
                        $('.act10').focus();
              return false;
                    }
                   
                     addNumbers(); 
                         addNumbers2();  addNumbers3();  addNumbers4();  addNumbers5();  addNumbers6();  addNumbers7(); 
                          addNumbers8();  addNumbers9();  addNumbers10(); 
                   
                    efficiency1();
                    efficiency2();
                    efficiency3();
                    efficiency4();
                    efficiency5();
                    efficiency6();
                    efficiency7();
                    efficiency8();
                    efficiency9();
                    efficiency10();
                    
                
                          
                   var sum = 0;
                    $('.price').each(function () {
                        sum += Number($(this).val());
                    });
                    $('#totalPrice1').val(sum);
                    
                    
                     var sum = 0;
                    $('.price2').each(function () {
                        sum += Number($(this).val());
                    });
                    $('#totalPrice2').val(sum);
                    
                    
                     efficiency11();
                     
                       var x = $("#totalPrice1").val();
                                var y = $("#totalPrice2").val();

                                if ((x === '0' || y === '0') || (($("#totalPrice1").val()).length === 0 || ($("#totalPrice2").val()).length === 0 || ($("#totalPrice3").val()).length === 0)) {
                                    alert("Please fill Carding Material Data");
                                    $('#emp').focus();
                                    return false;
                                }
                                
                                
                       
                                
                }
          
                    </script>


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
               

                <!-- /.container -->

    </body>
    
</html>

