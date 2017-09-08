<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="en">
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
            <script src="js/bootstrap.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <style type="text/css">
            
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}

            label[for="i1"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;}
            input[type="checkbox"]{
                width: 25px;
                margin-left: 10px;
            }
            .boxborder td{
    border-top-width: 0px;
}
            
        </style>
        <sj:head/>
        <s:head/>
        <SCRIPT language=Javascript>
            $(document).ready(function () {
                $('input[type="checkbox"]').click(function (event) {
                    if (this.checked && $('input:checked').length > 3) {
                        event.preventDefault();
                        alert('You are not allowed to choose more than 3 boxes');
                    }
                });
            });
        </SCRIPT> 
    </head>
    <body style="background-color: #EEEEEE">
        <s:iterator value="ulist" var="myobj">
            <%@include  file="Upperpage.jsp" %>

            <div class="container">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sri Mouli Textiles Private Limited Stock Report</h1>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Projects Row -->
                <div class="row">
                    <center>
                        <s:form action="stock" method="post" class="form-horizontal">
                            <table>
                                <tr> 
                                    <td><s:hidden name="id" value="%{id}" /></td>
<%--                                <td><s:hidden name="purchaseid" value="%{purchaseid}" /></td>
                                    <td><s:hidden name="startdate" value="%{startdate}" /></td>
                                    <td><s:hidden name="enddate" value="%{enddate}" /></td>--%>
                                    <td> <sj:datepicker name="sd.date" changeMonth="true" changeYear="true" id="i" readonly="true"  label="From Date"  size="90" cssClass="lab price" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                                        <td><br/></td>
                                        <td><sj:datepicker  name="sd.date1" changeYear="true" changeMonth="true" id="i1" readonly="true"  label="To Date"  size="90" cssClass="lab price1" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true" theme="simple"></sj:datepicker> </td>
                                        <td><br/></td>
                                        <td><s:checkboxlist label="Select Product Type" id="i" cssClass="form-group" list="productlist" name="sd.ptype" value="defaultSubject" /> </td>
                                    <td><br/></td>
                                </tr>
                            </table>

                            <div class="form-group">
                                <div class="col-sm-6 text-center">
                                    <s:submit  label="Submit"  cssClass="btn btn-primary" align="center" onloading="loading" ></s:submit>
                                    </div>
                                   <div class="col-sm-6 text-center">
        <s:reset value="Cancel" align="center" cssClass="btn btn-primary" onClick="window.location.reload()"></s:reset>
      </div>
                                </div> 
                        </div>

                   

            </s:form>

    

        <div>
            <br>
            <br>
        </div>         

                    
                    
                    
                    
                    
 <table class="table table-responsive" id="table">
  
   <s:iterator value="var" status="count">
       <s:hidden value="%{#count.index}" id="like"/>
   <td style="padding:0px"> 
       
       <table border='1' class="table table-bordered" style="background-color:#EEEEEE">   
   <tr>
       <s:if test="%{#count.index==0}">
       <th style="border-bottom:none"></th>
      </s:if>
         <th colspan="15" style="text-align: center"><s:property /></th>     
   </tr>
   <s:if test="%{size>=1}">
       <s:if test="%{#count.index==0}">
       
    <tr style="border-collapse: collapse">
   <s:if test="%{#count.index==0}">
       <th style="border-bottom:none;border-top:none"></th>
       </s:if>
    <th colspan="3" style="text-align: center">Received</th>
    <th colspan="3" style="text-align: center;white-space:nowrap;">Issue to Precleaner</th>
    <th colspan="3" style="text-align: center;white-space:nowrap;">Issue to Department</th>
    <th colspan="3" style="text-align: center">Sale</th>
    <th colspan="3" style="text-align: center">Closing Stock</th>
   
   </tr>
           
   <tr style="border-collapse: collapse">
    <th style="border-top:none">Date</th>
    <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
   
   </tr>
     <s:set var="sumTotal1" value="0" />
                     <s:set var="sumTotal2" value="0" />
                     <s:set var="sumTotal3" value="0" />
                     <s:set var="sumTotal6" value="0" />
                     <s:set var="sumTotal7" value="0" />
                     <s:set var="sumTotal8" value="0" />
                     <s:set var="sumTotal9" value="0" />
                     <s:set var="sumTotal10" value="0"/>
                     <s:set var="sumTotal11" value="0" />
                    <s:set var="sumTotal12" value="0" />
                     <s:set var="sumTotal13" value="0" />
                     <s:set var="sumTotal14" value="0" />
                     <s:set var="sumTotal15" value="0" />
                     <s:set var="sumTotal4" value="0" />
                     <s:set var="sumTotal5" value="0" />
                     <s:iterator value="rlist1" var="obj" status="count1">   
                           <s:hidden value="%{#count1.index}" id="like1"/>
                        <tr>
                        <td style="white-space:nowrap;"><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>
                            <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj.receivedQuantity!=null">
                            <s:set var="sumTotal1" value="%{#sumTotal1 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj.receivedKgs!=null">
                            <s:set var="sumTotal2" value="%{#sumTotal2 + receivedKgs}" />
                             </s:if>
                             <td><s:property value="receivedAvg"/> </td>
                             <s:if test="#obj.receivedAvg!=null">
                            <s:set var="sumTotal3" value="%{#sumTotal3 + receivedAvg}" />
                             </s:if>
                             
                             
                             <td><s:property value="issuepQuantity"/> </td>
                            <s:if test="#obj.issuepQuantity!=null">
                            <s:set var="sumTotal6" value="%{#sumTotal6 + issuepQuantity}" />
                            </s:if>
                            <td><s:property value="issuepKgs"/> </td>
                             <s:if test="#obj.issuepKgs!=null">
                            <s:set var="sumTotal7" value="%{#sumTotal7 + issuepKgs}" />
                             </s:if>
                             <td><s:property value="issuepAvg"/> </td>
                             <s:if test="#obj.issuepAvg!=null">
                            <s:set var="sumTotal8" value="%{#sumTotal8 + issuepAvg}" />
                             </s:if>
                             
                             <td><s:property value="issuedQuantity"/> </td>
                            <s:if test="#obj.issuedQuantity!=null">
                            <s:set var="sumTotal9" value="%{#sumTotal9 + issuedQuantity}" />
                            </s:if>
                            <td><s:property value="issuedKgs"/> </td>
                             <s:if test="#obj.issuedKgs!=null">
                            <s:set var="sumTotal10" value="%{#sumTotal10 + issuedKgs}" />
                             </s:if>
                             <td><s:property value="issuedAvg"/> </td>
                             <s:if test="#obj.issuedAvg!=null">
                            <s:set var="sumTotal11" value="%{#sumTotal11 + issuedAvg}" />
                             </s:if>
                             
                             <td><s:property value="saleQuantity"/> </td>
                            <s:if test="#obj.saleQuantity!=null">
                            <s:set var="sumTotal12" value="%{#sumTotal12 + saleQuantity}" />
                            </s:if>
                            <td><s:property value="saleKgs"/> </td>
                             <s:if test="#obj.saleKgs!=null">
                            <s:set var="sumTotal13" value="%{#sumTotal13 + saleKgs}" />
                             </s:if>
                             <td><s:property value="saleAvg"/> </td>
                             <s:if test="#obj.saleAvg!=null">
                            <s:set var="sumTotal14" value="%{#sumTotal14 + saleAvg}" />
                             </s:if>
                             
                             
                            <td><s:property value="stockQuantity"/> </td>
                            <s:if test="#obj.stockQuantity!=null">
                              <s:set var="sumTotal15" value="%{#sumTotal15 + stockQuantity}" />
                            </s:if>
                            <td><s:property value="stockKgs"/> </td>
                             <s:if test="#obj.stockKgs!=null">
                             <s:set var="sumTotal4" value="%{#sumTotal4 + stockKgs}" />
                             </s:if>
                              <td><s:property value="stockAvg"/> </td>
                             <s:if test="#obj.stockAvg!=null">
                             <s:set var="sumTotal5" value="%{#sumTotal5 + stockAvg}" />
                             </s:if>
                          
                        </tr>
                    </s:iterator>   
                        <tr>
    <th style="border-color:#EEEEEE">Total</th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal1}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal2}" /></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal3}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal6}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal7}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal8}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal9}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal10}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal11}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal12}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal13}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal14}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal15}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal4}" /></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal5}" /></th>
