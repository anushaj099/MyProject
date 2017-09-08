<%-- 
    Document   : DispatchReports
    Created on : Feb 14, 2017, 12:40:22 PM
    Author     : Swathi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html>
<html>
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
            </style>
        </head>
        <body style="background-color: #EEEEEE">
        <s:iterator value="ulist" var="myobj" >  
            <%@include file="Upperpage3.jsp" %>                  
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Dispatch Reports</h1>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <s:form action="dispatchrtve" method="post" class="form-horizontal">
                            <table>
                                <td><s:hidden value="%{id}" name="id"/></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                <td><sj:datepicker readonly="true"  name="f1.date" id="i" changeMonth="true" changeYear="true"   label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" ></sj:datepicker> </td>
                                <td><sj:datepicker readonly="true" name="f1.date1" id="i1"  changeMonth="true" changeYear="true"   label="To Date"  size="90" cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                                <td><s:select name="count" id="i" list="countlist" cssClass="form-control form-group" label="Count" headerKey="-1" headerValue="-- Select Count --"/></td>
                                <td><s:select name="f1.packingType" list="{'Box','Bag','All'}"  id="i" cssClass="form-control form-group" label="Packing Type" headerKey="-1" headerValue=" --Select-- " placeholder="Enter Packing Pattern"/></td>
                            </table>
                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <div style="margin-left: 10em; margin-top: 3em">
                                        <center> <s:submit label="Submit" cssClass="btn btn-primary" ></s:submit></center>
                                        </div>
                                    </div>
                                </div>
                    </center>
                        </div>
                    </div>
            </s:form>
        </s:iterator>
<br/>
<br/>
    <div class="tab1">
        <table border="1" id="table" class="table table-bordered table-responsive">
            <tr>
                <th>Date</th>
                <th>Count</th>
                <th>Lot No</th>
                <th>Packing Weight</th>
                <th>Customer Name</th>
                <th>No of Bags</th>
                <th>Net Weight</th>
                <th>Expected Gross Weight</th>
                <th>Actual Gross Weight</th>
                <th>Extra Yarn Cent</th>
            </tr>
            <s:iterator value="list" status="count">
                 <s:hidden value="%{#count.index}" id="like"/> 
                <tr>
                    <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                    <td><s:property value="count"/></td>
                    <td><s:property value="lotNo"/></td>
                    <td><s:property value="packingWeight"/></td>
                    <td><s:property value="customer"/></td>
                    <td><s:property value="noOfBags"/></td>
                    <td><s:property value="netWt"/></td>
                    <td><s:property value="expectedGrossWt"/></td>
                    <td><s:property value="weighingBridge"/></td>
                    <td><s:property value="extraYarnCent"/></td>
                </tr>
            </s:iterator>
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
                    a.download = 'Packing(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';
                    a.click();
                    e.preventDefault();
                });
            });
        </script>
    </div>
    <hr>
</body>
</html>
