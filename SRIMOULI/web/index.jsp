<%-- 
    Document   : index
    Created on : Dec 6, 2016, 11:26:38 AM
    Author     : nsg
--%>


<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/favicon.ico">

		<title>..:: Sri Mouli Textiles Pvt. Ltd ::..</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/Styles.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>


	<script src="js/login.js"></script> 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <s:head/>
  </head>

  <body>
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
    <div class="container">
    <div class="row">
    <div class="col-lg-12 text-center mainLogo">
	<img src="Images/MainLogo.jpg" alt="images" />
    </div>
    </div>
    </div>


    <div class="container">
    <div class="row">
    <div class="col-lg-4"></div>
    <div class="col-lg-4 loginForm">
      <s:form  action="insert" cssClass="form-signin" id="form_id" method="post">
       <!-- <h2 class="form-signin-heading">Please sign in</h2>-->
       <!-- <label for="inputEmail" class="sr-only">Email address</label>-->
       <!--<input type="text" name="username" id="username" placeholder="Username" class="form-control" required autofocus><br/>-->
       <s:textfield name="login.username" size="50"   placeholder="Username" cssClass="form-control " autofocus="autofocus"/>
       <h2 class="form-signin-heading">Please sign in</h2>
        
        <label for="inputPassword" class="sr-only">Password</label>
       <!-- <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>-->
        
   
       <s:textfield name="login.password" cssClass="form-control btm " placeholder="Password" type="password" />
       
      <%-- <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>--%>
      <s:submit value="Login" cssClass="btn btn-lg btn-primary btn-block btm "></s:submit>
		<!--  <input type="button" class="btn btn-lg btn-primary btn-block" value="Login" id="submit" onclick="validate()"/>-->


<!--<p>Forget your Username or Password <a onclick="forget()">Click Here</a></p>-->
      </s:form>
    </div> <!-- /col-lg-8 -->
    <div class="col-lg-4"></div>
    </div> <!-- /row -->
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>