<!--    <th colspan="2" style="border-color:#EEEEEE"></td>-->
</tr>
    </s:if>
</s:if>
     <s:if test="%{size>=2}">
       <s:if test="%{#count.index==1}">
  <tr style="border-collapse: collapse">
<!--       <th style="border-bottom:none;border-top:none"></th>-->
    <th colspan="3" style="text-align: center">Received</th>
    <th colspan="3" style="text-align: center;white-space:nowrap;">Issue to Precleaner</th>
    <th colspan="3" style="text-align: center;white-space:nowrap;">Issue to Department</th>
    <th colspan="3" style="text-align: center">Sale</th>
    <th colspan="3" style="text-align: center">Closing Stock</th>
    
   </tr>
           
   <tr style="border-collapse: collapse">
<!--  <th style="border-top:none">Date</th>-->
    <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
   
   </tr>
         <s:set var="sumTotal21" value="0" />
                     <s:set var="sumTotal22" value="0" />
                     <s:set var="sumTotal23" value="0" />
                     <s:set var="sumTotal26" value="0" />
                     <s:set var="sumTotal27" value="0" />
                     <s:set var="sumTotal28" value="0" />
                     <s:set var="sumTotal29" value="0" />
                     <s:set var="sumTotal210" value="0" />
                     <s:set var="sumTotal211" value="0" />
                    <s:set var="sumTotal212" value="0" />
                     <s:set var="sumTotal213" value="0" />
                     <s:set var="sumTotal214" value="0" />
                     <s:set var="sumTotal215" value="0" />
                     <s:set var="sumTotal24" value="0" />
                     <s:set var="sumTotal25" value="0" />
                     <s:iterator value="rlist2" var="obj2">     
                        <tr>
