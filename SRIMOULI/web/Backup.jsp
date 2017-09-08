<%-- 
    Document   : Backup
    Created on : Apr 10, 2017, 3:27:04 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
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
     <link href="Images/SriMouli.ico" rel="icon">
    <!-- Custom CSS -->
    <link href="css/Srimouli.css" rel="stylesheet">
<link href="css/newcss.css" rel="stylesheet">
   <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <s:head/>
  
      <style type="text/css">
            
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}

            label[for="i1"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}
            input[type="checkbox"]{
                width: 25px;
                margin-left: 10px;
            }
            .boxborder td{
    border-top-width: 0px;
}
            
        </style>
    </head>
    <body style="background-color: #EEEEEE">
       <s:iterator value="ulist" var="myobj" >   
         <%@include file="Upperpage.jsp" %> 
         
          <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited  Data Backup</h1>
            </div>
            <center> 
            <div class="col-lg-12">
               <h3 class="page-header">Select a date and month for backup every year</h3>
            </div>
            </center>
        </div>
        <!-- /.row -->
        
          
         <div class="row">
            <center>
                <s:form action="backupinsert" method="post" class="form-horizontal">
           <table>
               <tr> 
                    <td><s:hidden name="id"  value="%{id}" /></td>
                    <td><sj:datepicker name="backupdate" maxDate="true" changeMonth="true" changeYear="true" id="i" readonly="true"  label="Data Backup Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                   </tr>
                   <tr><td><br/><br/><br/></td></tr>
           </table>

                   
                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <s:submit  label="Submit"  cssClass="btn btn-primary" align="center"  ></s:submit>
                                    </div>
                                   <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
                                </div> 
            </center>
    </div>
                </s:form>
       </s:iterator>
          
       
    </body>
</html>
