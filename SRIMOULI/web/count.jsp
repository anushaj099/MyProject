<%-- 
    Document   : count
    Created on : Dec 21, 2016, 3:27:13 PM
    Author     : nsg
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">

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
  <!-- jQuery -->
    <script src="js/jquery.js"></script>
 <script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
   
     
      
       <SCRIPT language=Javascript>
      function isDecimalKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                    var regex = /^[0-9]+$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }
       </script>
</head>

<body style="background-color: #EEEEEE">

      <style type="text/css">
            label[for="i"] {
            color: black;
            font-size: 11pt;
            padding-bottom: 10px;
            font-style: normal;}    
            input[type="radio"]{
                width: 25px;
                margin-left: 10px;
            }
            input[type="checkbox"]{
                width: 25px;
                    margin-left: 10px;
            }
        </style>
        <script>
            
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
            
            
        var frm = document.querySelector('form.classesName');
var inputs = frm.querySelectorAll('input[type=text]');

frm.addEventListener('submit', function(e) {
    e.preventDefault();
    var classArr = [];

    for(var i = 0; i < inputs.length; i++) {
        if(classArr.indexOf(inputs[i].value) != -1) {
            inputs[i].style.backgroundColor = "red";
            return false;
        }
        else
            classArr.push(inputs[i].value);
    }
    frm.submit();
});
</script>
         <s:iterator value="ulist" var="myobj" >   
             <%@include file="Upperpage.jsp" %>         
             <div class="container">    
                 
                           <button type="button" class="btn btn-primary" ><a href="viewCount?id=<s:property value="id"/>" style="text-decoration:none; color:white">Click here to Edit,Delete</a></button>
  <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited  Count value Form</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">

 <div class="clear">&#x00A0;</div>
     <s:form action="counts"  enctype="multipart/form-data" >          
    <table>
        <tr>
      
        <td><s:hidden name="id" value="%{id}" /></td>  
         <%--<td><s:textfield id="i" name="l.name" label="Enter Supervisor name " placeholder="Enter Superviser name" cssClass="form-control form-group" size="90" ></s:textfield></td> --%>           
        <td><s:textfield id="i" name="l.count" label="Enter count value " onkeypress="return isDecimalKey(event)" placeholder="Enter count value" cssClass="form-control form-group" size="90" autofocus="autofocus"></s:textfield></td>        
        <td><s:textfield id="i" name="l.openStock" label="Enter Openening Stock(If any) " onkeypress="return isNumberKey(this,event)" placeholder="Enter Opening stock" cssClass="form-control form-group" size="90" ></s:textfield></td>
        </tr>
    </table>
        <br/><br/>
          <div class="form-group">
      <s:if test="year.isEmpty()">
      <div class="col-sm-6 col-xs-6 text-center">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
      </s:if>
          <s:else>
              <div class="col-sm-6 col-xs-6 text-center">
                  <button disabled type="submit" class="btn btn-primary">Submit</button>
      </div> 
          </s:else>

      <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
      
    </div>
     </s:form>
        </s:iterator>  
        </center>
    </div>
            
            <br><br> 
         <%--  <s:form action="rt">
               <s:submit value="View Count Data" cssClass="btn btn-primary" align="left"/>
            </s:form> --%>
            
            <br>
            <br>

    <!-- /.container -->

</body>
</html>