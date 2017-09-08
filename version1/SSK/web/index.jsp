<%-- 
    Document   : index
    Created on : Jun 23, 2017, 2:58:25 PM
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
        <s:head/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/SkyHRMS.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
         <style>
            html, body {
               padding:0px;
               margin:0px;
                width:100%;
                height:50%;
            }
            
        </style>
    </head>
    <body class="hold-transition login-page">
        <div id="container">
        <script>
 window.onload = function () {
    if (typeof history.pushState === "function") {
        history.pushState("jibberish", null, null);
        window.onpopstate = function () {
            history.pushState('newjibberish', null, null);
        };
    }
    else {
         var ignoreHashChange = true;
         window.onhashchange = function (){
            if (!ignoreHashChange) {
                ignoreHashChange = true;
                window.location.hash = Math.random();
            }
            else {
                ignoreHashChange = false;   
            }
        };
    }
};
  </script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
$(document).ready(function(){
     $("p").hide();
    
    $("#show").click(function(){
        $("p").show();
    });
});
</script>

   
  
  
   <br/><br/><br/>
        <div class="login-box">
            
            <div class="login-logo">
               
               <img src="dist/img/ssk_head.jpg" alt="images" />
              
            </div>
            
        </div>
             <CENTER><a href="#"><h1 style="margin-bottom: -1em;margin-top: -2em;color:#272854;"> SRI SAI KRISHNA STONE CRUSHER </h1></a></center>
            <!-- /.login-logo -->
              <div class="login-box">
            <div class="login-box-body">
                <p class="login-box-msg"><h2>Please sign in</h2></p>

           
                    <table>
 <b><p style="color: #FF0000;">Please Contact the Administrator</p></b>

                    <s:form action="insert"  method="post">

                        <div class="form-group has-feedback">
                            <td>
                                <s:textfield name="logindto.loginid" cssClass="form-control" size="50" placeholder="Login ID"></s:textfield> 
                                </td>
                            </div>

                            <td><br/></td>

                            <div class="form-group has-feedback">
                            <s:password name="logindto.password" cssClass="form-control" placeholder="Password"></s:password>

                            </div>
                            </td>
                            <td> <br/></td>
                            <s:submit value="Submit" cssClass="btn btn-primary btn-block btn-flat"></s:submit>
                        </s:form>
                </table>

                <!-- /.social-auth-links -->
                <br/>
               <a href="#" id="show">I forgot my password</a><br>


            </div>
            <!-- /.login-box-body -->
            <div style="text-align: center"><strong>Copyright &copy; <script>document.write(new Date().getFullYear())</script> <a href="https://www.nivriticloudsolutions.com/" target="_blank">Nivriti Solutions Global Inc.</a></strong> <br/>All rights reserved.
            </div>
        </div>
        <!-- /.login-box -->
        

        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="plugins/iCheck/icheck.min.js"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });
        </script>
        </div>
    </body>
</html>

