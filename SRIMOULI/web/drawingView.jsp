<%-- 
    Document   : DrawingReports
    Created on : Dec 17, 2016, 12:20:48 PM
    Author     : NSG
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
    
         <sj:head/>
           <s:head/>
        
    </head>
     
 
   <body style="background-color: #EEEEEE">
     <%--  <s:iterator value="ulist" var="myobj" >   
           <%@include file="Upperpage4.jsp" %>  --%>
     <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage4.jsp" %>
                    </s:if>
               
          
       <!-- Page Content -->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Sri Mouli Textiles Private Limited Drawing View</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
         <center>

     <s:form >
          
<div class="tab1">
      <table border="1" class="table table-bordered table-responsive">
         <tr>
              <th>Date</th>
              <th>Supervisor</th>
              <th>Shift</th>
             <th>Total Expected Production</th> 
           <th>Total Actual Production</th>
            <th>Total Efficiency</th>
             <s:if test="#myobj.loginType == 'control'"> 
            <th>Edit</th>
            <th>Delete</th>
            </s:if>
          </tr>
          
           <s:iterator value="dlist">
            <tr>
                <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td></td>
                <td><s:property value="superviser"/></td>
                <td><s:property value="shifts"/></td>
                <td><s:property value="totalEp"/></td>
                <td><s:property value="totalAp"/></td>
                <td><s:property value="totalEfficiency"/></td>
               <s:if test="#myobj.loginType == 'control'"> 
                   
                    <s:if test="year.isEmpty()">
                <td><a href="drawingEdit?id=<s:property value='id'/>&idd=<s:property value="idd"/>" data-toggle="tooltip" data-placement="bottom" title="Edit"> <img src="Images/edit.png" alt="Images" /></a></td>
                <td><a href="drawingDelete?id=<s:property value='id'/>&idd=<s:property value="idd"/>" data-toggle="tooltip" data-placement="bottom" title="Delete" onclick="return confirm('Are You Sure ?')"> <img src="Images/delete.png" alt="Images" /></a></td>
               </s:if>
         <s:else>
               <td><a  href="#" data-toggle="tooltip" data-placement="bottom" title="Edit"> <img src="Images/edit.png" alt="images" /></a></td>
         <td><a href="#" data-toggle="tooltip" onclick="return confirm('Are You Sure ?')" data-placement="bottom" title="Delete"> <img src="Images/delete.png" alt="images" /></a></td>

                 </s:else>
                   
                   
                </s:if>
               </tr>
        </s:iterator>
      </table>   
</div>
    
    </div>
     
</div>
          </s:form>
   </s:iterator> 
</center>
   <div>
              <br>
              <br>
          </div>         
          
          
            
  

            
           
        <!-- /.row -->
        <hr>

        <!-- Footer -->
       
    </div>
    
    <!-- /.container -->

   

</body>
</html>

