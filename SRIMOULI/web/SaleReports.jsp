<%-- 
    Document   : PurchaseRtve
    Created on : Dec 13, 2016, 10:50:11 AM
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
      
      <s:iterator value="ulist" var="myobj" >   
      
          <%@include file="Upperpage3.jsp" %> 
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Sales Main Statement Report</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <center>
     <s:form action="SaleRtve" method="post" class="form-horizontal">
           <table>
               <tr> 
                   <td><s:hidden name="id" value="%{id}" /></td>
<%--                    <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                    <td><s:hidden name="startdate" value="%{startdate}" /></td>
                    <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                   <td> <sj:datepicker name="sd.date" changeMonth="true"  changeYear="true" id="i" readonly="true"  label="From Date"  size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                   <sj:datepicker  name="sd.date1" maxDate= "now" changeYear="true" changeMonth="true" id="i1" readonly="true"  label="To Date"  size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> 
               </tr>
       
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
      <table  border="1" class="table table-bordered table-responsive">
          
          <tr>
              <th>Date</th>
           <th>Customer</th>
            <th>Product Type</th>
            <th>No.Bales</th>
            <th>Gross Weight</th>
            <th>Net Weight</th>
            <th>Tare Weight</th>
            <th>Vehicle No</th>
            <th>Remarks</th>
          </tr>
        
           <s:iterator value="list">
              
            <tr>
                <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                <td><s:property value="customerName"/></td>
                 <td><s:property value="ProductType"/></td>
                 <td><s:property value="noOfBales"/></td>
                 <td><s:property value="grossWeight"/></td>
                 <td><s:property value="netWeight"/></td>
                  <td><s:property value="tareWeight"/></td>
                   <td><s:property value="vehicleNo"/></td>
                  <td><s:property value="remarks"/></td>
            </tr>
              
        </s:iterator>
      </table>   
  </div>
     <!-- /.row -->
        <hr>

        <!-- Footer -->
       
    </div>
    
    <!-- /.container -->
    
        </s:iterator>
   
</body>
</html>
