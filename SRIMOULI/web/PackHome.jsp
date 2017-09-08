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
         <script language=Javascript>
                 function isNumberKey(el, evt)
                {
                if((evt.charCode>= 48 && evt.charCode <= 57) || evt.charCode=== 46 ||evt.charCode === 0){
                if(el.value.indexOf('.') > -1){
                if(evt.charCode=== 46)
                evt.preventDefault();
                }
                }else
                evt.preventDefault();
                }
                </script>
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>
            <sj:head/>
            <s:head/>
            
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
         <s:if test="%{shift_date!=null}">
       <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property>  </marquee>
    </s:if>
    <s:else>
        <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>  
    </s:else>
   <%--      <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage2.jsp" %>                  
        </s:iterator> --%>
   <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage2.jsp" %>
                    </s:if>
                </s:iterator>
     <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Packing Data</h1>
                    </div>
    </div>
     <!-- /.row -->

    <!-- Projects Row -->
    <div class="row">
     <center>
       <%--   <s:iterator value="list">
             <s:textfield value="%{openingStock}"/>
         </s:iterator> --%>
         
     <s:form action="packval" method="post" class="form-horizontal">
     <table id="part1">
         <td><s:hidden name="id" value="%{id}" /></td>
         <td><sj:datepicker maxDate="true"  name="form.date" id="i" readonly="true" label="Date"  changeMonth="true" changeYear="true" size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>
     <td><s:select name="form.supervisor" list="superList" id="i" cssClass="form-control form-group" label="Packed By" headerKey="-1" headerValue=" --Select-- " placeholder="Enter Supervisor name"/></td>
      <s:hidden value="%{status}" id="check1" />
      
      </table> 
         <br/>
    <div class="form-group">
        <div class="col-sm-6 text-center" >
         <center>
         <s:submit id="goButton" value="Go" cssClass="btn btn-primary" align="right" onchange="validateform()"></s:submit>
         </center>
         </div>
            </s:form>
      
      
      
     <s:form action="insertPacking" enctype="multipart/form-data" method="post" onsubmit="return validateForm()">     
      <div class="col-sm-12 text-center"><h3>Packing Data</h3></div>
                                  
        <div class="tab1">
        <table class="table table-bordered table-responsive" id="one1">
        <tr>
      <th>Count No</th>
      <th>Count</th>
      <th>Type of Packing</th>
      <th>Weight</th>
      <th>Opening Stock</th>
      <th>Number of Packed Items</th>
      <th>Dispatch</th>
      <th>Closing</th>
       </tr>
       <s:hidden name="id" value="%{id}" />
   <tr>
   <td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  
   <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Pack type" /></td>
   <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{cClose}" id="valu1" cssClass="form-control price"  placeholder="Enter Opening Stock"  theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr>
            
    <tr>
    <td><s:textfield name="form.count1" cssClass="form-control" value="12" theme="simple" readonly="true"></s:textfield></td>  
    <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
    <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td> 
    <td><s:textfield name="form.open" id="valu2" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.pack" id="digit2" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.dis" id="exp2" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.close" id="data2" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing2()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
    </tr>
    
   <tr>
   <td><s:textfield name="form.count1" cssClass="form-control" value="32" theme="simple" readonly="true"></s:textfield></td>  
   <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
   <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>  
   <td><s:textfield name="form.open" id="valu3" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter  Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" id="digit3" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp3" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" id="data3" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing3()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr> 
   
     <tr>
   <td><s:textfield name="form.count1" cssClass="form-control" value="15.5" theme="simple" readonly="true"></s:textfield></td>  
  <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
  <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>   
   <td><s:textfield name="form.open" id="valu4" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" id="digit4" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp4" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" id="data4" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing4()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
    </tr>
    
      <tr>
  <td><s:textfield name="form.count1" cssClass="form-control" value="16bx" theme="simple" readonly="true"></s:textfield></td>  
  <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
  <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
  <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>   
  <td><s:textfield name="form.open" id="valu5" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
  <td><s:textfield name="form.pack" id="digit5" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp5" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" id="data5" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing5()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr>  
   
    <tr>
   <td><s:textfield name="form.count1" cssClass="form-control" value="16bg" theme="simple" readonly="true"></s:textfield></td>  
  <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
    <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td> 
   <td><s:textfield name="form.open" id="valu6" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" id="digit6" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp6" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
  <td><s:textfield name="form.close" id="data6" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing6()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
    </tr>
    
     <tr>
  <td><s:textfield name="form.count1" cssClass="form-control" value="19.5" theme="simple" readonly="true"></s:textfield></td>  
  <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
  <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
  <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>   
  <td><s:textfield name="form.open" id="valu7" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" id="digit7" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp7" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter  Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" id="data7" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing7()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr>
   
   
     <tr>
   <td><s:textfield name="form.count1" cssClass="form-control" value="20" theme="simple" readonly="true"></s:textfield></td>  
  <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Pack type"/></td>
   <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>  
   <td><s:textfield name="form.open" id="valu8" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" id="digit8" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp8" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
  <td><s:textfield name="form.close" id="data8" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing8()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr>
   
   
      <tr>
   <td><s:textfield name="form.count1" cssClass="form-control" value="21" theme="simple" readonly="true"></s:textfield></td>  
 <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
 <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>    
   <td><s:textfield name="form.open" id="valu9" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" id="digit9" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.dis" id="exp9" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" id="data9" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing9()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
    </tr>
    
      <tr>
    <td><s:textfield name="form.count1" cssClass="form-control" value="22" theme="simple" readonly="true"></s:textfield></td>  
   <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
  <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>   
    <td><s:textfield name="form.open" id="valu10" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.pack" id="digit10" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.dis" id="exp10" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
  <td><s:textfield name="form.close" id="data10" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing10()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr>
   
     <tr>
  <td><s:textfield name="form.count1" cssClass="form-control" value="24" theme="simple" readonly="true"></s:textfield></td>  
     <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Count"/></td>
  <td><s:select list="{'Bag','Box'}" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple"  headerKey="" headerValue="Enter Pack type"/></td>
 <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>    
  <td><s:textfield name="form.open" id="valu11" onkeypress="return isNumberKey(this,event)" value="%{cClose}" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
  <td><s:textfield name="form.pack" id="digit11" onkeypress="return isNumberKey(this,event)" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
  <td><s:textfield name="form.dis" id="exp11" onkeypress="return isNumberKey(this,event)" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.close" id="data11" onkeypress="return isNumberKey(this,event)" onmousemove="javascript:closing11()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
   </tr>
   
    <tr>
        <td colspan="4" class="text-center"><b>Total Production</b></td>  
   
   <td><s:textfield name="form.totalOpeningStock" id="totalPrice1" cssClass="form-control"  placeholder="Enter Opening Stock" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalPackedBags" id="totalPrice2" cssClass="form-control"  placeholder="Enter Packed Bags" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalDispatch" id="totalPrice3" cssClass="form-control"  placeholder="Enter Dispatch" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalDisclose"  id="totalPrice4" cssClass="form-control"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>
    </tr>
                                    
   </table>
                                    
    <br/><br/>
                             
    
    <div class="form-group">
      <div class="col-sm-6 text-center" id="two">
          <s:submit label="Update" cssClass="btn btn-primary" align="center"></s:submit> 
     
    </div>
      <div class="col-sm-6 text-center">
         <button type="reset" class="btn btn-primary" >Cancel</button>
           </div>
