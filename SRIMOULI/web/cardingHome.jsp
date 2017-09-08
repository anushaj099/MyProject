<%-- 
    Document   : cardingHome
    Created on : Dec 9, 2016, 11:43:24 AM
    Author     : Swathi
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
        <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage2.jsp" %>                  
        </s:iterator>

        <div class="container">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sri Mouli Textiles Private Limited Carding Data</h1>
                </div>
            </div>
            <!-- /.row -->

            <!-- Projects Row -->
            <div class="row">
                <center>

                    <s:form action="Cardinginsert" method="post" class="form-horizontal" >
                        <table id="part1">

                            <td><s:hidden name="id" value="%{id}" /></td>
                            <td><sj:datepicker readonly="true" name="pcard.dat" id="i" maxDate="true" changeMonth="true" changeYear="true"  label="Date "  size="90"  displayFormat="dd-mm-yy" cssClass="lab" placeholder="dd-mm-yyyy"/> </td>

                            <td><s:select name="pcard.superviser" id="i" cssClass="form-control " label="Supervisor"  list="superList" headerKey="-1" headerValue="-- Select Supervisor --"/></td>

                            <td><s:select id="i"  name="pcard.shifts" list="{'Shift1','Shift2','Shift3'}" onchange="findval(this.value)" label="Select Shift" headerKey="-1" headerValue=" --Select Shift-- " cssClass="form-control shift"/></td>
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
                        <s:form action="CardinginsertReal" enctype="multipart/form-data" method="post" onsubmit="return addAll()">
                            <div class="col-sm-12 text-center"><h3>Carding Material Data</h3></div>
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
                                        <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-1" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control itema one"  onkeypress="return isNumberKey(this,event)" id="valu1" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two"  onkeypress="return isNumberKey(this,event)" id="valu2" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three item2" onkeypress="return isNumberKey(this,event)" id="noBales" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" id="expprod" cssClass="form-control price esp" onfocus="javascript:addNumbers()" onkeypress="return isNumberKey(this,event)" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act1 four" onkeypress="return isNumberKey(this,event)" id="digit1" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency1()" id="data1" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five" onkeypress="return isDecimalKey(event)" id="no11Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six" id="no12Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                        <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-2" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp1" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one1" onkeypress="return isNumberKey(this,event)" id="valu21" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two1" onkeypress="return isNumberKey(this,event)" id="valu22" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three1 item3" onkeypress="return isNumberKey(this,event)" id="noBales1" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp1" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers2()" id="expprod2" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act2 four1" onkeypress="return isNumberKey(this,event)" id="digit2" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency2()" id="data2" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five1" onkeypress="return isDecimalKey(event)" id="no21Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six1" id="no22Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-3" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp2" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one2" onkeypress="return isNumberKey(this,event)" id="valu31" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two2" onkeypress="return isNumberKey(this,event)" id="valu32" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three2 item4" onkeypress="return isNumberKey(this,event)" id="noBales2" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp2" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers3()" id="expprod3" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act3 four2" onkeypress="return isNumberKey(this,event)" id="digit3" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency3()" id="data3" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five2" onkeypress="return isDecimalKey(event)" id="no31Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six2" id="no32Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-4" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp3" theme="simple" placeholder="Employee id"></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one3" onkeypress="return isNumberKey(this,event)" id="valu41" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two3" onkeypress="return isNumberKey(this,event)" id="valu42" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three3 item5" onkeypress="return isNumberKey(this,event)" id="noBales3" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers4()" id="expprod4" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act4 four3" onkeypress="return isNumberKey(this,event)" id="digit4" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency4()" id="data4" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five3" onkeypress="return isDecimalKey(event)" id="no41Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six3" id="no42Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-5" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control"  theme="simple" id="emp4" placeholder="Employee id"></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one4" onkeypress="return isNumberKey(this,event)" id="valu51" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two4" onkeypress="return isNumberKey(this,event)" id="valu52" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three4 item6" onkeypress="return isNumberKey(this,event)" id="noBales4" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp4" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers5()" id="expprod5" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act5 four4" onkeypress="return isNumberKey(this,event)" id="digit5" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency5()" id="data5" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five4" onkeypress="return isDecimalKey(event)" id="no51Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six4" id="no52Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-6" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp5" theme="simple" placeholder="Employee id"></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one5" onkeypress="return isNumberKey(this,event)" id="valu61" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two5" onkeypress="return isNumberKey(this,event)" id="valu62" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three5 item7" onkeypress="return isNumberKey(this,event)" id="noBales5" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp5" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers6()" id="expprod6" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act6 four5" onkeypress="return isNumberKey(this,event)" id="digit6" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency6()" id="data6" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five5" onkeypress="return isDecimalKey(event)" id="no61Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six5" id="no62Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-7" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp6" theme="simple" placeholder="Employee id" ></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one6" onkeypress="return isNumberKey(this,event)" id="valu71" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two6" onkeypress="return isNumberKey(this,event)" id="valu72" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three6 item8" onkeypress="return isNumberKey(this,event)" id="noBales6" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp6" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers7()" id="expprod7" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act7 four6" onkeypress="return isNumberKey(this,event)" id="digit7" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency7()" id="data7" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five6" onkeypress="return isDecimalKey(event)" id="no71Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six6" id="no72Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-8" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp7" theme="simple" placeholder="Employee id"></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one7" onkeypress="return isNumberKey(this,event)" id="valu81" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two7" onkeypress="return isNumberKey(this,event)" id="valu82" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three7 item9" onkeypress="return isNumberKey(this,event)" id="noBales7" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp7" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers8()" id="expprod8" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act8 four7" onkeypress="return isNumberKey(this,event)" id="digit8" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency8()" id="data8" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five7" onkeypress="return isDecimalKey(event)" id="no81Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six7" id="no81Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-9" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp8"  theme="simple" placeholder="Employee id"></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one8" onkeypress="return isNumberKey(this,event)" id="valu91" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two8" onkeypress="return isNumberKey(this,event)" id="valu92" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three8 item10" onkeypress="return isNumberKey(this,event)" id="noBales8" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp8" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers9()" id="expprod9" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act9 four8" onkeypress="return isNumberKey(this,event)" id="digit9" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency9()" id="data9" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five8" onkeypress="return isDecimalKey(event)" id="no91Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six8" id="no92Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td><s:textfield name="pcard.carding" cssClass="form-control" value="MC-10" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                        <td><s:textfield name="pcard.emId" cssClass="form-control" id="emp9" theme="simple" placeholder="Employee id"></s:textfield></td>
                                        <td><s:textfield name="pcard.hank" cssClass="form-control one9" onkeypress="return isNumberKey(this,event)" id="valu101" placeholder="Enter MC-1 Delivery Hank" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.mcspeed" cssClass="form-control  two9" onkeypress="return isNumberKey(this,event)" id="valu102" placeholder="Enter MC-1 M/C Speed" theme="simple" ></s:textfield></td>
                                        <td><s:textfield name="pcard.mcrun" cssClass="form-control three9 item11" onkeypress="return isNumberKey(this,event)" id="noBales9" placeholder="Enter MC-1 M/C Running" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.exp" readonly="true" cssClass="form-control price esp9" onkeypress="return isNumberKey(this,event)" onfocus="javascript:addNumbers10()" id="expprod10" placeholder="Enter MC-1 Expected Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.act" cssClass="form-control price2 act10 four9" onkeypress="return isNumberKey(this,event)" id="digit10" placeholder="Enter MC-1 Actual Production" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.effic" readonly="true" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" onfocus="javascript:efficiency10()" id="data10" placeholder="Enter MC-1 Efficiency" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.brek" cssClass="form-control five9" onkeypress="return isDecimalKey(event)" id="no101Bales" placeholder="Enter MC-1 Breacked in Shifts" theme="simple"></s:textfield></td>
                                        <td><s:textfield name="pcard.remk" cssClass="form-control six9" id="no102Bales" placeholder="Enter MC-1 Remarks" theme="simple"></s:textfield></td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-center"><b>Total Production</b></td>
                                            <td><b><s:textfield name="pcard.totalExpectedProduction" readonly="true" id="totalPrice1" cssClass="form-control" placeholder="Enter Total Expected production" theme="simple"></s:textfield>   </b></td>
                                        <td><b><s:textfield name="pcard.totalActualProduction" readonly="true" id="totalPrice2" cssClass="form-control" placeholder="Enter Total Actual production" theme="simple" onclick="javascript:addDigits()"></s:textfield> </b></td>
                                        <td><b><s:textfield name="pcard.totalEfficiency" readonly="true" id="totalPrice3" cssClass="form-control" onclick="javascript:efficiency11()" placeholder="Enter Total Efficiency" theme="simple" ></s:textfield> </b></td>
                                            <td colspan="2" ></td>
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
                </center>
            </div>
            <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>

            <script type="text/javascript">
                
                function addAll(){
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
                
                            $(document).ready(function () {
                                yourFunction();
                                $('.one').attr("readonly", true);
                                $('.two').attr("readonly", true);
                                $('.three').attr("readonly", true);
                                $('.four').attr("readonly", true);
                                $('.esp').attr("readonly", true);


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
                                                $("#valu1").attr("readonly", false);
                                                $("#valu1").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $("#valu1").val("");
                                                        $("#valu1").attr("readonly", true);
                                                        $("#valu2").val("");
                                                        $("#valu2").attr("readonly", true);
                                                        $("#noBales").val("");
                                                        $("#noBales").attr("readonly", true);
                                                        $("#expprod").val("");
                                                        $("#expprod").attr("readonly", true);
                                                        $("#digit1").val("");
                                                        $("#digit1").attr("readonly", true);
                                                        $("#data1").val("");
                                                        $("#data1").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();

                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu1").blur(function () {
                                    $("#emp").focus(function () {

                                        $("#emp").keyup(function () {
                                            if (($("#emp").val()).length === 0) {
                                                $("#valu1").val("");
                                                $("#valu1").attr("readonly", true);
                                                $("#valu2").val("");
                                                $("#valu2").attr("readonly", true);
                                                $("#noBales").val("");
                                                $("#noBales").attr("readonly", true);
                                                $("#expprod").val("");
                                                $("#expprod").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu1").val()).length !== 0) {
                                        $("#valu2").attr("readonly", false);
                                        $("#valu2").focus();
                                    }
                                });


                                $("#valu2").blur(function () {
                                    $("#valu1").focus(function () {

                                        $("#valu1").keyup(function () {

                                            if (($("#valu1").val()).length === 0) {
                                                $("#valu2").val("");
                                                $("#valu2").attr("readonly", true);
                                                $("#noBales").val("");
                                                $("#noBales").attr("readonly", true);
                                                $("#expprod").val("");
                                                $("#expprod").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu2").val()).length !== 0) {
                                        $("#noBales").attr("readonly", false);
                                        $("#noBales").focus();
                                    }
                                });

                                $("#noBales").blur(function () {
                                    $("#valu2").focus(function () {

                                        $("#valu2").keyup(function () {
                                            if (($("#valu2").val()).length === 0) {
                                                $("#noBales").val("");
                                                $("#noBales").attr("readonly", true);
                                                $("#expprod").val("");
                                                $("#expprod").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales").val()).length !== 0) {
                                        $("#expprod").attr("readonly", true);
                                        $("#expprod").focus();
                                    }
                                });

                                $("#expprod").blur(function () {
                                    $("#noBales").focus(function () {

                                        $("#noBales").keyup(function () {
                                            if (($("#noBales").val()).length === 0) {
                                                $("#expprod").val("");
                                                $("#expprod").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod").val()).length !== 0) {
                                        $("#digit1").attr("readonly", false);
                                        $("#digit1").focus();
                                    }
                                });
                                $("#digit1").blur(function () {
                                    $("#expprod").focus(function () {

                                        $("#expprod").keyup(function () {
                                            if (($("#expprod").val()).length === 0) {
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                                $("#expprod").val("");
                                                $("#expprod").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit1").val()).length !== 0) {
                                        $("#data1").attr("readonly", true);
                                        $("#data1").focus();
                                    }
                                });
                                $("#data1").blur(function () {
                                    $("#digit1").focus(function () {

                                        $("#digit1").keyup(function () {
                                            if (($("#digit1").val()).length === 0) {
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", false);
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
                                                $("#valu21").attr("readonly", false);
                                                $("#valu21").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu21").attr("readonly", true);
                                                        $("#valu21").val("");
                                                        $("#valu22").attr("readonly", true);
                                                        $("#valu22").val("");
                                                        $("#noBales1").val("");
                                                        $("#noBales1").attr("readonly", true);
                                                        $("#expprod2").val("");
                                                        $("#expprod2").attr("readonly", true);
                                                        $("#digit2").val("");
                                                        $("#digit2").attr("readonly", true);
                                                        $("#data2").val("");
                                                        $("#data2").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                });

                                $("#valu21").blur(function () {
                                    $("#emp1").focus(function () {

                                        $("#emp1").keyup(function () {
                                            if (($("#emp1").val()).length === 0) {
                                                $("#valu21").val("");
                                                $("#valu21").attr("readonly", true);
                                                $("#valu22").val("");
                                                $("#valu22").attr("readonly", true);
                                                $("#noBales1").val("");
                                                $("#noBales1").attr("readonly", true);
                                                $("#expprod2").val("");
                                                $("#expprod2").attr("readonly", true);
                                                $("#digit2").val("");
                                                $("#digit2").attr("readonly", true);
                                                $("#data2").val("");
                                                $("#data2").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu21").val()).length !== 0) {
                                        $("#valu22").attr("readonly", false);
                                        $("#valu22").focus();
                                    }
                                });


                                $("#valu22").blur(function () {
                                    $("#valu21").focus(function () {

                                        $("#valu21").keyup(function () {
                                            if (($("#valu21").val()).length === 0) {
                                                $("#valu22").val("");
                                                $("#valu22").attr("readonly", true);
                                                $("#noBales1").val("");
                                                $("#noBales1").attr("readonly", true);
                                                $("#expprod2").val("");
                                                $("#expprod2").attr("readonly", true);
                                                $("#digit2").val("");
                                                $("#digit2").attr("readonly", true);
                                                $("#data2").val("");
                                                $("#data2").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu22").val()).length !== 0) {
                                        $("#noBales1").attr("readonly", false);
                                        $("#noBales1").focus();
                                    }
                                });

                                $("#noBales").blur(function () {
                                    $("#valu22").focus(function () {

                                        $("#valu22").keyup(function () {
                                            if (($("#valu22").val()).length === 0) {
                                                $("#noBales1").val("");
                                                $("#noBales1").attr("readonly", true);
                                                $("#expprod2").val("");
                                                $("#expprod2").attr("readonly", true);
                                                $("#digit2").val("");
                                                $("#digit2").attr("readonly", true);
                                                $("#data2").val("");
                                                $("#data2").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales1").val()).length !== 0) {
                                        $("#expprod2").attr("readonly", true);
                                        $("#expprod2").focus();
                                    }
                                });

                                $("#expprod2").blur(function () {
                                    $("#noBales1").focus(function () {

                                        $("#noBales1").keyup(function () {
                                            if (($("#noBales1").val()).length === 0) {
                                                $("#expprod2").val("");
                                                $("#expprod2").attr("readonly", true);
                                                $("#digit2").val("");
                                                $("#digit2").attr("readonly", true);
                                                $("#data2").val("");
                                                $("#data2").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod2").val()).length !== 0) {
                                        $("#digit2").attr("readonly", false);
                                        $("#digit2").focus();
                                    }
                                });
                                $("#digit2").blur(function () {
                                    $("#expprod2").focus(function () {

                                        $("#expprod2").keyup(function () {
                                            if (($("#expprod2").val()).length === 0) {
                                                $("#data2").val("");
                                                $("#data2").attr("readonly", true);
                                                $("#expprod2").val("");
                                                $("#expprod2").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit2").val()).length !== 0) {
                                        $("#data2").attr("readonly", true);
                                        $("#data2").focus();
                                    }
                                });
                                $("#data2").blur(function () {
                                    $("#digit2").focus(function () {

                                        $("#digit2").keyup(function () {
                                            if (($("#digit2").val()).length === 0) {
                                                $("#data2").val("");
                                                $("#data2").attr("readonly", true);
                                                $("#digit2").val("");
                                                $("#digit2").attr("readonly", false);
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
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp2').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
                                        $('#emp2').val("");
                                    }
                                    if (($("#emp2").val()).length === 0) {
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
                                                $("#valu31").attr("readonly", false);
                                                $("#valu31").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $("#valu31").val("");
                                                        $("#valu31").attr("readonly", true);
                                                        $("#valu32").val("");
                                                        $("#valu32").attr("readonly", true);
                                                        $("#noBales2").val("");
                                                        $("#noBales2").attr("readonly", true);
                                                        $("#expprod3").val("");
                                                        $("#expprod3").attr("readonly", true);
                                                        $("#digit3").val("");
                                                        $("#digit3").attr("readonly", true);
                                                        $("#data3").val("");
                                                        $("#data3").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu31").blur(function () {
                                    $("#emp2").focus(function () {

                                        $("#emp2").keyup(function () {
                                            if (($("#emp2").val()).length === 0) {
                                                $("#valu31").val("");
                                                $("#valu31").attr("readonly", true);
                                                $("#valu32").val("");
                                                $("#valu32").attr("readonly", true);
                                                $("#noBales2").val("");
                                                $("#noBales2").attr("readonly", true);
                                                $("#expprod3").val("");
                                                $("#expprod3").attr("readonly", true);
                                                $("#digit3").val("");
                                                $("#digit3").attr("readonly", true);
                                                $("#data3").val("");
                                                $("#data3").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu31").val()).length !== 0) {
                                        $("#valu32").attr("readonly", false);
                                        $("#valu32").focus();
                                    }
                                });


                                $("#valu32").blur(function () {
                                    $("#valu31").focus(function () {

                                        $("#valu31").keyup(function () {
                                            if (($("#valu31").val()).length === 0) {
                                                $("#valu32").val("");
                                                $("#valu32").attr("readonly", true);
                                                $("#noBales2").val("");
                                                $("#noBales2").attr("readonly", true);
                                                $("#expprod3").val("");
                                                $("#expprod3").attr("readonly", true);
                                                $("#digit3").val("");
                                                $("#digit3").attr("readonly", true);
                                                $("#data3").val("");
                                                $("#data3").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu32").val()).length !== 0) {
                                        $("#noBales2").attr("readonly", false);
                                        $("#noBales2").focus();
                                    }
                                });

                                $("#noBales2").blur(function () {
                                    $("#valu32").focus(function () {

                                        $("#valu32").keyup(function () {
                                            if (($("#valu32").val()).length === 0) {
                                                $("#noBales2").val("");
                                                $("#noBales2").attr("readonly", true);
                                                $("#expprod3").val("");
                                                $("#expprod3").attr("readonly", true);
                                                $("#digit3").val("");
                                                $("#digit3").attr("readonly", true);
                                                $("#data3").val("");
                                                $("#data3").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales2").val()).length !== 0) {
                                        $("#expprod3").attr("readonly", true);
                                        $("#expprod3").focus();
                                    }
                                });

                                $("#expprod3").blur(function () {
                                    $("#noBales2").focus(function () {

                                        $("#noBales2").keyup(function () {
                                            if (($("#noBales2").val()).length === 0) {
                                                $("#expprod3").val("");
                                                $("#expprod3").attr("readonly", true);
                                                $("#digit3").val("");
                                                $("#digit3").attr("readonly", true);
                                                $("#data3").val("");
                                                $("#data3").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod3").val()).length !== 0) {
                                        $("#digit3").attr("readonly", false);
                                        $("#digit3").focus();
                                    }
                                });
                                $("#digit3").blur(function () {
                                    $("#expprod3").focus(function () {

                                        $("#expprod3").keyup(function () {
                                            if (($("#expprod3").val()).length === 0) {
                                                $("#data3").val("");
                                                $("#data3").attr("readonly", true);
                                                $("#expprod3").val("");
                                                $("#expprod3").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit3").val()).length !== 0) {
                                        $("#data3").attr("readonly", true);
                                        $("#data3").focus();
                                    }
                                });
                                $("#data3").blur(function () {
                                    $("#digit3").focus(function () {

                                        $("#digit3").keyup(function () {
                                            if (($("#digit3").val()).length === 0) {
                                                $("#data3").val("");
                                                $("#data3").attr("readonly", true);
                                                $("#digit3").val("");
                                                $("#digit3").attr("readonly", false);
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
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp3').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
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
                                                $("#valu41").attr("readonly", false);
                                                $("#valu41").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $("#valu41").val("");
                                                        $("#valu41").attr("readonly", true);
                                                        $("#valu42").val("");
                                                        $("#valu42").attr("readonly", true);
                                                        $("#noBales3").val("");
                                                        $("#noBales3").attr("readonly", true);
                                                        $("#expprod4").val("");
                                                        $("#expprod4").attr("readonly", true);
                                                        $("#digit4").val("");
                                                        $("#digit4").attr("readonly", true);
                                                        $("#data4").val("");
                                                        $("#data4").attr("readonly", true);
                                                        $(this).val("");
                                                        $(this).focus();
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu41").blur(function () {
                                    $("#emp3").focus(function () {

                                        $("#emp3").keyup(function () {
                                            if (($("#emp3").val()).length === 0) {
                                                $("#valu41").val("");
                                                $("#valu41").attr("readonly", true);
                                                $("#valu42").val("");
                                                $("#valu42").attr("readonly", true);
                                                $("#noBales3").val("");
                                                $("#noBales3").attr("readonly", true);
                                                $("#expprod4").val("");
                                                $("#expprod4").attr("readonly", true);
                                                $("#digit4").val("");
                                                $("#digit4").attr("readonly", true);
                                                $("#data4").val("");
                                                $("#data4").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu41").val()).length !== 0) {
                                        $("#valu42").attr("readonly", false);
                                        $("#valu42").focus();
                                    }
                                });


                                $("#valu42").blur(function () {
                                    $("#valu41").focus(function () {

                                        $("#valu41").keyup(function () {
                                            if (($("#valu41").val()).length === 0) {
                                                $("#valu42").val("");
                                                $("#valu42").attr("readonly", true);
                                                $("#noBales3").val("");
                                                $("#noBales3").attr("readonly", true);
                                                $("#expprod4").val("");
                                                $("#expprod4").attr("readonly", true);
                                                $("#digit4").val("");
                                                $("#digit4").attr("readonly", true);
                                                $("#data4").val("");
                                                $("#data4").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu42").val()).length !== 0) {
                                        $("#noBales3").attr("readonly", false);
                                        $("#noBales3").focus();
                                    }
                                });

                                $("#noBales3").blur(function () {
                                    $("#valu42").focus(function () {

                                        $("#valu42").keyup(function () {
                                            if (($("#valu42").val()).length === 0) {
                                                $("#noBales3").val("");
                                                $("#noBales3").attr("readonly", true);
                                                $("#expprod4").val("");
                                                $("#expprod4").attr("readonly", true);
                                                $("#digit4").val("");
                                                $("#digit4").attr("readonly", true);
                                                $("#data4").val("");
                                                $("#data4").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales3").val()).length !== 0) {
                                        $("#expprod4").attr("readonly", true);
                                        $("#expprod4").focus();
                                    }
                                });

                                $("#expprod4").blur(function () {
                                    $("#noBales3").focus(function () {

                                        $("#noBales3").keyup(function () {
                                            if (($("#noBales3").val()).length === 0) {
                                                $("#expprod4").val("");
                                                $("#expprod4").attr("readonly", true);
                                                $("#digit4").val("");
                                                $("#digit4").attr("readonly", true);
                                                $("#data4").val("");
                                                $("#data4").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod4").val()).length !== 0) {
                                        $("#digit4").attr("readonly", false);
                                        $("#digit4").focus();
                                    }
                                });
                                $("#digit4").blur(function () {
                                    $("#expprod4").focus(function () {

                                        $("#expprod4").keyup(function () {
                                            if (($("#expprod4").val()).length === 0) {
                                                $("#data4").val("");
                                                $("#data4").attr("readonly", true);
                                                $("#expprod4").val("");
                                                $("#expprod4").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit4").val()).length !== 0) {
                                        $("#data4").attr("readonly", true);
                                        $("#data4").focus();
                                    }
                                });
                                $("#data4").blur(function () {
                                    $("#digit4").focus(function () {

                                        $("#digit4").keyup(function () {
                                            if (($("#digit4").val()).length === 0) {
                                                $("#data4").val("");
                                                $("#data4").attr("readonly", true);
                                                $("#digit4").val("");
                                                $("#digit4").attr("readonly", false);
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
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp4').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
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
                                                $("#valu51").attr("readonly", false);
                                                $("#valu51").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu51").val("");
                                                        $("#valu51").attr("readonly", true);
                                                        $("#valu52").val("");
                                                        $("#valu52").attr("readonly", true);
                                                        $("#noBales4").val("");
                                                        $("#noBales4").attr("readonly", true);
                                                        $("#expprod5").val("");
                                                        $("#expprod5").attr("readonly", true);
                                                        $("#digit5").val("");
                                                        $("#digit5").attr("readonly", true);
                                                        $("#data5").val("");
                                                        $("#data5").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu51").blur(function () {
                                    $("#emp4").focus(function () {

                                        $("#emp4").keyup(function () {
                                            if (($("#emp4").val()).length === 0) {
                                                $("#valu51").val("");
                                                $("#valu51").attr("readonly", true);
                                                $("#valu52").val("");
                                                $("#valu52").attr("readonly", true);
                                                $("#noBales4").val("");
                                                $("#noBales4").attr("readonly", true);
                                                $("#expprod5").val("");
                                                $("#expprod5").attr("readonly", true);
                                                $("#digit5").val("");
                                                $("#digit5").attr("readonly", true);
                                                $("#data5").val("");
                                                $("#data5").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu51").val()).length !== 0) {
                                        $("#valu52").attr("readonly", false);
                                        $("#valu52").focus();
                                    }
                                });


                                $("#valu52").blur(function () {
                                    $("#valu51").focus(function () {

                                        $("#valu51").keyup(function () {
                                            if (($("#valu51").val()).length === 0) {
                                                $("#valu52").val("");
                                                $("#valu52").attr("readonly", true);
                                                $("#noBales4").val("");
                                                $("#noBales4").attr("readonly", true);
                                                $("#expprod5").val("");
                                                $("#expprod5").attr("readonly", true);
                                                $("#digit5").val("");
                                                $("#digit5").attr("readonly", true);
                                                $("#data5").val("");
                                                $("#data5").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu52").val()).length !== 0) {
                                        $("#noBales4").attr("readonly", false);
                                        $("#noBales4").focus();
                                    }
                                });

                                $("#noBales4").blur(function () {
                                    $("#valu52").focus(function () {

                                        $("#valu52").keyup(function () {
                                            if (($("#valu52").val()).length === 0) {
                                                $("#noBales4").val("");
                                                $("#noBales4").attr("readonly", true);
                                                $("#expprod5").val("");
                                                $("#expprod5").attr("readonly", true);
                                                $("#digit5").val("");
                                                $("#digit5").attr("readonly", true);
                                                $("#data5").val("");
                                                $("#data5").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales4").val()).length !== 0) {
                                        $("#expprod5").attr("readonly", true);
                                        $("#expprod5").focus();
                                    }
                                });

                                $("#expprod5").blur(function () {
                                    $("#noBales4").focus(function () {

                                        $("#noBales4").keyup(function () {
                                            if (($("#noBales4").val()).length === 0) {
                                                $("#expprod5").val("");
                                                $("#expprod5").attr("readonly", true);
                                                $("#digit5").val("");
                                                $("#digit5").attr("readonly", true);
                                                $("#data5").val("");
                                                $("#data5").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod5").val()).length !== 0) {
                                        $("#digit5").attr("readonly", false);
                                        $("#digit5").focus();
                                    }
                                });
                                $("#digit5").blur(function () {
                                    $("#expprod5").focus(function () {

                                        $("#expprod5").keyup(function () {
                                            if (($("#expprod5").val()).length === 0) {
                                                $("#data5").val("");
                                                $("#data5").attr("readonly", true);
                                                $("#expprod5").val("");
                                                $("#expprod5").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit5").val()).length !== 0) {
                                        $("#data5").attr("readonly", true);
                                        $("#data5").focus();
                                    }
                                });
                                $("#data5").blur(function () {
                                    $("#digit5").focus(function () {

                                        $("#digit5").keyup(function () {
                                            if (($("#digit5").val()).length === 0) {
                                                $("#data5").val("");
                                                $("#data5").attr("readonly", true);
                                                $("#digit5").val("");
                                                $("#digit5").attr("readonly", false);
                                            }
                                        });

                                    });

                                });






                                $('.one5').attr("readonly", true);
                                $('.two5').attr("readonly", true);
                                $('.three5').attr("readonly", true);
                                $('.four5').attr("readonly", true);
                                $('.esp5').attr("readonly", true);

                                $("#emp5").keyup(function () {
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp5').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
                                        $('#emp5').val("");
                                    }
                                    if (($("#emp5").val()).length === 0) {
                                        $('.one5').attr("readonly", true);
                                        $('.two5').attr("readonly", true);
                                        $('.three5').attr("readonly", true);
                                        $('.four5').attr("readonly", true);
                                        $('.esp5').attr("readonly", true);
                                        $('.esp5').val("");
                                        $('.two5').val("");
                                        $('.three5').val("");
                                        $('.four5').val("");
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
                                                $("#valu61").attr("readonly", false);
                                                $("#valu61").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu61").val("");
                                                        $("#valu61").attr("readonly", true);
                                                        $("#valu62").val("");
                                                        $("#valu62").attr("readonly", true);
                                                        $("#noBales5").val("");
                                                        $("#noBales5").attr("readonly", true);
                                                        $("#expprod6").val("");
                                                        $("#expprod6").attr("readonly", true);
                                                        $("#digit6").val("");
                                                        $("#digit6").attr("readonly", true);
                                                        $("#data6").val("");
                                                        $("#data6").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu61").blur(function () {
                                    $("#emp5").focus(function () {

                                        $("#emp5").keyup(function () {
                                            if (($("#emp5").val()).length === 0) {
                                                $("#valu61").val("");
                                                $("#valu61").attr("readonly", true);
                                                $("#valu62").val("");
                                                $("#valu62").attr("readonly", true);
                                                $("#noBales5").val("");
                                                $("#noBales5").attr("readonly", true);
                                                $("#expprod6").val("");
                                                $("#expprod6").attr("readonly", true);
                                                $("#digit6").val("");
                                                $("#digit6").attr("readonly", true);
                                                $("#data6").val("");
                                                $("#data6").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu61").val()).length !== 0) {
                                        $("#valu62").attr("readonly", false);
                                        $("#valu62").focus();
                                    }
                                });


                                $("#valu62").blur(function () {
                                    $("#valu61").focus(function () {

                                        $("#valu61").keyup(function () {
                                            if (($("#valu61").val()).length === 0) {
                                                $("#valu62").val("");
                                                $("#valu62").attr("readonly", true);
                                                $("#noBales5").val("");
                                                $("#noBales5").attr("readonly", true);
                                                $("#expprod6").val("");
                                                $("#expprod6").attr("readonly", true);
                                                $("#digit6").val("");
                                                $("#digit6").attr("readonly", true);
                                                $("#data6").val("");
                                                $("#data6").attr("readonly", true);
                                            }
                                        });
                                            
                                    });


                                    if (($("#valu62").val()).length !== 0) {
                                        $("#noBales5").attr("readonly", false);
                                        $("#noBales5").focus();
                                    }
                                });

                                $("#noBales5").blur(function () {
                                    $("#valu62").focus(function () {

                                        $("#valu62").keyup(function () {
                                            if (($("#valu62").val()).length === 0) {
                                                $("#noBales5").val("");
                                                $("#noBales5").attr("readonly", true);
                                                $("#expprod6").val("");
                                                $("#expprod6").attr("readonly", true);
                                                $("#digit6").val("");
                                                $("#digit6").attr("readonly", true);
                                                $("#data6").val("");
                                                $("#data6").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales5").val()).length !== 0) {
                                        $("#expprod6").attr("readonly", true);
                                        $("#expprod6").focus();
                                    }
                                });

                                $("#expprod6").blur(function () {
                                    $("#noBales5").focus(function () {

                                        $("#noBales5").keyup(function () {
                                            if (($("#noBales5").val()).length === 0) {
                                                $("#expprod6").val("");
                                                $("#expprod6").attr("readonly", true);
                                                $("#digit6").val("");
                                                $("#digit6").attr("readonly", true);
                                                $("#data6").val("");
                                                $("#data6").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod6").val()).length !== 0) {
                                        $("#digit6").attr("readonly", false);
                                        $("#digit6").focus();
                                    }
                                });
                                $("#digit6").blur(function () {
                                    $("#expprod6").focus(function () {

                                        $("#expprod6").keyup(function () {
                                            if (($("#expprod6").val()).length === 0) {
                                                $("#data6").val("");
                                                $("#data6").attr("readonly", true);
                                                $("#expprod6").val("");
                                                $("#expprod6").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit6").val()).length !== 0) {
                                        $("#data6").attr("readonly", true);
                                        $("#data6").focus();
                                    }
                                });
                                $("#data6").blur(function () {
                                    $("#digit6").focus(function () {

                                        $("#digit6").keyup(function () {
                                            if (($("#digit6").val()).length === 0) {
                                                $("#data6").val("");
                                                $("#data6").attr("readonly", true);
                                                $("#digit6").val("");
                                                $("#digit6").attr("readonly", false);
                                            }
                                        });

                                    });

                                });




                                $('.one6').attr("readonly", true);
                                $('.two6').attr("readonly", true);
                                $('.three6').attr("readonly", true);
                                $('.four6').attr("readonly", true);
                                $('.esp6').attr("readonly", true);

                                $("#emp6").keyup(function () {
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp6').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
                                        $('#emp6').val("");
                                    }
                                    if (($("#emp6").val()).length === 0) {
                                        $('.one6').attr("readonly", true);
                                        $('.two6').attr("readonly", true);
                                        $('.three6').attr("readonly", true);
                                        $('.four6').attr("readonly", true);
                                        $('.esp6').attr("readonly", true);
                                        $('.esp6').val("");
                                        $('.two6').val("");
                                        $('.three6').val("");
                                        $('.four6').val("");
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
                                                $("#valu71").attr("readonly", false);
                                                $("#valu71").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu71").val("");
                                                        $("#valu71").attr("readonly", true);
                                                        $("#valu72").val("");
                                                        $("#valu72").attr("readonly", true);
                                                        $("#noBales6").val("");
                                                        $("#noBales6").attr("readonly", true);
                                                        $("#expprod7").val("");
                                                        $("#expprod7").attr("readonly", true);
                                                        $("#digit7").val("");
                                                        $("#digit7").attr("readonly", true);
                                                        $("#data7").val("");
                                                        $("#data7").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });


                                $("#valu71").blur(function () {
                                    $("#emp6").focus(function () {

                                        $("#emp6").keyup(function () {
                                            if (($("#emp6").val()).length === 0) {
                                                $("#valu71").val("");
                                                $("#valu71").attr("readonly", true);
                                                $("#valu72").val("");
                                                $("#valu72").attr("readonly", true);
                                                $("#noBales6").val("");
                                                $("#noBales6").attr("readonly", true);
                                                $("#expprod7").val("");
                                                $("#expprod7").attr("readonly", true);
                                                $("#digit7").val("");
                                                $("#digit7").attr("readonly", true);
                                                $("#data7").val("");
                                                $("#data7").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu71").val()).length !== 0) {
                                        $("#valu72").attr("readonly", false);
                                        $("#valu72").focus();
                                    }
                                });


                                $("#valu72").blur(function () {
                                    $("#valu71").focus(function () {

                                        $("#valu71").keyup(function () {
                                            if (($("#valu71").val()).length === 0) {
                                                $("#valu72").val("");
                                                $("#valu72").attr("readonly", true);
                                                $("#noBales6").val("");
                                                $("#noBales6").attr("readonly", true);
                                                $("#expprod7").val("");
                                                $("#expprod7").attr("readonly", true);
                                                $("#digit7").val("");
                                                $("#digit7").attr("readonly", true);
                                                $("#data7").val("");
                                                $("#data7").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu72").val()).length !== 0) {
                                        $("#noBales6").attr("readonly", false);
                                        $("#noBales6").focus();
                                    }
                                });

                                $("#noBales6").blur(function () {
                                    $("#valu72").focus(function () {

                                        $("#valu72").keyup(function () {
                                            if (($("#valu72").val()).length === 0) {
                                                $("#noBales6").val("");
                                                $("#noBales6").attr("readonly", true);
                                                $("#expprod7").val("");
                                                $("#expprod7").attr("readonly", true);
                                                $("#digit7").val("");
                                                $("#digit7").attr("readonly", true);
                                                $("#data7").val("");
                                                $("#data7").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales6").val()).length !== 0) {
                                        $("#expprod7").attr("readonly", true);
                                        $("#expprod7").focus();
                                    }
                                });

                                $("#expprod7").blur(function () {
                                    $("#noBales6").focus(function () {

                                        $("#noBales6").keyup(function () {
                                            if (($("#noBales6").val()).length === 0) {
                                                $("#expprod7").val("");
                                                $("#expprod7").attr("readonly", true);
                                                $("#digit7").val("");
                                                $("#digit7").attr("readonly", true);
                                                $("#data7").val("");
                                                $("#data7").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod7").val()).length !== 0) {
                                        $("#digit7").attr("readonly", false);
                                        $("#digit7").focus();
                                    }
                                });
                                $("#digit7").blur(function () {
                                    $("#expprod7").focus(function () {

                                        $("#expprod7").keyup(function () {
                                            if (($("#expprod7").val()).length === 0) {
                                                $("#data7").val("");
                                                $("#data7").attr("readonly", true);
                                                $("#expprod7").val("");
                                                $("#expprod7").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit7").val()).length !== 0) {
                                        $("#data7").attr("readonly", true);
                                        $("#data7").focus();
                                    }
                                });
                                $("#data7").blur(function () {
                                    $("#digit7").focus(function () {

                                        $("#digit7").keyup(function () {
                                            if (($("#digit7").val()).length === 0) {
                                                $("#data7").val("");
                                                $("#data7").attr("readonly", true);
                                                $("#digit7").val("");
                                                $("#digit7").attr("readonly", false);
                                            }
                                        });

                                    });

                                });




                                $('.one7').attr("readonly", true);
                                $('.two7').attr("readonly", true);
                                $('.three7').attr("readonly", true);
                                $('.four7').attr("readonly", true);
                                $('.esp7').attr("readonly", true);

                                $("#emp7").keyup(function () {
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp7').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
                                        $('#emp7').val("");
                                    }
                                    if (($("#emp7").val()).length === 0) {
                                        $('.one7').attr("readonly", true);
                                        $('.two7').attr("readonly", true);
                                        $('.three7').attr("readonly", true);
                                        $('.four7').attr("readonly", true);
                                        $('.esp7').attr("readonly", true);
                                        $('.esp7').val("");
                                        $('.two7').val("");
                                        $('.three7').val("");
                                        $('.four7').val("");
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
                                                $("#valu81").attr("readonly", false);
                                                $("#valu81").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu81").val("");
                                                        $("#valu81").attr("readonly", true);
                                                        $("#valu82").val("");
                                                        $("#valu82").attr("readonly", true);
                                                        $("#noBales7").val("");
                                                        $("#noBales7").attr("readonly", true);
                                                        $("#expprod8").val("");
                                                        $("#expprod8").attr("readonly", true);
                                                        $("#digit8").val("");
                                                        $("#digit8").attr("readonly", true);
                                                        $("#data8").val("");
                                                        $("#data8").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu81").blur(function () {
                                    $("#emp7").focus(function () {

                                        $("#emp7").keyup(function () {
                                            if (($("#emp7").val()).length === 0) {
                                                $("#valu81").val("");
                                                $("#valu81").attr("readonly", true);
                                                $("#valu82").val("");
                                                $("#valu82").attr("readonly", true);
                                                $("#noBales7").val("");
                                                $("#noBales7").attr("readonly", true);
                                                $("#expprod8").val("");
                                                $("#expprod8").attr("readonly", true);
                                                $("#digit8").val("");
                                                $("#digit8").attr("readonly", true);
                                                $("#data8").val("");
                                                $("#data8").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu81").val()).length !== 0) {
                                        $("#valu82").attr("readonly", false);
                                        $("#valu82").focus();
                                    }
                                });


                                $("#valu82").blur(function () {
                                    $("#valu81").focus(function () {

                                        $("#valu81").keyup(function () {
                                            if (($("#valu81").val()).length === 0) {
                                                $("#valu82").val("");
                                                $("#valu82").attr("readonly", true);
                                                $("#noBales7").val("");
                                                $("#noBales7").attr("readonly", true);
                                                $("#expprod8").val("");
                                                $("#expprod8").attr("readonly", true);
                                                $("#digit8").val("");
                                                $("#digit8").attr("readonly", true);
                                                $("#data8").val("");
                                                $("#data8").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu82").val()).length !== 0) {
                                        $("#noBales7").attr("readonly", false);
                                        $("#noBales7").focus();
                                    }
                                });

                                $("#noBales7").blur(function () {
                                    $("#valu82").focus(function () {

                                        $("#valu82").keyup(function () {
                                            if (($("#valu82").val()).length === 0) {
                                                $("#noBales7").val("");
                                                $("#noBales7").attr("readonly", true);
                                                $("#expprod8").val("");
                                                $("#expprod8").attr("readonly", true);
                                                $("#digit8").val("");
                                                $("#digit8").attr("readonly", true);
                                                $("#data8").val("");
                                                $("#data8").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales7").val()).length !== 0) {
                                        $("#expprod8").attr("readonly", true);
                                        $("#expprod8").focus();
                                    }
                                });

                                $("#expprod8").blur(function () {
                                    $("#noBales7").focus(function () {

                                        $("#noBales7").keyup(function () {
                                            if (($("#noBales7").val()).length === 0) {
                                                $("#expprod8").val("");
                                                $("#expprod8").attr("readonly", true);
                                                $("#digit8").val("");
                                                $("#digit8").attr("readonly", true);
                                                $("#data8").val("");
                                                $("#data8").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod8").val()).length !== 0) {
                                        $("#digit8").attr("readonly", false);
                                        $("#digit8").focus();
                                    }
                                });
                                $("#digit8").blur(function () {
                                    $("#expprod8").focus(function () {

                                        $("#expprod8").keyup(function () {
                                            if (($("#expprod8").val()).length === 0) {
                                                $("#data8").val("");
                                                $("#data8").attr("readonly", true);
                                                $("#expprod8").val("");
                                                $("#expprod8").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit8").val()).length !== 0) {
                                        $("#data8").attr("readonly", true);
                                        $("#data8").focus();
                                    }
                                });
                                $("#data8").blur(function () {
                                    $("#digit8").focus(function () {

                                        $("#digit8").keyup(function () {
                                            if (($("#digit8").val()).length === 0) {
                                                $("#data8").val("");
                                                $("#data8").attr("readonly", true);
                                                $("#digit8").val("");
                                                $("#digit8").attr("readonly", false);
                                            }
                                        });

                                    });

                                });



                                $('.one8').attr("readonly", true);
                                $('.two8').attr("readonly", true);
                                $('.three8').attr("readonly", true);
                                $('.four8').attr("readonly", true);
                                $('.esp8').attr("readonly", true);

                                $("#emp8").keyup(function () {
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp8').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
                                        $('#emp8').val("");
                                    }
                                    if (($("#emp8").val()).length === 0) {
                                        $('.one8').attr("readonly", true);
                                        $('.two8').attr("readonly", true);
                                        $('.three8').attr("readonly", true);
                                        $('.four8').attr("readonly", true);
                                        $('.esp8').attr("readonly", true);
                                        $('.esp8').val("");
                                        $('.two8').val("");
                                        $('.three8').val("");
                                        $('.four8').val("");
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
                                                $("#valu91").attr("readonly", false);
                                                $("#valu91").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu91").val("");
                                                        $("#valu91").attr("readonly", true);
                                                        $("#valu92").val("");
                                                        $("#valu92").attr("readonly", true);
                                                        $("#noBales8").val("");
                                                        $("#noBales8").attr("readonly", true);
                                                        $("#expprod9").val("");
                                                        $("#expprod9").attr("readonly", true);
                                                        $("#digit9").val("");
                                                        $("#digit9").attr("readonly", true);
                                                        $("#data9").val("");
                                                        $("#data9").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });
                                $("#valu91").blur(function () {
                                    $("#emp8").focus(function () {

                                        $("#emp8").keyup(function () {
                                            if (($("#emp8").val()).length === 0) {
                                                $("#valu91").val("");
                                                $("#valu91").attr("readonly", true);
                                                $("#valu92").val("");
                                                $("#valu92").attr("readonly", true);
                                                $("#noBales8").val("");
                                                $("#noBales8").attr("readonly", true);
                                                $("#expprod9").val("");
                                                $("#expprod9").attr("readonly", true);
                                                $("#digit9").val("");
                                                $("#digit9").attr("readonly", true);
                                                $("#data9").val("");
                                                $("#data9").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu91").val()).length !== 0) {
                                        $("#valu92").attr("readonly", false);
                                        $("#valu92").focus();
                                    }
                                });


                                $("#valu92").blur(function () {
                                    $("#valu91").focus(function () {

                                        $("#valu91").keyup(function () {
                                            if (($("#valu91").val()).length === 0) {
                                                $("#valu92").val("");
                                                $("#valu92").attr("readonly", true);
                                                $("#noBales8").val("");
                                                $("#noBales8").attr("readonly", true);
                                                $("#expprod9").val("");
                                                $("#expprod9").attr("readonly", true);
                                                $("#digit9").val("");
                                                $("#digit9").attr("readonly", true);
                                                $("#data9").val("");
                                                $("#data9").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu92").val()).length !== 0) {
                                        $("#noBales8").attr("readonly", false);
                                        $("#noBales8").focus();
                                    }
                                });

                                $("#noBales8").blur(function () {
                                    $("#valu92").focus(function () {

                                        $("#valu92").keyup(function () {
                                            if (($("#valu92").val()).length === 0) {
                                                $("#noBales8").val("");
                                                $("#noBales8").attr("readonly", true);
                                                $("#expprod9").val("");
                                                $("#expprod9").attr("readonly", true);
                                                $("#digit9").val("");
                                                $("#digit9").attr("readonly", true);
                                                $("#data9").val("");
                                                $("#data9").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales8").val()).length !== 0) {
                                        $("#expprod9").attr("readonly", true);
                                        $("#expprod9").focus();
                                    }
                                });

                                $("#expprod9").blur(function () {
                                    $("#noBales8").focus(function () {

                                        $("#noBales8").keyup(function () {
                                            if (($("#noBales8").val()).length === 0) {
                                                $("#expprod9").val("");
                                                $("#expprod9").attr("readonly", true);
                                                $("#digit9").val("");
                                                $("#digit9").attr("readonly", true);
                                                $("#data9").val("");
                                                $("#data9").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod9").val()).length !== 0) {
                                        $("#digit9").attr("readonly", false);
                                        $("#digit9").focus();
                                    }
                                });
                                $("#digit9").blur(function () {
                                    $("#expprod9").focus(function () {

                                        $("#expprod9").keyup(function () {
                                            if (($("#expprod9").val()).length === 0) {
                                                $("#data9").val("");
                                                $("#data9").attr("readonly", true);
                                                $("#expprod9").val("");
                                                $("#expprod9").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit9").val()).length !== 0) {
                                        $("#data9").attr("readonly", true);
                                        $("#data9").focus();
                                    }
                                });
                                $("#data9").blur(function () {
                                    $("#digit9").focus(function () {

                                        $("#digit9").keyup(function () {
                                            if (($("#digit9").val()).length === 0) {
                                                $("#data9").val("");
                                                $("#data9").attr("readonly", true);
                                                $("#digit9").val("");
                                                $("#digit9").attr("readonly", false);
                                            }
                                        });

                                    });

                                });





                                $('.one9').attr("readonly", true);
                                $('.two9').attr("readonly", true);
                                $('.three9').attr("readonly", true);
                                $('.four9').attr("readonly", true);
                                $('.esp9').attr("readonly", true);

                                $("#emp9").keyup(function () {
                                    var regx = /^[A-Za-z0-9]+$/;
                                    if (!regx.test($('#emp9').val()))
                                    {
                                        alert("Only Alphanumerics are allowed !");
                                        $('#emp9').val("");
                                    }
                                    if (($("#emp9").val()).length === 0) {
                                        $('.one9').attr("readonly", true);
                                        $('.two9').attr("readonly", true);
                                        $('.three9').attr("readonly", true);
                                        $('.four9').attr("readonly", true);
                                        $('.esp9').attr("readonly", true);
                                        $('.esp9').val("");
                                        $('.two9').val("");
                                        $('.three9').val("");
                                        $('.four9').val("");
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
                                                $("#valu101").attr("readonly", false);
                                                $("#valu101").focus();
                                            } else {
                                                if (i === (a2.valueOf() - 1)) {
                                                    if (b.valueOf() !== "hello") {
                                                        alert("Please enter valid Employee Id");
                                                        $(this).val("");
                                                        $(this).focus();
                                                        $("#valu101").val("");
                                                        $("#valu101").attr("readonly", true);
                                                        $("#valu102").val("");
                                                        $("#valu102").attr("readonly", true);
                                                        $("#noBales9").val("");
                                                        $("#noBales9").attr("readonly", true);
                                                        $("#expprod10").val("");
                                                        $("#expprod10").attr("readonly", true);
                                                        $("#digit10").val("");
                                                        $("#digit10").attr("readonly", true);
                                                        $("#data10").val("");
                                                        $("#data10").attr("readonly", true);
                                                    }
                                                }
                                            }
                                        }

                                    }

                                });

                                $("#valu101").blur(function () {
                                    $("#emp9").focus(function () {

                                        $("#emp9").keyup(function () {
                                            if (($("#emp9").val()).length === 0) {
                                                $("#valu101").val("");
                                                $("#valu101").attr("readonly", true);
                                                $("#valu102").val("");
                                                $("#valu102").attr("readonly", true);
                                                $("#noBales9").val("");
                                                $("#noBales9").attr("readonly", true);
                                                $("#expprod10").val("");
                                                $("#expprod10").attr("readonly", true);
                                                $("#digit10").val("");
                                                $("#digit10").attr("readonly", true);
                                                $("#data10").val("");
                                                $("#data10").attr("readonly", true);

                                            }
                                        });

                                    });


                                    if (($("#valu101").val()).length !== 0) {
                                        $("#valu102").attr("readonly", false);
                                        $("#valu102").focus();
                                    }
                                });


                                $("#valu102").blur(function () {
                                    $("#valu101").focus(function () {

                                        $("#valu101").keyup(function () {
                                            if (($("#valu101").val()).length === 0) {
                                                $("#valu102").val("");
                                                $("#valu102").attr("readonly", true);
                                                $("#noBales9").val("");
                                                $("#noBales9").attr("readonly", true);
                                                $("#expprod10").val("");
                                                $("#expprod10").attr("readonly", true);
                                                $("#digit10").val("");
                                                $("#digit10").attr("readonly", true);
                                                $("#data10").val("");
                                                $("#data10").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#valu102").val()).length !== 0) {
                                        $("#noBales9").attr("readonly", false);
                                        $("#noBales9").focus();
                                    }
                                });

                                $("#noBales9").blur(function () {
                                    $("#valu102").focus(function () {

                                        $("#valu102").keyup(function () {
                                            if (($("#valu102").val()).length === 0) {
                                                $("#noBales9").val("");
                                                $("#noBales9").attr("readonly", true);
                                                $("#expprod10").val("");
                                                $("#expprod10").attr("readonly", true);
                                                $("#digit10").val("");
                                                $("#digit10").attr("readonly", true);
                                                $("#data10").val("");
                                                $("#data10").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#noBales9").val()).length !== 0) {
                                        $("#expprod10").attr("readonly", true);
                                        $("#expprod10").focus();
                                    }
                                });

                                $("#expprod10").blur(function () {
                                    $("#noBales9").focus(function () {

                                        $("#noBales9").keyup(function () {
                                            if (($("#noBales9").val()).length === 0) {
                                                $("#expprod10").val("");
                                                $("#expprod10").attr("readonly", true);
                                                $("#digit10").val("");
                                                $("#digit10").attr("readonly", true);
                                                $("#data10").val("");
                                                $("#data9").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#expprod10").val()).length !== 0) {
                                        $("#digit10").attr("readonly", false);
                                        $("#digit10").focus();
                                    }
                                });
                                $("#digit10").blur(function () {
                                    $("#expprod10").focus(function () {

                                        $("#expprod10").keyup(function () {
                                            if (($("#expprod10").val()).length === 0) {
                                                $("#data10").val("");
                                                $("#data10").attr("readonly", true);
                                                $("#expprod10").val("");
                                                $("#expprod10").attr("readonly", true);
                                            }
                                        });

                                    });


                                    if (($("#digit10").val()).length !== 0) {
                                        $("#data10").attr("readonly", true);
                                        $("#data10").focus();
                                    }
                                });
                                $("#data10").blur(function () {
                                    $("#digit10").focus(function () {

                                        $("#digit10").keyup(function () {
                                            if (($("#digit10").val()).length === 0) {
                                                $("#data10").val("");
                                                $("#data10").attr("readonly", true);
                                                $("#digit10").val("");
                                                $("#digit10").attr("readonly", false);
                                            }
                                        });

                                    });

                                });

                            });

            </script>
            <script type="text/javascript">

                $(document).ready(function () {
                    yourFunction();
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
            <script language="javascript">
                
               /* $( ".mcr1" ).change(function() {
    
                var a = $(this).val();
                 if (name === 'Shift 1' || name === 'Shift 2') {
                  if (parseInt(a) >510)
                  {
                      alert("anuuuuuuuuuuuuuuuuuuu");
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
          
          
          $( ".mcr7" ).change(function() {
    
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
          
          $( ".mcr8" ).change(function() {
    
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
          
          
          $( ".mcr9" ).change(function() {
    
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
      
      
      $( ".mcr10" ).change(function() {
    
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

                $(".item2").change(function () {
                    var digit6 = $(this).val();
                    if (name === 'Shift1' || name === 'Shift2')
                    {
                        if (parseFloat(digit6) > 510)
                        {
                            alert("Machine Running must be lessthan 510");
                           // $("#valu2").val("");
//                            $("#noBales").val("");
//                            $("#noBales").attr("readonly", true);
                            $("#expprod").val("");
                            $("#expprod").attr("readonly", true);
                            $("#digit1").val("");
                            $("#digit1").attr("readonly", true);
                            $("#data1").val("");
                            $("#data1").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
                            //$("#valu2").val("");
//                            $("#noBales").val("");
//                            $("#noBales").attr("readonly", true);
                            $("#expprod").val("");
                            $("#expprod").attr("readonly", true);
                            $("#digit1").val("");
                            $("#digit1").attr("readonly", true);
                            $("#data1").val("");
                            $("#data1").attr("readonly", true);
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
//                            $("#noBales1").val("");
//                            $("#noBales1").attr("readonly", true);
                            $("#expprod2").val("");
                            $("#expprod2").attr("readonly", true);
                            $("#digit2").val("");
                            $("#digit2").attr("readonly", true);
                            $("#data2").val("");
                            $("#data2").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales1").val("");
//                            $("#noBales1").attr("readonly", true);
                            $("#expprod2").val("");
                            $("#expprod2").attr("readonly", true);
                            $("#digit2").val("");
                            $("#digit2").attr("readonly", true);
                            $("#data2").val("");
                            $("#data2").attr("readonly", true);
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
//                            $("#noBales2").val("");
//                            $("#noBales2").attr("readonly", true);
                            $("#expprod3").val("");
                            $("#expprod3").attr("readonly", true);
                            $("#digit3").val("");
                            $("#digit3").attr("readonly", true);
                            $("#data3").val("");
                            $("#data3").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales2").val("");
//                            $("#noBales2").attr("readonly", true);
                            $("#expprod3").val("");
                            $("#expprod3").attr("readonly", true);
                            $("#digit3").val("");
                            $("#digit3").attr("readonly", true);
                            $("#data3").val("");
                            $("#data3").attr("readonly", true);
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
//                            $("#noBales3").val("");
//                            $("#noBales3").attr("readonly", true);
                            $("#expprod4").val("");
                            $("#expprod4").attr("readonly", true);
                            $("#digit4").val("");
                            $("#digit4").attr("readonly", true);
                            $("#data4").val("");
                            $("#data4").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales3").val("");
//                            $("#noBales3").attr("readonly", true);
                            $("#expprod4").val("");
                            $("#expprod4").attr("readonly", true);
                            $("#digit4").val("");
                            $("#digit4").attr("readonly", true);
                            $("#data4").val("");
                            $("#data4").attr("readonly", true);
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
//                            $("#noBales4").val("");
//                            $("#noBales4").attr("readonly", true);
                            $("#expprod5").val("");
                            $("#expprod5").attr("readonly", true);
                            $("#digit5").val("");
                            $("#digit5").attr("readonly", true);
                            $("#data5").val("");
                            $("#data5").attr("readonly", true);
                            $(this).focus();
                            $(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales4").val("");
//                            $("#noBales4").attr("readonly", true);
                            $("#expprod5").val("");
                            $("#expprod5").attr("readonly", true);
                            $("#digit5").val("");
                            $("#digit5").attr("readonly", true);
                            $("#data5").val("");
                            $("#data5").attr("readonly", true);
                            $(this).val("");
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
//                            $("#valu61").val("");
//                            $("#noBales5").val("");
//                            $("#noBales5").attr("readonly", true);
                            $("#expprod6").val("");
                            $("#expprod6").attr("readonly", true);
                            $("#digit6").val("");
                            $("#digit6").attr("readonly", true);
                            $("#data6").val("");
                            $("#data6").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#valu61").val("");
//                            $("#noBales5").val("");
//                            $("#noBales5").attr("readonly", true);
                            $("#expprod6").val("");
                            $("#expprod6").attr("readonly", true);
                            $("#digit6").val("");
                            $("#digit6").attr("readonly", true);
                            $("#data6").val("");
                            $("#data6").attr("readonly", true);
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
//                            $("#noBales6").attr("readonly", true);
//                            $("#noBales6").val("");
                            $("#expprod7").val("");
                            $("#expprod7").attr("readonly", true);
                            $("#digit7").val("");
                            $("#digit7").attr("readonly", true);
                            $("#data7").val("");
                            $("#data7").attr("readonly", true);

                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales6").val("");
//                            $("#noBales6").attr("readonly", true);
                            $("#expprod7").val("");
                            $("#expprod7").attr("readonly", true);
                            $("#digit7").val("");
                            $("#digit7").attr("readonly", true);
                            $("#data7").val("");
                            $("#data7").attr("readonly", true);

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
//                            $("#noBales7").val("");
//                            $("#noBales7").attr("readonly", true);
                            $("#expprod8").val("");
                            $("#expprod8").attr("readonly", true);
                            $("#digit8").val("");
                            $("#digit8").attr("readonly", true);
                            $("#data8").val("");
                            $("#data8").attr("readonly", true);
                            $(this).val("");
                            $(this).focus();
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales7").val("");
//                            $("#noBales7").attr("readonly", true);
                            $("#expprod8").val("");
                            $("#expprod8").attr("readonly", true);
                            $("#digit8").val("");
                            $("#digit8").attr("readonly", true);
                            $("#data8").val("");
                            $("#data8").attr("readonly", true);
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
//                            $("#noBales8").val("");
//                            $("#noBales8").attr("readonly", true);
                            $("#expprod9").val("");
                            $("#expprod9").attr("readonly", true);
                            $("#digit9").val("");
                            $("#digit9").attr("readonly", true);
                            $("#data9").val("");
                            $("#data9").attr("readonly", true);
                            $(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales8").val("");
//                            $("#noBales8").attr("readonly", true);
                            $("#expprod9").val("");
                            $("#expprod9").attr("readonly", true);
                            $("#digit9").val("");
                            $("#digit9").attr("readonly", true);
                            $("#data9").val("");
                            $("#data9").attr("readonly", true);
                            $(this).val("");
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
//                            $("#noBales9").val("");
//                            $("#noBales9").attr("readonly", true);
                            $("#expprod10").val("");
                            $("#expprod10").attr("readonly", true);
                            $("#digit10").val("");
                            $("#digit10").attr("readonly", true);
                            $("#data10").val("");
                            $("#data10").attr("readonly", true);
                            $(this).val("");
                        }
                    } else if (name === 'Shift3')
                    {
                        if (parseFloat(digit6) > 420)
                        {
                            alert("Machine Running must be lessthan 420");
//                            $("#noBales9").val("");
//                            $("#noBales9").attr("readonly", true);
                            $("#expprod10").val("");
                            $("#expprod10").attr("readonly", true);
                            $("#digit10").val("");
                            $("#digit10").attr("readonly", true);
                            $("#data10").val("");
                            $("#data10").attr("readonly", true);
                            $(this).val("");
                        }
                    }
                });

                function efficiency1() {
                    var x = parseFloat(document.getElementById("expprod").value);
                    var y = parseFloat(document.getElementById("digit1").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";

                    var res = document.getElementById("data1");
                    res.value = z;
                }
                function efficiency2() {
                    var x = parseFloat(document.getElementById("expprod2").value);
                    var y = parseFloat(document.getElementById("digit2").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data2");
                    res.value = z;
                }
                function efficiency3() {
                    var x = parseFloat(document.getElementById("expprod3").value);
                    var y = parseFloat(document.getElementById("digit3").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data3");
                    res.value = z;
                }
                function efficiency4() {
                    var x = parseFloat(document.getElementById("expprod4").value);
                    var y = parseFloat(document.getElementById("digit4").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data4");
                    res.value = z;
                }
                function efficiency5() {
                    var x = parseFloat(document.getElementById("expprod5").value);
                    var y = parseFloat(document.getElementById("digit5").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data5");
                    res.value = z;
                }
                function efficiency6() {
                    var x = parseFloat(document.getElementById("expprod6").value);
                    var y = parseFloat(document.getElementById("digit6").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data6");
                    res.value = z;
                }
                function efficiency7() {
                    var x = parseFloat(document.getElementById("expprod7").value);
                    var y = parseFloat(document.getElementById("digit7").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data7");
                    res.value = z;
                }
                function efficiency8() {
                    var x = parseFloat(document.getElementById("expprod8").value);
                    var y = parseFloat(document.getElementById("digit8").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data8");
                    res.value = z;
                }
                function efficiency9() {
                    var x = parseFloat(document.getElementById("expprod9").value);
                    var y = parseFloat(document.getElementById("digit9").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data9");
                    res.value = z;
                }
                function efficiency10() {
                    var x = parseFloat(document.getElementById("expprod10").value);
                    var y = parseFloat(document.getElementById("digit10").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("data10");
                    res.value = z;
                }
                function efficiency11() {
                    var x = parseFloat(document.getElementById("totalPrice1").value);
                    var y = parseFloat(document.getElementById("totalPrice2").value);
                    var n = (y / x) * 100;
                    var z = n.toFixed(3);
                    if (isNaN(n))
                        z = "";
                    var res = document.getElementById("totalPrice3");
                    res.value = z;
                }
                $(".price3").mouseenter(function () {
                    efficiency11();

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
