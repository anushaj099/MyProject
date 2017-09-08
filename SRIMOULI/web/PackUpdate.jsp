<%-- 
    Document   : PackUpdate
    Created on : Dec 28, 2016, 12:30:07 PM
    Author     : ch.mounika
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
         
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>
<SCRIPT language="javascript">
  function addRow(one1) {
   var table = document.getElementById(one1);

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
                      
   var colCount = table.rows[0].cells.length;
                      //   alert(colCount);
   for(var i=0; i<colCount; i++) {

    var newcell = row.insertCell(i);

    newcell.innerHTML = table.rows[1].cells[i].innerHTML;
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
                        
                        
  }
  function myFunction()
{
   
    $('#one1').find('input, textarea, button, select').attr("disabled", "disabled");
   // alert("Page is loaded");
}
 
    </SCRIPT> 

            <sj:head/>
            <s:head/>
         
    </head>
    <body style="background-color: #EEEEEE" onload="myFunction()">
      <%--  <s:iterator var="myobj" value="ulist">
<%@include  file="Upperpage4.jsp" %>  --%>
        <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
                        
            <%@include file="Upperpage4.jsp" %>
           
                    </s:if>
               
     <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Packing Update</h1>
                    </div>
    </div>
     <!-- /.row -->

    <!-- Projects Row -->
    <div class="row">
     <center>
       <%--   <s:iterator value="list">
             <s:textfield value="%{openingStock}"/>
         </s:iterator> --%>
         
       <s:form action="packUpdate" method="post" class="form-horizontal" onsubmit="return updateAll()">
          
     <table>
        <s:iterator value="ppList">
    <td><s:hidden name="form.id" value="%{id}" /></td>
    <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield readonly="true" displayFormat="dd-mm-yy" id="i" name="form.date" value="%{date1}"  label="Date "  size="90"  cssClass="form-control" /> </td>
  <%--  <td><sj:datepicker  name="form.date" value="%{date}" id="i" readonly="true" changeMonth="true" changeYear="true" label="Date"  size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>--%>
    <td><s:textfield name="form.supervisor" value="%{supervisor}"  list="superList" readonly="true" id="i" cssClass="form-control form-group" label="Packer Name" /></td>
     </s:iterator>
      </table>
     
      <div class="col-sm-12 text-center"><h3>Packing Data</h3></div>
           <table id="two1">
               <tr><td align="left"><input disabled type="button" value="Add Row"  class="btn btn-primary" onclick="addRow('one1')" onkeyup="myFunction()"/>   
        </td></tr>
    </table>                       
        <div class="tab1">
            <table class="table table-bordered table-responsive weight-table" id="one1">
        <tr>
<!--      <th>Count No</th>-->
      <th>Count</th>
      <th>Type of Packing</th>
      <th>Bag Weight</th>
      <th>Box Weight</th>
      <th>Opening Stock</th>
      <th>Packed Bags</th>
      <th>Number of kgs packed</th>
<!--      <th>Closing</th>-->
       </tr>
       <s:iterator value="list11">
        <s:hidden name="form.idpq" value="%{idpq}" />
    <tr>
   <%--<td><s:textfield name="form.count1" value="%{count}" cssClass="form-control"  theme="simple" readonly="true"></s:textfield></td> --%>
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" value="%{openingStock}" readonly="true" id="valu1" cssClass="form-control price"  placeholder="Enter Opening Stock"  theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit1" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked"  value="%{noofKgsPacked}" readonly="true" id="exp1" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <%--<td><s:textfield name="form.close" value="%{disclose}" id="data1" readonly="true" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>--%>
   </tr>
    </s:iterator>
    <s:iterator value="list1">
  <tr>
   <%--<td><s:textfield name="form.count1" cssClass="form-control" value="%{count}" theme="simple" readonly="true"></s:textfield></td> --%> 
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu2" value="%{openingStock}" readonly="true"  cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit2" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp2" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
   <%--<td><s:textfield name="form.close" value="%{disclose}" id="data2" readonly="true" onmousemove="javascript:closing2()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>--%>
    </tr>
    </s:iterator>
    <s:iterator value="list2">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"   value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType"  /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
  <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu3" value="%{openingStock}" readonly="true"  cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit3" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp3" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<%--   <td><s:textfield name="form.close" value="%{disclose}" id="data3" readonly="true" onmousemove="javascript:closing3()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>
    <s:iterator value="list3">
   <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType"  /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu4" value="%{openingStock}" readonly="true"  cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit4" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp4" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data4" readonly="true" onmousemove="javascript:closing4()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
    </tr>
    </s:iterator>
    <s:iterator value="list4">
   <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <<td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType"  /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two" theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu5" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit5" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp5" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data5" readonly="true" onmousemove="javascript:closing5()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
    <s:iterator value="list5">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu6" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit6" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp6" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data6" readonly="true" onmousemove="javascript:closing6()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
    </tr>
    </s:iterator>
    <s:iterator value="list6">
  <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
  <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu7" value="%{openingStock}"  readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit7" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp7" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data7" readonly="true" onmousemove="javascript:closing7()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
    <s:iterator value="list7">
  <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control" theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu8" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit8" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp8" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data8" readonly="true" onmousemove="javascript:closing8()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
    <s:iterator value="list8">
   <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu9" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit9" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp9" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data9" readonly="true" onmousemove="javascript:closing9()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
    </tr>
    </s:iterator>
    <s:iterator value="list9">
   <tr>
<!--    <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
   <td><s:textfield  name="form.countdb" id="cout"   onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{countDb}" readonly="true"/></td>
   <td><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType"  /></td>
   <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
  <td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu10" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit10" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp10" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data10" readonly="true" onmousemove="javascript:closing10()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
    <s:iterator value="list10">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
        <td style="width: 8em"><s:textfield  name="form.countdb" onkeypress="return isNumberKey(this,event)"  id="cout" cssClass="form-control"  theme="simple" value="%{countDb}"/></td>
   <td style="width: 8em"><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td style="width: 8em"><s:select list="weightlist" id="eeee" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td style="width: 8em"><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu11" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit11" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}"  readonly="true" id="exp11" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data11" readonly="true" onmousemove="javascript:closing11()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
    </s:iterator>
   <s:iterator value="list12">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"   value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
    <td style="width: 8em"><s:textfield  name="form.countdb" onkeypress="return isNumberKey(this,event)"  id="cout" cssClass="form-control"  theme="simple" value="%{countDb}"/></td>
   <td style="width: 8em"><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="" headerValue="Enter PackType" /></td>
   <td style="width: 8em"><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Select Weight"/></td>
   <td style="width: 8em"><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu11" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit11" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp11" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data11" readonly="true" onmousemove="javascript:closing11()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
   <s:iterator value="list13">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
     <td style="width: 8em"><s:textfield  name="form.countdb" onkeypress="return isNumberKey(this,event)"  id="cout" cssClass="form-control"  theme="simple" value="%{countDb}"/></td>
   <td style="width: 8em"><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="-1" headerValue="Enter PackType" /></td>
   <td style="width: 8em"><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="-1" headerValue="Select Weight"/></td>
   <td style="width: 8em"><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu11" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit11" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp11" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data11" readonly="true" onmousemove="javascript:closing11()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
   <s:iterator value="list14">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control"  value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
     <td style="width: 8em"><s:textfield  name="form.countdb" onkeypress="return isNumberKey(this,event)"  id="cout" cssClass="form-control"  theme="simple" value="%{countDb}"/></td>
   <td style="width: 8em"><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="-1" headerValue="Enter PackType" /></td>
   <td style="width: 8em"><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="-1" headerValue="Select Weight"/></td>
   <td style="width: 8em"><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu11" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit11" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp11" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data11" readonly="true" onmousemove="javascript:closing11()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
   <s:iterator value="list15">
    <tr>
