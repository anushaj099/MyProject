<%-- 
    Document   : openendDashboard
    Created on : Dec 16, 2016, 10:38:19 AM
    Author     : NSG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
    </head>
    <body style="background-color: #EEEEEE">
            
        
         <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
<a href="#">
<img class="img-responsive" src="Images/Logo.jpg" alt="Sri Mouli Textiles Pvt. Ltd." />
</a>
            </div>
        </div>
       </div>


    <div class="container-fluid naga">

        <!-- Page Heading -->

    <!-- Navigation -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only " >Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
                
                <a class="navbar-brand" href="openendHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
              
                </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                                        <li>
                                            <a href="openendDashboard?id=<s:property value='id'/>" class="actived">Dashboard</a>
                    </li>
                    <li>
                        <a href="openendreports?id=<s:property value='id'/>" id="no">Reports</a>
                    </li>
                </ul>
             
      <ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" title="Dash Board" aria-hidden="true"></span> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="openendprofile?id=<s:property value='id' /> " data-toggle="tooltip" data-placement="bottom" title="Edit">My Profile</a></li>
            <li><a href="changepwd?id=<s:property value='id'/>">Change Password</a></li>
           <s:if test="#myobj.loginType == 'control'">  
            <li><a href="settingsHome?id=<s:property value="id"/> " >Settings</a></li>
           </s:if>
            <li role="separator" class="divider"></li>
            <li><a href="index.jsp">Logout</a></li>
          </ul>
        </li>
      </ul>
          
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    </body>
</html>
