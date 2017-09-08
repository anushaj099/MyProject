<%-- 
    Document   : newjsp
    Created on : May 20, 2017, 4:23:06 PM
    Author     : Masrat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>










<!--
<div class="tab1">
<table class="table table-bordered table-responsive packing1 weight-table" id="one1">
  <tr>
<th>Count No</th>
       <th>Count</th>
       <th>Type of Packing</th>
       <th>Packing Weight</th>
       <th>Opening Stock</th>
       <th>Packed Bags</th>
       <th>Number Of Kgs Packed</th>
<%-- <th>Closing</th>--%>
  </tr>
       
   <%--<s:hidden name="id" value="%{id}" />--%>

   <s:if test="%{openingstocklist.isEmpty()}">
       <% int x=2;%>
<% for(int i=0;i<3;i++) {%>         
       <%--<s:hidden name="id" value="%{id}" />--%>
   <tr>
   <td><s:select list="countlist" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control count" theme="simple" headerKey="" headerValue="Enter Count"/></td>
   <td><s:select list="{'Bag','Box'}"  id="tri" name="form.boxtype" onchange="findval(this.value)" cssClass="form-control" theme="simple" headerKey="" headerValue="Enter Pack type" /></td>
   <%--<s:set name="gayathri" value="%{tri}"/>--%>
   <%--<s:if test="%{boxtype.equals('Bag'}"> --%>
   <td><s:select list="weightlist" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" theme="simple" headerKey="" headerValue="Enter Weight"/></td>
   <%--</s:if>
   
   <s:else>
   <td><s:select list="weightlist1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" headerKey="" headerValue="Enter Weight"/></td>
   </s:else>--%>
   <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" id="valu1" cssClass="form-control price"  placeholder="Enter Opening Stock"  theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2"  placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
   </tr>
       <% } %>  
</table>
<table class="table table-bordered table-responsive weight-table">
   <tr>
   <td style="width: 480px" class="text-center"><b>Total Production</b></td>  
   <td><s:textfield name="form.totalOpeningStock" id="totalPrice1" cssClass="form-control"  placeholder="Enter Opening Stock" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalPackedBags" id="totalPrice2" cssClass="form-control"  placeholder="Enter Packed Bags" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalNoofkgsPacked" id="totalPrice3" cssClass="form-control"  placeholder="Enter Dispatch" readonly="true" theme="simple"></s:textfield></td>
<!--<td><s:textfield name="form.totalDisclose"  id="totalPrice4" cssClass="form-control"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>-->
   </tr>
</table>
   </s:if>
   <s:else>
    
         <s:iterator value="list11">
      <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" theme="simple" value="%{boxType}"  headerKey="" headerValue="Enter Box Type" /></td>
    
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"   placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>
   <s:iterator value="list1">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}"  theme="simple" headerKey="" headerValue="Enter Box Type" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two" theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>
   <s:iterator value="list2">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="Enter Box Type" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="Enter Weight"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>
   <s:iterator value="list3">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>
   <s:iterator value="list4">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>
   <s:iterator value="list5">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>  
   <s:iterator value="list6">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>  
   <s:iterator value="list7">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>  
   <s:iterator value="list8">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>  
   <s:iterator value="list9">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator>  
   <s:iterator value="list10">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator> 
   <s:iterator value="list12">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator> 
   <s:iterator value="list13">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}"  theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator> 
   <s:iterator value="list14">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator> 
   <s:iterator value="list15">
   <tr>
<%--<td><s:textfield name="form.count1" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="10" theme="simple" readonly="true"></s:textfield></td>  --%>
    <td><s:select list="countlist" id="emp" name="form.countdb" onkeypress="return isNumberKey(this,event)" cssClass="form-control" value="%{countDb}" theme="simple" headerKey="" headerValue="Enter Count"/></td>
    <td><s:select list="{'Bag','Box'}" id="a1" name="form.boxtype" onkeypress="return isNumberKey(this,event)" cssClass="form-control one" value="%{boxType}" theme="simple" headerKey="" headerValue="%{boxType}" /></td>
    <td><s:select list="weightlist" id="b1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" value="%{weight}" headerKey="" headerValue="%{weight}"/></td>
    <td><s:textfield name="form.open" onkeypress="return isNumberKey(this,event)" value="%{disclose}" id="valu1" cssClass="form-control price three"  placeholder="Enter Opening Stock"  theme="simple" ></s:textfield></td>
    <td><s:textfield name="form.pack" onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2 four"  placeholder="Enter Packed Bags" theme="simple"></s:textfield></td>
    <td><s:textfield name="form.noofKgsPacked" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3 five"  placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
<%--<td><s:textfield name="form.close" onkeypress="return isNumberKey(this,event)" id="data1" onmousemove="javascript:closing1()" cssClass="form-control price4"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>--%>
   </tr>
   </s:iterator> 
   
</table>
-->