<!--                       <td style="white-space:nowrap;"><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>-->
                            <td style="height:37px;"><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj2.receivedQuantity!=null">
                            <s:set var="sumTotal21" value="%{#sumTotal21 + receivedQuantity}" />
                            </s:if>
                            <td style="height:37px;"><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj2.receivedKgs!=null">
                            <s:set var="sumTotal22" value="%{#sumTotal22 + receivedKgs}" />
                             </s:if>
                             <td style="height:37px;"><s:property value="receivedAvg"/> </td>
                             <s:if test="#obj2.receivedAvg!=null">
                            <s:set var="sumTotal23" value="%{#sumTotal23 + receivedAvg}" />
                             </s:if>
                             
                             
                             <td><s:property value="issuepQuantity"/> </td>
                            <s:if test="#obj2.issuepQuantity!=null">
                            <s:set var="sumTotal26" value="%{#sumTotal26 + issuepQuantity}" />
                            </s:if>
                            <td><s:property value="issuepKgs"/> </td>
                             <s:if test="#obj2.issuepKgs!=null">
                            <s:set var="sumTotal27" value="%{#sumTotal27 + issuepKgs}" />
                             </s:if>
                             <td><s:property value="issuepAvg"/> </td>
                             <s:if test="#obj2.issuepAvg!=null">
                            <s:set var="sumTotal28" value="%{#sumTotal28 + issuepAvg}" />
                             </s:if>
                             
                             <td><s:property value="issuedQuantity"/> </td>
                            <s:if test="#obj2.issuedQuantity!=null">
                            <s:set var="sumTotal29" value="%{#sumTotal29 + issuedQuantity}" />
                            </s:if>
                            <td><s:property value="issuedKgs"/> </td>
                             <s:if test="#obj2.issuedKgs!=null">
                            <s:set var="sumTotal210" value="%{#sumTotal210 + issuedKgs}" />
                             </s:if>
                             <td><s:property value="issuedAvg"/> </td>
                             <s:if test="#obj2.issuedAvg!=null">
                            <s:set var="sumTotal211" value="%{#sumTotal211 + issuedAvg}" />
                             </s:if>
                             
                             <td><s:property value="saleQuantity"/> </td>
                            <s:if test="#obj2.saleQuantity!=null">
                            <s:set var="sumTotal212" value="%{#sumTotal212 + saleQuantity}" />
                            </s:if>
                            <td><s:property value="saleKgs"/> </td>
                             <s:if test="#obj2.saleKgs!=null">
                            <s:set var="sumTotal213" value="%{#sumTotal213 + saleKgs}" />
                             </s:if>
                             <td><s:property value="saleAvg"/> </td>
                             <s:if test="#obj2.saleAvg!=null">
                            <s:set var="sumTotal214" value="%{#sumTotal214 + saleAvg}" />
                             </s:if>
                             
                             
                            <td><s:property value="stockQuantity"/> </td>
                            <s:if test="#obj2.stockQuantity!=null">
                              <s:set var="sumTotal215" value="%{#sumTotal215 + stockQuantity}" />
                            </s:if>
                            <td><s:property value="stockKgs"/> </td>
                             <s:if test="#obj2.stockKgs!=null">
                             <s:set var="sumTotal24" value="%{#sumTotal24 + stockKgs}" />
                             </s:if>
                              <td><s:property value="stockAvg"/> </td>
                             <s:if test="#obj2.stockAvg!=null">
                             <s:set var="sumTotal25" value="%{#sumTotal25 + stockAvg}" />
                             </s:if>
                          
                        </tr>
                    </s:iterator>   
