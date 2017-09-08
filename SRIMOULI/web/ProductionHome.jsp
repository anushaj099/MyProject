<%-- 
    Document   : ProductionHome
    Created on : Feb 13, 2017, 11:42:10 AM
    Author     : Gayathri
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
         <s:iterator value="ulist" status="stat"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage.jsp" %>
                   
               
        <!-- Page Content -->
    <div class="container">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome to Production Sector</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="productionDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 issue"><h3>Issue to Department</h3></div>
                </a>
            </div>
                                <div class="col-md-4 portfolio-item">
                <a href="precleaningDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 settings"><h3>Issue to Precleaning</h3></div>
                </a>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="wastageDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 wastage"><h3>Wastage</h3></div>
                </a>
            </div>
      
                                 </s:if>
        </s:iterator>
        <!-- /.row -->
        <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
