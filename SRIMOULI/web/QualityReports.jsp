<%-- 
    Document   : QualityReports
    Created on : Dec 22, 2016, 3:49:04 PM
    Author     : NSG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<html lang="en">
    <head>

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
            
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">
          $(function () {
        $("#ddlPassport").change(function () {
            if ($(this).val() == "M/C Testing") {
                $("#dvPassport").show();
                 $("#dvPassport1").hide();
            }
            else if ($(this).val() == "Samples") {
                $("#dvPassport1").show();
                 $("#dvPassport").hide();
            }
            
        else {
                $("#dvPassport").hide();
            }
        });
    });
    
      </script>
        </head>
        

        <body style="background-color: #EEEEEE">
       
        <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage3.jsp" %>                  



            <!-- Page Content -->
            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Quality Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>
                        <s:form action="QltyRtve" method="post" class="form-horizontal">
                            <table class="EventDetail">
                                <td><s:hidden name="id" value="%{id}" /></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                <td><sj:datepicker  name="qlt.date" id="i" readonly="true" changeMonth="true" changeYear="true"  label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <td><sj:datepicker  name="qlt.date1" id="i1" readonly="true"  maxDate= "now" label="To Date" changeMonth="true" changeYear="true"  size="90" cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                       <%--     <td><s:select id="i" name="qlt.superName" list="superList" label="Superviser Name" headerKey="-1" headerValue=" --Select Name-- " requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td>
                        <td><s:select id="i" name="qlt.shifts" list="{'Shift1','Shift2','Shift3','Whole day'}" label="Select Shift" headerKey="-1" headerValue=" --Select Shift-- " requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td> --%>

                       <td><s:select id="ddlPassport"  name="qlt.shifts" list="{'M/C Testing','Samples'}"  label="Test Type" headerKey="-1" headerValue=" --Select Type-- " value="--Select Type--" cssClass="form-control"/></td>
<!--                          <td><s:checkboxlist id="i" list="{'M/C Testing','Samples'}" name="qlt.shifts" label="Test Type" cssClass="form-group chbox"/></td>-->
                            </table>