<tr>
<!--    <th style="border-color:#EEEEEE">Total</th>-->
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal21}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal22}" /></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal23}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal26}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal27}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal28}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal29}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal210}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal211}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal212}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal213}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal214}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal215}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal24}" /></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal25}" /></th>
<!--    <th colspan="2" style="border-color:#EEEEEE"></td>-->
</tr>
       </s:if>
     </s:if>
     <s:if test="%{size>=3}">
       <s:if test="%{#count.index==2}">
     <tr style="border-collapse: collapse">
<!--    <th style="border-bottom:none;border-top:none"></th>-->
    <th colspan="3" style="text-align: center">Received</th>
    <th colspan="3" style="text-align: center;white-space:nowrap;">Issue to Precleaner</th>
    <th colspan="3" style="text-align: center;white-space:nowrap;">Issue to Department</th>
    <th colspan="3" style="text-align: center">Sale</th>
    <th colspan="3" style="text-align: center">Closing Stock</th>
    
   </tr>
           
   <tr style="border-collapse: collapse">
<!--    <th style="border-top:none">Date</th>-->
    <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
     <th>Bales</th>
    <th>Kgs</th>
    <th>Avg bale wt</th>
   
   </tr>
                   
    <s:set var="sumTotal321" value="0" />
                     <s:set var="sumTotal322" value="0" />
                     <s:set var="sumTotal323" value="0" />
                     <s:set var="sumTotal326" value="0" />
                     <s:set var="sumTotal327" value="0" />
                     <s:set var="sumTotal328" value="0" />
                     <s:set var="sumTotal329" value="0" />
                     <s:set var="sumTotal3210" value="0" />
                     <s:set var="sumTotal3211" value="0" />
                    <s:set var="sumTotal3212" value="0" />
                     <s:set var="sumTotal3213" value="0" />
                     <s:set var="sumTotal3214" value="0" />
                     <s:set var="sumTotal3215" value="0" />
                     <s:set var="sumTotal324" value="0" />
                     <s:set var="sumTotal325" value="0" />
                     <s:iterator value="rlist3" var="obj3">     
                        <tr>
<!--                    <td style="white-space:nowrap;"><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>-->
                            <td style="height:37px;"><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj3.receivedQuantity!=null">
                            <s:set var="sumTotal321" value="%{#sumTotal321 + receivedQuantity}" />
                            </s:if>
                            <td style="height:37px;"><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj3.receivedKgs!=null">
                            <s:set var="sumTotal322" value="%{#sumTotal322 + receivedKgs}" />
                             </s:if>
                             <td style="height:37px;"><s:property value="receivedAvg"/> </td>
                             <s:if test="#obj3.receivedAvg!=null">
                            <s:set var="sumTotal323" value="%{#sumTotal323 + receivedAvg}" />
                             </s:if>
                             
                             
                             <td><s:property value="issuepQuantity"/> </td>
                            <s:if test="#obj3.issuepQuantity!=null">
                            <s:set var="sumTotal326" value="%{#sumTotal326 + issuepQuantity}" />
                            </s:if>
                            <td><s:property value="issuepKgs"/> </td>
                             <s:if test="#obj3.issuepKgs!=null">
                            <s:set var="sumTotal327" value="%{#sumTotal327 + issuepKgs}" />
                             </s:if>
                             <td><s:property value="issuepAvg"/> </td>
                             <s:if test="#obj3.issuepAvg!=null">
                            <s:set var="sumTotal328" value="%{#sumTotal328 + issuepAvg}" />
                             </s:if>
                             
                             <td><s:property value="issuedQuantity"/> </td>
                            <s:if test="#obj3.issuedQuantity!=null">
                            <s:set var="sumTotal329" value="%{#sumTotal329 + issuedQuantity}" />
                            </s:if>
                            <td><s:property value="issuedKgs"/> </td>
                             <s:if test="#obj3.issuedKgs!=null">
                            <s:set var="sumTotal3210" value="%{#sumTotal3210 + issuedKgs}" />
                             </s:if>
                             <td><s:property value="issuedAvg"/> </td>
                             <s:if test="#obj3.issuedAvg!=null">
                            <s:set var="sumTotal3211" value="%{#sumTotal3211 + issuedAvg}" />
                             </s:if>
                             
                             <td><s:property value="saleQuantity"/> </td>
                            <s:if test="#obj3.saleQuantity!=null">
                            <s:set var="sumTotal3212" value="%{#sumTotal3212 + saleQuantity}" />
                            </s:if>
                            <td><s:property value="saleKgs"/> </td>
                             <s:if test="#obj3.saleKgs!=null">
                            <s:set var="sumTotal3213" value="%{#sumTotal3213 + saleKgs}" />
                             </s:if>
                             <td><s:property value="saleAvg"/> </td>
                             <s:if test="#obj3.saleAvg!=null">
                            <s:set var="sumTotal3214" value="%{#sumTotal3214 + saleAvg}" />
                             </s:if>
                             
                             
                            <td><s:property value="stockQuantity"/> </td>
                            <s:if test="#obj3.stockQuantity!=null">
                              <s:set var="sumTotal3215" value="%{#sumTotal3215 + stockQuantity}" />
                            </s:if>
                            <td><s:property value="stockKgs"/> </td>
                             <s:if test="#obj3.stockKgs!=null">
                             <s:set var="sumTotal324" value="%{#sumTotal324 + stockKgs}" />
                             </s:if>
                              <td><s:property value="stockAvg"/> </td>
                             <s:if test="#obj3.stockAvg!=null">
                             <s:set var="sumTotal325" value="%{#sumTotal325 + stockAvg}" />
                             </s:if>
                          
                        </tr>
                    </s:iterator>   