<!--   <td><s:textfield name="form.count1" cssClass="form-control" value="%{count}" theme="simple" readonly="true"></s:textfield></td>  -->
     <td style="width: 8em"><s:textfield  name="form.countdb" onkeypress="return isNumberKey(this,event)"  id="cout" cssClass="form-control"  theme="simple" value="%{countDb}"/></td>
   <td style="width: 8em"><s:select list="{'Bag','Box'}" id="tri" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control"  theme="simple" value="%{boxType}" headerKey="-1" headerValue="Enter PackType" /></td>
   <td style="width: 8em"><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="-1" headerValue="Select Weight"/></td>
   <td style="width: 8em"><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
   <td><s:textfield name="form.open" id="valu11" value="%{openingStock}" readonly="true" cssClass="form-control price"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" value="%{packedBags}" id="digit11" cssClass="form-control price2"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" value="%{noofKgsPacked}" readonly="true" id="exp11" cssClass="form-control price3"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.close" value="%{disclose}" id="data11" readonly="true" onmousemove="javascript:closing11()" cssClass="form-control price4"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
   </tr>
   </s:iterator>
            </table>
   <table class="table table-bordered table-responsive weight-table" id="one1">
   <s:iterator value="ppList">
   <tr>
   <td style="width: 600px" class="text-center"><b>Total Production</b></td>  
   
   <td><s:textfield name="form.totalOpeningStock" readonly="true"  value="%{totalOpeningStock}" id="totalPrice1" cssClass="form-control"  placeholder="Enter Opening Stock" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalPackedBags" readonly="true" value="%{totalPackedBags}" id="totalPrice2" cssClass="form-control"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalNoofkgsPacked" readonly="true" value="%{totalNoofkgsPacked}" id="totalPrice3" cssClass="form-control"  placeholder="Enter Dispatch" theme="simple"></s:textfield></td>
