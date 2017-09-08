<%-- 
    Document   : UpperDrawing
    Created on : Dec 17, 2016, 12:28:21 PM
    Author     : NSG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>
<html>
    
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
     
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>-->
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <!--[endif]-->
    <script src="js/jquery.js"></script>
   
    <!-- Bootstrap Core JavaScript -->
      <sj:head/>

   <script language="javascript" type="text/javascript">
 function changetitle()
{
 if (history.pushState) {
    var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '#';
    window.history.replaceState({path:newurl},'',newurl);
}
}
</script>    
    
    
    <body onload="javascript:changetitle()">


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

                    <div class="navbar-header active actived">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only " >Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                       
                            <a class="navbar-brand active" href="home?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                    </div>
                         <%--   <s:if test="#myobj.loginType == 'godown'">        
                    </s:if>
                            <s:if test="#myobj.loginType == 'drawing'">  
                            <a class="navbar-brand" href="drawingHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                            <s:if test="#myobj.loginType == 'carding'">  
                            <a class="navbar-brand" href="cardingHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                            <s:if test="#myobj.loginType == 'openend'">  
                            <a class="navbar-brand" href="openendHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                            <s:if test="#myobj.loginType == 'quality'">  
                            <a class="navbar-brand" href="qualityHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                            <s:if test="#myobj.loginType == 'packing'">  
                            <a class="navbar-brand" href="packingHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                            <s:if test="#myobj.loginType == 'control'">  
                            <a class="navbar-brand" href="controlhome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                            <s:if test="#myobj.loginType == 'electricity'">  
                            <a class="navbar-brand" href="powerHome?id=<s:property value='id'/>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                            </s:if>
                   
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <s:if test="#myobj.loginType == 'drawing'"> 
                                    <a href="drawingDashboard?id=<s:property value='id'/>">Entry</a>
                                </s:if> 
                                <s:if test="#myobj.loginType == 'carding'"> 
                                    <a href="cardingDashboard?id=<s:property value='id'/>">Entry</a>
                                </s:if>
                                <s:if test="#myobj.loginType == 'openend'"> 
                                    <a href="openendDashboard?id=<s:property value='id'/>">Entry</a>
                                </s:if> 
                                <s:if test="#myobj.loginType == 'quality'"> 
                                    <a href="qualityDashboard?id=<s:property value='id'/>">Entry</a>
                                </s:if>
                                <s:if test="#myobj.loginType == 'packing'"> 
                                    <a href="packingDashboard?id=<s:property value='id'/>">Entry</a>
                                </s:if>
                                <s:if test="#myobj.loginType == 'electricity'"> 
                                    <a href="super?id=<s:property value='id'/>">Entry</a>
                                </s:if>     

                            </li>
                            <li>
                                <s:if test="#myobj.loginType == 'carding'">  
                                    <a href="cardingreports?id=<s:property value='id'/>" id="no">Reports</a> 
                                </s:if>
                                <s:if test="#myobj.loginType == 'drawing'"> 
                                    <a href="drawingreports?id=<s:property value='id'/>" id="no">Reports</a>
                                </s:if>
                                <s:if test="#myobj.loginType == 'openend'"> 
                                    <a href="openendreports?id=<s:property value='id'/>" id="no">Reports</a>
                                </s:if> 
                                <s:if test="#myobj.loginType == 'quality'"> 
                                    <a href="qualityreports?id=<s:property value='id'/>" id="no">Reports</a>
                                </s:if>  
                                <s:if test="#myobj.loginType == 'packing'"> 
                                    <a href="packingreports?id=<s:property value='id'/>" id="no">Reports</a>
                                </s:if>
                                  <s:if test="#myobj.loginType == 'electricity'"> 
                                    <a href="powerretrieve?id=<s:property value='id'/>" id="no">Reports</a>
                                </s:if>   
                            </li>
                            <li>
                                <s:if test="#myobj.loginType == 'carding'">  
                                    <a href="cardingview?id=<s:property value='id'/>" id="no">View</a> 
                                </s:if>
                                <s:if test="#myobj.loginType == 'drawing'"> 
                                    <a href="drawingview?id=<s:property value='id'/>" id="no">View</a>
                                </s:if>
                                <s:if test="#myobj.loginType == 'openend'"> 
                                    <a href="openendview?id=<s:property value='id'/>" id="no">View</a>
                                </s:if> 
                                <s:if test="#myobj.loginType == 'quality'"> 
                                    <a href="qualityview?id=<s:property value='id'/>" id="no">View</a>
                                </s:if> 
                             <s:if test="#myobj.loginType == 'packing'"> 
                                    <a href="packingview?id=<s:property value='id'/>" id="no">View</a>
                                </s:if> 
                             <s:if test="#myobj.loginType == 'electricity'"> 
                                    <a href="powerView?id=<s:property value='id'/>" id="no" >View</a>
                                </s:if>
                         </li>   
                        </ul>--%>
                      

                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" title="Dash Board" aria-hidden="true"></span> <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="MyProfile?id=<s:property value='id'/> " data-toggle="tooltip" data-placement="bottom" title="Edit">My Profile</a></li>
                                    <li><a href="changepwd?id=<s:property value='id'/>">Change Password</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </li>
                        </ul>

                    </div>

           
                        

                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
          
                       

    </body>
</html>