<tr>
<!--    <th style="border-color:#EEEEEE">Total</th>-->
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal321}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal322}" /></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal323}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal326}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal327}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal328}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal329}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3210}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal3211}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3212}"/></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3213}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal3214}" /></th>
    <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3215}"/></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal324}" /></th>
    <th style="border-color:#EEEEEE"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sumTotal325}" /></th>
   
   </tr>

       </s:if>
     </s:if>
  </table>
   </td>
   </s:iterator>
  
</table>
            <div class="col-sm-6 text-center" id="abc" >
                <s:submit value="Export To Excel" id="button"  cssClass="btn btn-primary"  />
            </div>
                    
    <%--    <s:if test="%{size==3}">

            <div class="semiconductor">

                <table border='1' class="table table-bordered table-responsive" id="table1" style="border-color: white;float:left; width:20%">
                    <tr>
                        <th colspan="7" style="text-align: center"><s:property value="variety1"/></th>        
                    </tr>
                    <tr>
                        <th>Date </th>
                        <th>Received Quantity </th>
                        <th>Received Kgs </th>
                        <th>Issue Quantity </th>
                        <th>Issue Kgs </th>
                        <th>Stock Quantity </th>
                        <th>Stock Kgs </th>
                    </tr>
                    <s:set var="sumTotal1" value="0" />
                     <s:set var="sumTotal2" value="0" />
                     <s:set var="sumTotal3" value="0" />
                     <s:set var="sumTotal4" value="0" />
                     <s:iterator value="rlist1" var="obj">     
                        <tr>
                         <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>


                            <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj.receivedQuantity!=null">
                            <s:set var="sumTotal1" value="%{#sumTotal1 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj.receivedKgs!=null">
                            <s:set var="sumTotal2" value="%{#sumTotal2 + receivedKgs}" />
                             </s:if>
                            <td><s:property value="issueQuantity"/> </td>
                            <s:if test="#obj.issueQuantity!=null">
                              <s:set var="sumTotal3" value="%{#sumTotal3 + issueQuantity}" />
                            </s:if>
                            <td><s:property value="issueKgs"/> </td>
                             <s:if test="#obj.issueKgs!=null">
                             <s:set var="sumTotal4" value="%{#sumTotal4 + issueKgs}" />
                             </s:if>
                            <td><s:property value="stockQuantity"/> </td>
                            <td><s:property value="stockKgs"/> </td>
                        </tr>
                    </s:iterator>   
 <tr>
        <th style="border-color:#EEEEEE">Total</th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal1}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal2}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal4}"/></th>
      <th colspan="2" style="border-color:#EEEEEE"></td>
    </tr>

                </table>
                <table  border='1'  class="table table-bordered table-responsive" id="table2" style="border-color: white;float:left; width:20%">
                    <tr>
                        <th colspan="7" style="text-align: center"><s:property value="variety2"/></td>        
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>Received Quantity </th>
                        <th>Received Kgs </th>
                        <th>Issue Quantity </th>
                        <th>Issue Kgs</th>
                        <th>Stock Quantity </th>
                        <th>Stock Kgs </th>
                    </tr>
                    <s:set var="sumTotal21" value="0" />
                     <s:set var="sumTotal22" value="0" />
                     <s:set var="sumTotal23" value="0" />
                     <s:set var="sumTotal24" value="0" />
                     <s:iterator value="rlist2" var="obj1">     
                        <tr>
                            <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>

                             <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj1.receivedQuantity!=null">
                            <s:set var="sumTotal21" value="%{#sumTotal21 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj1.receivedKgs!=null">
                            <s:set var="sumTotal22" value="%{#sumTotal22 + receivedKgs}" />
                             </s:if>
                            <td><s:property value="issueQuantity"/> </td>
                            <s:if test="#obj1.issueQuantity!=null">
                              <s:set var="sumTotal23" value="%{#sumTotal23 + issueQuantity}" />
                            </s:if>
                            <td><s:property value="issueKgs"/> </td>
                             <s:if test="#obj1.issueKgs!=null">
                             <s:set var="sumTotal24" value="%{#sumTotal24 + issueKgs}" />
                             </s:if>
                            <td><s:property value="stockQuantity"/> </td>
                            <td><s:property value="stockKgs"/> </td>
                        </tr>
                    </s:iterator>   
