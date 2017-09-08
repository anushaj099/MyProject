<%-- 
    Document   : DrawingReportsmain
    Created on : Jan 7, 2017, 4:32:32 PM
    Author     : NSG
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
            <!-- Page Content -->
            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Drawing Main Statement Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>

                        <s:form action="retrievemainDrawing" method="post" class="form-horizontal">
                            <table>
                                <td><s:hidden name="id" value="%{id}" /></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                <td><sj:datepicker changeMonth="true" changeYear="true" maxDate="now"  name="form1.date" id="i" readonly="true"  label="From Date"  size="90" cssClass="lab d1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy"></sj:datepicker> </td>
                                <td><sj:datepicker changeMonth="true" maxDate="now" changeYear="true"  name="form1.date1" id="i1" readonly="true"  label="To Date"  size="90" cssClass="lab d2" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy"></sj:datepicker> </td>
                                <td><s:select id="i" name="machines" list="{'MC-1','MC-2','MC-3','MC-4','MC-5','All'}" label="Select Machine" headerKey="-1" headerValue=" --Select-- " cssClass="form-control"/></td>
                                <td><s:select id="i" name="form1.shifts" list="{'Shift1','Shift2','Shift3','Whole Day'}" label="Select Shift" cssClass="form-control" headerKey="-1" headerValue="--SelectShift--" /></td>
                            </table>

                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <div style="margin-left: 10em; margin-top: 3em">
                                        <center> <s:submit label="Submit" cssClass="btn btn-primary" onclick="javascript:my()" ></s:submit></center>
                                        </div>
                                    </div>
                                </div>
                        </div>

                    </div>
            </s:form>

        </center>

        <div>
            <br>
            <br>
        </div>         

        <div class="tab1">
            <table border="1" class="table table-bordered table-responsive" id="table">

                <tr>
                    <th>Date</th>
                    <th>Shift</th>
                    <th>Emp Id</th>
                    <th>Machine No</th>
                    <th>Delivery Hank</th> 
                    <th>M/C Speed</th>
                    <th>M/C Running</th>
                    <th>Expected Production</th>
                    <th>Actual Production</th>
                    <th>Efficiency</th>
                    <th>No of Breaks</th>
                    <th>Remarks</th>

                </tr>

                <s:iterator value="list1" var="obj1" status="count" >
                    <s:hidden value="%{#count.index}" id="like"/>
                     <s:if test="#obj1.ActualProduction!=null">
                    <tr> 
                        <s:if  test="%{machines=='All'}" >
                            <s:if test="%{#count.index%5==0}">
                                <s:iterator value="list" var="obj2" >
                                    <s:if test="#obj1.parentDrawing.idd==#obj2.idd" >
                                        <td rowspan="5" style="vertical-align: middle;"><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                        <td rowspan="5" style="vertical-align: middle;"><s:property value="shifts"/></td>
                                    </s:if>
                                </s:iterator> 
                            </s:if>
                        </s:if>
                        <s:else>
                        <s:iterator value="list" var="obj2" >
                                <s:if test="#obj1.parentDrawing.idd==#obj2.idd" >
                                    <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    <td><s:property value="shifts"/></td>
                                </s:if>
                        </s:iterator> 
                        </s:else>
                        <td><s:property value="empId"/></td>
                        <td><s:property value="carding"/></td>
                        <td><s:property value="deliveryHank"/></td>
                        <td><s:property value="mcSpeed"/></td>
                        <td><s:property value="mcRunning"/></td>
                        <td><s:property value="expectedProduction"/></td>
                        <td><s:property value="actualProduction"/></td>
                        <td><s:property value="efficiency"/></td>
                        <td><s:property value="breakedInShifts"/></td>
                        <td><s:property value="remarks"/></td>

                    </tr>
                     </s:if>
                </s:iterator>
            </table>   
            <div class="col-sm-6 text-center" id="abc" >
                <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
            </div>
        </div>
        <hr>
    </s:iterator>
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">

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

                var d1 = $('.d1').val();
                var d2 = $('.d2').val();
                var a = document.createElement('a');
                var data_type = 'data:application/vnd.ms-excel';
                var table_div = document.getElementById('table');
                var table_html = table_div.outerHTML.replace(/ /g, '%20');
                a.href = data_type + ', ' + table_html;
                a.download = 'Drawing(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';
                a.click();
                e.preventDefault();
            });
        });
        function my()
        {
            var button = $('#button');
            $(button).removeAttr('disabled');
        }

    </script>

</body>
</html>