<!--   <td><s:textfield name="form.totalDisclose" readonly="true" value="%{totalDisclose}" id="totalPrice4" cssClass="form-control"  placeholder="Enter Closing" theme="simple"></s:textfield></td>-->
    </tr>
   </s:iterator>                               
   </table>
                                    
    <br/><br/>
                             
    
     <div class="form-group">
                        <div class="col-sm-6 text-center">
                            <s:submit disabled="true" value="Update" cssClass="btn btn-primary" align="center"></s:submit> 

                            </div>
                           <div class="col-sm-6 text-center">
         <button type="reset" class="btn btn-primary" >Cancel</button>
           </div>
                    </div>

          
                    </s:form>
        </s:iterator>                 
                    </center>
                </div>
     </div>
  
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
 <script>
                 $(document).ready(function () {
                     $("#one1").find("input,button,textarea,select").attr("disabled", "disabled");
//    $('.weight-table tr').on('mousemove', function () {
//           
//      
//              $('.weight-table tr').each(function () {
//           
//          //       alert('box type isss'); 
//             var boxtype1=$(this).find("#tri option:selected").text();     
//              //  alert(boxtype1);
//                
//               if(boxtype1!=='Enter PackType' || boxtype1.length!==0)   {
//                   if(boxtype1.length!==0) {
//                      if(boxtype1==='Box') {
//                       
//                     $(this).find(".two").attr('disabled',true);
//                      $(this).find(".three").prop('disabled',false);
//                      $(this).find(".two").val("Enter Weight");
//                  
//                      }
//                    else if(boxtype1==='Bag'){
//                      $(this).find(".three").attr('disabled',true);
//                      $(this).find(".two").prop('disabled',false);
//                       $(this).find(".three").val("Enter Weight");
//            
//                      }   
//                 }
//               }
//              
//                                            });
//                                            return false;
//                                        });
                                    }); 
    
</script>
 
