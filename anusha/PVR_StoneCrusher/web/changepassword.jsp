<%-- 
    Document   : index
    Created on : Jun 23, 2017, 2:58:25 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Stone Crusher</title>
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
  <s:head/>
 <style type="text/css">
            
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 10pt;
                padding-bottom: 10px;
                padding-left: 100px;
            } 
           
            </style>
            
<style type="text/css">
    #s
    {
        width: 100px;
        height: 40px;
       
        margin-left: 150px;
    }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <s:iterator value="ulist" var="myobj"> 
           
            
            <s:if test="#myobj.LType=='control'">
                  <%@include  file="upperpage1.jsp" %>
        </s:if>
            <s:else>
                <%@include  file="upperpage2.jsp" %> 
            </s:else>
 
  <!-- Left side column. contains the logo and sidebar -->
 
  <!-- Content Wrapper. Contains page content -->
 
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <center>
      <h1>
        Change Password
        
      </h1>
        </center>
     
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-12">

  
          <div class="box box-warning">          
            
             <s:form action="changepwd" method="post">
                 <s:hidden name="lid" value="%{lid}"/>
        <table>
              <td><br/></td>
     
           <s:hidden name="grade.lid" value="%{lid}"/>
           
            <td><br/></td>
      <div class="form-group has-feedback">
          <s:password name="grade.password" id="i" cssClass="form-control" placeholder="Current Password" size="90" label="Current Password"/>
        
      </div>
            
            
            
            <td><br/></td>
      <div class="form-group has-feedback">
          <s:password name="grade.newpwd" id="i" cssClass="form-control" placeholder="New Password" size="90" label="New Password"/>
      
      </div>
            
            
              
            <td><br/></td>
      <div class="form-group has-feedback">
          <s:password name="grade.confirmpwd" id="i" cssClass="form-control" placeholder="Confirm New Password" size="90" label="Confirm New Password"/>
        
      </div>
      
            <td><br/></td>
            
        <s:submit id="s" value="Submit" cssClass="btn btn-primary btn-block btn-flat" align="center"/>
         <td><br/></td>
         
        </table>
    </s:form>

             

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
         
        </div>
        <!-- /.col (right) -->
     
      <!-- /.row -->

     </s:iterator>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
     <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://nivriticloudsolutions.com">Nivriti Solutions Global Inc</a>.</strong> All rights
    reserved.
  </footer>

 
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

       <!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>

</body>
</html>
