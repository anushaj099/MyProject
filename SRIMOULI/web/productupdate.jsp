<%-- 
    Document   : product
    Created on : Feb 15, 2017, 10:47:15 AM
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
        </style>
 <s:iterator value="ulist" var="myobj" >   
     <%@include file="Upperpage.jsp" %>         
           
    <div class="container">
        
        
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Product Data</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">

 <div class="clear">&#x00A0;</div>
     <s:form action="productUpdate"  enctype="multipart/form-data" class="form-horizontal">          
    <table>
        <s:iterator value="productlist">
        <tr>
         <td><s:hidden name="id" value="%{id}" /></td>
         <td><s:hidden name="stock.ids" value="%{ids}" /></td>
           <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield name="stock.date" id="i" readonly="true" label="Date" value="%{date1}" size="90" cssClass="form-control form-group" displayFormat="dd-mm-yy" /></td>
         <td><s:textfield id="i" name="form.productName" readonly="true" label="Enter Product name " value="%{variety}" onkeypress="return isDecimalKey(event)" placeholder="Enter Product name" cssClass="form-control form-group" size="90"></s:textfield></td>        
         <td><s:checkboxlist label="Select the module where you want to visible"  id="i" cssClass="form-group" list="{'Purchase','Issue to department','Issue to pre-cleaning','Wastage','Sale','Stock Report'}" name="form.partialType" value="%{productType}" /> </td>
         <td><s:textfield id="i" name="stock.stockQuantity" value="%{stockQuantity}" label="No.of Bales " onkeypress="return isDecimalKey(event)" placeholder="Enter No of Bales" cssClass="form-control form-group" size="90"></s:textfield></td>              
         <td><s:textfield id="i" name="stock.stockKgs" label="Weight" value="%{stockKgs}" onkeypress="return isDecimalKey(event)" placeholder="Enter Weight" cssClass="form-control form-group" size="90"></s:textfield></td>        
        </tr>
        </s:iterator>
    </table>
        <br/><br/>
          <div class="form-group">
      <div class="col-sm-6 col-xs-6 text-center">
        <button type="submit" class="btn btn-primary">Update</button>
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

  </s:iterator>  

</body>
</html>
