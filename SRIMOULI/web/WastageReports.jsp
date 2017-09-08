<%-- 
    Document   : MiniSaleReports
    Created on : Jan 10, 2017, 4:28:31 PM
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
        <SCRIPT language=Javascript>
            $(document).ready(function () {
                $('input[type="checkbox"]').click(function (event) {
                    if (this.checked && $('input:checked').length > 3) {
                        event.preventDefault();
                        alert('You are not allowed to choose more than 3 boxes');
                    }
                });
            });
        </SCRIPT> 
    </head>
    <body style="background-color: #EEEEEE">
     <s:iterator value="ulist" var="myobj"> 
            <%@include  file="Upperpage3.jsp" %> 

            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Issue To Wastage Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>
                        <s:form action="wastages" method="post" class="form-horizontal">
                            <table class="EventDetail">
                                <td><s:hidden name="id" value="%{id}" /></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                <td><sj:datepicker  name="pp.date" id="i" changeMonth="true" changeYear="true" label="From Date" readonly="true" size="90" cssClass="lab d1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <td><sj:datepicker  name="pp.date1" id="i1" changeMonth="true" changeYear="true" label="To Date" readonly="true" size="90" cssClass="lab d2" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
                                <td><s:textfield label="Receipt Number" size="90" name="pp.receipt" cssClass="form-control" onkeypress="return isNumberKey(this,event)" id="i" placeholder="Enter Receipt.No"> </s:textfield></td> 
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
                    <th>Receipt. No</th>
                    <th>Variety</th>
                    <th>Weight</th>
                    <th>Bales</th>
                    
                </tr>
               <s:iterator value="list" var="obj1" status="stat">
                    <s:hidden value="%{#stat.index}" id="like"/>
                    <tr>
                        <s:if test="%{#stat.index%7==0}">
                            
                            <s:iterator value="list1" var="obj2">
                                <s:if test="#obj1.parentGdWastage.idw==#obj2.idw">
                                    <td rowspan="7" style="vertical-align: middle;"><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                    <td rowspan="7" style="vertical-align: middle;"><s:property value="receiptNo"/></td>
                                    
                                </s:if>     
                            </s:iterator>
                        </s:if> 
                        <td><s:property value="variety" /></td>
                        <td><s:property value="weight" /></td>
                        <td><s:property value="numberofBales"/></td>
                        
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

