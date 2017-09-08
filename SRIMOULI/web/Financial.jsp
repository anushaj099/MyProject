<%-- 
    Document   : Financial
    Created on : Apr 3, 2017, 3:54:15 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
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
    <!-- Custom CSS -->
    <link href="css/Srimouli.css" rel="stylesheet">
    <link href="css/newcss.css" rel="stylesheet">
   <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
        <sj:head/>
        <s:head/>
      
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>
              <style type="text/css">
            label[for="i1"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    

        </style>
        
           <style type="text/css">
* {margin:0;padding:0;}
#ticker {
display:block;
width:100#100;
color:#fff;
background:#000080;
font-family: Gill, Helvetica, sans-serif;
font-size:larger; 
font-weight:bold;
margin:auto;
text-align:center;
}
</style>
    </head>
    <body style="background-color: #EEEEEE">
        
         <s:if test="%{shiftexists!=null}">
       <marquee id="ticker" direction="right" loop="20">The Last Updated year end Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shiftexists}"/> <s:property value="%{date1}" ></s:property>  </marquee>
    </s:if>
    <s:else>
        <marquee id="ticker" direction="right" loop="20">You haven't entered any date</marquee>  
    </s:else>
        
        <%@include file="Upperpage.jsp" %>
        
         <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Financial Year End Date</h1>
                    </div>
                </div>
           <div class="row">
               <center>
        <s:form action="enddate" method="post" class="form-horizontal">
            <table>
                <tr>
                 <td><s:hidden name="id" value="%{id}" /></td>
                 <s:hidden>    </s:hidden>
                 <td>
                 <sj:datepicker changeMonth="true" maxDate="true" changeYear="true"   name="yearend" id="i" readonly="true"  label="Year End Date"  size="90" cssClass="lab d1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy"></sj:datepicker> </td>
     
              
                <%--                 <td>  <br/></td>
                 <td> <br/></td>
                     <td><sj:datepicker changeMonth="true" changeYear="true"   name="backupdate" id="i1" readonly="true"  label="Data Backup date"  size="90" cssClass="lab d1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy"></sj:datepicker> </td>--%>
                </tr>
            </table>
            <div class="form-group">
                   <div class="col-sm-6 text-center">
                        <div style="margin-left: 10em; margin-top: 3em">
                                        <center> <s:submit label="Submit" cssClass="btn btn-primary" onclick="javascript:my()" ></s:submit></center>
                        </div>
                   </div>
            </div> 
        </center>
        </s:form>
           </div>
         </div>
          
    </body>
</html>
