<%-- 
    Document   : sendemail
    Created on : Jan 3, 2017, 10:57:56 AM
    Author     : nsg
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Struts2 - Send Email</title>
</head>
<body>
<s:if test="hasActionErrors()">
<s:actionerror />
</s:if>
<s:if test="hasActionMessages()">
<s:actionmessage />
</s:if>
<s:form action="sendEmail" method="post" enctype="multipart/form-data">
    <s:head/>   
<s:textfield label="From Address" name="emailFromAddress"></s:textfield>
<s:password label="Password" name="password"></s:password>
<s:textfield label="To Address" name="emailToAddress"></s:textfield>
<s:textfield label="Cc" name="emailCc"></s:textfield>  
<s:textfield label="Subject" name="emailSubject"></s:textfield>
<s:textarea label="Body" name="emailBody" rows="5" cols="50"></s:textarea>
<s:file label="File" name="file" multiple="multiple"></s:file>
<s:submit value="Send Email"></s:submit>
</s:form>
</body>
</html>