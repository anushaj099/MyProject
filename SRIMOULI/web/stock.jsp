<%-- 
    Document   : stock
    Created on : Jan 17, 2017, 3:58:49 PM
    Author     : ch.mounika
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
        <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage.jsp" %>                  
        </s:iterator>
    <center>
        <div class="container">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Enter last updated stock data</h1>
                </div>
            </div>
            <!-- /.row -->

            <!-- Projects Row -->
            <div class="row">


                <s:form action="stockInsertCheck"  method="post" class="form-horizontal" > 
                    <table id="part1">
                        <td><sj:datepicker readonly="true" name="pcard.date" id="i" changeMonth="true" changeYear="true"  label="Date "  size="90"  displayFormat="dd-mm-yy" cssClass="lab date1" placeholder="dd-mm-yyyy"/> </td>
                   <s:hidden value="%{status}" id="check1" />
                    </table>
                    <br/>
                    <div class="form-group">
                         <div class="col-sm-6 text-center">
                              <center>
                              <s:submit id="goButton" value="Go" cssClass="btn btn-primary" align="right"></s:submit>
                              </center>
                              </div> 
                    </s:form>
                        <s:form action="stockInsert" method="post" class="form-horizontal" > 
                        <div class="col-sm-12 text-center"><h3>Stock Data</h3></div>
                        <div class="tab1">
                            <table class="table table-bordered table-responsive" id="one1"  style="width:800px;">
                                <tr>
                                    <th>Variety</th>
                                    <th>Stock Quantity</th>
                                    <th>Stock Kgs</th>
                                </tr>
                                <tr>
                                    <td><s:textfield name="pcard.variety" cssClass="form-control" value="Cotton1" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString"  value="" theme="simple" onkeypress="return isNumberKey(this,event)"  placeholder="Enter Cotton-1 Quantity"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control"  value="" onkeypress="return isNumberKey(this,event)" id="myString1" placeholder="Enter Cotton-1 weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="Cotton2" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString2" onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter Cotton-2 Quantity" ></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString3" placeholder="Enter Cotton-2 weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="Comber" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString4" onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter Comber Quantity" ></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString5" placeholder="Enter Comber Weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="Flatstrips" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString6" onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter Flatstrips quantity"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString7" placeholder="Enter Flatstrips weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="Silver/PS" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control"  onkeypress="return isNumberKey(this,event)" theme="simple" id="myString16" placeholder="Enter Silver Quantity"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString17" placeholder="Enter Silver weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="LFS" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString8" onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter LFS Quantity"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString9" placeholder="Enter LFS Weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="Pneumafil" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString10" onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter Pneumafil Quantity" ></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString11" placeholder="Enter Pneumafil weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="LD" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString12" onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter LD Quantity"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString13" placeholder="Enter LD Weight" theme="simple"></s:textfield></td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="pcard.variety" cssClass="form-control" value="BRD" id="noBales" theme="simple" readonly="true"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockQuantity" cssClass="form-control" id="myString14"  onkeypress="return isNumberKey(this,event)" theme="simple" placeholder="Enter BRD Quantity"></s:textfield></td>
                                    <td><s:textfield name="pcard.stockKgs" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="myString15" placeholder="Enter BRD Weight" theme="simple"></s:textfield></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form-group" >
                                <div class="col-sm-6 text-center" id="two">
                                <s:submit label="Submit" cssClass="btn btn-primary" align="center" onclick="checkvalue()"></s:submit> 
                                </div>
                                <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
                        </div>
                    </s:form>
                    </center>
                </div>
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

                <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
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
                <script type="text/javascript">
                           function checkvalue() {
                               var mystring = document.getElementById('myString').value;
                               var mystring1 = document.getElementById('myString1').value;
                               var mystring2 = document.getElementById('myString2').value;
                               var mystring3 = document.getElementById('myString3').value;
                               var mystring4 = document.getElementById('myString4').value;
                               var mystring5 = document.getElementById('myString5').value;
                               var mystring6 = document.getElementById('myString6').value;
                               var mystring7 = document.getElementById('myString7').value;
                               var mystring8 = document.getElementById('myString8').value;
                               var mystring9 = document.getElementById('myString9').value;
                               var mystring10 = document.getElementById('myString10').value;
                               var mystring11 = document.getElementById('myString11').value;
                               var mystring12 = document.getElementById('myString12').value;
                               var mystring13 = document.getElementById('myString13').value;
                               var mystring14 = document.getElementById('myString14').value;
                               var mystring15 = document.getElementById('myString15').value;
                               var mystring16 = document.getElementById('myString16').value;
                               var mystring17 = document.getElementById('myString17').value;

                               var valueDate = document.getElementById('i').value;
                               if (valueDate == null || valueDate == '')
                               {
                                   alert('Date is empty');
                                   return false;
                               }

                               if (!mystring.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring1.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring2.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring3.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring4.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring5.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring6.match(/\S/)) {
                                 alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring7.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring8.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring9.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring10.match(/\S/)) {
                                 alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring11.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring12.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring13.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring14.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring15.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring16.match(/\S/)) {
                                   alert('Are You sure, You want to continue?');
                                   return false;
                               } else if (!mystring17.match(/\S/)) {
                                  alert('Are You sure, You want to continue?');
                                   return false;
                               }

                           }



                </script>

                <%--<script type="text/javascript">
                    function dateValid(){
                var valueDate = document.getElementById('i').value;
                if ( valueDate== null || valueDate== '')
                {
                    alert('Date is empty');
                    return false;
                }
                    }
                </script> --%>

                </body>
                </html>