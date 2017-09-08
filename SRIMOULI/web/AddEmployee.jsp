<%-- 
    Document   : Insertion
    Created on : Dec 6, 2016, 11:01:51 AM
    Author     : ch.mounika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>



<!DOCTYPE html>



<html lang="en">
    <head>
        
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sri Mouli Textiles Private Limited</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/Srimouli.css" rel="stylesheet">
    <link href="css/newcss.css" rel="stylesheet">
   <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
     <sj:head/>
           <s:head/>
              <SCRIPT language=Javascript>
     function isDecimalKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                     var regex = /^[0-9a-zA-Z ]*$/;
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
                    var regex = /^[a-zA-Z ]+$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }   
                
                 function isNumericKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                   var regex = /^[0-9]*$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }   
                
                
                
                </SCRIPT> 
        
        
    </head>
     <style type="text/css">
            label[for="i"] {
            font-family:sans-serif;
            font-style: normal;
            color: black;
             font-size: 12pt;
            padding-bottom: 10px;}    
        </style>
    
    <body style="background-color: #EEEEEE">

           
         <s:iterator value="ulist" var="myobj" status="stat">   
                 <s:if test="%{#stat.index==0}">
                <%@include file="Upperpage.jsp" %>   
                 </s:if>
         </s:iterator>    

      
    <!-- Page Content -->
    <div class="container"> 
     <s:form action="viewEmployee" method="post" class="form-horizontal">
         <div class="col-lg-12">
              <s:iterator value="ulist" var="myobj" status="stat">   
                 <s:if test="%{#stat.index==0}">
                     <s:if test="#myobj.loginType == 'control'">
         <s:submit  value="Click Here To Edit Employee" cssClass="btn btn-primary"></s:submit>
                 </s:if>
                 </s:if>
              </s:iterator>
         </div>
     </s:form>


        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Employee Form </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
         <center>

     <s:form action="insertEmployee" method="post" class="form-horizontal">
           <table>
                 <td><s:hidden name="id" value="%{id}" /></td>
                 <td><s:textfield name="e.ename" id="i" cssClass="form-control form-group" label="Employee Name" size="90" onkeypress="return isAlphaKey(event)" placeholder="Enter Employee name"></s:textfield></td>
                 <td><s:textfield name="e.eid" id="i" cssClass="form-control form-group" label="Employee ID " size="90" onkeypress="return isNumericKey(event)" placeholder="Enter Employee ID" /></td>
                 <td><s:textfield name="e.desg" id="i" cssClass="form-control form-group" label="Designation" size="90" onkeypress="return isDecimalKey(event)" placeholder="Enter Designation"></s:textfield></td>
          </table>
 </center>
                 <br/>
                 <br/>
    <div class="form-group">
          <s:if test="year.isEmpty()">
     <div class="col-sm-6 text-center">
         <s:submit  label="Submit" cssClass="btn btn-primary" align="center" onloading="loading" ></s:submit>
     </div>
          </s:if>
    <s:else>
        <div class="col-sm-6 text-center">
          <s:submit disabled="true" label="Submit"  cssClass="btn btn-primary" align="center" onloading="loading" ></s:submit>
     </div>
    </s:else>
     <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
    </div>
     
</div>
          </s:form>


  
          <div>
              <br>
              <br>
          </div>         
          
          
 

            
           
        <!-- /.row -->
        <hr>

        <!-- Footer -->
       
    </div>
    
    <!-- /.container -->

       

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
 
</body>
</html>

