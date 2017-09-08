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
        <title>JSP Page</title>
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
                <h1 class="page-header">Welcome to Godown Sector</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="purchaseDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 godownpur"><h2>Purchase</h2></div>
                </a>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="productionhome?id=<s:property value="id"/>">
				<div class="dashboard1 godownprod"><h2>Production</h2></div>
                </a>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="saleDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 godownsale"><h2>Sale</h2></div>
                </a>
            </div>
        </div>
        <div class="row"> 
              <div class="col-md-4 portfolio-item">
                <a href="stockDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 packing"><h2>Stock Report</h2></div>
                </a>
            </div>                       
        </div>                      
    </div>
            </s:if>
         </s:iterator>
        <!-- /.row -->
        <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
