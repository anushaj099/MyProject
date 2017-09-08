<%-- 
    Document   : index
    Created on : Jun 23, 2017, 2:58:25 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Sri Sai Krishna Stone Crusher</title>
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
                padding-bottom: 0px;
                padding-left: 10px;
            } 
           
 </style>
            
<style type="text/css">
    #s
    {
        width: 100px;
        height: 40px;
        margin-right:90px;
        margin-bottom: 80px;
      
    }
</style>

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

            function isNumberKey(el, evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode !== 45 && charCode !== 8 && (charCode !== 46) && (charCode < 48 || charCode > 57))
                    return false;
                if (charCode === 46) {
                    if ((el.value) && (el.value.indexOf('.') >= 0))
                        return false;
                    else
                        return true;
                }
                return true;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                var number = evt.value.split('.');
                if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            }
            
            
            
   function addRow(one1) {
   var table = document.getElementById(one1);

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
                      
   var colCount = table.rows[2].cells.length;
                      //   alert(colCount);
   for(var i=0; i<colCount; i++) {

    var newcell = row.insertCell(i);

    newcell.innerHTML  = table.rows[rowCount-1].cells[i].innerHTML ;
    //alert(newcell.childNodes[0].type);
    switch(newcell.childNodes[0].type) {
     case "text":
       newcell.childNodes[0].value = "";
       break;
     case "checkbox":
       newcell.childNodes[0].checked = false;
       break;
     case "select-one":
       newcell.childNodes[0].selectedIndex = 0;
       break;
       
    }
   }
  // alert(rowCount);
  // $(".table").find("tr:nth-child("+(rowCount+1)+")").find("td:nth-child("+(5)+")").text("");                
                        
  }
</SCRIPT>

<script>
    $(document).ready(function() {
  $("input[id^='chk-']").change(function() {
    if ($(this).is(":checked")) {
      var chkId = $(this).attr("id");
      var inpId = chkId.substring(chkId.indexOf("-") + 1);
      
      $(this).next("label").after($inp);
    } else {
      var chkId = $(this).attr("id");
      var inpId = chkId.substring(chkId.indexOf("-") + 1)
      $("#TextBox"+inpId).remove();
    }
  });
});
    </script>
    
    <script type="text/javascript">
            function FillBilling(f){
                if(f.billingtoo.checked == true){
                    f.consigneeName.value=f.receiverName.value;
                }
            }
        </script>
        
         <script type="text/javascript">
            function FillBilling1(f){
                if(f.billingtoo1.checked == true){
                    f.consigneeAddress.value=f.receiverAddress.value;
                }
            }
        </script>
        
        
         <script type="text/javascript">
            function FillBilling2(f){
                if(f.billingtoo2.checked == true){
                    f.consigneeState.value=f.receiverState.value;
                }
            }
        </script>
        
        
         <script type="text/javascript">
            function FillBilling3(f){
                if(f.billingtoo3.checked == true){
                    f.consigneePincode.value=f.receiverPincode.value;
                }
            }
        </script>
        
        
         <script type="text/javascript">
            function FillBilling4(f){
                if(f.billingtoo4.checked == true){
                    f.consigneeGstinNo.value=f.receiverGstinNo.value;
                }
            }
        </script>
        
        <script>
    function populateCustomerId()
    {
    var selectBox = document.getElementById('selectBox');

    /* selected value of dropdown */
    var selectedCustomerId = selectBox.options[selectBox.selectedIndex].value;

    /* selected value set to input field */
    document.getElementById('customerId').value = selectedCustomerId; 
      }
      
      
       
         </script>

<style>
#input{width:100px;} /* needed only to fit in the "Run code snippet" box */

.wwFormTable tr {
    display: inline-block;
    
}
label {
  display: inline-block;
  
  margin-left: -1px;
  text-align: right;
}​
</style> 
  <s:head/>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <s:iterator value="ulist" var="myobj"> 
        <%@include file="upperpage2.jsp" %>
    </s:iterator>
  <!-- Content Wrapper. Contains page content -->
 
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <center>
      <h1>
       DEBIT NOTE
        
      </h1>
        </center>
     
    </section>

     
    
    
    <section class="content">
