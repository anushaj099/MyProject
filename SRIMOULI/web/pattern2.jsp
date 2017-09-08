<%-- 
    Document   : pattern2
    Created on : Feb 13, 2017, 5:22:22 PM
    Author     : nsg
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
       <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage.jsp" %>  
       </s:iterator>
            <!-- Page Content -->
            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Patterns Report</h1>
                    </div>
                </div>
                <!-- /.row -->
                <!-- Projects Row -->
                <div class="row">
                    <center>

                      
        </center>

        <div>
            <br>
            <br>
        </div>         

                    

        <div class="tab1">
            <table border="1" class="table table-bordered table-responsive">
          <tr>
              <th>S.No</th>
              <th>Con Weight</th>
              <th>No of cones</th>
              <th>weight</th>
              <th>Tare weight</th>
              <th>Type Of Packing</th>
              <s:if test="#myobj.loginType == 'control'"> 
            <th>Edit</th>
            <th>Delete</th>
            </s:if>
          </tr>
          
           <s:iterator value="patternlist" status="rowstatus" var="obj">
            <tr>
                <td><s:property value="#rowstatus.count" /></td>
                <td><s:property value="conWeight"/></td>
                <td><s:property value="noOfCones"/></td>
                <td><s:property value="weight"/></td>
                <td><s:property value="tareWeight"/></td>
                <td><s:property value="typeOfPacking"/></td>
                <s:if test="#myobj.loginType == 'control'">  
                    
                       <s:if test="year.isEmpty()">
     <td><a href="patternedit?id=<s:property value='id'/>&idp=<s:property value="idp"/>" data-toggle="tooltip" data-placement="bottom" title="Edit" >  <img src="Images/edit.png" alt="images" /></a></td>

<td><a href="patternDelete?id=<s:property value='id'/>&idp=<s:property value="idp"/>" data-toggle="tooltip" data-placement="bottom" title="Delete" onclick="return confirm('Are u Sure want to delete?')"> <img src="Images/delete.png" alt="Images" /></a></td>
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

                     

        <!-- /.row -->
        <hr>

        <!-- Footer -->

    </div>

    <!-- /.container -->



<%--</s:iterator>--%>

</body>
</html>




