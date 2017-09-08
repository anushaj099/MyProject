<%-- 
    Document   : ProductionRtve
    Created on : Dec 12, 2016, 4:03:37 PM
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

    <%--    <s:iterator value="ulist" var="myobj" >   
<%@include file="Upperpage3.jsp" %>  --%>
      <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage3.jsp" %>
                    </s:if>
               
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Issue to Department Report</h1>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <s:form action="ProductionRtve" method="post" class="form-horizontal">
                            <table class="EventDetail">
                                <td><s:hidden name="id" value="%{id}" /></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                <td><sj:datepicker  name="pp.date" id="i" changeMonth="true" changeYear="true" label="From Date" readonly="true" size="90" cssClass="lab d1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <td><sj:datepicker  name="pp.date1" id="i1" changeMonth="true" changeYear="true" label="To Date" readonly="true" size="90" cssClass="lab d2" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <%--<td><s:select name="pp.superviser" id="i" list="superList" cssClass="form-control form-group" label="Godown Keeper Name"  headerKey="-1" headerValue="--Select Godown Keeper Name--"/></td>
                                <td><s:select id="i" name="pp.shifts" list="{'Shift1','Shift2','Shift3','Whole day'}" label="Select Shift" headerKey="-1" headerValue=" --Select-- " requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td> --%>
                                <td><s:select name="pp.mixingNumber" id="i" cssClass="form-control" list="{'Mixing1','Mixing2', 'Mixing3', 'All'}" label="Mixing Number" headerKey="-1" headerValue="-- Select --" /></td>
                                <td><s:select name="pp.issueNumber" id="i" cssClass="form-control" list="{'1','2','3','4','5','6','7','8','9','10','All'}" label="Issue Number" headerKey="-1" headerValue="-- Select Issue Number --" /></td>
                            </table>
                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <div style="margin-left: 10em; margin-top: 3em">
                                        <center><s:submit label="Submit" cssClass="btn btn-primary" ></s:submit></center>
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
            <table border="1" class="table table-bordered table-responsive EventDetail" id="table">
                <tr>
                    <th>Date</th>
                    <th>Godown Keeper Name</th>
                    <th>Mixing Number</th>
                    <th>Issue Number</th> 
                    <th>Variety</th>
                    <th>Weight</th>
                    <th>Number of Bales</th>
                    <th>Mixing Percentage</th>
                </tr>
                <s:iterator value="list" var="obj1" status="stat">
                    <s:hidden value="%{#stat.index}" id="like"/>
                    <tr>
                        
                            
                            <s:iterator value="list1" var="obj2">
                                <s:if test="#obj1.parentGdProduction.idpp==#obj2.idpp">
                                    <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    <td><s:property value="superviser"/></td>
                                    <td><s:property value="mixingNumber"/></td>
                                    <td><s:property value="issueNumber"/></td>
                                </s:if>     
                            </s:iterator>
                   
                        <td><s:property value="variety" /></td>
                        <td><s:property value="weight" /></td>
                        <td><s:property value="TotalBales"/></td>
                        <td><s:property value="mixing"/></td>
                    </tr>
                </s:iterator>
            </table>  
             <div class="col-sm-6 text-center" id="abc" >
                <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
            </div>
        </div>
        <hr>
    </s:iterator>
    <script>
         $('.EventDetail tr:has(td:empty)').hide();
         
        $(document).ready(function () {
             var al=$("#like").val();
           if(al===undefined)
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
                //var postfix = "( " + d1 + " )" + " to " + "( " + d2 + " )";
                var a = document.createElement('a');
                var data_type = 'data:application/vnd.ms-excel';
                var table_div = document.getElementById('table');
                var table_html = table_div.outerHTML.replace(/ /g, '%20');
                a.href = data_type + ', ' + table_html;
               // a.download = postfix + '.xls';
                a.download = 'Production('+d1+' to '+d2+')_' + postfix + '.xls';
                
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
