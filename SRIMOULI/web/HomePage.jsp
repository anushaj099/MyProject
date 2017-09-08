<%-- 
    Document   : HomePage
    Created on : Dec 6, 2016, 11:51:34 AM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
      <%@taglib prefix="sj" uri="/struts-jquery-tags"%>
 
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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body style="background-color: #EEEEEE"> 
       
 <script type="text/javascript">
var nameStatus = "";
var nameStat = "";
var nameStatus3="",nameStatus4="",nameStatus5="",nameStatus6="",nameStatus7="",nameStatus8="";
function test(){
    nameStatus="hide";
    }

function test2(){
     nameStat="hide";
    
}
function test3(){
     nameStatus3="hide";
}
function test4(){
     nameStatus4="hide";
}
function test5(){
     nameStatus5="hide";
}
function test6(){
     nameStatus6="hide";
}
function test7(){
     nameStatus7="hide";
}
function test8(){
     nameStatus8="hide";
}
function decite(){
  if(!nameStatus==='hide'){
     nameStatus="show";
 }
     
}
function decite2(){
  
    if(!nameStat==='hide')
     nameStat="show";
     
}
function decite3(){
  
   if(!nameStatus3==='hide')
     nameStatus3="show";
}
function decite4(){
  
    if(!nameStatus4==='hide')
     nameStatus4="show";
}
function decite5(){
  
    if(!nameStatus5==='hide')
     nameStatus5="show";
}
function decite6(){
  
    if(!nameStatus6==='hide')
     nameStatus6="show";
}
function decite7(){
  
    if(!nameStatus7==='hide')
     nameStatus7="show";
}
function decite8(){
  
    if(!nameStatus8==='hide')
     nameStatus8="show";
}
 

           
     // alert("inside test------------>"+nameStat);
     //alert(nameStatus);
    
       </script>
 
      
       
             <s:if test="%{xyz==1000}">
                 <script>
                     window.alert('Password Changed Successfully');
                 </script>
        </s:if>
            <% int id = 0;
             session.setAttribute("id", id);%>
                <s:iterator value="ulist" status="stat"> 
                    <s:if test="%{#stat.index==0}">
            <%@include file="Upperpage.jsp" %>
                    </s:if>
                </s:iterator>
             
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">   Welcome to Sri Mouli Textiles Private Limited</h1>
                </div>
            </div>
            <!-- Page Content -->   
            <!-- /.row -->
            <!-- Projects Row -->
            
       
               <div class="container">
                    <!-- Page Heading -->

                    <div class="row">
                         <s:iterator value="ulist" var="myobj"> 
                             <s:if test="#myobj.loginType == 'godown'">
                                <script type="text/javascript"> test()</script>
                        <div class="col-md-3 portfolio-item">               
                            <a href="godownHome?id=<s:property value="id" /> ">
                                <div class="dashboard1 godown"><h3 class="text-center">Godown</h3></div>
                            </a>
                                 </div>
                                
                        </s:if>
                                <s:else>
                                      <script type="text/javascript"> decite()</script>
                                </s:else>
                               
                        </s:iterator>
                  <div class="col-md-3 portfolio-item" id="butt1">
                       <div class="dashboard1 godown disabled1"><h3 class="text-center">Godown</h3></div>
                 </div>
                       
                        
                         <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'carding'">
                                  <script type="text/javascript"> test2()</script>
                        <div class="col-md-3 portfolio-item"> 
                        <a href="cardingDashboard?id=<s:property value="id" /> " data-toggle="tooltip" data-placement="bottom" title="Edit"">
                                    <div class="dashboard1 carding"><h3 class="text-center">Carding</h3></div>
                                </a>
                        </div>
                            </s:if>
                                   <s:else>
                                      <script type="text/javascript"> decite2()</script>
                                </s:else>
                               
                        </s:iterator>
                    <div class="col-md-3 portfolio-item" id="butt2">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                    </div>
                        
                          <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'drawing'">
                                  <script type="text/javascript"> test3()</script>
                        <div class="col-md-3 portfolio-item">
                            <a href="drawingDashboard?id=<s:property value="id" />">
                                        <div class="dashboard1 drawing"><h3 class="text-center">Drawing</h3></div>
                                    </a>
                        </div>
                         </s:if>
                                   <s:else>
                                      <script type="text/javascript"> decite3()</script>
                                </s:else>
                        </s:iterator>
                   <div class="col-md-3 portfolio-item" id="Button3">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Drawing</h3></div>
                    </div>
                        
                        <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'openend'">
                                 <script type="text/javascript"> test4()</script>
                        <div class="col-md-3 portfolio-item">
                            <a href="openendDashboard?id=<s:property value="id" />">
                            <div class="dashboard1 oe"><h3 class="text-center">Open End (OE)</h3></div>
                            </a>
                        </div>
                         </s:if>
                                  <s:else>
                                      <script type="text/javascript"> decite4()</script>
                                </s:else>
                        </s:iterator>
                                 
              <div class="col-md-3 portfolio-item" id="Button4">
                         <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                    </div>
                        
                    </div>
                    <!-- /.row -->  
                    <!-- Projects Row -->
                    <div class="row">
                         <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'quality'">
                         <script type="text/javascript"> test5()</script>
                        <div class="col-md-3 portfolio-item">
                           <a href="qualityDashboard?id=<s:property value="id" />">
                            <div class="dashboard1 quality"><h3 class="text-center">Quality</h3></div>
                           </a>
                        </div>
                            </s:if>
                         <s:else>
                             <script type="text/javascript"> decite5()</script>
                         </s:else>
                        </s:iterator>
                        <div class="col-md-3 portfolio-item" id="Button5">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Quality</h3></div>
                    </div>
                         <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'packing'">
                                  <script type="text/javascript"> test6()</script>
                        <div class="col-md-3 portfolio-item">
                             <a href="packinghome?id=<s:property value="id" />">
                                     <div class="dashboard1 packing"><h3 class="text-center">Packing</h3></div>
                         </a>
                        </div>
                          </s:if>
                         <s:else>
                             <script type="text/javascript"> decite6()</script>
                         </s:else>
                        </s:iterator>
                        <div class="col-md-3 portfolio-item" id="Button6">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Packing</h3></div>
                    </div>
                        <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'electricity'">
                                  <script type="text/javascript"> test7()</script>
                        <div class="col-md-3 portfolio-item">
                           <a href="super?id=<s:property value="id" />">
                                <div class="dashboard1 power"><h3 class="text-center">Power</h3></div>
                              </a>
                        </div>
                         </s:if>
                      <s:else>
                             <script type="text/javascript"> decite7()</script>
                         </s:else>
                        </s:iterator>
                 <div class="col-md-3 portfolio-item" id="Button7">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Power</h3></div>
                    </div>
                             
            <s:set var="abortLoop" value="%{false}"/>