<br/>
                            <div id="dvPassport" style="display: none">
                                
                <s:checkboxlist id="ddlPassport"  name="qlt.mctype" list="{'M/C-1','M/C-2','M/C-3','M/C-4','M/C-5','M/C-6'}"  label="Machines" cssClass="form-group chbox price"/>
                        </div>
                        <br/>
                        <div id="dvPassport1" style="display: none">
                      <s:checkboxlist id="ddlPassport"  name="qlt.mctype" list="{'Sample1','Sample2','Sample3','Sample4','Sample5','Sample6'}"  label="Samples" cssClass="form-group chbox"/></td>
                    </div>

                            <div class="form-group">
                                <div class="col-sm-6 text-center" >
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



                      <table border="1" class="table table-bordered table-responsive EventDetail" id="table">
             <th>Date</th>   
             <s:if test="%{testtype=='M/C Testing'}">
              <th>Machines</th>
             </s:if>
             <s:elseif test="%{testtype=='Samples'}">
             <th>Samples</th>
             </s:elseif>
            <th>Count Number</th>
            <th>Count Maintained</th>
            <th>CSP</th>
            <th>CV</th>
            <th>Strength CV</th>
            <th>-50 (Every Day)</th>
            <th>+50 (Every Day)</th>
            <th>+280 (Every Day)</th>
            <th>IPI (Every Day) Test-1</th>
            <th>Remarks</th>
                    </tr>

                    <s:iterator value="list" status="stat" var="obj1">
                        <s:hidden value="%{#stat.index}" id="like"/>
                        <tr>
                            <%--<td><s:date format="dd-MM-yyyy" var="date1" name="%{actualDate}"/> <s:property value="%{date1}" ></s:property></td>--%>

                          

                                <s:iterator value="list1" var="obj2">
                                    <s:if test="#obj1.parentQuality.idq==#obj2.idq">
                                        <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    </s:if>     
                                </s:iterator>
                         
                            <th><s:property value="machines"/></th>
                            <td><s:property value="count"/></td>
                            <td><s:property value="countmaintained"/></td>
                            <td><s:property value="csp"/></td>
                            <td><s:property value="cv"/></td>
                            <td><s:property value="strengthCv"/></td>
                            <td><s:property value="minus50EveryDay"/></td>
                            <td><s:property value="plus50EveryDay"/></td>
                            <td><s:property value="plus280everyDay"/></td>
                            <td><s:property value="ipi"/></td>
                            <td><s:property value="remarks"/></td>
                        </tr>
                    </s:iterator> 
                    <s:iterator value="qlist" status="stat" var="obj1">
                        <s:hidden value="%{#stat.index}" id="like"/>
                        <tr>
                            <%--<td><s:date format="dd-MM-yyyy" var="date1" name="%{actualDate}"/> <s:property value="%{date1}" ></s:property></td>--%>

                          

                                <s:iterator value="list1" var="obj2">
                                    <s:if test="#obj1.parentQuality.idq==#obj2.idq">
                                        <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    </s:if>     
                                </s:iterator>
                         
                            <th><s:property value="machines"/></th>
                            <td><s:property value="count"/></td>
                            <td><s:property value="countmaintained"/></td>
                            <td><s:property value="csp"/></td>
                            <td><s:property value="cv"/></td>
                            <td><s:property value="strengthCv"/></td>
                            <td><s:property value="minus50EveryDay"/></td>
                            <td><s:property value="plus50EveryDay"/></td>
                              <td><s:property value="plus280everyDay"/></td>
                                <td><s:property value="ipi"/></td>
                                  <td><s:property value="remarks"/></td>
                        </tr>
                    </s:iterator>   
                   <s:iterator value="qlist1" status="stat" var="obj1">
                        <s:hidden value="%{#stat.index}" id="like"/>
                        <tr>
                            <%--<td><s:date format="dd-MM-yyyy" var="date1" name="%{actualDate}"/> <s:property value="%{date1}" ></s:property></td>--%>

                          

                                <s:iterator value="list1" var="obj2">
                                    <s:if test="#obj1.parentQuality.idq==#obj2.idq">
                                        <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    </s:if>     
                                </s:iterator>
                         
                            <th><s:property value="machines"/></th>
                            <td><s:property value="count"/></td>
                            <td><s:property value="countmaintained"/></td>
                            <td><s:property value="csp"/></td>
                            <td><s:property value="cv"/></td>
                            <td><s:property value="strengthCv"/></td>
                            <td><s:property value="minus50EveryDay"/></td>
                            <td><s:property value="plus50EveryDay"/></td>
                              <td><s:property value="plus280everyDay"/></td>
                                <td><s:property value="ipi"/></td>
                                  <td><s:property value="remarks"/></td>
                        </tr>
                    </s:iterator>         
                     <s:iterator value="qlist2" status="stat" var="obj1">
                        <s:hidden value="%{#stat.index}" id="like"/>
                        <tr>
                            <%--<td><s:date format="dd-MM-yyyy" var="date1" name="%{actualDate}"/> <s:property value="%{date1}" ></s:property></td>--%>

                          

                                <s:iterator value="list1" var="obj2">
                                    <s:if test="#obj1.parentQuality.idq==#obj2.idq">
                                        <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    </s:if>     
                                </s:iterator>
                         
                            <th><s:property value="machines"/></th>
                            <td><s:property value="count"/></td>
                            <td><s:property value="countmaintained"/></td>
                            <td><s:property value="csp"/></td>
                            <td><s:property value="cv"/></td>
                            <td><s:property value="strengthCv"/></td>
                            <td><s:property value="minus50EveryDay"/></td>
                            <td><s:property value="plus50EveryDay"/></td>
                              <td><s:property value="plus280everyDay"/></td>
                                <td><s:property value="ipi"/></td>
                                  <td><s:property value="remarks"/></td>
                        </tr>
                    </s:iterator>    
                    <s:iterator value="qlist3" status="stat" var="obj1">
                        <s:hidden value="%{#stat.index}" id="like"/>
                        <tr>
                            <%--<td><s:date format="dd-MM-yyyy" var="date1" name="%{actualDate}"/> <s:property value="%{date1}" ></s:property></td>--%>

                          

                                <s:iterator value="list1" var="obj2">
                                    <s:if test="#obj1.parentQuality.idq==#obj2.idq">
                                        <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    </s:if>     
                                </s:iterator>
                         
                            <th><s:property value="machines"/></th>
                            <td><s:property value="count"/></td>
                            <td><s:property value="countmaintained"/></td>
                            <td><s:property value="csp"/></td>
                            <td><s:property value="cv"/></td>
                            <td><s:property value="strengthCv"/></td>
                            <td><s:property value="minus50EveryDay"/></td>
                            <td><s:property value="plus50EveryDay"/></td>
                              <td><s:property value="plus280everyDay"/></td>
                                <td><s:property value="ipi"/></td>
                                  <td><s:property value="remarks"/></td>
                        </tr>
                    </s:iterator>   
                   <s:iterator value="qlist4" status="stat" var="obj1">
                        <s:hidden value="%{#stat.index}" id="like"/>
                        <tr>
                            <%--<td><s:date format="dd-MM-yyyy" var="date1" name="%{actualDate}"/> <s:property value="%{date1}" ></s:property></td>--%>

                          

                                <s:iterator value="list1" var="obj2">
                                    <s:if test="#obj1.parentQuality.idq==#obj2.idq">
                                        <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    </s:if>     
                                </s:iterator>
                         
                            <th><s:property value="machines"/></th>
                            <td><s:property value="count"/></td>
                            <td><s:property value="countmaintained"/></td>
                            <td><s:property value="csp"/></td>
                            <td><s:property value="cv"/></td>
                            <td><s:property value="strengthCv"/></td>
                            <td><s:property value="minus50EveryDay"/></td>
                            <td><s:property value="plus50EveryDay"/></td>
                              <td><s:property value="plus280everyDay"/></td>
                                <td><s:property value="ipi"/></td>
                                  <td><s:property value="remarks"/></td>
                        </tr>
                    </s:iterator>   
                </table>   
                <div class="col-sm-6 text-center" id="abc" >
                    <center><s:submit value="Export to Excel" onclick="fnExcelReport()" id="button" cssClass="btn btn-primary" ></s:submit>
                        </center>
                    </div>
                </div>
                <!-- /.row -->
                <hr>

                <!-- Footer -->


                <!-- /.container -->
        </s:iterator>
        <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script language="javascript">
             $('.EventDetail tr:has(td:empty)').hide();
            
            $(document).ready(function () {
                var al = $("#like").val();
                if (al === undefined)
                    $("#abc").find("input,button,textarea,select").attr("disabled", "disabled");
            });
            function fnExcelReport()
            {
                var dt = new Date();
                var day = dt.getDate();
                var month = dt.getMonth() + 1;
                var year = dt.getFullYear();
                var hour = dt.getHours();
                var mins = dt.getMinutes();
                var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
                var d1 = $('.price').val();
                var d2 = $('.price1').val();
                //var postfix = "( " + d1 + " )" + " to " + "( " + d2 + " )";
                var a = document.createElement('a');
                var data_type = 'data:application/vnd.ms-excel';
                var table_div = document.getElementById('table');
                var table_html = table_div.outerHTML.replace(/ /g, '%20');
                a.href = data_type + ', ' + table_html;
                // a.download = postfix + '.xls';
                a.download = 'Quality(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';

                a.click();
                e.preventDefault();
            }
            function my()
            {
                var button = $('#button');
                $(button).removeAttr('disabled');
            }
        </script>

    </body>
</html>
