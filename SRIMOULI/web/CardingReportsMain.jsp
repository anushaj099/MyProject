<%-- 
    Document   : CardingReportsMain
    Created on : Jan 7, 2017, 4:31:35 PM
    Author     : Gayathri
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


        <sj:head/>
        <s:head/>

    </head>
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

        <body style="background-color: #EEEEEE">
        <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage3.jsp" %>               



            <!-- Page Content -->
            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Carding Main Statement Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>

                        <s:form action="retrievePCarding1" method="post" class="form-horizontal">
                            <table>
                                <td><s:hidden name="id" value="%{id}" /></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>   --%>
                                <td>

                                    <sj:datepicker  name="form.date" id="i" changeMonth="true" changeYear="true" readonly="true"  label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <td><sj:datepicker  name="form.date1" id="i1" readonly="true" changeMonth="true" changeYear="true" label="To Date" size="90"  cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <%-- <td><s:select name="form.superviser" id="i" list="superList" cssClass="form-control form-group" label="Employee Id" headerKey="-1" headerValue=" --Select Supervisor-- " /></td>--%>
                                <td><s:select id="i" name="machines" list="{'MC-1','MC-2','MC-3','MC-4','MC-5','MC-6','MC-7','MC-8','MC-9','MC-10','All'}" label="Select Machines" headerKey="-1" headerValue=" --Select-- " requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td>
                                <td><s:select id="i" name="form.shifts" list="{'Shift1','Shift2','Shift3','WholeDay'}" label="Select Shifts" headerKey="-1" headerValue="--Select--" requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td>
                            </table>





                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <div style="margin-left: 10em; margin-top: 3em">
                                        <center> <s:submit label="Submit" cssClass="btn btn-primary" ></s:submit></center>
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



        <div class="tab1" id="dvData">
            <table border="1" class="table table-bordered table-responsive EventDetail" id="table">
                <tr>


                    <th>Date</th>
                    <th>Shifts</th>
                    <th>Employee Id</th>
                    <th>Machines</th>
                    <th>Delivery Hank</th>
                    <th>M/C Speed</th>
                    <th>M/C Running</th>
                    <th>Excepted Production</th>
                    <th>Actual Production</th>
                    <th>Efficiency</th>
                    <th>No of Breaks</th>
                    <th>Remarks</th>
                </tr>


                <s:iterator value="list1" var="obj1" status="count">
                    <s:hidden value="%{#count.index}" id="like"/>
                    
                     <s:if test="#obj1.ActualProduction!=null">
                         <tr>
                        <s:if  test="%{machines=='All'}" >
                            <s:if test="%{#count.index%10==0}">
                                <s:iterator value="list" var="obj2">
                                    <s:if test="#obj1.parentCarding.idc==#obj2.idc">
                                        <td rowspan="10" style="vertical-align: middle;"><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                        <td rowspan="10" style="vertical-align: middle;"><s:property value="shifts"/></td>
                                    </s:if>
                                </s:iterator> 
                            </s:if>
                        </s:if>
                        <s:else>
                            <s:iterator value="list" var="obj2">
                                <s:if test="#obj1.parentCarding.idc==#obj2.idc">
                                    <td><s:date  format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    <td><s:property value="shifts"/></td>
                                </s:if>
                            </s:iterator> 
                        </s:else>
                              
                        <td><s:property value="emId"/></td>
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
        </s:iterator>        
        <script>
           
         // $('.EventDetail tr:has(td:empty)').hide();
           
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
                a.download = 'Carding(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';
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

<!-- /.container -->





<script type="text/javascript">
    $("#btnExport").click(function (e) {
        window.open('data:application/vnd.ms-excel,' + $('#dvData').click());
        e.preventDefault();
    });

    }
</script>

</body>
</html>