<!-- <script>
       $(document).ready(function () {
         
         //  alert('UUUUUUUUUUUUUUU');
            var n = 0;
           
              var a1=new Array();
             a1=<s:property value="countlist11"/>;
           //  alert(a1);
           alert(a1);
 
               var a2=new Array();
             a2 =<s:property value="stocklist"/>;
           alert(a2);
         
          var z=new Array();
                z=<s:property value="weightlistbf"/>;
             //    alert(z);
         
          //alert(cc[0]);
           
             $('.weight-table tr').on('mousemove', function () {
              $('.weight-table tr').each(function () {
                 var  counttt = $(this).find("#cout option:selected").val();
                 var cc=$(this).find("#cout option:selected").text();
                 
                 
               
                 
                 //  alert(boxtype1);
         //  alert(cc);
              
                 if(cc==='Select Count') {  
                // alert('PPPPP');
                   $(this).find('input.price').val(""); 
                           }
                
         
                 if(cc!=='Select Count') {
                    var vvv=parseInt(counttt);
                    var size=z.length;
                 //   alert(a1.length);
                  if(cc.length!==0)  {
                   //   alert(weight);
                    
                   
                   if(z.length===0) {
                   //   alert('LLLLLLLLLLLL');
                       var b1=new Array();
                   b1=<s:property value="countlist22"/>;
          
           
                  var b2=new Array();
                  b2=<s:property value="stocklist2"/>;
           
                 
                      
                        for(var i=0;i<b1.length;i++) {
                       
                     var a3=parseInt(b1[i]);
                     
                      var c1;
                     
                     if(z.length===0) {
                   //      alert('OOOOOOOOOOOOO');
                        c1=parseInt(b2[i]); 
                     }
                     else {
                        c1=parseInt(a2[i]); 
                    }    
                       var a4=parseFloat(c1);
                       var a5=parseFloat(a2[i]);
                       var count=parseInt(a1[i]);
                     //   alert(a3); alert(count); alert(a4); alert(a5);
                     //  alert(a4);
                         if(vvv.valueOf()===a3.valueOf() && vvv.valueOf()===count.valueOf()) {
                            
                            n=a4+a5;
                          // alert(a4);
                         //  alert(a5);
                              if (n !== "NaN") {
                                   $(this).find('input.price').val(n);
                                                } else {
                                  $(this).find('input.price').val("");
                                       }
                                    }
                            if(vvv.valueOf()===a3.valueOf() && vvv.valueOf()!==count.valueOf()) {
                            n=a4;
                          // alert(a4);
                              if (n !== "NaN") {
                                   $(this).find('input.price').val(n);
                                                } else {
                                  $(this).find('input.price').val("");
                                       }
                                    }        
                                    
                                    
                             } 
                    }
            else if(z.length!==0)
            {
           // alert('');
             //   alert('DDDDDDDD');
              // alert('UUUUUUUUUUUUU');
              
             for(var i=0;i<a1.length;i++) {
                       
                 //    var a3=parseInt(b1[i]);
                     
                  //    var c1;
                     
                     if(z.length===0) {
                   //      alert('OOOOOOOOOOOOO');
                        
                     }
                     else {
                        c1=parseInt(a2[i]); 
                    }    
                       var a4=parseFloat(c1);
                      
                       var count=parseInt(a1[i]);
                      
                      //  alert(count); 
                     //   alert(a4); 
                     //  alert(a4);
                         if(vvv.valueOf()===count.valueOf()) {
                          
                     //   alert(a4); 
                        
                            n=a4;
                       //     alert(n);
                          // alert(a4);
                         //  alert(a5);
                              if (n !== "NaN") {
                                   $(this).find('input.price').val(n);
                                                } 
                               else {
                                  $(this).find('input.price').val("");
                                       }
                                    }
                           
                                    
                             }
             
            }
                    
}
                     }
                     
                    
               
                             
                      
                                            });
                                            return false;
                                        });
                                    });
  </script>-->
  
  <script>
       $(document).ready(function () {
     //      alert('UUUUUUUUUUUUUUU');
            var n = 0;
             var a1=new Array();
             a1 =<s:property value="countlist11"/>;
 
            var a2=new Array();
           a2 =<s:property value="stocklist"/>;
           
             $('.weight-table tr').on('mousemove', function () {
              $('.weight-table tr').each(function () {
                 var  counttt = $(this).find("#eeee option:selected").val();
                 var  counttt1 = $(this).find("#eeee1 option:selected").val();
                // alert(counttt1);
                 var cc=$(this).find("#eeee option:selected").text();
                 var cc1=$(this).find("#eeee1 option:selected").text();
              //     alert(cc);
         //  alert(cc);
              if(cc1==='Enter Weight') {
                  
                 if(cc!=='Enter Weight' || cc.length!==0) {
                  //   alert('OOOOO');
                  if(cc.length!==0) {
                     var fields=counttt.split('=');
                // alert(fields[1]);  
                  var lr=fields[1];
                  
                  var y=$(this).find('.price2').val();
                   
                  var z=lr*y;
                                    
                    if (isNaN(z)) {
                         $(this).find('input.price3').val("");
                           } else {
                           $(this).find('input.price3').val(z);
                            }
                   
            }
                
               }         
                 else { 
             //    alert('iiiiiiiiiiiiii');
                   $(this).find('input.price3').val(""); 
                            } 
                             
        }
        else {
            
            if(cc1!=='Enter Weight' || cc1.length!==0) {
                  //   alert('OOOOO');
                  if(cc1.length!==0) {
                     var fields=counttt1.split('=');
                // alert(fields[1]);  
                  var lr=fields[1];
                  
                  var y=$(this).find('.price2').val();
                   
                  var z=lr*y;
                                    
                    if (isNaN(z)) {
                         $(this).find('input.price3').val("");
                           } else {
                           $(this).find('input.price3').val(z);
                            }
                   
            }
                
               }         
                 else { 
             //    alert('iiiiiiiiiiiiii');
                   $(this).find('input.price3').val(""); 
                            } 
        }
        
                                            });
                                            return false;
                                        });
                                    });
  </script>
  
    <script language="javascript">
        function updateAll(){
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
        $('.price').mouseenter(function () {
 
    // initialize the sum (total price) to zero
    var sum = 0;
     
    // we use jQuery each() to loop through all the textbox with 'price' class
    // and compute the sum for each loop
    $('.price').each(function() {
        sum += Number($(this).val());
    });
     
    // set the computed value to 'totalPrice' textbox
    $('#totalPrice1').val(sum);
     
});
 
    $('.price2').mouseenter(function () {
 
    // initialize the sum (total price) to zero
    var sum = 0;
     
    // we use jQuery each() to loop through all the textbox with 'price' class
    // and compute the sum for each loop
    $('.price2').each(function() {
        sum += Number($(this).val());
    });
     
    // set the computed value to 'totalPrice' textbox
    $('#totalPrice2').val(sum);
     
});
$('.price3').mouseenter(function () {
 
    // initialize the sum (total price) to zero
    var sum = 0;
     
    // we use jQuery each() to loop through all the textbox with 'price' class
    // and compute the sum for each loop
    $('.price3').each(function() {
        sum += Number($(this).val());
    });
     
    // set the computed value to 'totalPrice' textbox
    $('#totalPrice3').val(sum);
     
});   

$('.price4').mouseenter(function () {
 
    // initialize the sum (total price) to zero
    var sum = 0;
     
    // we use jQuery each() to loop through all the textbox with 'price' class
    // and compute the sum for each loop
    $('.price4').each(function() {
        sum += Number($(this).val());
    });
     
    // set the computed value to 'totalPrice' textbox
    $('#totalPrice4').val(sum);
     
});  
 function abc(){
            var sum = 0;
      $('.price').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice1').val(sum);
 }
 function def(){
       var sum = 0;
     $('.price2').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice2').val(sum);
 }
 function ghi(){
     var sum = 0;
      $('.price3').each(function() {
        sum += Number($(this).val());
    });
     $('#totalPrice3').val(sum);
}
function jkl(){
     var sum = 0;
    $('.price4').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice4').val(sum);
}

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
