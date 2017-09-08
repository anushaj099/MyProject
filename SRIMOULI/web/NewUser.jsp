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
                    var regex = /^[a-zA-Z]+$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }     
                
                
                
                </SCRIPT> 
        
    </head>
    
    
    <body style="background-color: #EEEEEE">
 <style type="text/css">
            label[for="i"] {
            font-family:sans-serif;
            font-style: normal;
            color: black;
             font-size: 12pt;
            padding-bottom: 10px;} 
             input[type="checkbox"]{
                width: 25px;
                    margin-left: 10px;
            }
        </style>
           
            <s:iterator value="ulist" var="myobj" >   
                <%@include file="Upperpage.jsp" %>         
           </s:iterator>    

       
     

    <!-- Page Content -->
    <div class="container">
        
         <button type="button" class="btn btn-primary" ><a href="userView?id=<s:property value="id"/>" style="text-decoration:none; color:white">Click here to Edit,Delete</a></button>

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited New User Form </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
         <center>

     <s:form action="insertLogin" method="post" class="form-horizontal">
           <table>
                 <td><s:hidden name="id" value="%{id}" /></td>
                 <td><s:textfield name="rf.userName" id="i" cssClass="form-control form-group" onkeypress="return isAlphaKey(event)" label="User Name" size="90" placeholder="Enter User name"></s:textfield></td>
                 <td><s:password name="rf.password" id="i" cssClass="form-control form-group" label="Password" size="90" placeholder="Enter Password"></s:password></td>
                  <td>&#X00A0;</td> 
                <td><s:checkboxlist id="i" list="{'Godown','Carding','Drawing','Openend','Quality','Electricity','Packing'}" name="rf.loginType" label="Login Type" cssClass="form-group chbox"/></td>
                  <td>&#X00A0; </td> 
       <%--<td><s:select name="rf.loginType" list="{'godown','carding','drawing','openend','quality','electricity','packing','control'}" id="i" cssClass="form-control form-group" label="Login Type" placeholder="Enter Login Type" headerKey="-1" headerValue=" --Select-- "></s:select></td>--%>
                 <td><s:textfield name="rf.designation" id="i" cssClass="form-control form-group desg" label="Designation" onkeypress="return isDecimalKey(event)" size="90" placeholder="Enter Designation"></s:textfield></td>
       
         </table>


  
 </center>
                 <br/>
                 <br/>
    <div class="form-group">
    <s:if test="year.isEmpty()">
         <div class="col-sm-6 text-center">
         <s:submit  label="Submit"  cssClass="btn btn-primary" align="center" onloading="loading" ></s:submit>
     </div>
    </s:if>
    <s:else>
         <div class="col-sm-6 text-center">
             <s:submit  disabled="true" label="Submit"  cssClass="btn btn-primary" align="center" onloading="loading" ></s:submit>
     </div>
    </s:else>
    
     <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
     </div> 
    </div>
     
</div>
          </s:form>
 <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
 <SCRIPT language=Javascript>
         $(document).ready(function () {
             
        $('input[type="checkbox"]').click(function(event) {
    if (this.checked && $('input:checked').length === 7 ) {
        $('.desg').val("Data Entry");
         $('.desg').attr("readonly", true);
       //  event.preventDefault();
     var checkedNum = $('input[type="checkbox"]:checked').length;
  //var allCheckoxesChecked = $('input[name="chkservicecrew"]:checked');
  var allCheckboxes = $('input[type="checkbox"]');

  if (checkedNum === 7) {
      //$(allCheckboxes).prop("disabled", true);
   // $(allCheckboxes).attr('disabled', 'disabled');
   // $(allCheckoxesChecked).removeAttr('disabled');
    alert("Your Designation is Data Entry");
  } else {
   // $(allCheckboxes).removeProp('disabled');
    
  }
        
        
    }else{
        $('.desg').val("");
         $('.desg').attr("readonly", false); 
    }
  
});
        });
            </SCRIPT>
  
          <div>
              <br>
              <br>
          </div>         
          
          
 

            
           
        <!-- /.row -->
        <hr>

        <!-- Footer -->
       
 
    
    <!-- /.container -->

       

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
 
</body>
</html>