<s:form action="insertInvoice" theme="css_xhtml">
      <!-- row -->
      <div class="row">
        <div class="col-md-12">
          <!-- jQuery Knob -->
          <div class="box box-solid">
                <div class="box box-warning">  
            <div class="box-header">
              
                
             <table>
                 <tr>
    <div class="block">
        &nbsp;
        <td style="padding-left: 80px;">
    <label>Document Number:</label>
     <s:textfield id="i"  name="logindto.docno" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Enter Document Number" size="50" />
    </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
    <label>Against invoice:</label>
        <s:textfield id="i" name="logindto.againstinvoice" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Enter Against Invoice" size="50" />
    </td>
    </div>
           </tr>
    
           <td><br/></td>         
         
   <tr>
    <div class="block bootstrap-timepicker">
       
        <td style="padding-left: 80px;">
    <label>Date of Issue:</label>
      <div class="input-group date">
       <div class="input-group-addon">
          <i class="fa fa-calendar"></i>
      </div>

       <sj:datepicker id="datepicker1"  name="logindto.urInvoiceDate"  cssClass="form-control" placeholder="Select Date(dd-mm-yyyy)" size="50" />
          </div>
        </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
    <label>Date Of Invoice:</label>
  <div class="input-group date">
       <div class="input-group-addon">
          <i class="fa fa-calendar"></i>
      </div>

       <sj:datepicker id="datepicker"  name="logindto.urInvoiceDate"  cssClass="form-control" placeholder="Select Date(dd-mm-yyyy)" size="50" />
          </div>
      
        </td>
  
    </div>
           </tr>
           
           
           <td><br/></td>   
           
      <tr>
    <div class="block">
        
        <td style="padding-left: 80px;">
    <label>State:</label>
    <s:select list="{'Andhra Pradesh','West Bengal'}" onclick="javascript:statecodes()"  id="eeee" name="logindto.state" onkeypress="return isDecimalKey(event)" cssClass="form-control" headerKey="-1" headerValue="Select State"/>

        </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
    <label>State Code:</label>
    <s:textfield  readonly="true" id="eeee1"  name="logindto.statecode"  cssClass="form-control" placeholder="Enter State Code" size="50" />
    </td>
    </div>
           </tr>
           
           
           
             <td><br/></td>         
    
             </table>
     </div>
           
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div>
      
      
      
      
      
       <div class="row">
        <div class="col-md-12">
          <!-- jQuery Knob -->
          <div class="box box-solid">
               <div class="box box-warning">    
            <div class="box-header">
              
                
             <table>
                
                 <tr>
    <div class="block">
        &nbsp;
        <td style="padding-left: 80px;">
       <center> <label><h3>Bill to Party </h3></label></center>
    <label>Name </label>
     <s:textfield id="i"  name="receiverName" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Name Of Receiver" size="50" />
    </td>
    

    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
        <center> <label><h3>Ship to Party </h3></label></center>
   
    
       &#x00A0;
   <input type="checkbox" name="billingtoo" onclick="FillBilling(this.form)" id="chk-01"/>
    <label>Name (Tick if name is same)</label>
        <s:textfield id="i" name="consigneeName" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Name Of Consignee" size="50" />
    </td>
    </div>
           </tr>
    
           <td><br/></td>         
      <tr>
    <div class="block">
       
        <td style="padding-left: 80px;">
    <label>Address</label>
      <s:textarea id="i" name="receiverAddress"  rows="4" cols="20" cssClass="form-control" placeholder="Enter Receiver Address"/>
    </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
       <input type="checkbox" name="billingtoo1" onclick="FillBilling1(this.form)" id="chk-01"/>
    <label>Address(Tick if address is same)</label>
        <s:textarea id="i" name="consigneeAddress"  rows="4" cols="20" cssClass="form-control" placeholder="Enter Consignee Address"/>
    </td>
    </div>
           </tr>
           
           
             <td><br/></td>         
      <tr>
    <div class="block">
       
        <td style="padding-left: 80px;">
    <label>State</label>
     <s:textfield id="i"  name="receiverState" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="State Of Receiver" size="50" />
    </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
        <input type="checkbox" name="billingtoo2" onclick="FillBilling2(this.form)" id="chk-01"/>
    <label>State(Tick if state is same)</label>
      <s:textfield id="i" name="consigneeState" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="State Of Consignee" size="50" />
    </td>
    </div>
           </tr>
           
           
           
           
             <td><br/></td>         
      <tr>
    <div class="block">
        
        <td style="padding-left: 80px;">
    <label>State Code</label>
    <s:textfield id="i"  name="receiverPincode" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="State Code" size="50" />
   
        </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
          <input type="checkbox" name="billingtoo3" onclick="FillBilling3(this.form)" id="chk-01"/>
    <label>State Code(Tick if pin code is same)</label>
        <s:textfield id="i" name="consigneePincode" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="State Code" size="50" />
    </td>
    </div>
           </tr>
            <td><br/></td>  
            
            
            
            
             <tr>
    <div class="block">
        
   <td style="padding-left: 80px;">
    <label>GSTIN Number</label>
    <s:textfield id="i"  name="receiverGstinNo" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="GSTIN Number" size="50" />
   </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
    <input type="checkbox" name="billingtoo4" onclick="FillBilling4(this.form)" id="chk-01"/>
    <label>GSTIN Number(Tick if number is same)</label>
    <s:textfield id="i" name="consigneeGstinNo" onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="GSTIN Number" size="50" />
    </td>
    </div>
           </tr>
           
           
            <td><br/></td>
            <td><br/></td>
             </table>
    </div>
          <!-- /.box -->
        </div>  </div>  </div>  </div>
             
         
          
         
    
    <div class="row">
        <div class="col-md-12">
          <!-- jQuery Knob -->
          <div class="box box-solid">
               <div class="box box-warning">    
            <div class="box-header">
                <table id="two1" >
                    <tr><td style="padding-left: 450px;"><input type="button" value="Add Row"  class="btn btn-primary" onclick="addRow('one1')" onkeyup="myFunction()"/>   
        </td></tr>
