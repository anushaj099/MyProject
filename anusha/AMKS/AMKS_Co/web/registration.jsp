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
  <s:head/>
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


<SCRIPT language=Javascript>
            function isDecimalKey(evt)
            {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                if (key.length === 0)
                    return;
                var regex = /^[a-zA-Z ]*$/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
            
             function isAlphaKey(evt)
            {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                if (key.length === 0)
                    return;
                var regex = /^[a-zA-Z0-9 ]*$/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }


            function isNumberKey(el, evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode !== 45 && charCode !== 8 && (charCode !== 46) && (charCode < 48 || charCode > 57))
                    return false;
                if (charCode === 46) {
                    if ((el.value) && (el.value.indexOf('.') >= 0))
                        return false;
                    else
                        return true;
                }
                return true;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                var number = evt.value.split('.');
                if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            }
</SCRIPT>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
     <s:iterator value="ulist" var="myobj"> 
    <%@include  file="upperpage1.jsp" %>
    
  <!-- Left side column. contains the logo and sidebar -->
 
  <!-- Content Wrapper. Contains page content -->
 
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <center>
            <h1>
        Registration Form
      </h1>
        </center>
     
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row"  >
        <div class="col-md-12" >

  
          <div class="box box-warning" >          
            
             <s:form action="register" method="post">
                
                 <table>
                     <tr><td><s:hidden name="lid" value="%{lid}" /></td>
              <td><br/></td>
      <div class="form-group has-feedback">
    <s:textfield id="i" name="logindto.fullName" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Full Name" size="90" label="Full Name"/>
        
      </div>
        <td><br/></td>
         <div class="form-group has-feedback">
          <s:textfield name="logindto.designation" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Designation" size="90" label="Designation"/>
      
      </div>
        
        <td><br/></td>
         <div class="form-group has-feedback">
          <s:textfield name="logindto.mobileNo" onkeypress="return isNumberKey(this,event)" id="i" cssClass="form-control" placeholder="Mobile Number" size="90" label="Mobile Number"/>
      
      </div>
        
         <td><br/></td>
      <div class="form-group has-feedback">
          <s:textfield name="logindto.LType" value="user" readonly="true" onkeypress="return isDecimalKey(event)" id="i" cssClass="form-control" placeholder="Login Type" size="90" label="Login Type"/>
       
      </div>
         
           <td><br/></td>
            <div class="form-group has-feedback">
                <s:textfield id="i" name="logindto.loginid"  onkeypress="return isAlphaKey(event)" cssClass="form-control" placeholder="User Name" size="90" label="LoginID"/>
       
      </div>
           
            <td><br/></td>
      <div class="form-group has-feedback">
          <s:password name="logindto.password" id="i" cssClass="form-control" placeholder="Password" size="90" label="Password"/>
       
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
    </section>
        <!-- /.col (right) -->
         </s:iterator>
     
      <!-- /.row -->

   
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
     <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://nivriticloudsolutions.com">Nivriti Solutions Global</a>.</strong> All rights
    reserved.
  </footer>

 

<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
</body>
</html>