<tr>
        <th style="border-color:#EEEEEE">Total</th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal21}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal22}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal23}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal24}"/></th>
      <th colspan="2" style="border-color:#EEEEEE"></td>
    </tr>
                </table>
                <table  border='1'  class="table table-bordered table-responsive" id="table3" style="border-color: white;float:left; width:20%">
                    <tr>
                        <th colspan="7" style="text-align: center"><s:property value="variety3"/></td>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>Received Quantity </th>
                        <th>Received Kgs </th>
                        <th>Issue Quantity </th>
                        <th>Issue Kgs </th>
                        <th>Stock Quantity </th>
                        <th>Stock Kgs </th>
                    </tr>
                    <s:set var="sumTotal31" value="0" />
                     <s:set var="sumTotal32" value="0" />
                     <s:set var="sumTotal33" value="0" />
                     <s:set var="sumTotal34" value="0" />
                     <s:iterator value="rlist3" var="obj2">     
                       <tr>
                            <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>

                             <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj2.receivedQuantity!=null">
                            <s:set var="sumTotal31" value="%{#sumTotal31 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj2.receivedKgs!=null">
                            <s:set var="sumTotal32" value="%{#sumTotal32 + receivedKgs}" />
                             </s:if>
                            <td><s:property value="issueQuantity"/> </td>
                            <s:if test="#obj2.issueQuantity!=null">
                              <s:set var="sumTotal33" value="%{#sumTotal33 + issueQuantity}" />
                            </s:if>
                            <td><s:property value="issueKgs"/> </td>
                             <s:if test="#obj2.issueKgs!=null">
                             <s:set var="sumTotal34" value="%{#sumTotal34 + issueKgs}" />
                             </s:if>
                            <td><s:property value="stockQuantity"/> </td>
                            <td><s:property value="stockKgs"/> </td>
                        </tr>
                    </s:iterator>   
<tr>
        <th style="border-color:#EEEEEE">Total</th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal31}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal32}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal33}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal34}"/></th>
      <th colspan="2" style="border-color:#EEEEEE"></td>
    </tr>
                </table>

            </div>
                    <center><button  onclick="tablesToExcel(['table1', 'table2', 'table3'], ['variety1', 'variety2', 'variety3'], 'StockReport.xls', 'Excel')" align="right"  class="btn btn-primary" >Export to Excel</button></center>

        </s:if>

        <s:if test="%{size==2}">
            <div class="semiconductor">
                <table border='1' class="table table-bordered table-responsive"  id="table1"  style="border-color: white;float:left; width:50%">
                    <tr>
                        <th colspan="7" style="text-align: center"><s:property value="variety1"/></td>        
                    </tr>
                    <tr>
                        <th>Date </th>
                        <th>Received Quantity </th>
                        <th>Received Kgs </th>
                        <th>Issue Quantity </th>
                        <th>Issue Kgs </th>
                        <th>Stock Quantity </th>
                        <th>Stock Kgs </th>
                    </tr>
                    <s:set var="sumTotal1" value="0" />
                     <s:set var="sumTotal2" value="0" />
                     <s:set var="sumTotal3" value="0" />
                     <s:set var="sumTotal4" value="0" />
                     <s:iterator value="rlist1" var="obj">     
                        <tr>
                         <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>


                            <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj.receivedQuantity!=null">
                            <s:set var="sumTotal1" value="%{#sumTotal1 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj.receivedKgs!=null">
                            <s:set var="sumTotal2" value="%{#sumTotal2 + receivedKgs}" />
                             </s:if>
                            <td><s:property value="issueQuantity"/> </td>
                            <s:if test="#obj.issueQuantity!=null">
                              <s:set var="sumTotal3" value="%{#sumTotal3 + issueQuantity}" />
                            </s:if>
                            <td><s:property value="issueKgs"/> </td>
                             <s:if test="#obj.issueKgs!=null">
                             <s:set var="sumTotal4" value="%{#sumTotal4 + issueKgs}" />
                             </s:if>
                            <td><s:property value="stockQuantity"/> </td>
                            <td><s:property value="stockKgs"/> </td>
                        </tr>
                    </s:iterator>   
 <tr>
      <th style="border-color:#EEEEEE">Total</th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal1}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal2}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal4}"/></th>
      <th colspan="2" style="border-color:#EEEEEE"></td>
    </tr>

                </table>
                <table  border='1' id="table2"  class="table table-bordered table-responsive"  style="border-color: white;float:left; width:50%">
                    <tr>
                        <th colspan="7" style="text-align: center"><s:property value="variety2"/></th>        
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>Received Quantity </th>
                        <th>Received Kgs </th>
                        <th>Issue Quantity </th>
                        <th>Issue Kgs</th>
                        <th>Stock Quantity </th>
                        <th>Stock Kgs </th>
                    </tr>
                    <s:set var="sumTotal21" value="0" />
                     <s:set var="sumTotal22" value="0" />
                     <s:set var="sumTotal23" value="0" />
                     <s:set var="sumTotal24" value="0" />
                     <s:iterator value="rlist2" var="obj1">     
                        <tr>
                            <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>

                             <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj1.receivedQuantity!=null">
                            <s:set var="sumTotal21" value="%{#sumTotal21 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj1.receivedKgs!=null">
                            <s:set var="sumTotal22" value="%{#sumTotal22 + receivedKgs}" />
                             </s:if>
                            <td><s:property value="issueQuantity"/> </td>
                            <s:if test="#obj1.issueQuantity!=null">
                              <s:set var="sumTotal23" value="%{#sumTotal23 + issueQuantity}" />
                            </s:if>
                            <td><s:property value="issueKgs"/> </td>
                             <s:if test="#obj1.issueKgs!=null">
                             <s:set var="sumTotal24" value="%{#sumTotal24 + issueKgs}" />
                             </s:if>
                            <td><s:property value="stockQuantity"/> </td>
                            <td><s:property value="stockKgs"/> </td>
                        </tr>
                    </s:iterator>   