</table>
                 &#x00A0;&#x00A0;  
    <table  border="1" style="border-collapse: collapse;" id="one1"> 
      <tr>
         
         <th rowspan="2">Grade Description</th>
          <th rowspan="2">HSN Code</th>
        <th rowspan="2">UOM</th>
          <th rowspan="2"> Qty (CuM)</th>
          <th rowspan="2">Rate before tax</th>
          <th rowspan="2">Rate before tax</th>
           <th rowspan="2">Amount &#8377;</th>
           <th rowspan="2">Discount &#8377;</th>
          <th rowspan="2">Taxable value &#8377;</th>
          <th colspan="2"> CGST </th> 
         <th colspan="2" >SGST</th>
         <th rowspan="2">Total &#8377;</th>
     </tr>
       <tr>
         <th>Rate </th>
          <th>Amount &#8377;</th>
         <th>Rate </th>
          <th>Amount &#8377;</th>
       
       </tr>
      
   <tr>
       
        <td><s:textfield name="logindto.goodDescription" id="i" cssClass="form-control"  theme="simple"></s:textfield></td>  
        <td><s:textfield name="logindto.hsnCode" id="i" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield name="logindto.qty" onkeyup="multiplication1()" id="qty" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield name="logindto.uom"  cssClass="form-control" id="i" theme="simple"></s:textfield></td>
        <td><s:textfield name="logindto.rate" onkeyup="multiplication1()"  id="customerId" cssClass="form-control "  theme="simple"></s:textfield></td>
   <td><s:textfield name="logindto.rate" onkeyup="multiplication1()"  id="customerId" cssClass="form-control "  theme="simple"></s:textfield></td>
   
            <td><s:textfield name="logindto.total" readonly="true" onkeyup="multiplication2()" id="total"  cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield name="logindto.discount" id="dis" onkeyup="multiplication2()" cssClass="form-control"  theme="simple"></s:textfield></td>
       <td><s:textfield name="logindto.taxableValue" onkeyup="multiplication3()" readonly="true"  id="tax" cssClass="form-control price"  theme="simple"></s:textfield></td>  
       <td><s:textfield name="logindto.cgstRate" onkeyup="multiplication3()" id="crate" cssClass="form-control"  theme="simple"></s:textfield></td>
       <td><s:textfield name="logindto.cgstAmt"  readonly="true" id="camt"  cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield name="logindto.sgstRate"  onkeyup="multiplication4()" id="srate"  cssClass="form-control"  theme="simple"></s:textfield></td>  
        <td><s:textfield name="logindto.sgstAmt"  readonly="true" id="samt" cssClass="form-control"  theme="simple"></s:textfield></td>
       <td><s:textfield name="logindto.total"  readonly="true" id="samt" cssClass="form-control"  theme="simple"></s:textfield></td>

   </tr>
   
   </table>
         
         
          <table border="1" width="100%">
      <tr>
   <td  width="21.6%" class="text-center"><b>Total</b></td>  
    <td><s:textfield name="logindto.totTaxVal" size="10" id="i" cssClass="form-control totalPrice1" readonly="true" theme="simple"></s:textfield></td>
   <td width="14.3%">&#X00A0;</td>
 
    <td><s:textfield name="logindto.totTaxVal" size="10.9" id="i" cssClass="form-control totalPrice1" readonly="true" theme="simple"></s:textfield></td>
   
    <td><s:textfield name="logindto.totTaxVal" size="10.9" id="i" cssClass="form-control totalPrice1" readonly="true" theme="simple"></s:textfield></td>
  
   <td><s:textfield name="logindto.totTaxVal" size="10.9" id="i" cssClass="form-control totalPrice1" readonly="true" theme="simple"></s:textfield></td>
   <td width="7.3%">&#X00A0;</td>
   <td><s:textfield name="logindto.totCgst" size="10" id="i" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   <td width="7.3%">&#X00A0;</td>
   <td><s:textfield name="logindto.totSgst" size="10" id="i" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
