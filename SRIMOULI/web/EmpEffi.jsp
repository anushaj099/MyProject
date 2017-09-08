<%-- 
    Document   : count
    Created on : Dec 21, 2016, 3:27:13 PM
    Author     : nsg
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

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
    
      
       <SCRIPT language=Javascript>
    function isNumKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                     var regex = /^[0-9]*$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }
                
                </script>
</head>

<body style="background-color: #EEEEEE">

      <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 11pt;
            padding-bottom: 10px;
            font-style: normal;} 
             label[for="i1"] {
            color: black;
            font-size: 11pt;
            padding-bottom: 10px;
            font-style: normal;} 
            input[type="radio"]{
                width: 25px;
                margin-left: 10px;
            }
            input[type="checkbox"]{
                width: 35px;
                    margin-left: 10px;
            }
        </style>
       <%--  <s:iterator value="ulist" var="myobj" >   
             <%@include file="Upperpage.jsp" %>         
           </s:iterator>   --%>
       <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage.jsp" %>
                    </s:if>
                </s:iterator>

       <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited  Employee Efficiency Form</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">

 <div class="clear">&#x00A0;</div>
     <s:form action="getEfficiency"  enctype="multipart/form-data" >          
    <table>
        <tr>
         <td><s:hidden name="id" value="%{id}" /></td>  
         <%--<td><s:textfield id="i" name="l.name" label="Enter Supervisor name " placeholder="Enter Superviser name" cssClass="form-control form-group" size="90" ></s:textfield></td> --%>           
        <td><sj:datepicker readonly="true" name="rf.date" id="i" changeMonth="true" changeYear="true"  label="From Date"  size="90"  displayFormat="dd-mm-yy" cssClass="lab form-group price" placeholder="dd-mm-yyyy"/> </td>
        
        <td><sj:datepicker readonly="true" name="rf.date2" id="i1" changeMonth="true" changeYear="true"  label="To Date"  size="90"  displayFormat="dd-mm-yy" cssClass="lab form-group price1" placeholder="dd-mm-yyyy"/> </td>
       
        <td><s:textfield name="rf.empid" id="i" cssClass="form-control form-group" onkeypress="return isNumKey(event)" label="Employee Id" size="90" placeholder="Enter Employee Id"></s:textfield></td>
        <td><s:checkboxlist id="i" list="{'Carding','Drawing','Openend'}" name="rf.module" label="Module" cssClass="form-group chbox"/></td>
         <td><s:textfield name="rf.percent" id="i" cssClass="form-control form-group" onkeypress="return isNumKey(event)" label="Efficiency Percent" size="90" placeholder="Enter Efficiency Percentage"></s:textfield></td>
        </tr>
    </table>
        <br/><br/>
       
          <div class="form-group">
           <div class="col-sm-6 text-center">
         <center>
         <s:submit id="goButton" value="Submit" cssClass="btn btn-primary" align="right"></s:submit>
         </center>
         </div>
          
          
    </div>
     </s:form>
        </center>
        
         
        
        <div>
            <br/>
        </div> 
        
        <div class="tab1">
            <table border="1" class="table table-bordered table-responsive" id="table">
                <tr> <th colspan="6" style="border-top-color:#EEEEEE;border-left-color:#EEEEEE;border-right-color:#EEEEEE;text-align: center">Number of days: <s:property value="days" /></th></tr>
                <tr>
                    <th>Date</th>
                     <th>Module</th>
                    <th>Shift</th>
                    <th>Actual Production</th> 
                    <th>Expected Production</th>
                    <th>Efficiency</th>
                </tr>

                <s:iterator value="list" var="myobj1" status="count">
                    <s:hidden value="%{#count.index}" id="like"/>
                    <tr>
                        <s:iterator value="total" var="myobj2">
                            <s:if test="#myobj1.parentCarding.idc==#myobj2.idc">
                                <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" /></td>
                                <td>Carding</td>
                                <td><s:property value="shifts"/></td>
                            </s:if>
                       </s:iterator>
                        <td><s:property value="actualProduction"/></td>
                        <td><s:property value="expectedProduction"/></td>
                        <td><s:property value="efficiency"/></td>
                    
                    </tr>
                </s:iterator>
                    
                    
                      <s:iterator value="list2" var="obj1" status="count1">
                            <s:hidden value="%{#count.index}" id="like1"/>
                    <tr>
                        <s:iterator value="total2" var="obj2">
                            <s:if test="#obj1.parentDrawing.idd==#obj2.idd">
                                <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" /></td>
                                <td>Drawing</td>
                                <td><s:property value="shifts"/></td>
                            </s:if>
                       </s:iterator>
                        <td><s:property value="actualProduction"/></td>
                        <td><s:property value="expectedProduction"/></td>
                        <td><s:property value="efficiency"/></td>
                     
                    </tr>
                </s:iterator>
                    
                    <s:iterator value="list3" var="oj1" status="count2">
                         <s:hidden value="%{#count.index}" id="like2"/>
                    <tr>
                        <s:iterator value="total3" var="oj2">
                            <s:if test="#oj1.parentOpenend.ido==#oj2.ido">
                                <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" /></td>
                                <td>Open End</td>
                                <td><s:property value="shifts"/></td>
                            </s:if>
                       </s:iterator>
                        <td><s:property value="actualProduction"/></td>
                        <td><s:property value="expectedProduction"/></td>
                        <td><s:property value="efficiency"/></td>
                     
                    </tr>
                </s:iterator>
            </table>   
        </div>
         <div class="col-sm-6 text-center" id="abc" >
                <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
            </div>
            
              <script>

            $(document).ready(function () {
                var al = $("#like").val();
                var al1= $("#like1").val();
                 var al2= $("#like2").val();
                if (al === undefined && al1 === undefined && al2 === undefined)
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
                a.download = 'Employee Efficiency(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';
                a.click();
                e.preventDefault();

                });
            });
        </script>

  </div>


        <!-- /.row -->
        <hr>

        <!-- Footer -->

 

        
   
        <!-- /.row -->
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-6 text-center">
                    <p>Copyright &copy; Sri Mouli Textiles Private Limited 2017</p>
                </div>
                <div class="col-lg-6 text-center">
                    <p>Design &#x0026; Developed by <a href="http://www.nivriticloudsolutions.com/">Nivriti Solutions Global Pvt. Ltd.</a></p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

  
    <!-- /.container -->

  

</body>
</html>