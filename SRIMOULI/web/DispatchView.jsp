<%-- 
    Document   : PurchaseView
    Created on : Dec 26, 2016, 11:25:21 AM
    Author     : Swathi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html>
<html>
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
        <sj:head/>
    </head>
    <body style="background-color: #EEEEEE">
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>
            <s:iterator value="ulist" var="myobj" > 
                <%@include file="Upperpage4.jsp" %> 
            
                <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Dispatch View </h1>
                    </div>
                </div>
                <div class="row">
                    <center>
             <s:form action="dispatchview" method="post" class="form-horizontal">
                        <div class="tab1">
                            <table border="1" class="table table-bordered table-responsive">
                                <tr>
                                    <th>S.No</th>
                                    <th>Date</th>
                                    <th>Customer Name</th> 
                                    <th>Packing Type</th>
                                     <s:if test="#myobj.loginType == 'control'"> 
                                    <th>Edit</th>
                                    <th>Delete</th>
                                    </s:if>
                                </tr>
                             <s:iterator value="ulist1" status="rowstatus">
                                    <tr>
                                        <td><s:property value="#rowstatus.count" /></td>
                                        <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                                        <td><s:property value="customer"/></td>
                                        <td><s:property value="packingType"/></td>
                                        <s:if test="#myobj.loginType == 'control'"> 
                                        <s:date format="dd-MM-yyyy" var="date1" name="%{date}"/>
                                     
                                          <s:if test="year.isEmpty()">
       <td><a href="dispatchEdit?id=<s:property value='id'/>&idk=<s:property value="idk"/>&boxType=<s:property value="packingType"/>&countDb=<s:property value="count"/>&actualDate=<s:property value="date1"/>" data-toggle="tooltip" data-placement="bottom" title="Edit"> <img src="Images/edit.png" alt="images" /></a></td>
                                        <td><a href="dispatchDelete?id=<s:property value='id'/>&idk=<s:property value="idk"/>&boxType=<s:property value="packingType"/>&countDb=<s:property value="count"/>&actualDate=<s:property value="date1"/>" data-toggle="tooltip" onclick="return confirm('Are You Sure ?')" data-placement="bottom" title="Delete"> <img src="Images/delete.png" alt="images" /></a></td>
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
  </s:form>
                    </s:iterator>
                    </center>
            </div>

        </div>  
<br/>
<br/>
    <hr>
</body>
</html>
