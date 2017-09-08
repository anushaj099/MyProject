<%-- 
    Document   : ReportManager
    Created on : Jul 1, 2017, 4:11:06 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sai Venkata Krishna Ready Mix Industry</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
          <s:iterator value="ulist" var="myobj"> 
            <%@include  file="upperpage1.jsp" %>
            
          </s:iterator>
        
        <br/><br/>
        <section class="content">
         <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Today's Bills are</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>Invoice Number</th>
                    <th>Invoice Date</th>
                    <th>Receiver Name</th>
                    <th>Invoice Total</th>
                  </tr>
                  </thead>
                  <s:set var="total" value="0"/> 
                      <s:iterator value="rlist">
                          <tr>
                              <s:set var="total" value="%{#total + totalInv}" />
                              <td><s:property value="invoiceNo"/>
                              <td><s:date format="dd-MM-yyyy" var="date1" name="%{invoiceDate}"/> <s:property value="%{date1}" ></s:property></td>
                             <td><s:property value="billToName"/></td>
                    <td><s:property value="getText('{0,number,###0.00}',{totalInv})"/></td>
                    <td><a href="viewinvoice?lid=<s:property value='lid'/>&invoiceNo=<s:property value='invoiceNo'/>"<span class="label label-success">View</span></a></td>
                         </tr>
                      </s:iterator>
                         <tr>
                             <td></td>
                             <td></td>
                             <td><B>GRAND TOTAL</b></td>
                            <td style="padding-left: 10px;"><b><s:property value="getText('{0,number,###0.00}',{#total})"/></b></td>
                         </tr>
                
                </table>
              </div>
            </div>
      </div>
        </section>
           </div>
          <%@include file="Footer.jsp" %>
    </div>
        <!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
    </body>
</html>
