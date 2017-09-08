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
                   
                if((evt.charCode>= 48 && evt.charCode <= 57) || evt.charCode=== 46 ||evt.charCode === 0){
                if(el.value.indexOf('.') > -1){
                if(evt.charCode=== 46)
                evt.preventDefault();
                }
                }else
                evt.preventDefault();
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
            <s:if test="%{dlist.size==2}">
                <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have one more shift to insert </marquee>
          </s:if>
          <s:elseif test="%{dlist.size==1}">
                <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have two more shifts to insert </marquee>
                </s:elseif>
                <s:else>
            <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property> and you have inserted all the shifts </marquee>
           </s:else>
        </s:if>
           <s:else>
           <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>
         </s:else>
      <%--   <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage2.jsp" %>         --%>
        <s:iterator value="ulist" status="stat" var="myobj"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage2.jsp" %>
                    </s:if>
               
       
      <style type="text/css">
            label[for="i"] {
            color: black;
            font-family:sans-serif;
            font-style: normal;
            font-size: 11pt;
            padding-bottom: 10px;}    
            
             label[for="totalPrice1"] {
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

   
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Sri Mouli Textiles Private Limited Power Data</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <center>
        <div class="row">
 <div class="clear">&#x00A0;</div>
 <s:form action="PowerInsert">
    <table id="part1">
        <tr>
            <s:hidden name="id" value="%{id}"/>
            <td><sj:datepicker id="i" name="form.date" maxDate="true" readonly="true" changeMonth="true" changeYear="true" label="Date"  placeholder="Enter Power date (dd-mm-yyyy)" displayFormat="dd-mm-yy" size="90" cssClass="lab"/> </td>
         <td><s:select id="i" name="form.superviser" label="Supervisor"  list="superList"   cssClass="form-control form-group"  headerKey="-1" headerValue="-- Select --" /></td> 
         <td><s:select id="i" name="form.shifts" label="Select Shift" onchange="findval(this.value)" list="{'Shift 1','Shift 2','Shift 3'}"  cssClass="form-control form-group"  headerKey="-1" headerValue="-- Select Shift --"/></td>
           <s:hidden value="%{status}" id="check1" />
 </tr>
    </table>
    <br/>
    <div class="form-group">
     <s:if test="year.isEmpty()">
   <div class="col-sm-6 text-center">
                            <center>
                                <s:submit id="goButton" value="Go" cssClass="btn btn-primary" align="right" onsubmit="return validateform()"></s:submit>
                                </center>
                            </div>
                      
    </s:if>
         <s:else>
             <div class="col-sm-6 text-center">
                            <center>
                                <s:submit disabled="true" id="goButton" value="Go" cssClass="btn btn-primary" align="right" onsubmit="return validateform()"></s:submit>
                                </center>
                            </div>
                     
         </s:else>
    </div>
            </s:form>
                
     <s:form action="insertReal" onsubmit="return validateForm()">

      <div class="col-lg-12 text-center"><h3>M.V Pannel Units</h3></div>
        <s:hidden name="id" value="%{id}"/>
    <table  id="one1">
    <tr>
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.blowRoom" label="BLOW ROOM" placeholder="Enter BLOW ROOM" size="90" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.wrs" label="WRS" placeholder="Enter WRS" cssClass="form-control form-group price" ></s:textfield></td>
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.prep" label="PREP" placeholder="Enter PREP" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.oe1" label="OE-1" placeholder="Enter OE-1" cssClass="form-control form-group  price"></s:textfield></td> 
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.oe2" label="OE-2" placeholder="Enter OE-2" cssClass="form-control form-group price" ></s:textfield></td> 
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.oe3" label="OE-3" placeholder="Enter OE-3" cssClass="form-control form-group price" ></s:textfield></td>   
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.oe4" label="OE-4" placeholder="Enter OE-4" cssClass="form-control form-group  price" ></s:textfield></td> 
   <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.oe5" label="OE-5" placeholder="Enter OE-5" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.oe6" label="OE-6" placeholder="Enter OE-6" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.hmPlant" label="H.M. PLANT" placeholder="Enter H.M. PLANT" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.compressor" label="COMPRESSER" placeholder="Enter COMPRESSER" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.lighting" label="LIGHTING" placeholder="Enter LIGHTING" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.roPlant" label="R.O.PLANT" placeholder="Enter R.O.PLANT" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.ycp" label="YCP" placeholder="Enter YCP" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.balePress" label="BALE PRESS" placeholder="Enter BALE PRESS" cssClass="form-control form-group price" ></s:textfield></td> 
     <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.fireDump" label="FIRE SUMP" placeholder="Enter FIRE SUMP" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="i" onkeypress="return isNumberKey(this,event)" name="form.preCleaning" label="PRE CLEANING" placeholder="Enter PRE CLEANING" cssClass="form-control form-group price" ></s:textfield></td> 
    <td><s:textfield id="totalPrice1" readonly="true" onkeypress="return isNumberKey(this,event)" name="form.total" label="TOTAL" placeholder="Total" cssClass="form-control form-group" ></s:textfield></td> 
     </tr>
    </table>
 
 
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
function validateForm() {
     
   if(($("#totalPrice1").val()).length===0){
        alert("Please fill Power Data");
        return false;
    }
}
  function findval(item) {
                    name = item;
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
