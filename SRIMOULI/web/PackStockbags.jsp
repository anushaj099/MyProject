<%-- 
    Document   : PackStock
    Created on : Feb 15, 2017, 12:02:10 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
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
        <link href="Images/SriMouli.ico" rel="icon">
        <!-- Custom CSS -->
        <link href="css/Srimouli.css" rel="stylesheet">
        <link href="css/newcss.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}

            label[for="i1"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}
            input[type="checkbox"]{
                width: 25px;
                margin-left: 10px;
            }

        </style>
        
        <sj:head/>
        <s:head/>
    </head>
    <body style="background-color: #EEEEEE">
        <s:iterator value="ulist" var="myobj">
            <%@include  file="Upperpage.jsp" %>

            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Packing Stock Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>
                        <s:form action="stockret" method="post" class="form-horizontal">
                            <table>
                                <tr> 
                                    <td><s:hidden name="id" value="%{id}" /></td>
                                    <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                    <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                    <td><s:hidden name="enddate" value="%{enddate}" /></td>                                    
                                    <td> <sj:datepicker name="form1.date" changeMonth="true" maxDate="now" changeYear="true" id="i" readonly="true"  label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="Select Date(dd-mm-yyyy)" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                                        <td><br/></td>
                                        <td><sj:datepicker  name="form1.date1" changeYear="true" maxDate="now" changeMonth="true" id="i1" readonly="true"  label="To Date"  size="90" cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="Select Date(dd-mm-yyyy)" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                                        <td><br/></td>
                                        <td><s:select name="countdb" id="i" cssClass="form-control" list="countlist" label="Count" headerKey="-1" headerValue="-- Select --" /></td> 
                                        <td><br/></td>    
                                </tr>
                                </table>
                                <div class="form-group">
                                    <div class="col-sm-6 text-center">
                                    <s:submit  label="Submit"  cssClass="btn btn-primary" align="center" onloading="loading" ></s:submit>
                                    </div>
                                    <div class="col-sm-6 text-center"> 
                                        <button type="reset" class="btn btn-primary" >Cancel</button>
                                    </div>
                                </div> 
                        </div>
                </s:form>

            </s:iterator>

            <div>
                <br>
                <br>
            </div>  

            <div class="tab1">
                <table border="1" id="table" class="table table-bordered table-responsive">
                   <tr>
                        <th>Date</th>
                        <th>Count</th>
                        <th>Type of Packing</th>
                        <th>Packing Weight</th>
                        <th>Opening Stock</th>
                        <th>Packed Bags</th>
                        <th>Dispatch</th>
                        <th>Closing Stock</th>
                        <th>Closing Stock(Kgs)</th>

                    </tr>
                    <%--<s:set var="total" value="0" />
                    <s:set var="total1" value="0" /> --%>
                    <s:iterator value="list" status="count" var="obj1"> 
                          <s:hidden value="%{#count.index}" id="like"/>
                       <%-- <s:set var="total" value="%{#total+totalPackedBags}" />
                        <s:set var="total1" value="%{#total1+totalDispatch}"/> --%>
                       
                        <tr>
                            <%-- <s:iterator value="plist" var="obj2" >
                             <s:if test="#obj1.parentPacking.idpq==#obj2.idpq">--%>
                            <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                            <%-- </s:if>
                             </s:iterator>--%>
                            <td><s:property value="count"/> </td>
                            <td><s:property value="typeOfPack"/></td>
                            <td><s:property value="packWt"/></td>
                            <td><s:property value="openStk"/></td>
                            <td><s:property value="packedBags"/></td>
                            <td><s:property value="dispatch"/></td>
                            <td><s:property value="closingStk"/></td>
                            <td><s:property value="closingStkKgs"/></td>
                           </tr>

                    </s:iterator>
                   <%-- <tr>
                        <th colspan="2" class="text-center">Total</th>
                        <th><s:property  value="%{#total}" /></th>
                        <th><s:property  value="%{#total1}" /></th>
                    </tr> --%>
                </table>   
                     <div class="col-sm-6 text-center" id="abc" >
                <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
            </div>
                      <script>
                $(document).ready(function () {
                var al = $("#like").val();
                if (al === undefined)
                    $("#abc").find("input,button,textarea,select").attr("disabled", "disabled");
                $("#button").click(function (e) {
                   
                    var dt = new Date();
                    var day = dt.getDate();
                    var month = dt.getMonth() + 1;
                    var year = dt.getFullYear();
                    var hour = dt.getHours();
                    var mins = dt.getMinutes();
                    var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
                    
                    var d1 = $('.price').val();
                    var d2 = $('.price1').val();
                    
                    var a = document.createElement('a');
                    var data_type = 'data:application/vnd.ms-excel';
                    var table_div = document.getElementById('table');
                    var table_html = table_div.outerHTML.replace(/ /g, '%20');
                    a.href = data_type + ', ' + table_html;
                    a.download = 'Pack_Stock(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';
                    a.click();
                    e.preventDefault();
                });
            });
        </script>
            </div>
            <!-- /.row -->
            <hr>

            <!-- Footer -->
        </div>
    </body>
</html>
