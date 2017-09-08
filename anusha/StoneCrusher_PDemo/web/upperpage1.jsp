<%-- 
    Document   : upperpage1
    Created on : Jun 23, 2017, 5:19:35 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
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
    </head>
    <body>
        <div class="wrapper">
        <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
       <!-- logo for regular state and mobile devices -->
       <s:if test="#myobj.LType=='control'">
           <span class="logo-lg"><b>Admin</b></span>
       </s:if>
       <s:else>
           <span class="logo-lg"><b>User</b></span>
       </s:else>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
             <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/SSK_Logo.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><s:property value="fullName"/></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/SSK_Logo.png" class="img-circle" alt="User Image">

                <p>
                    <s:property value="fullName"/>
                    <small><s:property value="designation"/></small>
                </p>
              </li>
              <!-- Menu Body -->
<!--              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                 /.row 
              </li>-->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="myprofile?lid=<s:property value='lid'/>" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout?lid=<s:property value='lid'/>" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->

        </ul><!--          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>-->
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/SSK_Logo.png" class="img-circle" alt="Image">
        </div>
        <div class="pull-left info">
            <p><s:property value="fullName"/></p>
          <!-- Status -->
         
        </div>
      </div>

      <!-- search form (Optional) -->
      
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="dashboard?lid=<s:property value='lid'/>"><i class="fa fa-link"></i> <span>Dashboard</span></a></li>
        
       <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>User</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="newuser?lid=<s:property value='lid'/>">Create New User</a></li>
            <li><a href="userview?lid=<s:property value='lid'/>">View & Edit Users</a></li>
          </ul>
        </li>
        
        
<!--        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Reports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>
                 <a href="#"> <span>Tax Invoice Report</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gradepage?lid=<s:property value='lid'/>">General Report</a></li>   
            <li><a href="dailyreport?lid=<s:property value='lid'/>">Daily Report</a></li>
            <li><a href="pwdpage?lid=<s:property value='lid'/>">Weekly Report</a></li>
            <li><a href="pwdpage?lid=<s:property value='lid'/>">Monthly Report</a></li>
            <li><a href="pwdpage?lid=<s:property value='lid'/>">Yearly Report</a></li>
          </ul>
            </li>
            </ul>
        </li>-->
        
         <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Tax Invoice</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="getGrades?lid=<s:property value='lid'/>">Generate Tax Invoice</a></li>
            <li><a href="viewtax?lid=<s:property value='lid'/>">Edit & Delete Tax Invoice</a></li>
          </ul>
        </li>


        
         <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Reports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="genreport?lid=<s:property value='lid'/>">General Report</a></li>  
            <li><a href="commonreport?lid=<s:property value='lid'/>">Daily Report</a></li>
            <li><a href="monthlyreport?lid=<s:property value='lid'/>">Monthly Report</a></li>
          </ul>
        </li>

         <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Settings</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="gradepage?lid=<s:property value='lid'/>">Grades and Basic Rate</a></li>
            <li><a href="getratepage?lid=<s:property value='lid'/>">Create Quantity per UOM</a></li>
            
            <li><a href="pwdpage?lid=<s:property value='lid'/>">Change Password</a></li>
          </ul>
        </li>
        
        
        
        
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          <b> WELCOME TO STONE CRUSHER  INDUSTRY</b>
      </h1>
    </section>
  
    </body>
</html>