<s:iterator value="ulist" var="myobj" > 
   <s:if test="%{!#abortLoop}">
         <s:if test="#myobj.designation == 'Data Entry'">
         <script type="text/javascript"> test8();</script>
         <div class="col-md-3 portfolio-item">
         <a href="settingsHome?id=<s:property value="id" />">
         <div class="dashboard1 settings"><h3 class="text-center">Settings</h3></div>
                        </a>
                      </div>
                         </s:if>
         <s:set var="abortLoop" value="%{true}"/>
   </s:if>
                      <s:else>
                             <script type="text/javascript"> decite8();</script>
                         </s:else>
                        </s:iterator>
                   <div class="col-md-3 portfolio-item" id="Button8">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Settings</h3></div>
                    </div>
                        <%--   <s:iterator value="ulist" var="myobj" > 
                             <s:if test="#myobj.loginType == 'control'">
                                  <script type="text/javascript"> test8()</script>
                        <div class="col-md-3 portfolio-item">
                            <a href="settingsHome?id=<s:property value="id" />">
                                <div class="dashboard1 settings"><h3 class="text-center">Settings</h3></div>
                       </a>
                        </div>
                          </s:if>
                     <s:else>
                             <script type="text/javascript"> decite8()</script>
                         </s:else>
                        </s:iterator>
                     <div class="col-md-3 portfolio-item" id="Button8">
                         <div class="dashboard1 carding disabled1"><h3 class="text-center">Settings</h3></div>
                    </div>
                    </div>
                
        
              </s:if>
                <!-- /.row -->    
                <!-- Projects Row -->
                <s:if test="#myobj.loginType == 'carding'">

                    <div class="container">
                        <!-- Page Heading -->
                        <div class="row">
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                            </div>
                            <div class="col-md-3 portfolio-item">
                                <a href="cardingDashboard?id=<s:property value="id" /> " data-toggle="tooltip" data-placement="bottom" title="Edit"">
                                    <div class="dashboard1 carding"><h3 class="text-center">Carding</h3></div>
                                </a>
                            </div>
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 drawing disabled1"><h3 class="text-center">Drawing</h3></div>
                            </div>
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <!-- Projects Row -->
                        <div class="row">
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 quality disabled1"><h3 class="text-center">Quality</h3></div>
                            </div>
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 packing disabled1"><h3 class="text-center">Packing</h3></div>
                            </div>
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 disabled1"><h3 class="text-center">Power</h3></div>
                            </div>
                            <div class="col-md-3 portfolio-item">
                                <div class="dashboard1 disabled1"><h3 class="text-center">Settings</h3></div>
                            </div>
                        </div>
                    </s:if>
                    <!-- /.row -->    


                    <!-- Projects Row -->
                    <s:if test="#myobj.loginType == 'drawing'">             
                        <div class="container">
                            <!-- Page Heading -->
                            <div class="row">
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                                </div>
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                                </div>
                                <div class="col-md-3 portfolio-item">
                                    <a href="drawingDashboard?id=<s:property value="id" />">
                                        <div class="dashboard1 drawing"><h3 class="text-center">Drawing</h3></div>
                                    </a>
                                </div>
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                                </div>
                            </div>
                            <!-- /.row -->
                            <!-- Projects Row -->
                            <div class="row">
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 quality disabled1"><h3 class="text-center">Quality</h3></div>
                                </div>
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 packing disabled1"><h3 class="text-center">Packing</h3></div>
                                </div>
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 disabled1"><h3 class="text-center">Power</h3></div>
                                </div>
                                <div class="col-md-3 portfolio-item">
                                    <div class="dashboard1 disabled1"><h3 class="text-center">Settings</h3></div>
                                </div>
                            </div>
                        </s:if>
                        <!-- /.row -->    


                        <!-- Projects Row -->
                        <s:if test="#myobj.loginType == 'openend'">

                            <div class="container">
                                <!-- Page Heading -->
                                <div class="row">
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                                    </div>
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                                    </div>
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 drawing disabled1"><h3 class="text-center">Drawing</h3></div>
                                    </div>
                                    <div class="col-md-3 portfolio-item">
                                        <a href="openendDashboard?id=<s:property value="id" />">
                                            <div class="dashboard1 oe"><h3 class="text-center">Open End (OE)</h3></div>
                                        </a>
                                    </div>
                                </div>
                                <!-- /.row -->
                                <!-- Projects Row -->
                                <div class="row">
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 quality disabled1"><h3 class="text-center">Quality</h3></div>
                                    </div>
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 packing disabled1"><h3 class="text-center">Packing</h3></div>
                                    </div>
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 disabled1"><h3 class="text-center">Power</h3></div>
                                    </div>
                                    <div class="col-md-3 portfolio-item">
                                        <div class="dashboard1 disabled1"><h3 class="text-center">Settings</h3></div>
                                    </div> 
                                </div>
                            </s:if>
                            <!-- /.row -->    



                            <!-- Projects Row -->
                            <s:if test="#myobj.loginType == 'quality'">

                                <div class="container">
                                    <!-- Page Heading -->
                                    <div class="row">
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                                        </div>
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                                        </div>
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 drawing disabled1"><h3 class="text-center">Drawing</h3></div>
                                        </div>
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                                        </div>
                                    </div>
                                    <!-- /.row -->
                                    <!-- Projects Row -->
                                    <div class="row">
                                        <div class="col-md-3 portfolio-item">
                                            <a href="qualityDashboard?id=<s:property value="id" />">
                                                <div class="dashboard1 quality"><h3 class="text-center">Quality</h3></div>
                                            </a>
                                        </div>
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 packing disabled1"><h3 class="text-center">Packing</h3></div>
                                        </div>
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 disabled1"><h3 class="text-center">Power</h3></div>
                                        </div>
                                        <div class="col-md-3 portfolio-item">
                                            <div class="dashboard1 disabled1"><h3 class="text-center">Settings</h3></div>
                                        </div>
                                    </div>
                                </s:if>
                                <!-- /.row -->    



                                <!-- Projects Row -->
                                <s:if test="#myobj.loginType == 'packing'">

                                    <div class="container">
                                        <!-- Page Heading -->
                                        <div class="row">
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                                            </div>
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                                            </div>
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 drawing disabled1"><h3 class="text-center">Drawing</h3></div>
                                            </div>
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                        <!-- Projects Row -->
                                        <div class="row">
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 disabled1"><h3 class="text-center">Quality</h3></div>
                                            </div>
                                            <div class="col-md-3 portfolio-item">
                                                <a href="packingDashboard?id=<s:property value="id" />">
                                                    <div class="dashboard1 packing"><h3 class="text-center">Packing</h3></div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 disabled1"><h3 class="text-center">Power</h3></div>
                                            </div>
                                            <div class="col-md-3 portfolio-item">
                                                <div class="dashboard1 disabled1"><h3 class="text-center">Settings</h3></div>
                                            </div>

                                        </div>
                                    </s:if>
                                    <!-- /.row -->


                                    <!-- Projects Row -->
                                    <s:if test="#myobj.loginType == 'electricity'">

                                        <div class="container">
                                            <!-- Page Heading -->
                                            <div class="row">
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                                                </div>
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                                                </div>
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 drawing disabled1"><h3 class="text-center">Drawing</h3></div>
                                                </div>
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                                                </div>
                                            </div>
                                            <!-- /.row -->
                                            <!-- Projects Row -->
                                            <div class="row">
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 disabled1"><h3 class="text-center">Quality</h3></div>
                                                </div>
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 packing disabled1"><h3 class="text-center">Packing</h3></div>
                                                </div>
                                                <div class="col-md-3 portfolio-item">
                                                    <a href="super?id=<s:property value="id" />">
                                                        <div class="dashboard1 power disabled1"><h3 class="text-center">Power</h3></div>
                                                    </a>
                                                </div>
                                                <div class="col-md-3 portfolio-item">
                                                    <div class="dashboard1 disabled1"><h3 class="text-center">Settings</h3></div>
                                                </div>

                                            </div>
                                        </s:if>
                                        <!-- /.row -->

                                        <!-- Projects Row -->
                                        <s:if test="#myobj.loginType == 'settings'">

                                            <div class="container">
                                                <!-- Page Heading -->
                                                <div class="row">
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 packing disabled1"><h3 class="text-center">Godown</h3></div>
                                                    </div>
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 carding disabled1"><h3 class="text-center">Carding</h3></div>
                                                    </div>
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 drawing disabled1"><h3 class="text-center">Drawing</h3></div>
                                                    </div>
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 oe disabled1"><h3 class="text-center">Open End (OE)</h3></div>
                                                    </div>
                                                </div>
                                                <!-- /.row -->
                                                <!-- Projects Row -->
                                                <div class="row">
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 quality"><h3 class="text-center">Quality</h3></div>
                                                    </div>
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 packing disabled1"><h3 class="text-center">Packing</h3></div>
                                                    </div>
                                                    <div class="col-md-3 portfolio-item">
                                                        <div class="dashboard1 disabled1"><h3 class="text-center">Power</h3></div>
                                                    </div>
                                                    <div class="col-md-3 portfolio-item">
                                                        <a href="settingsHome?id=<s:property value="id" />">
                                                            <div class="dashboard1 settings disabled1"><h3 class="text-center">Settings</h3></div>
                                                        </a>
                                                    </div>

                                                </div>
                                            </s:if>
                                            <!-- /.row --> --%>
                                            
                                            

                                            <!-- Projects Row --> 
                                            <s:iterator value="ulist" var="myobj" > 
                                            <s:if test="#myobj.loginType == 'control'">            
