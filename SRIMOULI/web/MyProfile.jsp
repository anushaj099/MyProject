<%-- 
    Document   : MyProfile
    Created on : Dec 9, 2016, 11:45:43 AM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html>
<html>
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
      <sj:head/>
    </head>
        <body style="background-color: #EEEEEE">
         <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 11pt;
            padding-bottom: 10px;}    
            input[type="radio"]{
                width: 25px;
                margin-left: 10px;
            }
            input[type="checkbox"]{
                width: 25px;
                    margin-left: 10px;
            }
        </style>
   <%--     <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage.jsp" %>  --%>
              
   <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage.jsp" %>
                    </s:if>
             
               <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Your Profile</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">        
            <table border="0">  
         <tr>
         <td><h3>User Name</h3></td>
         <td><h3>:</h3></td>
         <td style="padding-left: 35px"><h3><s:property value="userName" /></h3></td>
       </tr>
        <tr>
         <td><h3>Password</h3></td>
         <td><h3>:</h3></td>
         <td style="padding-left: 35px"><h2><a href="changepwd?id=<s:property value='id'/>" class="btn btn-lg btn-primary btn-block btm ">Change Password</a></h2></td>
       </tr>  
       <tr>
         <td><h3>Type of User</h3></td>
         <td><h3>:</h3></td>
         <td style="padding-left: 35px"><h3><s:property value="loginType" /></h3></td>
       </tr>
       <tr>
         <td><h3>Designation</h3></td>
         <td><h3>:</h3></td>
         <td style="padding-left: 35px"><h3><s:property value="designation" /></h3></td>
       </tr>
       <tr>&#X00A0;</tr>
       <tr></tr>
      
     </table>

        </div>
               </div>
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
            
            
        </s:iterator>
    </body>
</html>
