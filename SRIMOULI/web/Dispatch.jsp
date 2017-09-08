<%-- 
    Document   : godownPurchase
    Created on : Dec 10, 2016, 3:22:18 PM
    Author     : nsg
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<%!
    public String name = "";
%> 
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
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <s:head/>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <sj:head/>
        <script type="text/javascript">
            $(document).ready(function () {
                var f = document.getElementById("ff1");
                $(f).attr("disabled", "disabled");

                var f1 = document.getElementById("ff");
                $(f1).attr("disabled", "disabled");
            });

            $(function () {
                $("#ddlPassport").change(function () {
                    if ($(this).val() === "Bag") {
                        $("#dvPassport").show();
                        $("#dvPassport1").hide();
                    } else if ($(this).val() === "Box") {
                        $("#dvPassport1").show();
                        $("#dvPassport").hide();
                    } else {
                        $("#dvPassport").hide();
                    }
                });
            });


            function myFunction() {
                var sel = $(".price option:selected").index();
                var f = document.getElementById("ff");
                $(f).attr("disabled", "disabled");
                f.selectedIndex = sel;
            }
            function myFunction1() {
                var sel = $(".price3 option:selected").index();
                var f = document.getElementById("ff1");
                $(f).attr("disabled", "disabled");
                f.selectedIndex = sel;
            }
        </script>
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
        <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property>  </marquee>
        </s:if>
        <s:else>
        <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>  
        </s:else>
    <style type="text/css">
        label[for="i"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;

        } 
        label[for="price2"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;

        } 
        label[for="price4"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;

        } 
        label[for="ff"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;

        } 
        label[for="ff1"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;

        } 
        label[for="extra"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;

        } 

        label[for="ddlPassport"]{
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;
        }
    </style>

    <s:iterator value="ulist" var="myobj" >  
        <%@include file="Upperpage2.jsp" %>                  
    </s:iterator>  
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <center><h1 class="page-header">Sri Mouli Textiles Private Limited Dispatch Data</h1></center>
            </div>
        </div>
        <center>
            <div class="row">

                <div class="clear">&#x00A0;</div>
                <s:form action="addDispatch"  enctype="multipart/form-data" >          
                    <table>
                        <tr>
                            <td><s:hidden name="id" value="%{id}" /></td>
                             
                            <td><sj:datepicker name="f1.date" id="i" maxDate="now" changeMonth="true" changeYear="true" label="Date" placeholder="Select  date (dd-mm-yyyy)" displayFormat="dd-mm-yy" size="90" cssClass="lab" readonly="true"/> </td>
                            <td><s:textfield id="i" name="f1.customer" label="Customer Name" onkeypress="return isDecimalKey(event)" placeholder="Enter Customer Name" cssClass="form-control form-group" ></s:textfield></td> 
                            <td><s:select id="i" name="f1.count" list="countlist" label="Count" onkeypress="return isNumberKey(this,event)"  cssClass="form-control form-group" headerKey="-1" headerValue="---Select Count---"></s:select></td> 
                            <td><s:select id="ddlPassport" name="f1.packingType" onchange="findval(this.value)" label="Select Pattern" list="{'Bag','Box'}"  cssClass="form-control form-group"  headerKey="-1" headerValue="-- Select Pattern --"/></td>
                        </tr>
                    </table>
                    <div id="dvPassport" style="display: none">
                        <table>
                            <s:select id="ddlPassport" cssStyle="width:688px;"   name="f1.packingWeight" list="weightlist" onchange="myFunction()"  label="Packing Weight" cssClass="form-group form-control price"/>
                            <s:select id="ff"  cssStyle="width:688px;"   name="f1.tareWeight" list="bagtare"  label="Tare Weight" cssClass="form-group form-control tare"/>   
                        </table></div> 
                    <div id="dvPassport1" style="display: none">
                        <table>
                            <s:select id="ddlPassport" cssStyle="width:688px;"  name="box" list="weightlist1" onchange="myFunction1()"  label="Packing Weight" cssClass="form-group form-control price3"/>
                            <s:select id="ff1"  cssStyle="width:688px;"   name="boxtare" list="boxtarel"  label="Tare Weight" cssClass="form-group form-control tare1"/>   
                        </table> </div>
                    <table style="margin-left: -80px;">
                        <tr>
                            <td><s:textfield id="i" name="f1.noOfBags" cssStyle="width:688px;" onkeypress="return isDecimalKey(event)" label="No. of Bag/Box to be loaded" placeholder="Enter no. of bags/box to be loaded"  cssClass="form-control form-group price1"/></td>
                            <td><s:textfield id="price2" name="f1.netWt" readonly="true" onmousemove="javascript:subNumbers()"  label="Net Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Net Weight" cssClass="form-control form-group" ></s:textfield></td> 
                            <td><s:textfield id="price4" name="f1.expectedGrossWt" readonly="true" label="Expected Gross Weight" onmousemove="javascript:subNumbers1()" placeholder="Enter Expected Gross weight" cssClass="form-control form-group expected"/></td>
                            <td><s:textfield id="i" name="f1.lotNo" onkeypress="return isDecimalKey(event)" label="LOT Number"  placeholder="Enter LOT Number" cssClass="form-control form-group" ></s:textfield></td> 
                            <td><s:textfield id="i" name="f1.bagSerialNo" onkeypress="return isDecimalKey(event)" label="Bag Serial Number"  placeholder="Enter Bag Serial Number" cssClass="form-control form-group" ></s:textfield></td> 
                            <td><s:textfield id="i" name="f1.weighingBridge" label="WeighBridge Weight" onkeypress="return isNumberKey(this,event)" placeholder="Enter Weighing Bridge" cssClass="form-control form-group weight" ></s:textfield></td> 
                            <td><s:textfield id="extra" name="f1.extraYarnCent" readonly="true" onmousemove="javascript:subNumbers2()" label="Extra Yarn Cent" placeholder="Enter Extra Yarn Cent" cssClass="form-control form-group "/></td>
                            <td><s:textfield id="i" name="f1.vehicleNo" label="Vehicle number" onkeypress="return isDecimalKey(event)" placeholder="Enter Vehicle Number" cssClass="form-control form-group" ></s:textfield></td> 
                            <td><s:textfield id="i" name="f1.remarks" label="Remarks" onkeypress="return isDecimalKey(event)" placeholder="Enter Remarks" cssClass="form-control form-group" ></s:textfield></td> 
                            </tr>
                        </table>
                        <br/><br/>
                        <div class="form-group">
                        <s:if test="year.isEmpty()">
                            <div class="col-sm-6 text-center" id="two">
                            <s:submit  label="Submit" cssClass="btn btn-primary" onclick="javascript:addAll()" align="center" ></s:submit>
                            </div>
                            </s:if>
                        <s:else>
                             <div class="col-sm-6 text-center" id="two">
                                 <s:submit disabled="true"  label="Submit" cssClass="btn btn-primary" onclick="javascript:addAll()" align="center" ></s:submit>
                            </div>
                        </s:else>
                            <div class="col-sm-6 text-center">
                            <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
                            </div>
                        </div>
                </s:form>
            </div>
        </center>
    </div>
    <hr>
    <footer>
        <div class="row">
            <div class="col-lg-6 text-center">
                <p>Copyright &copy; Sri Mouli Textiles Private Limited 2017</p>
            </div>
            <div class="col-lg-6 text-center">
                <p>Design &#x0026; Developed by <a href="http://www.nivriticloudsolutions.com/">Nivriti Solutions Global Pvt. Ltd.</a></p>
            </div>
        </div>
    </footer>
    <script language="javascript">
        function findval(item) {
            name = item;
        }
        function addAll()
        {
            subNumbers();
            subNumbers1();
            subNumbers2();
        }
        function subNumbers() {
            var mul = 0;
            var x = ($('.price').val());
            var fields = x.split('=');
            var l = fields[1];
            var y = ($('.price1').val());
            var d = ($('.price3').val());
            var fields1 = d.split('=');
            var m = fields1[1];
            if (name === 'Bag') {
                mul = l * y;
            } else if (name === 'Box') {
                mul = m * y;
            }
            if (isNaN(x))
                x = 0;
            if (isNaN(y))
                y = 0;
            if (isNaN(d))
                d = 0;
            var z = document.getElementById("price2");
            if (isNaN(mul))
                mul = "";
            z.value = mul;
        }
        function subNumbers1() {
            var mul = 0;
            var x = ($('.price').val());
            var fields = x.split('=');
            var l = fields[1];
            var y = ($('.tare').val());
            var z = ($('.price1').val());
            var h = ($('.tare1').val());
            var d = ($('.price3').val());
            var fields1 = d.split('=');
            var m = fields1[1];
            if (isNaN(x))
                x = 0;
            if (isNaN(y))
                y = 0;
            if (name === 'Bag') {
                mul = (parseFloat(l) + parseFloat(y)) * parseFloat(z);

            } else if (name === 'Box') {
                mul = (parseFloat(m) + parseFloat(h)) * parseFloat(z);
            }
            var z = document.getElementById("price4");
            if (isNaN(mul))
                mul = "";
            z.value = mul;
        }
        function subNumbers2() {
            var mul = 0;
            var x = $('.weight').val();
            var y = $('.expected').val();

            mul = parseFloat(x) - parseFloat(y);
            if (isNaN(x))
                x = 0;
            if (isNaN(y))
                y = 0;
            if (isNaN(z))
                z = 0;
            var z = document.getElementById("extra");
            if (isNaN(mul))
                mul = "";
            z.value = mul;
        }
    </script>
</body>
</html>