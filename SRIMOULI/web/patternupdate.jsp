<%-- 
    Document   : patternupdate
    Created on : Feb 14, 2017, 12:10:10 PM
    Author     : nsg
--%>








<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">

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
   <link href="css/Styles.css" rel="stylesheet">
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
    
      <SCRIPT language=Javascript>
      function isDecimalKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                    var regex = /^[0-9a-zA-Z]+$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }
                </script>
</head>

<body style="background-color: #EEEEEE">

      <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 11pt;
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
            label[for="price"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;}
            label[for="price1"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;}
            label[for="expprod"] {
            color: black;
            font-size: 11pt;
            font-family:sans-serif;
            font-style: normal;
            padding-bottom: 10px;}
        </style>
<s:iterator value="ulist" var="myobj" >   
     <%@include file="Upperpage.jsp" %>   
</s:iterator>
           
    <div class="container">
      
          
       
      
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Patterns Update</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">

 <div class="clear">&#x00A0;</div>
     <s:form action="patternupdate"  enctype="multipart/form-data" class="form-horizontal">    
         
    <table>
        <s:iterator value="patternlist">
        <tr>
         <td><s:hidden name="id" value="%{id}" /></td>   
         <td><s:hidden name="form.idp" value="%{idp}" /></td> 
         <td><s:textfield id="price" name="form.conWeight" label="Enter con weight " value="%{conWeight}" placeholder="Enter con weight" cssClass="form-control form-group" size="90" autofocus="autofocus"></s:textfield></td>        
         <td><s:textfield id="price1" name="form.noOfCones" label="Enter no of cones " value="%{noOfCones}" placeholder="Enter no of cones" cssClass="form-control form-group" size="90" ></s:textfield></td>          
         <td><s:textfield id="expprod" name="form.weight" readonly="true" onmousemove="javascript:multiplication()" label="Enter weight " value="%{weight}"  placeholder="Enter weight" cssClass="form-control form-group" size="90" ></s:textfield></td>        
         <td><s:textfield id="i" name="form.tareWeight" label="Enter tare weight "  value="%{tareWeight}" placeholder="Enter tare weight" cssClass="form-control form-group" size="90" ></s:textfield></td>        
         <td><s:select id="i" name="form.packType" label="Type of Packing" list="{'Bag','Box'}" value="%{packType}" cssClass="form-control form-group" headerKey="" headerValue="--Select type of Packing--"/></td>
        </tr>
        </s:iterator>
    </table>
       <br/><br/>
       
       
       
      <div class="form-group">
      <div class="col-sm-6 col-xs-6 text-center">
          <button type="submit" class="btn btn-primary" onclick="return multiplication()">Submit</button>
      </div>
       
          <s:form  action="supervisor1">
      <div class="col-sm-6 col-xs-6 text-center">
      <%-- <button type="button" class="btn btn-primary" ><a href="controlhome?id=<s:property value="id"/>" style="text-decoration:none; color:white">Cancel</a></button>--%>
      <button type="reset" class="btn btn-primary">Cancel</button>
          </div>
          </s:form>
    </div>
     </s:form>
        </center>
    </div>
        <br/>    
      <br/>
            
        <script language="javascript">
       function multiplication() 
       {
            var mul = 0;
            var x = parseFloat(document.getElementById("price").value);
            var y = parseFloat(document.getElementById("price1").value);
            if(isNaN(x))
                x=0;
            if(isNaN(y))
                y=0;
            mul = x*y;
            var z = document.getElementById("expprod");
            if (isNaN(mul))
                mul = "";
            z.value =mul;
       } 
</script>
          </div>  

        <!-- /.row -->
        <hr>

        <!-- Footer -->
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

    
    <!-- /.container -->

</body>
</html>

