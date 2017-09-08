<%-- 
    Document   : PowerHome
    Created on : Dec 29, 2016, 1:19:55 PM
    Author     : ch.mounika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>
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
       <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <sj:head />
    <s:head />
    
    
     <SCRIPT language=Javascript>
                <!--
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

                function isDecimalKey(evt)
                {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                    if (key.length === 0)
                        return;
                    var regex = /^[0-9.,\b]+$/;
                    if (!regex.test(key)) {
                        theEvent.returnValue = false;
                        if (theEvent.preventDefault)
                            theEvent.preventDefault();
                    }
                }



                //-->
            </SCRIPT>   

</head>

<body style="background-color: #EEEEEE">
      <style type="text/css">
            label[for="i"] {
            color: black;
            font-family:sans-serif;
            font-style: normal;
            font-size: 11pt;
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

    <%-- <s:iterator value="ulist" var="myobj" >  
             <%@include file="Upperpage4.jsp" %>   --%>
    <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage4.jsp" %>
                    </s:if>
               
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Power Update</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">
 <div class="clear">&#x00A0;</div>
 <s:form action="updatePower">
     <s:iterator value="list">
    <table id="part1">
        <tr>
            <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield id="i"  name="form.date" readonly="true" value="%{date1}" cssClass="form-control form-group"   changeMonth="true" changeYear="true" label="Date"  placeholder="Enter Purchase date (dd-mm-yyyy)" displayFormat="dd-mm-yy" size="90" /> </td>
         <td><s:textfield id="i" name="form.superviser" label="Supervisor" readonly="true" value="%{superviser}"    cssClass="form-control form-group"   /></td> 
         <td><s:textfield id="i" name="form.shifts" label="Select Shift" value="%{shifts}" readonly="true" onchange="findval(this.value)"  cssClass="form-control form-group"  /></td>
           <s:hidden value="%{status}" id="check1" />
 </tr>
    </table>
    
   
           

      <div class="col-lg-12 text-center"><h3>M.V Pannel Units</h3></div>
      <s:hidden name="id" value="%{id}"/>
      <s:hidden name="ide" value="%{ide}"/> 
    <table  id="one1">
    <tr>
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{blowRoom}" name="form.blowRoom" label="BLOW ROOM" placeholder="Enter No. of Bales" size="90" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{wrs}" name="form.wrs" label="WRS" placeholder="Enter WRS" cssClass="form-control form-group price" ></s:textfield></td>
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{prep}" name="form.prep" label="PREP" placeholder="Enter PREP" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{oe1}" name="form.oe1" label="OE-1" placeholder="Enter OE-1" cssClass="form-control form-group  price"></s:textfield></td> 
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{oe2}" name="form.oe2" label="OE-2" placeholder="Enter OE-2" cssClass="form-control form-group price" ></s:textfield></td> 
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{oe3}" name="form.oe3" label="OE-3" placeholder="Enter OE-3" cssClass="form-control form-group price" ></s:textfield></td>   
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{oe4}" name="form.oe4" label="OE-4" placeholder="Enter OE-4" cssClass="form-control form-group  price" ></s:textfield></td> 
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{oe5}" name="form.oe5" label="OE-5" placeholder="Enter OE-5" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{oe6}" name="form.oe6" label="OE-6" placeholder="Enter OE-6" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{hmPlant}" name="form.hmPlant" label="H.M. PLANT" placeholder="Enter H.M. PLANT" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{compressor}" name="form.compressor" label="COMPRESSER" placeholder="Enter COMPRESSER" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{lighting}" name="form.lighting" label="LIGHTING" placeholder="Enter LIGHTING" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{roPlant}" name="form.roPlant" label="R.O.PLANT" placeholder="Enter R.O.PLANT" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{ycp}" name="form.ycp" label="YCP" placeholder="Enter YCP" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{balePress}" name="form.balePress" label="BALE PRESS" placeholder="Enter BALE PRESS" cssClass="form-control form-group price" ></s:textfield></td> 
     <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{fireDump}" name="form.fireDump" label="FIRE SUMP" placeholder="Enter FIRE SUMP" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" value="%{preCleaning}" name="form.preCleaning" label="PRE CLEANING" placeholder="Enter PRE CLEANING" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="totalPrice1" onkeypress="return isNumberKey(this,event)" value="%{total}" name="form.total" label="TOTAL" placeholder="TOTAL" cssClass="form-control form-group" ></s:textfield></td> 
     </tr>
    </table>
      </s:iterator>
 
 
         <div class="form-group">
      <div class="col-sm-6 col-xs-6 text-center" id="two">
        <button  type="submit" class="btn btn-primary">Submit</button>
      </div>
      <div class="col-sm-6 col-xs-6 text-center">
        <button type="reset" class="btn btn-primary" onClick="window.location.reload()">Cancel</button>
      </div>
    </div>
</s:form>
 </center>
    </s:iterator>


       </div>
        <!-- /.row -->
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-6 text-center">
                    <p>Copyright &copy; Sri Mouli Textiles Private Limited 2017</p>
                </div>
                <div class="col-lg-6 text-center">
                    <p>Design &#x0026; Developed by <a href="http://www.nivriticloudsolutions.com/">Nivriti Solutions Global Pvt. Ltd.</a></p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
    </div>
    <!-- /.container -->

    <script type="text/javascript">

  function findval(item) {
                    name = item;
                }

    $(document).ready(function () {
        yourFunction();
    });
 
  $('.price').keyup(function () {
 
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




</script>

    
    
    
    
    
</body>
</html>
