<%-- 
    Document   : ReadyMixplant
    Created on : Jun 29, 2017, 12:34:34 PM
    Author     : ch.mounika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1" style="border-collapse: collapse; width: 1em;">
      <tr>
          <th rowspan="2">S.No</th>
         <th rowspan="2">Description of Goods</th>
          <th rowspan="2">HSN Code(GST)</th>
         <th rowspan="2">Qty</th>
          <th rowspan="2"> UOM</th>
           <th rowspan="2">Rate</th>
           <th rowspan="2">Total</th>
           <th rowspan="2">Discount</th>
          <th rowspan="2">Taxable value</th>
          <th colspan="2"> CGST </th> 
         <th colspan="2" >SGST</th>
        <th colspan="2">IGST</th>
     </tr>
       <tr>
         <th>Rate </th>
          <th>Amount </th>
         <th>Rate </th>
          <th>Amount </th>
      <th>Rate </th>
          <th>Amount </th>
</tr>
     
   
   <tr>
        <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
        <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       
   </tr>
   <tr>
        <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
        <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       <td><s:textfield value="%{openEnd}" name="oe.openEnd" cssClass="form-control"  theme="simple"></s:textfield></td>
        <td><s:textfield value="%{empId}" id="emp" name="oe.empId" cssClass="form-control"  theme="simple"></s:textfield></td>  
       
   </tr>
        </table>
    </body>
</html>
