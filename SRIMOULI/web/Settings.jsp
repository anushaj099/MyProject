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
          
        
<%--          <s:iterator value="ulist" var="myobj">    
                 <s:if test="#myobj.loginType =='control'">
                     <s:if test="%{xyz==1000}">
                 <script>
                     window.alert('Employee Form Inserted Successfully, Click OK to continue');
                 </script>
        </s:if>
                     <%@include file="Upperpage.jsp" %>
                 </s:if>    --%>
                 <%@include file="Upperpage.jsp" %>
        <!-- Page Content -->
    <div class="container">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome to Administration Sector</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
         <s:set var="abortLoop" value="%{false}"/>
        <s:iterator value="ulist" var="myobj"> 
            
            <s:if test="#myobj.loginType =='control'">
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="supervisorDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 godownpur"><h3>Create Supervisor</h3></div>
                </a>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="newuserDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 godownprod"><h3>Create  New User</h3></div>
                </a>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="countDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 godownsale"><h3>Create OE Count</h3></div>
                </a>
            </div>
        </div>
                                    <div class="row">

                                 <div class="col-md-4 portfolio-item">
                <a href="employeeDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 packing"><h3>Create Employee</h3></div>
                </a>
            </div>

       
     
<!--            <div class="col-md-3 portfolio-item">
                <a href="employeeDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 packing"><h2>Create Employee</h2></div>
                </a>
            </div>-->
                       
            
            <div class="col-md-4 portfolio-item">
                <a href="patternDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 carding"><h3>Packing patterns</h3></div>
                </a>
            </div>
                                <div class="col-md-4 portfolio-item">
                <a href="packerDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 quality"><h3>Packer Name</h3></div>
                </a>
            </div>
                                 </div>
                                    <div class="row">
                                        
                                
                                
          
                                <div class="col-md-4 portfolio-item">
                <a href="productDashboard?id=<s:property value="id"/>">
				<div class="dashboard1 drawing"><h3>Product Name</h3></div>
                </a>
            </div>   
                                <div class="col-md-4 portfolio-item">
                <a href="employeeEfficiency?id=<s:property value="id"/>">
                    <div class="dashboard1 settings"><h4 style="font-size: 16pt;">Employee Efficiency Report</h4></div>
                </a>
            </div>
            
<!--             <div class="col-md-4 portfolio-item">
                <a href="backuptab?id=<s:property value="id"/>">
                    <div class="dashboard1 packing"><h4 style="font-size: 16pt;">Year end date and backup creation</h4></div>
                </a>
            </div>-->

             <div class="col-md-4 portfolio-item">
                <a href="YCalculations?id=<s:property value="id"/>">
			<div class="dashboard1 godownpur"><h3>Calculations</h3></div>
                </a>
            </div>
                    
    </div>
            </s:if>
            <s:else>
                <s:if test="%{!#abortLoop}">
                    <s:if test="#myobj.designation == 'Data Entry'">
                        <div class="row">
<!--            <div class="col-md-3 portfolio-item">
		<div class="dashboard1 godownpur disabled1"><h2>Create Supervisor</h2></div>
            </div>
            <div class="col-md-4 portfolio-item">
		<div class="dashboard1 godownprod disabled1"><h2>Create New User</h2></div>
            </div>
            <div class="col-md-4 portfolio-item">
		<div class="dashboard1 godownsale disabled1"><h2>Create OE Count</h2></div>
            </div>-->
          </div>
         <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="employeeDashboard?id=<s:property value="id"/>">
                    <div class="dashboard1 packing"><h3>Create Employee</h3></div>
                </a>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="employeeEfficiency?id=<s:property value="id"/>">
                    <div class="dashboard1 settings"><h4 style="font-size: 14pt;">Employee Efficiency Report</h4></div>
                </a>
            </div>
          
        </div>
           </s:if>
               <s:set var="abortLoop" value="%{true}"/>
                </s:if>
            </s:else>
        </s:iterator>
        <!-- /.row -->
        <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
        
    </body>
</html>
