<%-- 
    Document   : MyProfile
    Created on : Jun 27, 2017, 2:34:08 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sj" uri="/struts-jquery-tags" %>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Venkata Sai Krishna Stone Crusher</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
 <script src="js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <sj:head/>
        <s:head/>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/skin-yellow.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
 <style type="text/css">
            
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 10pt;
                padding-bottom: 10px;
                padding-left: 100px;
            } 
            
          
</style>
            
<style type="text/css">
    #s
    {
        width: 100px;
        height: 40px;
        margin-left:211px;
        margin-bottom: 80px;
      
    }
    #container{
   text-align: center;
}
  
</style>
<style>
    @page {
        size: A4;
        margin: 0.3cm;
    }

    .print {
        display: none;
    }

    @media print {
        div.fix-break-print-page {
            page-break-inside: avoid;
        }

        .print {
            display: block;
        }
    }

    .print:last-child {
        page-break-after: auto;
    }
    
    #report{font-size-adjust: 105;}
    * {
/*  font-size: 0.99em !important;*/
  line-height: 1.26 !important;
}
    
</style>
<script>
                
      
        function my()
        {
           var button = $('#button');
           $(button).removeAttr('disabled');
        }
        
    </script>
<script>
         function myFunction(divName)
          {
               
               var printContents = document.getElementById(divName).innerHTML;
               var originalContents = document.body.innerHTML;

                 document.body.innerHTML = printContents;
 
                    window.print();
                    
                     document.body.innerHTML = originalContents;
           }
           
           
   function check()
   {    
csv = []
rows = $('#table2 tr');
for(i =0;i < rows.length;i++) {
cells = $(rows[i]).find('td,th');
csv_row = [];
for (j=0;j<cells.length;j++) {
    txt = cells[j].innerText;
    csv_row.push(txt.replace(",", "-"));
}
csv.push(csv_row.join(","));
}
output = csv.join("\n")
var textToSave = output;
var textToSaveAsBlob = new Blob([textToSave], {type:"text/plain"});
var textToSaveAsURL = window.URL.createObjectURL(textToSaveAsBlob);
var fileNameToSaveAs = "Reports.csv";
var downloadLink = document.createElement("a");
downloadLink.download = fileNameToSaveAs;

downloadLink.innerHTML = "Download File";

downloadLink.href = textToSaveAsURL;    
downloadLink.onclick = destroyClickedElement;
function destroyClickedElement(event)
  {
   document.body.removeChild(event.target);
   }
downloadLink.style.display = "none";
document.body.appendChild(downloadLink);


downloadLink.click();
   }
   </script>
 </head>
   <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <s:iterator value="ulist" var="myobj"> 
            <%@include  file="upperpage1.jsp" %>
          
            <section class="content">

      <div class="row"  >
        <div class="col-md-12">
  <div class="box box-info">
  <div class="box-header with-border">
             <s:form action="getGenReports" method="post">
               
                 <table>
                     <tr><td><s:hidden name="lid" value="%{lid}" /></td>
              <td><br/></td>
      <td style="padding-left: 130px;">
  
        <div class="input-group date">
           
            <center><td><s:textfield id="i" readonly="true" data-date-format="dd/mm/yyyy" name="form.invoiceDate" onkeypress="return isDecimalKey(event)"  cssClass="form-control datepicker" placeholder="Select Date" size="90" label="From Date"/></td></center>
       </div>
   </td>
              <td><br/></td>
                 <td><br/></td>
                      <td style="padding-left: 130px;">
   
        <div class="input-group date">
     
            <s:textfield id="i"   readonly="true" data-date-format="dd/mm/yyyy" name="form.invoiceDate1" onkeypress="return isDecimalKey(event)"  cssClass="form-control datepicker1" placeholder="Select Date" size="50" label="To Date"/>
       </div>
        </td>
            <td><br/></td>
            
            <td><s:textfield id="i"   name="form.invoiceNo" onkeypress="return isDecimalKey(event)"  cssClass="form-control " placeholder="Enter Invoice Number" size="50" label="Invoice Number"/></td>
            <td><br/></td>
            
            <td><s:select id="i" list="nlist" headerKey="" headerValue="--Select Party Name---" name="form.billToName" onkeypress="return isDecimalKey(event)"  cssClass="form-control " placeholder="Enter Invoice Number" label="Party Name"/></td>
            <td><br/></td>
            
            <td><s:select id="i" list="glist" headerKey="" headerValue="--Select Grade--" name="form.grades" onkeypress="return isDecimalKey(event)"  cssClass="form-control " placeholder="Enter Invoice Number"  label="Select Grade"/></td>
            <td><br/></td>
            
            <td><s:select id="i" list="gstlist" headerKey="" headerValue="--Select GSTIN Number--" name="form.shipToGstin" onkeypress="return isDecimalKey(event)"  cssClass="form-control " placeholder="Select GSTIN Number"  label="Select GSTIN Number"/></td>
            <td><br/></td>
          <s:submit id="s" value="Submit" cssClass="btn btn-primary btn-block btn-flat" align="center"/>
         <td><br/></td>
         
        </table>
    </s:form>
       
  </div></div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
        </div>
                <br/><br/>
    
             </s:iterator> 
           
                 <div id="container">
                   <div  id="abc" >
                     
                       <button type="button home-button" id="report" onclick="myFunction('printablearea')" class="btn btn-primary">Print Reports</button>
               <button id="button" onclick="return check()" class="btn btn-primary">Export To Excel</button>
            </div>
                 </div>
           
               <br/>
           
             <div class="box box-info">
            <div class="box-header with-border">
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
              <div class="table-responsive">
                   <div id="printablearea">   
               <table class="table no-margin" id="table2">
                  <thead>
                  <tr>
                    <th style="vertical-align: top">S.No</th>
                    <th style="vertical-align: top">Date</th>
                    <th>Invoice Number</th> 
                    <th style="vertical-align: top">Party Name</th>
                    <th style="vertical-align: top">GSTIN</th>
                    <th style="vertical-align: top"> Grade </th>
                    <th style="vertical-align: top">Quantity </th>     
                    <th> Taxable Value </th>
                    <th> CGST Amount </th>
                    <th> SGST Amount </th>
                    <th> Rounded Value </th>
                    <th> Total Amount </th>
                  </tr>
                  </thead> 
                  <s:set var="sno" value="0"/>
                      <s:set var="sumTotal22" value="0" />
                      <s:set var="sumTotal23" value="0" />
                      <s:set var="taxval" value="0" />
                      <s:set var="cgstamt" value="0" />
                      <s:set var="sgstamt" value="0" />
                      <s:set var="roundval" value="0" />
                      
                  <s:iterator value="clist" var="obj1" status="stat">
                    <s:hidden value="%{#stat.index}" id="like"/>
                    <s:if test="#obj1.productDesc=='Frieght Charges' || #obj1.productDesc=='FRIEGHT CHARGES' || #obj1.productDesc=='Mining Charges'||#obj1.productDesc=='MINING CHARGES'">
                       
                      </s:if>
                      <s:else>
                    <tr>
                         <s:iterator value="rlist" var="obj2">
                                <s:if test="#obj1.prTaxIntra.ptId==#obj2.ptId">
                                    <s:set var="sno" value="%{#sno+1}"/>
                                    <td><s:property value="%{#sno}"/></td>
                                    <td><s:date format="dd-MM-yyyy"  name="%{invoiceDate}"/></td>
                                    <td><s:property value="invoiceNo"/></td>
                                    <td><s:property value="billToName"/></td>        
                                    <td><s:property value="billToGstin" /></td>
                                    <td><s:property value="grade" /></td>                                   
                                    <td><s:property value="getText('{0,number,###0.00}',{totalQty})" /></td> 
                                    <td><s:property value="getText('{0,number,###0.00}',{totalTaxval})" /></td> 
                                    <td><s:property value="getText('{0,number,###0.00}',{totalCgstAmt})" /></td> 
                                    <td><s:property value="getText('{0,number,###0.00}',{totalSgstAmt})" /></td>
                                    <td><s:property value="getText('{0,number,###0.00}',{totalInv-(totalTaxval+totalCgstAmt+totalSgstAmt)})" /></td>
                                    <td><s:property value="getText('{0,number,###0.00}',{totalInv})"/></td>
                                      
                                
                                    <s:set var="cgstamt" value="%{#cgstamt + totalCgstAmt}" />
                                    <s:set var="taxval" value="%{#taxval + totalTaxval}" />
                                    <s:set var="sumTotal22" value="%{#sumTotal22 + totalQty}" />
                                    <s:set var="sumTotal23" value="%{#sumTotal23 + totalInv}" />   
                                    <s:set var="sgstamt" value="%{#sgstamt + totalSgstAmt}" />
                                   <s:set var="roundval" value="%{#roundval + totalInv-(totalTaxval+totalCgstAmt+totalSgstAmt)}" />
                                  
                                </s:if>     
                         </s:iterator>
                             
               </tr>
                      </s:else>
                 </s:iterator>
                <tr>
                    <td> </td>
                      <td> </td>
                      <td></td>               
            <td><B>GRAND TOTAL</b></td>
            <td> </td> 
            <td> </td>
            <td align="left"><b><s:property value="getText('{0,number,###0.00}',{#sumTotal22})"/></b> </td>
            <td align="left"><b><s:property value="getText('{0,number,###0.00}',{#taxval})"/></b> </td>
            <td align="left"><b><s:property value="getText('{0,number,###0.00}',{#cgstamt})"/> </b></td> 
            <td align="left"><b><s:property value="getText('{0,number,###0.00}',{#sgstamt})"/> </b></td>  
            <td align="left"><b><s:property value="getText('{0,number,###0.00}',{#roundval})"/> </b></td> 
            <td align="left"><b><s:property value="getText('{0,number,###0.00}',{#sumTotal23})"/></b> </td>    
             
            <td>  </td>
         
                </tr>
                
                </table>
                 </div>
              
            </div>
      </div>
        </section> 
         </div>     
    </div>
     <%@include file="Footer.jsp" %>
    </div>
       
       <!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script type="text/javascript" src="regvalid.js"></script>
<script>
    $(function(){
       $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'DD/MM/YYYY'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('.datepicker').datepicker({
      autoclose: true
    });
    
      $('.datepicker1').datepicker({
      autoclose: true
    });
    $('#datepicker2').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
  
  
  
  $(document).ready(function () {
                var al = $("#like").val();
                if (al === undefined)
                    $("#abc").find("input,button,textarea,select").attr("disabled", "disabled");
            });
   
</script>
<script>
                
      $('.EventDetail tr').has('td:empty').hide();
</script>
    </body>
</html>
