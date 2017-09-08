<%-- 
    Document   : OeRtve
    Created on : Dec 15, 2016, 10:29:59 AM
    Author     : ch.mounika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>

<html lang="en">
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

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
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
                    var date = $('.price').val();
                    var date1 = $('.price1').val();
                    var a = document.createElement('a');
                    var data_type = 'data:application/vnd.ms-excel';
                    var table_div = document.getElementById('table');
                    var table_html = table_div.outerHTML.replace(/ /g, '%20');
                    a.href = data_type + ', ' + table_html;
                    a.download = 'OE(' + date + ' to ' + date1 + ')_' + postfix + '.xls';
                    a.click();
                    e.preventDefault();

                });
            });

        </script>
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>
            <style type="text/css">
            label[for="i1"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>

            <sj:head/>
            <s:head/>

        </head>

        <body style="background-color: #EEEEEE">

        <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage3.jsp" %>



            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Open End (OE) Mini Statement Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>

                        <s:form action="Openend" method="post" class="form-horizontal">
                            <table>
                                <td><s:hidden name="id" value="%{id}" /></td>
                                <td><sj:datepicker  name="ort.date" id="i" changeMonth="true" changeYear="true" readonly="true" label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <td><sj:datepicker  maxDate="now" name="ort.date1" id="i1" changeMonth="true" changeYear="true" readonly="true" label="To Date"  size="90" cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <%-- <td><s:textfield name="ort.eid" id="i" cssClass="form-control form-group" label="Employee Id" placeholder="Employee Id"></s:textfield></td>               <td><s:select name="ort.superviser" id="i" cssClass="form-control form-group"  list="superList" label="Supervisor" headerKey="-1" headerValue=" --Select Supervisor-- " /></td> --%>
                                <td><s:select id="i" name="ort.shifts" list="{'Shift 1','Shift 2','Shift 3','Whole day'}" label="Select Shift" headerKey="-1" headerValue=" --Select-- " requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td>
                            
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



            <div>
                <br>
                <br>
            </div>         



            <div class="tab1">
                <table border="1" class="table table-bordered table-responsive" id="table">
                    <tr>
                        <th>Date</th>
                        <th>Shift</th>
                        <th>Expected Production</th> 
                        <th>Actual Production</th>
                        <th>Efficiency</th>
                        <th>Hp Efficiency</th>

                    </tr>

                    <s:iterator value="list" status="count">
                        <s:hidden value="%{#count.index}" id="like"/>
                        <tr>
                            <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                            <td><s:property value="shifts"/></td>
                            <td><s:property value="totalEp"/></td>
                            <td><s:property value="totalAp"/></td>
                            <td><s:property value="totalEfcy"/></td>
                            <td><s:property value="totalHpEfcy"/></td>
                        </tr>
                    </s:iterator>
                </table> 
                <div class="col-sm-6 text-center" id="abc" >
                    <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
                </div>
            </div>
            <!-- /.row -->
            <hr>

            <!-- Footer -->



            <!-- /.container -->
        </s:iterator>  

    </body>
</html>

