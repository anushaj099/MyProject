<%-- 
    Document   : ForgotPwd
    Created on : Dec 9, 2016, 11:45:57 AM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
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
    </head>
    <body style="background-color: #EEEEEE">
        <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 11pt;
            font-family: sans-serif;
            font-style: normal;
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
       
       <%-- <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage.jsp" %> --%>
       <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage.jsp" %>
                   
               
              <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Change Password</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">        
            <s:form action="updatepwd"  enctype="multipart/form-data">          
    <table>
        <tr>   
            <td><s:hidden name="id" value="%{id}" /></td>
            <td><s:password id="i" name="login.password" size="70" label="Current Password" placeholder="Current password" cssClass="form-control form-group" /></td> 
            <td><s:password id="i" name="login.newpwd" label="New Password" placeholder="New Password" cssClass="form-control form-group" ></s:password></td>
            <td><s:password id="i" name="login.confirmpwd" label="Confirm Password" placeholder="Confirm password" cssClass="form-control form-group" ></s:password></td> 
        </tr>
    </table>
        <br/><br/>
          <div class="form-group">
      <div class="col-sm-6 col-xs-6 text-center">
          <button type="submit" class="btn btn-primary">Submit</button>
      </div>

     <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
    </div>
     </s:form>
        </div>
               </div>
            
             </s:if>
        </s:iterator>
        
        
        
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

    </body>
</html>
