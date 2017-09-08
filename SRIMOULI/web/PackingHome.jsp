<%-- 
    Document   : PackingHome
    Created on : Dec 27, 2016, 10:53:40 AM
    Author     : ch.mounika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%!
    public String name = "";
%> 
<!DOCTYPE html>
<html>
<head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sri Mouli Textiles Private Limited</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta http-equiv="refresh">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        
        <meta name="author" content="">
        <!-- Bootstrap Core CSS -->
        <link href="Images/SriMouli.ico" rel="icon">

        <!-- Custom CSS -->
        <link href="css/Srimouli.css" rel="stylesheet">
        <link href="css/newcss.css" rel="stylesheet">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 12pt;
                padding-bottom: 10px;} 

        </style>

        <s:head />
        <sx:head />
        <!-- jQuery -->

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/Srimouli.css" rel="stylesheet">
        <link href="css/newcss.css" rel="stylesheet">



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
<SCRIPT language="javascript">
  function addRow(one1) {
   var table = document.getElementById(one1);

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
                      
   var colCount = table.rows[0].cells.length;
                      //   alert(colCount);
   for(var i=0; i<colCount; i++) {

    var newcell = row.insertCell(i);

    newcell.innerHTML  = table.rows[rowCount-1].cells[i].innerHTML ;
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
  // alert(rowCount);
  // $(".table").find("tr:nth-child("+(rowCount+1)+")").find("td:nth-child("+(5)+")").text("");                
                        
  }
  
  function findcounttt(item,evnt) {
            var xpp = item;var flag="notdone";
            var OpStk;
                // alert($(evnt).parents('tr').prev().children().eq(0).find('option:selected').text());
                  var rowIndex = $(evnt).closest('tr').index();
           // alert(rowIndex);
                // var total = $(".table").find("tr").length;
                var total=rowIndex;
               //  alert($(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(1)+")").html());
 // alert($(".table").find("tr:nth-child("+(rowIndex+1)+")").find("td:nth-child("+(1)+")").find('option:selected').text());
    
    for(rowIndex;rowIndex>=1;rowIndex--){
        var pos;
        if(total.valueOf()===rowIndex.valueOf()){
            pos=rowIndex+1;
        }
        else{
            pos=total+1;
        }
       
       // alert(pos);
         if(flag.valueOf()==="done"){
                  break;
              }
        
        // alert("haaiiiiaaa");
         
        if(rowIndex.valueOf()>1){
           // alert("haaiiii*****--------");
           abc();def();ghi();
          var ppcont=$(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(1)+")").find('option:selected').text();
               // alert(ppcont);
                 $(".table").find("tr:nth-child("+(rowIndex)+")").find('input,select').attr('disabled',true);
                  $(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(3)+")").prop('disabled',true);
                   $(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(4)+")").prop('disabled',true);
                if(ppcont!=="Select Count"){
                     //alert("haiiiii..."+xpp+"....."+ppcont);
                    // $(".table").find("tr:nth-child("+(rowIndex)+")").find('input,select').attr('disabled',true);
                    //  $(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(2)+")").prop('disabled',true);
                     //  $(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(3)+")").prop('disabled',true);
                      if(xpp.valueOf()===ppcont.valueOf()){
                          
                         // alert("equlal");
                          var pkbgs=$(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(6)+")").find('input').val();
                          if(pkbgs!==0&&pkbgs!==''){
                            //  alert("equlal..***--"+pkbgs);
                               var Nokbgs=$(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(7)+")").find('input').val();
                               if(Nokbgs!==''){
                                  
                                   OpStk=$(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(5)+")").find('input').val();
                                    //alert("....**--**"+OpStk);
                                   if(OpStk===undefined){
                                       // alert("....innn*...*--*...*"+OpStk);   
                                       OpStk=$(".table").find("tr:nth-child("+(rowIndex)+")").find("td:nth-child("+(5)+")").text();
                                   }
                               //    alert("---**--"+OpStk);
                                   var rem=OpStk-Nokbgs;
                                   //alert("...."+rem+"******....."+pos);
                                 // $(".table").find("tr:nth-child("+pos+")").find("td:nth-child("+(5)+")").text(rem);
                                 //  $(".table").find("tr:nth-child("+pos+")").find("td:nth-child("+(5)+")").text(rem); 
                                  $(".table").find("tr:nth-child("+pos+")").find("td:nth-child("+(5)+")").find('input.valu1').val(rem); 
                                     //alert("..**.."+rem);
                               }
                          }
                         
                          // alert("equlal.."+pkbgs);
                           flag="done";
                          
                      }
                  }   
              }
             
    }
                 
                 
//                 var ppcont=$(evnt).parents('tr').prev().children().eq(0).find('option:selected').text();
//                 if(ppcont!=="Select Count"){
//                     $(evnt).parents('tr').prev().children().find('input,select').attr('disabled',true);
//                      $(evnt).parents('tr').prev().children().eq(2).prop('disabled',true);
//                       $(evnt).parents('tr').prev().children().eq(3).prop('disabled',true);
//                    //  alert("haiiiii..."+xpp+"....."+ppcont);
//                      if(xpp.valueOf()===ppcont.valueOf()){
//                          alert("equlal");
//                          var pkbgs=$(evnt).parents('tr').prev().children().eq(5).find('input').val();
//                          if(pkbgs!==0&&pkbgs!==''){
//                            //  alert("equlal..***--"+pkbgs);
//                               var Nokbgs=$(evnt).parents('tr').prev().children().eq(6).find('input').val();
//                               if(Nokbgs!==''){
//                                  
//                                   OpStk=$(evnt).parents('tr').prev().children().eq(4).find('input').val();
//                                    alert("....**--**"+OpStk);
//                                   if(OpStk===undefined){
//                                        alert("....innn*...*--*...*"+OpStk);   
//                                       OpStk=$(evnt).parents('tr').prev().children().eq(4).text();
//                                   }
//                                   alert("---**--"+OpStk);
//                                   var rem=OpStk-Nokbgs;
//                                   alert("...."+rem);
//                                  $(evnt).parents('tr').children().eq(4).text(rem);
//                                     alert("..**.."+rem);
//                               }
//                          }
//                           alert("equlal.."+pkbgs);
//                      }
//                 }
               
           // alert("haiiiii..."+xpp+"....."+ppcont);
}  
  function findval(item,evnt) {
     // alert(item);
            name = item;
            //$(evnt).parents('tr').prev().children().eq(4).find('input').val();
              var boxtype1= $(evnt).parents('tr').find("#tri option:selected").text();     
               // alert("...---"+boxtype1);
               if(boxtype1!=='Enter PackType' || boxtype1.length!==0)   {
                   if(boxtype1.length!==0) {
                      if(boxtype1==='Box') {
                       
                     $(evnt).parents('tr').find(".two").attr('disabled',true);
                      $(evnt).parents('tr').find(".three").prop('disabled',false);
                       $(evnt).parents('tr').find(".two").val("Enter Weight");
                  
                      }
                    else if(boxtype1==='Bag'){
                      $(evnt).parents('tr').find(".three").attr('disabled',true);
                       $(evnt).parents('tr').find(".two").prop('disabled',false);
                        $(evnt).parents('tr').find(".three").val("Enter Weight");
            
                      }  
                 }
               }
        }
    $(document).ready(function () {
 $(function () {
                $("#ddlPassport").change(function () {
                    if ($(this).val() === "Bag") {
                        $("#dvPassport").show();
                        $("#dvPassport1").hide();
                    } else if ($(this).val() === "Box") {
                        $("#dvPassport1").show();
                        $("#dvPassport").hide();
                    } else {
                        $("#dvPassport").hide();
                    }
                });
            });
        });

    </SCRIPT> 
    
     <script type="text/javascript">
//            window.onload = function () {
//               // alert("haiiiilsjljs");
//                document.getElementById('fromDate').children[1].setAttribute("readOnly", "true");
//                 alert("sdfldsjfkl--.....----lk------------....-----999..-------->");
//        // If sessionStorage is storing default values (ex. name), exit the function and do not restore data
//        if (sessionStorage.getItem('name') === "name") {
//            return;
//        }
//               
//        // If values are not blank, restore them to the fields
//        var name = sessionStorage.getItem('name');
//        if (name !== null) $('.datee').val(name);
//       
//
//        var email = sessionStorage.getItem('email');
//        if (email !== null) $('.packk').val(email);
//
//        var subject= sessionStorage.getItem('subject');
//        if (subject!== null) $('#check1').val(subject);
//                
//            };
        </script>
        
<script type="text/javascript">
$(document).ready(function(){

//Check if the current URL contains '#' 
if(document.URL.indexOf("#")===-1)
{
// Set the URL to whatever it was plus "#".
url = document.URL+"#";
location = "#";

//Reload the page
location.reload(true);

}
});
</script> 

</head>
<body style="background-color: #EEEEEE">
<script>
//    // Run on page load
//    window.onload = function() {
//        alert("sdfldsjfkl--.....----lk------------....-----999..-------->");
//        // If sessionStorage is storing default values (ex. name), exit the function and do not restore data
//        if (sessionStorage.getItem('name') === "name") {
//            return;
//        }
//               
//        // If values are not blank, restore them to the fields
//        var name = sessionStorage.getItem('name');
//        if (name !== null) $('.datee').val(name);
//       
//
//        var email = sessionStorage.getItem('email');
//        if (email !== null) $('.packk').val(email);
//
//        var subject= sessionStorage.getItem('subject');
//        if (subject!== null) $('#check1').val(subject);
//    };
//
//    // Before refreshing the page, save the form data to sessionStorage
//    window.onbeforeunload = function() {
//         alert("sdfldsjfkl--.....----lk------------....-----999..-------->");
//        sessionStorage.setItem("name", $('.datee').val());
//        sessionStorage.setItem("email", $('.packk').val());
//        sessionStorage.setItem("subject", $('#check1').val());
//    };
</script>

    <s:if test="%{shift_date!=null}">
       <marquee id="ticker" direction="right" loop="20">The Last Updated Date is <s:date format="dd-MM-yyyy" var="date1" name="%{shift_date}"/> <s:property value="%{date1}" ></s:property>  </marquee>
    </s:if>
    <s:else>
        <marquee id="ticker" direction="right" loop="20">You haven't entered any data</marquee>  
    </s:else>
       <%--  <s:iterator value="ulist" var="myobj" >   
            <%@include file="Upperpage2.jsp" %>                  
        </s:iterator> ---%>
    <s:iterator value="ulist" status="stat" var="myobj"> 
        <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage2.jsp" %>
        </s:if>
    </s:iterator>
     <div class="container">
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
<s:form action="packval" method="post" class="form-horizontal" enctype="multipart/form-data">
  <table id="part1">
      <td><s:hidden name="id" value="%{id}" /></td>
     <%-- <td><sj:datepicker maxDate="true" name="form.date" id="i" readonly="true" changeMonth="true" changeYear="true" label="Date"  size="90" cssClass="lab" displayFormat="dd-mm-yy"  placeholder="dd-mm-yyyy" requiredLabel="true"></sj:datepicker> </td>--%>
     <s:if test="%{status==123}">
     <td><sx:datetimepicker   name="form.date" disabled="true" cssStyle="width:600px" onkeypress="return isDecimalKey(event)" cssClass="lab" label="Date"   displayFormat="dd-MM-yyyy" value=""/></td>
     </s:if>
     <s:else>
     <td><sx:datetimepicker  name="form.date" cssStyle="width:600px" onkeypress="return isDecimalKey(event)" cssClass="lab datee" label="Date"   displayFormat="dd-MM-yyyy" value=""/></td> 
     </s:else>
     <td><s:select name="form.supervisor" list="superList" id="i"  cssClass="form-control form-group packk" label="Packed By" headerKey="-1" headerValue=" --Select-- " placeholder="Packer Name"/></td>
     <s:textfield value="%{status}" id="check1"/>
   </table> 
   <br/>
   <div class="form-group">
      <div class="col-sm-6 text-center" >
      <center>
      <s:submit id="goButton" value="Go" cssClass="btn btn-primary" align="right" onchange="validateform()"></s:submit>
      </center>
   </div>
</s:form>
<s:form action="insertPacking" enctype="multipart/form-data" method="post" onsubmit="return validateForm()" onchange="validateform()" >     
<div class="col-sm-12 text-center"><h3>Packing Data</h3></div>
<table id="two1" >
  <tr><td align="left"><input type="button" value="Add Row"  class="btn btn-primary weight-table" onclick="addRow('one1')" onkeyup="myFunction()"/>   
        </td></tr>
</table> 
<div class="tab1">
<table class="table table-bordered table-responsive packing1 weight-table weight-table22" id="one1">
  <tr>
<!--<th>Count No</th>-->
       <th>Count</th>
       <th>Type of Packing</th>
       <th>Bag Weight</th>
       <th>Box Weight</th>
       <th>Opening Stock</th>
       <th>Packed Bags</th>
       <th>Number Of Kgs Packed</th>
<!--       <th>Closing</th>-->
  </tr>
       
   <%--<s:hidden name="id" value="%{id}" />--%>
  
     
<% for(int i=0;i<3;i++) {%>         
       <%--<s:hidden name="id" value="%{id}" />--%>
   <tr>
       <td><s:select list="countlist" name="form.countdb" id="cout" onchange="findcounttt(this.value,this)"  onkeypress="return isNumberKey(this,event)" cssClass="form-control ccoout" theme="simple" headerKey="" headerValue="Select Count" /></td> 
<%--  <td><s:textfield  name="form.countdb"   onkeypress="return isNumberKey(this,event)" cssClass="form-control abcd"  theme="simple" value="10" /></td> --%>
       <td><s:select list="{'Bag','Box'}"  id="tri" name="form.boxtype" onchange="findval(this.value,this)" cssClass="form-control ggg"  theme="simple" headerKey="" headerValue="Enter PackType"/></td>
   <%--<s:set name="gayathri" value="%{tri}"/>--%>
 <%--  <s:if test="%{boxtype.equals('Bag'}">--%>
   
 <td><s:select list="weightlist" name="form.weight" id="eeee" onkeypress="return isNumberKey(this,event)" cssClass="form-control two"  theme="simple" headerKey="" headerValue="Enter Weight" > </s:select></td>
<td><s:select list="weightlist1" name="form.weight" id="eeee1" onkeypress="return isNumberKey(this,event)" cssClass="form-control three"  theme="simple" headerKey="" headerValue="Enter Weight" > </s:select></td>

 <%-- </s:if>
   
   <s:else>
   <td><s:select list="weightlist1" name="form.weight" onkeypress="return isNumberKey(this,event)" cssClass="form-control" theme="simple" headerKey="" headerValue="Enter Weight"/></td>
   </s:else> --%>
   <td><s:textfield name="form.open" readonly="true"  onkeypress="return isNumberKey(this,event)"   cssClass="form-control price valu1"  placeholder="Enter Opening Stock"  theme="simple"></s:textfield></td>
   <td><s:textfield name="form.pack"  onkeypress="return isNumberKey(this,event)" id="digit1" cssClass="form-control price2"   placeholder="Enter Number of Packed Items" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.noofKgsPacked" readonly="true" onkeypress="return isNumberKey(this,event)" id="exp1" cssClass="form-control price3"   placeholder="Enter Number of kgs packed" theme="simple"></s:textfield></td>
   </tr>
       <% } %>  
</table>
<table class="table table-bordered table-responsive  weight-table weight-table22">
   <tr>
   <td style="width: 570px" class="text-center"><b>Total Production</b></td>  
   <td><s:textfield name="form.totalOpeningStock" id="totalPrice1" cssClass="form-control"  placeholder="Enter Opening Stock" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalPackedBags" id="totalPrice2" cssClass="form-control"  placeholder="Enter Packed Bags" readonly="true" theme="simple"></s:textfield></td>
   <td><s:textfield name="form.totalNoofkgsPacked" id="totalPrice3" cssClass="form-control"  placeholder="Enter Dispatch" readonly="true" theme="simple"></s:textfield></td>
<!--<td><s:textfield name="form.totalDisclose"  id="totalPrice4" cssClass="form-control"  placeholder="Enter Closing" readonly="true" theme="simple"></s:textfield></td>-->
   </tr>
</table>
                   
  <br/><br/>
                             
    <div class="form-group">
      <div class="col-sm-6 text-center" id="two">
          <s:submit label="Update" cssClass="btn btn-primary" align="center"></s:submit> 
      </div>
      <div class="col-sm-6 text-center">
         <button type="reset" class="btn btn-primary">Cancel</button>
      </div>
    </div>
</s:form>
</center>
</div>
</div>
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
 
<script>
//                 $(document).ready(function () {
//   // $('.weight-table tr').on('mousemove', function () {
//           
//      
//              $('.weight-table tr').each(function () {
//              $("#tri").click(function() {
//             var boxtype1=$(this).find("#tri option:selected").text();     
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
//                });
//            //  });
//                     return false;
//                                        });
//                                    }); 
    
</script>
 
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
   <script>
       $(document).ready(function () {
         
            var nn = 0;
           
              var an1=new Array();
               //stocklist--count from readytopack
             an1=<s:property value="countlist11"/>;
         //  alert(an1);
 
               var an2=new Array();
               //stocklist--readytopakckgs from readytopack
             an2 =<s:property value="stocklist"/>;
          // alert("sdfdf----sdf-------------"+an2);
         
          var zn=new Array();
          //weightlistbf--counts_db from child packing table
                zn=<s:property value="weightlistbf"/>;
             // alert("sdgdgfdgfdgfdgfdgfd"+zn);
         
           var b2=new Array();
           //stocklist2--open_stock From counts table
                  b2=<s:property value="stocklist2"/>;
                 // alert("ksdfkj9-----09----------3");
                 // alert("sdgdgfdgfdgfdgfdgfd"+b2);
                  
             $('.weight-table tr').on('mousemove', function () {
              $('.weight-table tr').each(function () {
                 var  countttn = $(this).find("#cout option:selected").val();
                 var cc=$(this).find("#cout option:selected").text();
                 if(cc==='Select Count') {  
                   $(this).find('input.valu1').val(""); 
                           }
                 if(cc!=='Select Count') {
                    var vvv=parseInt(countttn);
                    var size=zn.length;
                  //  alert("********-------******-----"+vvv);
                  if(cc.length!==0)  {
                   
                   if(zn.length===0) {
                       var b1=new Array();
                   b1=<s:property value="countlist22"/>;
          
                        for(var i=0;i<b1.length;i++) {
                       
                     var a3=parseInt(b1[i]);
                     
                      var c1;
                     
                     if(zn.length===0) {
                        c1=parseInt(b2[i]); 
                     }
                     else {
                        c1=parseInt(an2[i]); 
                    }    
                       var a4=parseFloat(c1);
                       var a5=parseFloat(an2[i]);
                       var count=parseInt(an1[i]);
                  
                         if(vvv.valueOf()===a3.valueOf() && vvv.valueOf()===count.valueOf()) {
                          
                           if(a4){
                               if(a5){
                            nn=a4+a5;
                        }else {
                            nn=a4;
                        }
                    }else if(a5){
                        nn=a5;
                    }else
                        nn=0;
                   // alert("ksjhdfkshfiiu------");
                  //  alert("sdfdsf-------sdf"+a4+"--------dfgkjdg834-------sf----"+a5+"---.-"+nn);
                        
                              if (nn !== "NaN") 
                                 // alert("haaaaaa");
                                  var opp= $(this).find('input.valu1').val();
                                 // alert(opp);
                                  if(opp.length===0){
                                   // alert("sdfsdfsdf");
                                   $(this).find('input.valu1').val(nn);
                               }
                                     } else {
                                  $(this).find('input.valu1').val("");
                                       }
                                    }
                            if(vvv.valueOf()===a3.valueOf() && vvv.valueOf()!==count.valueOf()) {
                            nn=a4;
                              if (nn !== "NaN") {
                                   //alert("in elssseeeeee"+opp);
                                   var opp= $(this).find('input.valu1').val();
                                  // alert("in elssseeeeee"+opp);
                                  if(opp.length===0){
                                   $(this).find('input.valu1').val(nn);
                               }           
                               } else {
                                  $(this).find('input.valu1').val("");
                                       }
                                    }
                             } 
                  
            else if(zn.length!==0)
            {
               
              //   alert("ksjhdfkshfiiu---***---in else vvv----*->"+vvv);
             for(var i=0;i<an1.length;i++) {
                  //   alert("ksjhdfkshfiiu---***---**bjjjj**--");
                     if(zn.length===0) {
                   //      alert('OOOOOOOOOOOOO');
                     }
                     else {
                          
                        c1=parseInt(an2[i]); 
                    //     alert('OOOOOOOOOOOOO000----OOO0'+c1);
                    }    
                       var a4=parseFloat(c1);
                   //    alert('OOOOOOOOOOOOO0nnn...nnnn00----OOO0'+a4);
                       var count=parseInt(an1[i]);
                     //   alert('-------nnn...nnnn00----OOO0--count-->'+count+"......------vvv-->"+vvv);
                         var vvvx=parseInt(countttn);
                     //    alert("........oooo..........*---vvvx---------->"+vvvx);
                         if(vvvx.valueOf()===count.valueOf()) {
                         //    alert('OOOOOOOOO**OOOO0nnn****...nnnn00----OOO0'+a4);
                             if(a4===0) {
                              var os=parseInt(b2[i]);
                              nn=os;
                                }
                                else {
                                   nn=a4;  
                                }
                             //    alert('OOOOOOOOOOOOO0nnnnnnn00----OOO0'+c1);
                              if (nn !== "NaN") {
                                    var opp= $(this).find('input.valu1').val();
                            //        alert("in else idfffffff"+opp);
                                  if(opp.length===0){
                                   $(this).find('input.valu1').val(nn);
                               }
                                 // var ccot= $row.find(':nth-child(1)').text()
                                     // var ccot= $(".ccoout").parent().prev()[0];
                                     } 
                               else {
                                  $(this).find('input.valu1').val("");
                                       }
                                    }
                             }
            }     }
}
                                            });
                                            return false;
                                        });
                                    });
  </script>
  
  
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">

function validateForm() {
       var x=$("#totalPrice1").val();
       var y=$("#totalPrice2").val();
       var z=$("#totalPrice3").val();
       var a=$("#totalPrice4").val();
      // alert("haiiii");
       
      // $("#one1").find("input,button,textarea,select").contentEditable = true;
  
   if((x==='0'||y==='0'||z==='0'||a==='0')||(($("#totalPrice1").val()).length===0 ||($("#totalPrice2").val()).length===0||($("#totalPrice3").val()).length===0)||($("#totalPrice3").val()).length===0){
        alert("Please fill Packing Material Data");
        return false;
    }else{
     $('#one1').find('input, textarea, button, select').removeAttr("disabled");
   // alert("enabled");
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
     $("#two1").find("input,button,textarea,select").attr("disabled", "disabled");
 }
 else{
     $("#goButton").hide();
      $("#part1").find("input,button,textarea,select").attr("disabled", "disabled");
 }
}
</script>

<script language="javascript">
    $('.price').mouseenter(function () {
    var sum = 0;
    $('.price').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice1').val(sum);
     });
     
     
 function retrievestock() {
    var a1=new Array();
     a1 =<s:property value="countlist11"/>;
   
     var a2=new Array();
     a2 =<s:property value="stocklist"/>;
   
     
     var size=a1.length;
     var count = parseInt($('#count').val());
     alert(count);
     
     for(var i=0;i<size;i++) {
         var a3=parseInt(a1[i]);
         var a4=parseFloat(a2[i]);
         if(count.valueOf()===a3.valueOf()) {
             $('#valu1').val(a4); 
         }
     }    
  
 }
 
 function abc(){
            var sum = 0;
      $('.price').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice1').val(sum);
 }
 
$('.price2').mouseenter(function () {
    var sum = 0;
    $('.price2').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice2').val(sum); 
});

function def(){
       var sum = 0;
     $('.price2').each(function() {
        sum += Number($(this).val());
    });
       $('#totalPrice2').val(sum);
 }
 
$('.price3').mousemove(function () {
    var sum = 0;
    $('.price3').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice3').val(sum);  
   
}); 

function ghi(){
     var sum = 0;
      $('.price3').each(function() {
        sum += Number($(this).val());
    });
     $('#totalPrice3').val(sum);
}

$('.price4').mouseenter(function () {
    var sum = 0;
    $('.price4').each(function() {
        sum += Number($(this).val());
    });
    $('#totalPrice4').val(sum);
});  
     
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

/*function closing1(){
   
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
                } */
/*var content = $('#valu2').val();
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
                } */
    
<%--    $(document).ready(function () {
                                yourFunction();
                                $('.one').attr("readonly", true);
                                $('.two').attr("readonly", true);
                                $('.three').attr("readonly", true);
                                $('.four').attr("readonly", true);
                                $('.five').attr("readonly", true);
                                $("#emp").keyup(function () {
                                     if (($("#emp").val()).length === 0) {
                                        $('.one').attr("readonly", true);
                                        $('.two').attr("readonly", true);
                                        $('.three').attr("readonly", true);
                                        $('.four').attr("readonly", true);
                                        $('.five').attr("readonly", true);
                                        $('.one').val("");
                                        $('.two').val("");
                                        $('.three').val("");
                                        $('.four').val("");
                                    }
                                });
                                $('#emp').blur(function () {
                                    if (($('#emp').val()).length !== 0) {
                                        
                                                $("#a1").val("");
                                                $("#a1").attr("readonly", true);
                                                $("#valu1").val("");
                                                $("#valu1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                                $("#b1").val("");
                                                $("#b1").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#exp1").val("");
                                                $("#exp1").attr("readonly", true);
                                    }
                                
                                 if (($("#emp").val()).length === 0) {
                                        $("#a1").attr("readonly", false);
                                        $("#a1").focus();
                                    }
                               });
                                $("#a1").blur(function () {
                                if (($("#a1").val()).length === 0) {
                                                $("#valu1").val("");
                                                $("#valu1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                                $("#b1").val("");
                                                $("#b1").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#exp1").val("");
                                                $("#exp1").attr("readonly", true);

                                            }
                                        

                                    if (($("#a1").val()).length === 0) {
                                        $("#b1").attr("readonly", false);
                                        $("#b1").focus();
                                    }
                                });
                                 $("#b1").blur(function () {
                                           if (($("#b1").val()).length === 0) {
                                                $("#valu1").val("");
                                                $("#valu1").attr("readonly", true);
                                                $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                                $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#exp1").val("");
                                                $("#exp1").attr("readonly", true);
                                            }
                                      
                                  
                                    if (($("#b1").val()).length !== 0) {
                                        $("#valu1").attr("readonly", false);
                                        $("#valu1").focus();
                                    }
                                });
                                $("#valu1").blur(function () {
                                        if (($("#valu1").val()).length === 0) {
                                               $("#digit1").val("");
                                                $("#digit1").attr("readonly", true);
                                                $("#exp1").val("");
                                                $("#exp1").attr("readonly", true);
                                                 $("#data1").val("");
                                                $("#data1").attr("readonly", true);
                                            }
                                       
                                    if (($("#valu1").val()).length !== 0) {
                                        $("#exp1").attr("readonly", false);
                                        $("#exp1").focus();
                                        $("#digit1").attr("readonly", false);
                                        $("#digit1").focus();
                                    }
                                });
                       
                       }); --%>                          
</script>
    
</body>
</html>
