<%-- 
    Document   : MyProfile
    Created on : Jun 27, 2017, 2:34:08 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <title>Sri Sai Krishna Stone Crusher</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    </head>
   <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <s:iterator value="ulist" var="myobj"> 
            <%@include  file="upperpage1.jsp" %>
          
        <div class="row">
        <div class="col-md-5"> 
        <div style="margin-top:  100px; margin-left: 150px;">
          <img src="dist/img/ssk_head.jpg"  class="img-circle" height="150" width="150" alt="User Image">
          <br/>
          <s:if test="#myobj.LType=='control'">
              <h4><b>&nbsp;&nbsp;&nbsp;ADMINISTRATOR</b></h4>
          </s:if>
          <s:else>
               <h4><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;USER</b></h4>
          </s:else>
               
         <BR/>
         <a href="logout?lid=<s:property value='lid'/>" class="btn btn-default btn-flat" style=" margin-left: 40px;">Sign out</a>
               
        </div>
        </div>
           <div class="col-md-6">  
               <div style="margin-right: 100px; margin-top: 100px;">
                <div class="box box-info">
            <div class="box-header with-border">
              <div class="box-body">
              <div class="table-responsive">  
               <table class="table no-margin">
                  
                   <tr>
                       <td><b>Full Name</b></td> <td><b>:</b></td>  <td><s:property value="fullName"/></td>   
                   </tr>
                   <tr>
                       <td><b>Designation</b></td> <td><b>:</b></td>   <td><s:property value="designation"/></td>  
                   </tr>
                   <tr>
                       <td><b>Mobile Number<td><b>:</b></td>   <td><s:property value="mobileNo"/></td> 
                   </tr>
                   <tr>
                       <td><b>Type of Login<td><b>:</b></td>   <td><s:property value="LType"/></td> 
                   </tr>
                    <tr>
                       <td><b>Login ID<td><b>:</b></td>   <td><s:property value="loginId"/></td> 
                   </tr>
                     <tr>
                       <td><b>Password<td><b>:</b></td>   <td><a href="pwdpage?lid=<s:property value='lid'/>"<span class="label label-success">Change Password</span></a></td>
                   </tr>
               </table>
              </div>
              </div>
            </div>
                </div>
          </div> 
               
        </div>        
               </div>

        
              
        </s:iterator> 
 </div>
        <%@include file="Footer.jsp" %>
   
       <!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>

    </body>
</html>
