<%-- 
    Document   : Yearlyreport
    Created on : Apr 6, 2017, 2:38:31 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>
<html>
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
         <%@include file="Upperpage.jsp" %> 
         
          <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Purchase Yearly Report</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
         
         <div class="row">
            <center>
                <s:form action="yearrt" method="post" class="form-horizontal">
           <table>
               <tr> 
                  <td><s:hidden name="id"  value="%{id}" /></td>
                  <td><s:select name="fyear" id="i" cssClass="form-control " label="Select an year "  list="ulist1" headerKey="-1" headerValue="-- Select Dates --"/></td>
                  <td><br/><br/></td>
                  <td><s:select name="module" id="i" cssClass="form-control " label="Select a Module "  list="{'Purchase','Issue to Department', 'Issue to Precleaning','Wastage','Sale','Stock Report','Carding','Drawing','Open End','Quality','Packing','Dispatch','Ready to Pack','Packing StockReport','Power'}" headerKey="-1" headerValue="-- Select a Module --"/></td>
               </tr>
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
         
        </s:iterator>
        
    </body>
</html>
