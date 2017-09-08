<%-- 
    Document   : PackRtve
    Created on : Dec 28, 2016, 10:34:42 AM
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


        <sj:head/>
        <s:head/>

    </head>

    <body style="background-color: #EEEEEE">
        <%--    <s:iterator var="myobj" value="ulist">
                <%@include  file="Upperpage3.jsp" %>
        --%>
        <s:iterator value="ulist" status="stat" var="myobj"> 
            <s:if test="%{#stat.index==0}">
                <%@include file="Upperpage3.jsp" %>
            </s:if>

            <!-- Page Content -->
            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Packing Reports</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>

            <s:form action="Packingrtve" method="post" class="form-horizontal">
                            <table class="EventDetail">
                                <td><s:hidden value="%{id}" name="id"/></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                <td><sj:datepicker readonly="true"  name="form1.date" id="i" changeMonth="true" changeYear="true"   label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" ></sj:datepicker> </td>
                                <td> <sj:datepicker readonly="true" name="form1.date1" id="i1"  changeMonth="true" changeYear="true"   label="To Date"  size="90" cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                                <td><s:select name="form1.superviser" list="superList"  id="i" cssClass="form-control form-group" label="Packer Name" headerKey="-1" headerValue=" --Select-- " placeholder="Enter Supervisor name"/></td>
                                <td><s:select name="countdb" list="countlist" id="i" cssClass="form-control form-group" headerKey="-1" headerValue="--Select Count--" placeholder="Select count" label="Counts"/></td>
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
    

    <div>
        <br>
        <br>
    </div>         



    <div class="tab1">
        <table border="1" id="table" class="table table-bordered table-responsive EventDetail">
            <tr>
                <th>Date</th>
                <th>Count</th>

                <!--                <th>Open Stock</th> -->
                <th>Type of Packing</th>
                <th>Packing Weight</th>
                <th>Packed Bags</th>
<!--                <th>Total Dispatch</th>
                <th>Closing Stock</th>-->

            </tr>
     <%--      <s:set var="total" value="0" />--%>
            
          <%--  <s:set var="total2" value="0" />
            <s:set var="total3" value="0" />--%>
         <s:set var="total1" value="0" />
          <s:iterator value="list1" status="count" var="obj1">
                <s:hidden value="%{#count.index}" id="like"/>
               <%-- <s:set var="total" value="%{#total+totalOpeningStock}" />--%>
                
               <%-- <s:set var="total2" value="%{#total2+totalDispatch}" />
                <s:set var="total3" value="%{#total3+totalDisclose}" /> --%>
               <%-- <s:set var="total1" value="%{#total1+totalPackedBags}" /> --%>
               <tr>
               <s:iterator value="list" var="obj2">
                             <s:if test="#obj1.parentPacking.idpq==#obj2.idpq">
                                    <td ><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                </s:if>
                           </s:iterator> 
                
<!--                    <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>-->
                    <td><s:property value="countDb"/></td>
                  <td><s:property value="boxType"/></td>
                    <td><s:property value="weight"/></td>
                    <td><s:property value="packedBags"/></td>
                      <s:set var="total1" value="%{#total1+packedBags}" />
                </tr>
           </s:iterator>
<!--        <tr>
                <th>Total</th>
                <th></th>
                <th></th>
                <th></th>
               <th><s:property  value="%{#total1}" /></th>-->
              <%--  <th><s:property  value="%{#total2}" /></th>
                <th><s:property  value="%{#total3}" /></th>
             <th><s:property  value="%{#total1}" /></th>--%>
           </tr>
        </table>   
           <div class="col-sm-6 text-center" id="abc" >
                <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
            </div>
            <script>
                $('.EventDetail tr:has(td:empty)').hide();
                
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
    <!-- /.row -->
    <hr>
<!-- Footer -->
<!-- /.container -->
</body>

</html>
