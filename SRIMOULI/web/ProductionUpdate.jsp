<%-- 
    Document   : ProductionUpdate
    Created on : Dec 27, 2016, 10:37:04 AM
    Author     : Gayathri
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
        <link href="Images/SriMouli.ico" rel="icon">
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
            <style type="text/css">
            label[for="i1"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}    
            </style>

            <sj:head/>
            <s:head/>
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
 
    </SCRIPT> 
 
        
        </head>
        <SCRIPT language=Javascript>
            
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
        <body style="background-color: #EEEEEE">
        <%--   <s:iterator value="ulist" var="myobj" >   
               <%@include file="Upperpage4.jsp" %>
           </s:iterator>  --%>
        <s:iterator value="ulist" status="stat" var="myobj"> 
            <s:if test="%{#stat.index==0}">
                <%@include file="Upperpage4.jsp" %>
            </s:if>
        </s:iterator>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sri Mouli Textiles Private Limited Issue to Department Update</h1>
                </div>
            </div>
            <div class="row">
                <center>
                    <s:form action="productionUpdate" class="form-horizontal" method="post" onsubmit="return updateAll()">
                        <table>
                            <s:iterator value="glist" >
                                <tr>
                                    <td><s:hidden name="ptp.id" value="%{id}" /></td>
                                    <td><s:date name="%{date}" format="dd-MM-yyyy" var="date1"/><s:textfield readonly="true" displayFormat="dd-mm-yy" id="i" name="ptp.date" value="%{date1}"  label="Date "  size="90"  cssClass="form-control" /> </td>

                                    <%-- <td><sj:datepicker readonly="true" id="i" name="ptp.date" value="%{date}" changeMonth="true" changeYear="true"  label="Date "  size="90"  displayFormat="dd-mm-yy" cssClass="lab" placeholder="dd-mm-yyyy"/> </td>--%>
                                    <td><s:textfield name="ptp.superviser" value="%{superviser}" id="i" cssClass="form-control " label="Godown Keeper Name" readonly="true"/></td>
                                    <td><s:textfield name="ptp.mixingNumber" value="%{mixingNumber}" id="i" cssClass="form-control" label="Mixing Number" readonly="true" /></td>
                                    <td><s:textfield name="ptp.issueNumber" value="%{issueNumber}" id="i" cssClass="form-control" label="Issue Number" readonly="true"/></td>
                                </tr>
                            </table>
                            <div class="col-sm-12 text-center"><h3>Issue to Department Material Data</h3></div>


                            <div class="tab1">
                                 <table id="two1">
  <tr > <td align="left">   <input type="button" value="Add Row"  class="btn btn-primary" onclick="addRow('one1')" onkeyup="myFunction()"/>   
        </td></tr>
    </table>
                                <table class="table table-bordered table-responsive weight-table" id="one1">
                                    <tr>
                                        <th>Variety</th>
                                        <th>Number of Bales</th>
                                        <th>Weight</th>
                                        <th>Mixing Percentage</th>

                                    </tr>
                                    <s:iterator value="list1" >
                                        <tr>
                                            <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple" ></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price"  onkeypress="return isNumberKey(this,event)" id="mix1" theme="simple" placeholder="Enter  Weight"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales1"  onmousemove="javascript:addNumbers1()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list2" >
                                        <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}"  list="productlist" headerKey="" headerValue="Select variety"  theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix2" theme="simple" placeholder="Enter  Weight" ></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales2"  onmousemove="javascript:addNumbers2()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list3" >
                                        <tr>
                                          <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple" ></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix3" theme="simple" placeholder="Enter  Weight" ></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales3"  onmousemove="javascript:addNumbers3()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list4">
                                        <tr>
                                        <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix4" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales4"  onmousemove="javascript:addNumbers4()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list5">
                                        <tr>
                                          <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix5" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales5"  onmousemove="javascript:addNumbers5()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>


                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list6">
                                        <tr> <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>   
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield  name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix6" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales6"  onmousemove="javascript:addNumbers6()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list7">
                                        <tr>
                                          <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix7" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales7"  onmousemove="javascript:addNumbers7()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>
                                    <s:iterator value="list8">
                                        <tr>
                                         <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix8" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales8"  onmousemove="javascript:addNumbers8()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>


                                            </tr>
                                    </s:iterator>
                                    
                                    <s:iterator value="list10">
                                        <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                            <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix10" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                            <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales10"  onmousemove="javascript:addNumbers10()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>

                                            </tr>
                                    </s:iterator>    
                                            
                                     <s:iterator value="list9">
                                          <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                              <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix9" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales9"  onmousemove="javascript:addNumbers9()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>
                                              
                                              </tr>
                                      </s:iterator>
                                    
                                    <s:iterator value="list11">
                                          <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                              <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix9" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales9"  onmousemove="javascript:addNumbers9()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>
                                              
                                              </tr>
                                      </s:iterator>
                                              
                                      <s:iterator value="list12">
                                          <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                              <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix9" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales9"  onmousemove="javascript:addNumbers9()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>
                                              
                                              </tr>
                                      </s:iterator>
                                              
                                     <s:iterator value="list13">
                                          <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                              <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix9" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales9"  onmousemove="javascript:addNumbers9()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>
                                              
                                              </tr>
                                      </s:iterator>      
                                       
                                               <s:iterator value="list14">
                                          <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                              <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix9" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales9"  onmousemove="javascript:addNumbers9()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>
                                              
                                              </tr>
                                      </s:iterator>    
                                              
                                               <s:iterator value="list15">
                                          <tr>
                                           <td><s:select name="ptp.variety" cssClass="form-control" value="%{variety}" headerKey="" headerValue="Select variety" list="productlist" theme="simple" readonly="true"/></td>  
                                              <td><s:textfield name="ptp.TotalBales" value="%{totalBales}" cssClass="form-control price3" onkeypress="return isNumberKey(this,event)" id="bales" placeholder="Enter  No. of Bales" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.weight" value="%{weight}" cssClass="form-control price" onkeypress="return isNumberKey(this,event)" id="mix9" placeholder="Enter  Weight" theme="simple"></s:textfield></td>
                                              <td><s:textfield name="ptp.mixing" value="%{mixing}" cssClass="form-control price2" onkeypress="return isNumberKey(this,event)" id="noBales9"  onmousemove="javascript:addNumbers9()" placeholder="Enter  Mixing" theme="simple"></s:textfield></td>
                                              
                                              </tr>
                                      </s:iterator>    
                                </table>      
                                              
                               <table class="table table-bordered table-responsive  weight-table">      
                                    <s:iterator value="glist">
                                        <tr>
                                            <td style="width: 220px"><b>Total</b></td>
                                            <td><b><s:textfield name="ptp.totalTotalBales" readonly="true" value="%{totalBales}" id="totalPrice3" cssClass="form-control" placeholder="Click here to get Total Bales" theme="simple" ></s:textfield> </b></td>
                                            <td><b><s:textfield name="ptp.totalWeight" readonly="true" value="%{totalWeight}" id="totalPrice1" cssClass="form-control" placeholder="Click here to get Total Weight" theme="simple"></s:textfield>   </b></td>
                                            <td><b><s:textfield name="ptp.totalMixing" id="totalPrice2" value="%{totalMixing}"  readonly="true" cssClass="form-control" placeholder="Total Mixing" theme="simple" ></s:textfield> </b></td>

                                            <%--     <td><b><s:textfield name="ptp.totalMixing" readonly="true" value="%{totalMixing}" id="totalPrice2" cssClass="form-control" placeholder="Click here to get Total Mixing" theme="simple" ></s:textfield> </b></td> --%>

                                        </tr>
                                    </s:iterator>
                                </table>
                            </s:iterator>
                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <s:submit value="Update" cssClass="btn btn-primary" align="center"></s:submit> 

                                    </div>
                                    <div class="col-sm-6 text-center">
                                        <button type="reset" class="btn btn-primary" >Cancel</button>
                                    </div>
                                </div>
                        </s:form>
                </center>
            </div>
        </div>
            
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>
       $('.price3').mouseenter(function () {
    var sum = 0;
    $('.price3').each(function() {
        sum += Number($(this).val());
        var n;
        n=sum.toFixed(3);
    });
    $('#totalPrice3').val(sum);
});

$('.price').mouseenter(function () {
    var sum = 0;
    $('.price').each(function() {
        sum += Number($(this).val());
        var n;
        n=sum.toFixed(3);
    });
    $('#totalPrice1').val(sum);
});

$('.price2').mousemove(function () {
   var sum = 0;
    $('.price2').each(function() {
        sum += Number($(this).val());
        var n;
        n=sum.toFixed(2);
    });
    $('#totalPrice2').val(n);
});


$(document).ready(function () {
    $('.weight-table tr').on('mousemove', function() {
      
        $('.weight-table tr').each(function() {
           var n=0;
           var hours = $(this).find('input.price').val();
           var rate=parseFloat(document.getElementById("totalPrice1").value);
           var dateTotal = (hours / rate)*100;
      //   alert(rate);
            n=dateTotal.toFixed(3);
              if(n!=="NaN") {
            $(this).find('input.price2').val(n);
              }
              else {
            $(this).find('input.price2').val("");       
              }
        });
        return false;
    }); 
});
  </script>
  
    </body>
</html>