<script type="text/javascript"> test();test2();test3();test4();test5();test6();test7();test8();</script>
                                                    
                                                    <!-- Page Heading -->
                                                    <div class="row">
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="godownHome?id=<s:property value="id" /> ">
                                                                <div class="dashboard1 godown"><h3 class="text-center">Godown</h3></div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="cardingDashboard?id=<s:property value="id" /> " data-toggle="tooltip" data-placement="bottom" title="Edit">
                                                                <div class="dashboard1 carding"><h3 class="text-center">Carding</h3></div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="drawingDashboard?id=<s:property value="id" /> " data-toggle="tooltip" data-placement="bottom" title="Edit">
                                                                <div class="dashboard1 drawing"><h3 class="text-center">Drawing</h3></div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="openendDashboard?id=<s:property value="id" /> " data-toggle="tooltip" data-placement="bottom" title="Edit">
                                                                <div class="dashboard1 oe"><h3 class="text-center">Open End (OE)</h3></div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <!-- /.row -->
                                                    <!-- Projects Row -->
                                                    <div class="row">
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="qualityDashboard?id=<s:property value="id" /> " data-toggle="tooltip" data-placement="bottom" title="Edit">
                                                                <div class="dashboard1 quality"><h3 class="text-center">Quality</h3></div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="packinghome?id=<s:property value="id" />">
                                                                <div class="dashboard1 packing"><h3 class="text-center">Packing</h3></div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="super?id=<s:property value="id" />">
                                                                <div class="dashboard1 power"><h3 class="text-center">Power</h3></div>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-3 portfolio-item">
                                                            <a href="settingsHome?id=<s:property value="id" />">
                                                                <div class="dashboard1 settings"><h3 class="text-center">Settings</h3></div>
                                                            </a>
                                                        </div>

                                               
                                                </s:if>
                                                </s:iterator>
                                                <!-- /.row -->  
                                                    </div></div>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    // $(window).load(function(){
        (function(){
           
     if(nameStatus==='hide'){
         $("#butt1").hide();
     }
 
      if(nameStat==='hide'){
         $("#butt2").hide();
     }
    
     if(nameStatus3==='hide'){
         $("#Button3").hide();
     }
     if(nameStatus4==='hide'){
         $("#Button4").hide();
     }
     if(nameStatus5==='hide'){
         $("#Button5").hide();
     }
     if(nameStatus6==='hide'){
         $("#Button6").hide();
     }
      if(nameStatus7==='hide'){
         $("#Button7").hide();
     }
      if(nameStatus8==='hide'){
         $("#Button8").hide();
     }
     
 }());
 //});
</script>
                   

 
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
                                       
    </nav>
                                        <!-- /.container -->
                                        <!-- jQuery -->
                                        <script src="js/jquery.js"></script>

                                        <!-- Bootstrap Core JavaScript -->
                                        <script src="js/bootstrap.min.js"></script>

                                        </body>
                                        </html>
