<%-- 
    Document   : ViewUser
    Created on : Jun 27, 2017, 6:30:15 PM
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
            <br/>
            <br/>
            <section class="content">
       <div class="box box-info">
           
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>Name</th>
                    <th>Mobile Number</th>
                    <th>Login Type</th>
                    <th>Designation</th>
                  </tr>
                  </thead>
                  
                  <s:iterator value="cilist" var="obj">
                          <tr>
                              <td><s:property value="fullName"/>
                                  <td><s:property value="mobileNo"/></td>
                                  <td><s:property value="LType"/></td>
                              <td><s:property value="designation"/></td>
                    <td><a href="edituser?did=<s:property value='lid'/>" <span class="label label-info">Edit</span></a></td>
                    <s:if test="#obj.LType=='user'">
                          <td><a href="deleteuser?did=<s:property value='lid'/>" data-toggle="tooltip" onclick="return confirm('Are You Sure ?')" <span class="label label-danger">Delete</span></a></td>
                    </s:if>
                    
                  </tr>
                      </s:iterator>
                  
                
                </table>
              </div>
            </div>
      </div>
            </section>
        </s:iterator>
    </div>

 <!-- Main Footer -->
   <footer class="main-footer">
    <div class="pull-right hidden-xs">
     <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://nivriticloudsolutions.com">Nivriti Solutions Global Inc</a>.</strong> All rights
    reserved.
  </footer>

        
             <!--  jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>

    </body>
</html>
