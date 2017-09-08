<%-- 
    Document   : DCals
    Created on : Apr 11, 2017, 3:37:50 PM
    Author     : Masrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
   <link href="css/Styles.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <s:head/>
    </head>
    <body style="background-color: #EEEEEE">

      <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 13pt;
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
         <%@include file="Upperpage.jsp" %>
        <!-- Page Content -->
    <div class="container">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome to Calculations Panel</h1>
                <br/>
                <center>
               <table>
                   <td>
                       <s:textfield id="i" name="curdfrom" label="From date of Financial Year" size="90"  cssClass="form-control form-group" readonly="true"/>
                      <%-- <s:date name="%{curdfrom}" format="dd-MM-yyyy" var="date1"/><s:textfield readonly="true" displayFormat="dd-mm-yy" id="i" name="form.date" value="%{date1}"  label="From date of Financial Year"  size="90" cssClass="form-control form-group" /> --%>
                   </td>
                   <s:if test="curdto!=null">
                   <td>
                        <s:textfield id="i" name="curdto" label="To date of Financial Year" size="90"  cssClass="form-control form-group" readonly="true"/>
                       <%--  <s:date name="%{curdto}" format="dd-MM-yyyy" var="date1"/><s:textfield readonly="true" displayFormat="dd-mm-yy" id="i" name="form.date" value="%{date1}"  label="To date of Financial Year"  size="90" cssClass="form-control form-group" />--%> 
                   </td>
              </s:if>
              <s:else>
                  <td> <s:textfield id="i" name="dtto" label="To date of Financial Year" cssClass="form-control" readonly="true"/></td>
              </s:else>
                   </table>
                   <br/>
                   <table>
                       <s:if test="statuss==null && curdfrom!=null">
                       <tr>
                   <th style="font-size: 13pt">Click the button to close current Year: </th>
                   <td><div class="col-sm-6 text-center"> 
          <button type="button" class="btn btn-default"  ><a href="closeYear" data-confirm="Are you sure to Close Current Year....?" style="text-decoration:none; color:black">Close Current Year</a></button>
          </div></td>
                    </tr>
                    </s:if>
                    
                     <s:else>
                       <tr>
                   <th style="font-size: 13pt">Click the button to close current Year: </th>
                   <td><div class="col-sm-6 text-center"> 
                           <button type="button" class="btn btn-default" disabled><a href="#" data-confirm="Are you sure to Close Current Year....?" style="text-decoration:none; color:black">Close Current Year</a></button>
          </div></td>
                    </tr>
                    </s:else>
                    
                     </table> 
                   <br/>
                   <s:form action="financialReports" method="post" data-confirm="Are you sure to go to particular Financial Year....?">
                   <table>
                       <tr>
<!--                   <th style="font-size: 13pt">Select the Year to go to particular Financial Year: </th>-->
                   <td><div class="col-sm-6 text-center" id="one"> 
         <s:select name="fy.finyear" id="i" label="Select the Year to go to particular Financial Year" list="%{avlyrs}" cssClass="form-control form-group hexp"  headerKey="0" headerValue="-- Select Year --"/> 
          </div></td>
          <s:if test="!avlyrs.isEmpty()">
           <td><div class="col-sm-6 text-center"> 
                     <s:submit value="Go" cssClass="btn btn-primary"></s:submit>
          </div></td>
          </s:if>
          <s:else>
               <td><div class="col-sm-6 text-center"> 
               <s:submit disabled="true" value="Go" cssClass="btn btn-primary"></s:submit>
          </div></td>
          </s:else>
                    </tr>
                     </table>
                   </s:form>
                </center>
            </div>
        </div>
    </div>
              
         <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
   
     <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
 <script type="text/javascript">
    
function efficy()
{
    $(".hexp")[0].selectedIndex = 0;
}

 $(document).on('click', ':not(form)[data-confirm]', function(e){
    
    if(!confirm($(this).data('confirm'))){
      e.stopImmediatePropagation();
      e.preventDefault();
      
		}
            });
           
$(document).on('submit', 'form[data-confirm]', function(e){
    
    if(!confirm($(this).data('confirm'))){
       efficy();
      e.stopImmediatePropagation();
      e.preventDefault();
    
     
}
});



  </script>
               
    </body>
</html>
        