<tr>
        <th style="border-color:#EEEEEE">Total</th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal21}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal22}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal23}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal24}"/></th>
      <th colspan="2" style="border-color:#EEEEEE"></td>
    </tr>
                </table>

            </div>
                    <center><button  onclick="tablesToExcel(['table1', 'table2'], ['variety1', 'variety2'], 'StockReport.xls', 'Excel')" align="right"  class="btn btn-primary" >Export to Excel</button></center>

        </s:if>

        <s:if test="%{size==1}">
            <div class="semiconductor">
                <table border='1'  class="table table-bordered table-responsive" id="table1"  style="border-color: white;float:left; width:100%">
                    <tr>
                        <th colspan="7" style="text-align: center"><s:property value="variety1"/></td>        
                    </tr>
                    <tr>
                        <th>Date </th>
                        <th>Received Quantity </th>
                        <th>Received Kgs </th>
                        <th>Issue Quantity </th>
                        <th>Issue Kgs </th>
                        <th>Stock Quantity </th>
                        <th>Stock Kgs </th>
                    </tr>
                     <s:set var="sumTotal1" value="0" />
                     <s:set var="sumTotal2" value="0" />
                     <s:set var="sumTotal3" value="0" />
                     <s:set var="sumTotal4" value="0" />
                     <s:iterator value="rlist1" var="obj">     
                        <tr>
 <td><s:date format="dd-MM-yyyy" var="date1" name="%{date}"/> <s:property value="%{date1}" ></s:property></td>

                            <td><s:property value="receivedQuantity"/> </td>
                            <s:if test="#obj.receivedQuantity!=null">
                            <s:set var="sumTotal1" value="%{#sumTotal1 + receivedQuantity}" />
                            </s:if>
                            <td><s:property value="receivedKgs"/> </td>
                             <s:if test="#obj.receivedKgs!=null">
                            <s:set var="sumTotal2" value="%{#sumTotal2 + receivedKgs}" />
                             </s:if>
                            <td><s:property value="issueQuantity"/> </td>
                            <s:if test="#obj.issueQuantity!=null">
                              <s:set var="sumTotal3" value="%{#sumTotal3 + issueQuantity}" />
                            </s:if>
                            <td><s:property value="issueKgs"/> </td>
                             <s:if test="#obj.issueKgs!=null">
                             <s:set var="sumTotal4" value="%{#sumTotal4 + issueKgs}" />
                             </s:if>
                            <td><s:property value="stockQuantity"/> </td>
                            <td><s:property value="stockKgs"/> </td>
                        </tr>
                    </s:iterator>   
                        <tr>
        <th style="border-color:#EEEEEE">Total</th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal1}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal2}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal3}"/></th>
      <th style="border-color:#EEEEEE"><s:property value="%{#sumTotal4}"/></th>
      <th colspan="2" style="border-color:#EEEEEE"></td>
    </tr>

                </table>
            </div>
           <center><button onclick="tablesToExcel(['table1'], ['variety1'], 'StockReport.xls', 'Excel')" align="right"  class="btn btn-primary" >Export to Excel</button></center>

        </s:if>--%>

    </s:iterator>


 </div>
         <script>

            $(document).ready(function () {
                var al = $("#like").val();
                 var al1 = $("#like1").val();
                if (al === undefined || al1=== undefined){
                    
                     $("#table").hide();
                    $("#abc").find("input,button,textarea,select").attr("disabled", "disabled");
                }
                $("#button").click(function (e) {
   var dt = new Date();
                var day = dt.getDate();
                var month = dt.getMonth() + 1;
                var year = dt.getFullYear();
                var hour = dt.getHours();
                var mins = dt.getMinutes();
                var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;

                var d1 = $('.price').val();
                var d2 = $('.price1').val();
                var a = document.createElement('a');
                var data_type = 'data:application/vnd.ms-excel';
                var table_div = document.getElementById('table');
                var table_html = table_div.outerHTML.replace(/ /g, '%20');
                a.href = data_type + ', ' + table_html;
                a.download = 'Godown-Stock(' + d1 + ' to ' + d2 + ')_' + postfix + '.xls';
                a.click();
                e.preventDefault();

                });
            });
        </script>
    <script>
        var tablesToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,'
                    , tmplWorkbookXML = '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">'
                    + '<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office"><Author>Axel Richter</Author><Created>{created}</Created></DocumentProperties>'
                    + '<Styles>'
                    + '<Style ss:ID="Currency"><NumberFormat ss:Format="Currency"></NumberFormat></Style>'
                    + '<Style ss:ID="Date"><NumberFormat ss:Format="Medium Date"></NumberFormat></Style>'
                    + '</Styles>'
                    + '{worksheets}</Workbook>'
                    , tmplWorksheetXML = '<Worksheet ss:Name="{nameWS}"><Table>{rows}</Table></Worksheet>'
                    , tmplCellXML = '<Cell{attributeStyleID}{attributeFormula}><Data ss:Type="{nameType}">{data}</Data></Cell>'
                    , base64 = function (s) {
                        return window.btoa(unescape(encodeURIComponent(s)))
                    }
            , format = function (s, c) {
                return s.replace(/{(\w+)}/g, function (m, p) {
                    return c[p];
                })
            }
            return function (tables, wsnames, wbname, appname) {
                var ctx = "";
                var workbookXML = "";
                var worksheetsXML = "";
                var rowsXML = "";

                for (var i = 0; i < tables.length; i++) {
                    if (!tables[i].nodeType)
                        tables[i] = document.getElementById(tables[i]);
                    for (var j = 0; j < tables[i].rows.length; j++) {
                        rowsXML += '<Row>'
                        for (var k = 0; k < tables[i].rows[j].cells.length; k++) {
                            var dataType = tables[i].rows[j].cells[k].getAttribute("data-type");
                            var dataStyle = tables[i].rows[j].cells[k].getAttribute("data-style");
                            var dataValue = tables[i].rows[j].cells[k].getAttribute("data-value");
                            dataValue = (dataValue) ? dataValue : tables[i].rows[j].cells[k].innerHTML;
                            var dataFormula = tables[i].rows[j].cells[k].getAttribute("data-formula");
                            dataFormula = (dataFormula) ? dataFormula : (appname == 'Calc' && dataType == 'DateTime') ? dataValue : null;
                            ctx = {attributeStyleID: (dataStyle == 'Currency' || dataStyle == 'Date') ? ' ss:StyleID="' + dataStyle + '"' : ''
                                , nameType: (dataType == 'Number' || dataType == 'DateTime' || dataType == 'Boolean' || dataType == 'Error') ? dataType : 'String'
                                , data: (dataFormula) ? '' : dataValue
                                , attributeFormula: (dataFormula) ? ' ss:Formula="' + dataFormula + '"' : ''
                            };
                            rowsXML += format(tmplCellXML, ctx);
                        }
                        rowsXML += '</Row>'
                    }
                    ctx = {rows: rowsXML, nameWS: wsnames[i] || 'Sheet' + i};
                    worksheetsXML += format(tmplWorksheetXML, ctx);
                    rowsXML = "";
                }

                ctx = {created: (new Date()).getTime(), worksheets: worksheetsXML};
                workbookXML = format(tmplWorkbookXML, ctx);



                var link = document.createElement("A");
                link.href = uri + base64(workbookXML);
                link.download = wbname || 'Workbook.xls';
                link.target = '_blank';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        })();
    </script>
</body>
</html>