</div>
          
                    </s:form>
                                     
                    </center>
                </div>
     </div>
         
            <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
function validateForm() {
       var x=$("#totalPrice1").val();
        var y=$("#totalPrice2").val();
         var z=$("#totalPrice3").val();
        var a=$("#totalPrice4").val();
      
   if((x==='0'||y==='0'||z==='0'||a==='0')||(($("#totalPrice1").val()).length===0 ||($("#totalPrice2").val()).length===0||($("#totalPrice3").val()).length===0)||($("#totalPrice3").val()).length===0){
        alert("Please fill Packing Material Data");
        return false;
    }
    abc();
    def();
    ghi();
    jkl();
    closing1();
    closing2();
    closing3();
    closing4();
    closing5();
    closing6();
    closing7();
    closing8();
    closing9();
    closing10();
    closing11();
    
}
    $(document).ready(function () {
        yourFunction();
    });
function yourFunction(){
    var x=parseFloat(document.getElementById("check1").value);
 if(x===12345||isNaN(x)){
     $("#one1").find("input,button,textarea,select").attr("disabled", "disabled");
     $("#two").find("input,button,textarea,select").attr("disabled", "disabled");
    
 }
 else{
     $("#goButton").hide();
      $("#part1").find("input,button,textarea,select").attr("disabled", "disabled");
 }
}

