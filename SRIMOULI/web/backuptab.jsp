<%-- 
    Document   : GodownHome
    Created on : Dec 6, 2016, 4:19:27 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sri Mouli Textiles Private Limited</title>
    </head>
    <body style="background-color: #EEEEEE">
            <s:if test="%{xyz==456}">
                 <script>
                     window.alert('Successfully entered the Date');
                 </script>
        </s:if>
           <s:if test="%{purchaseid==44}">
                 <script>
                     window.alert('Successfully entered the Date');
                 </script>
        </s:if>

                 <%@include file="Upperpage.jsp" %>
        <!-- Page Content -->
    <div class="container">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome to Financial year and Backup Sector</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
       
        <s:iterator value="ulist" var="myobj"> 
            
          
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="end?id=<s:property value="id"/>">
				<div class="dashboard1 carding"><h3>Year End Date</h3></div>
                </a>
            </div>
<%--            <div class="col-md-4 portfolio-item">
                <a href="backdate?id=<s:property value="id"/>">
				<div class="dashboard1 godownprod"><h3>Back Up Date</h3></div>
                </a>
            </div>--%>
            <div class="col-md-4 portfolio-item">
                <a href="yearlytab?id=<s:property value="id"/>">
				<div class="dashboard1 godownsale"><h3>Year wise Reports</h3></div>
                </a>
            </div>
        </div>
         </s:iterator> 
        <!-- /.row -->
        <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
        
    </body>
</html>