<td><s:textfield name="logindto.totIgst" size="10" id="i" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>

   </tr>
  
  </table>
   
   <table border="1" width="100%">
        <tr>
       <td><b></b></td>  
       <td><s:textfield name="logindto.invoiceTotal" size="45"  cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   <td>Total Amount: &#8377;</td>
   <td><s:textfield name="form.totalOpeningStock" size="5" id="totalPrice1" cssClass="form-control" readonly="true" theme="simple"></s:textfield></td>
   
   </tr>
   </table>
         &#x00A0;&#x00A0;&#x00A0;
            </div>  </div>  </div>  </div></div>
         
         
         
         
         
           <div class="row">
        <div class="col-md-12">
          <!-- jQuery Knob -->
          <div class="box box-solid">
               <div class="box box-warning">    
            <div class="box-header">
                <table>
                     <tr>
    <div class="block">
       
        <td style="padding-left: 80px;">
    <label>Terms And Conditions</label>
      <s:textarea id="i" name="logindto.termsConditions"  rows="4" cols="55" cssClass="form-control"/>
    </td>
    <td>&#x00A0;</td>
   <td style="padding-left: 130px;">
        <label>Bank A/C: </label>
       <div>
               <s:textfield id="i" name="logindto.authName"  onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Enter Bank A/C" size="50" />
               
            </div>
               <label>Bank IFSC Code: </label>
               <div>
               <s:textfield id="i" name="logindto.authDesign"  onkeypress="return isDecimalKey(event)" cssClass="form-control" placeholder="Enter Bank IFSC Code" size="50" />
               
            </div>
     
    </td>
    </div>
           </tr>
                </table>
            </div>
               </div>  
               </div></div></div>
         
              <table  >
                  <tr><td style="padding-left: 470px;"><s:submit id="s" value="submit"  cssClass="btn btn-primary"/>   
        </td></tr>
</table>
      
      </s:form>
    </sectiLon>
    
    
    <script>
         function statecodes() {
            var a1=new Array('Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jammu and Kashmir','Jharkhand','Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur','Meghalaya');
            var a2=new Array('IN-AP','IN-WB');
       
              var x =document.getElementById("eeee").value;
         
           if(x==='-1') {
            document.getElementById("eeee1").value=" ";  
             
              }
           
           if(x!=='-1') {
              
               for(var i=0;i<a1.length;i++) {
                   var state=a1[i];
                   var code=a2[i];
                   if(x===state) {
                     document.getElementById("eeee1").value=code;  
                   }
               }
               
           //  var code=document.getElementById("eeee1");
             
             
                 }
           
         }           
    </script>

  
  <script>
      function multiplication1(){
          var t1=document.getElementById("qty").value;
           var t2=document.getElementById("customerId").value;
           document.getElementById("total").value=t1*t2;
      }
      
       function multiplication2(){
          var t1=document.getElementById("total").value;
           var t2=document.getElementById("dis").value;
           document.getElementById("tax").value=t1*t2;
      }
      function multiplication3(){
          var t1=document.getElementById("tax").value;
           var t2=document.getElementById("crate").value;
           document.getElementById("camt").value=t1*t2;
      }
      function multiplication4(){
          var t1=document.getElementById("tax").value;
           var t2=document.getElementById("srate").value;
           document.getElementById("samt").value=t1*t2;
      }
       function multiplication5(){
          var t1=document.getElementById("tax").value;
           var t2=document.getElementById("irate").value;
           document.getElementById("iamt").value=t1*t2;
      }
      
        $('.price').mouseenter(function () {
                                    var sum = 0;
                                    $('.price').each(function () {
                                        sum += Number($(this).val());
                                    });
                                    $('#totalPrice1').val(sum);
                                });

  </script>
  
  <!-- /.content-wrapper -->
  <footer class="main-footer" style="margin:0px !important;">
    <div class="pull-right hidden-xs">
     <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://nivriticloudsolutions.com">Nivriti Solutions Global</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

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

<!-- Page script -->
<script>
  $(function () {
    //Initialize Select2 Elements
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
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
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
    $('#datepicker').datepicker({
      autoclose: true
    });
    
      $('#datepicker1').datepicker({
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
</script>
</body>
</html>