</script>
    
    <script language="javascript">
        function abc(){
            var sum = 0;
      $('.price').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice1').val(sum);
 }
        $('.price').mousemove(function () {
     var sum = 0;
      $('.price').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice1').val(sum);
});
 function def(){
       var sum = 0;
     $('.price2').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice2').val(sum);
 }
 
    $('.price2').mousemove(function () {
     var sum = 0;
     $('.price2').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice2').val(sum);
});
function ghi(){
     var sum = 0;
      $('.price3').each(function() {
        sum += Number($(this).val());
    });
     $('#totalPrice3').val(sum);
}
$('.price3').mousemove(function () {
    var sum = 0;
      $('.price3').each(function() {
        sum += Number($(this).val());
    });
     $('#totalPrice3').val(sum);
});   
function jkl(){
     var sum = 0;
    $('.price4').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice4').val(sum);
}
$('.price4').mousemove(function () {
     var sum = 0;
    $('.price4').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice4').val(sum);
     
});  
  var content = $('#valu1').val();
         $('#valu1').keyup(function() { 
        if ($('#valu1').val() !== content) {
            closing1();
                   }
       });
       var content = $('#digit1').val();
         $('#digit1').keyup(function() { 
        if ($('#digit1').val() !== content) {
            closing1();
                   }
       });
       var content = $('#exp1').val();
         $('#exp1').keyup(function() { 
        if ($('#exp1').val() !== content) {
            closing1();
                   }
       });
      

 function closing1(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu1").value);
                    var y = parseFloat(document.getElementById("digit1").value);
                    var a = parseFloat(document.getElementById("exp1").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data1");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                }  
    var content = $('#valu2').val();
         $('#valu2').keyup(function() { 
        if ($('#valu2').val() !== content) {
            closing2();
                   }
       });
       var content = $('#digit2').val();
         $('#digit2').keyup(function() { 
        if ($('#digit2').val() !== content) {
            closing2();
                   }
       });
       var content = $('#exp2').val();
         $('#exp2').keyup(function() { 
        if ($('#exp2').val() !== content) {
            closing2();
                   }
       });
       
      function closing2(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu2").value);
                    var y = parseFloat(document.getElementById("digit2").value);
                    var a = parseFloat(document.getElementById("exp2").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data2");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
   var content = $('#valu3').val();
         $('#valu3').keyup(function() { 
        if ($('#valu3').val() !== content) {
            closing3();
                   }
       });
       var content = $('#digit3').val();
         $('#digit3').keyup(function() { 
        if ($('#digit3').val() !== content) {
            closing3();
                   }
       });
       var content = $('#exp3').val();
         $('#exp3').keyup(function() { 
        if ($('#exp3').val() !== content) {
            closing3();
                   }
       });
       
               function closing3(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu3").value);
                    var y = parseFloat(document.getElementById("digit3").value);
                    var a = parseFloat(document.getElementById("exp3").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data3");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                }  
      var content = $('#valu4').val();
         $('#valu4').keyup(function() { 
        if ($('#valu4').val() !== content) {
            closing4();
                   }
       });
       var content = $('#digit4').val();
         $('#digit4').keyup(function() { 
        if ($('#digit4').val() !== content) {
            closing4();
                   }
       });
       var content = $('#exp4').val();
         $('#exp4').keyup(function() { 
        if ($('#exp4').val() !== content) {
            closing4();
                   }
       });
                function closing4(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu4").value);
                    var y = parseFloat(document.getElementById("digit4").value);
                    var a = parseFloat(document.getElementById("exp4").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data4");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
                         
       var content = $('#valu5').val();
         $('#valu5').keyup(function() { 
        if ($('#valu5').val() !== content) {
            closing5();
                   }
       });
       var content = $('#digit5').val();
         $('#digit5').keyup(function() { 
        if ($('#digit5').val() !== content) {
            closing5();
                   }
       });
       var content = $('#exp5').val();
         $('#exp5').keyup(function() { 
        if ($('#exp5').val() !== content) {
            closing5();
                   }
       });
                function closing5(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu5").value);
                    var y = parseFloat(document.getElementById("digit5").value);
                    var a = parseFloat(document.getElementById("exp5").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data5");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                }
               var content = $('#valu6').val();
         $('#valu6').keyup(function() { 
        if ($('#valu6').val() !== content) {
            closing6();
                   }
       });
       var content = $('#digit6').val();
         $('#digit6').keyup(function() { 
        if ($('#digit6').val() !== content) {
            closing6();
                   }
       });
       var content = $('#exp6').val();
         $('#exp6').keyup(function() { 
        if ($('#exp6').val() !== content) {
            closing6();
                   }
       });
       
                function closing6(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu6").value);
                    var y = parseFloat(document.getElementById("digit6").value);
                    var a = parseFloat(document.getElementById("exp6").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data6");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
               var content = $('#valu7').val();
         $('#valu7').keyup(function() { 
        if ($('#valu7').val() !== content) {
            closing7();
                   }
       });
       var content = $('#digit7').val();
         $('#digit7').keyup(function() { 
        if ($('#digit7').val() !== content) {
            closing7();
                   }
       });
       var content = $('#exp7').val();
         $('#exp7').keyup(function() { 
        if ($('#exp7').val() !== content) {
            closing7();
                   }
       });      
                function closing7(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu7").value);
                    var y = parseFloat(document.getElementById("digit7").value);
                    var a = parseFloat(document.getElementById("exp7").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data7");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
                 
 var content = $('#valu8').val();
         $('#valu8').keyup(function() { 
        if ($('#valu8').val() !== content) {
            closing8();
                   }
       });
       var content = $('#digit8').val();
         $('#digit8').keyup(function() { 
        if ($('#digit8').val() !== content) {
            closing8();
                   }
       });
       var content = $('#exp8').val();
         $('#exp8').keyup(function() { 
        if ($('#exp8').val() !== content) {
            closing8();
                   }
       });     
                 function closing8(){
   
                   var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu8").value);
                    var y = parseFloat(document.getElementById("digit8").value);
                    var a = parseFloat(document.getElementById("exp8").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                   
                        sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data8");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
                var content = $('#valu9').val();
         $('#valu9').keyup(function() { 
        if ($('#valu9').val() !== content) {
            closing9();
                   }
       });
       var content = $('#digit9').val();
         $('#digit9').keyup(function() { 
        if ($('#digit9').val() !== content) {
            closing9();
                   }
       });
       var content = $('#exp9').val();
         $('#exp9').keyup(function() { 
        if ($('#exp9').val() !== content) {
            closing9();
                   }
       });  
                 function closing9(){
                      var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu9").value);
                    var y = parseFloat(document.getElementById("digit9").value);
                    var a = parseFloat(document.getElementById("exp9").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                    sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data9");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
                 var content = $('#valu10').val();
         $('#valu10').keyup(function() { 
        if ($('#valu10').val() !== content) {
            closing10();
                   }
       });
       var content = $('#digit10').val();
         $('#digit10').keyup(function() { 
        if ($('#digit10').val() !== content) {
            closing10();
                   }
       });
       var content = $('#exp10').val();
         $('#exp10').keyup(function() { 
        if ($('#exp10').val() !== content) {
            closing10();
                   }
       });  
                     function closing10(){
                      var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu10").value);
                    var y = parseFloat(document.getElementById("digit10").value);
                    var a = parseFloat(document.getElementById("exp10").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                    sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data10");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
                  var content = $('#valu11').val();
         $('#valu11').keyup(function() { 
        if ($('#valu11').val() !== content) {
            closing11();
                   }
       });
       var content = $('#digit11').val();
         $('#digit11').keyup(function() { 
        if ($('#digit11').val() !== content) {
            closing11();
                   }
       });
       var content = $('#exp11').val();
         $('#exp11').keyup(function() { 
        if ($('#exp11').val() !== content) {
            closing11();
                   }
       });  
                 function closing11(){
                      var sum = 0;
                    var n;
                    var x = parseFloat(document.getElementById("valu11").value);
                    var y = parseFloat(document.getElementById("digit11").value);
                    var a = parseFloat(document.getElementById("exp11").value);
                    if(isNaN(x))
                        x=0;
                    if(isNaN(y))
                        y=0;
                    if(isNaN(a))
                        a=0;
                    sum = (x+y)-a;
                   //n = sum.toFixed(3);
                   n=Math.round(sum);
                    var z = document.getElementById("data11");
                    if (isNaN(n))
                        n = 0;
                    z.value =n;
                } 
                
                
     
                </script>
                
                
                
                
    
     </body>
</html>
