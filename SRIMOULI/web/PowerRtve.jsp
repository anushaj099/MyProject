<%-- 
    Document   : PowerRtve
    Created on : Dec 30, 2016, 3:59:21 PM
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
     <%--  <s:iterator var="myobj" value="ulist">
           <%@include  file="Upperpage3.jsp" %>  --%>
       <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage3.jsp" %>
                    </s:if>
                
      
    
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Power Reports</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
         <center>

     <s:form action="ElecRtve" method="post" class="form-horizontal">
           <table>
               <s:hidden name="id" value="%{id}"/>
<%--               <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
               <td><s:hidden name="startdate" value="%{startdate}" /></td>
               <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
               <td><sj:datepicker  name="form.date" id="i" readonly="true" changeMonth="true" changeYear="true" label="From Date"  size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
               <td>  <sj:datepicker  name="form.date1" id="i1"  readonly="true" label="To Date" changeMonth="true" changeYear="true" size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
         <td><s:select id="i" name="form.superviser" label="Supervisor"  list="superList"   cssClass="form-control form-group"  headerKey="-1" headerValue="-- Select --" /></td> 
           <td><s:select id="i" name="form.shifts" list="{'Shift 1','Shift 2','Shift 3','Whole day'}" label="Select Shift" headerKey="-1" headerValue=" --Select-- " requiredLabel="true" requiredPosition="left" cssClass="form-control"/></td>
       
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
          
          
            
  <div class="tab1">
      <table border="1" class="table table-bordered table-responsive">
          <tr>
              <th>Date</th>
              <th>Shifts</th>
              <th>Superviser</th>
            <th>Total Pannel Units</th> 
          
          </tr>
          
           <s:iterator value="list">
            <tr>
                  <td><s:date format="dd-MM-yyyy" name="%{date}"/> <s:property value="%{date1}" ></s:property></td></td>
                  <td><s:property value="%{shifts}"/></td>
                  <td><s:property value="%{superviser}"/></td>
                <td><s:property value="total"/></td>
               
                
                
            </tr>
        </s:iterator>
      </table>   
  </div>
     <!-- /.row -->
        <hr>

        <!-- Footer -->
       
    </div>
       </s:iterator>
    <!-- /.container -->

</body>

</body>
</html>

