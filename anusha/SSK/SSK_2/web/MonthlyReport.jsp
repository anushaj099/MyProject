<%-- 
    Document   : ReportManager
    Created on : Jul 1, 2017, 4:11:06 PM
    Author     : Swathi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sai Venkata Krishna Ready Mix Industry</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
   <style type="text/css">
            
            label[for="i"] {
                font-family:sans-serif;
                font-style: normal;
                color: black;
                font-size: 10pt;
                padding-bottom: 10px;
                padding-left: 100px;
            } 
           
    </style>
            
<style type="text/css">
    #s
    {
        width: 100px;
        height: 40px;
        margin-left: 150px;
    }
 
</style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
          <s:iterator value="ulist" var="myobj"> 
            <%@include  file="upperpage1.jsp" %>
            
          </s:iterator>
        
        <br/><br/>
      
         
        <section class="content">
                 <div class="col-md-6">
           <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Monthly Report Chart: Invoice's Per Month</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                 <canvas id="myChart1" ></canvas>
             <div id="legendDiv"></div>
              </div>
            </div>
            <!-- /.box-body -->
          </div> 
                     
          <div class="box box-primary">
            <div class="box-header with-border">
            
              <h3 class="box-title">Sale of No. of Grades in current month</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <canvas id="myChart"></canvas>
            </div>
            <!-- /.box-body-->
          </div>
                     
              
                     
                      </div>
        <div class="col-md-6">
            <div class="box box-primary">
                 <div class="box-header with-border">
              <h3 class="box-title">Monthly Report Chart: Percentage wise</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
                     <div id="container" style="min-width: 310px; height: 255px; max-width: 600px; margin: 0 auto"></div>
        </div>
             <div class="box box-primary">
             <div class="box">
            <div class="box-header">
              <h3 class="box-title">Top 5 Suppliers</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
                <table class="table table-striped EventDetail" border="0" style="height: 250px; max-width: 600px;">
                <tr>
                  <th style="width: 10px">No.</th>
                  <th>Supplier Name</th>
                  <th>Progress</th>
                  <th style="width: 40px">Total Invoices</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td><input style="border:none"  type="text" id="row1" value="" readonly="true"/></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><input style="border:none"  type="text" id="col1" value="" readonly="true"/></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td><input style="border:none"  type="text" id="row2"  value="" readonly="true"/></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><input style="border:none"  type="text" id="col2" value="" readonly="true"/></td>
                </tr>
                <tr>
                  <td>3.</td>
                   <td><input style="border:none"  type="text" id="row3"  value="" readonly="true"/></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><input style="border:none"  type="text" id="col3" value="" readonly="true"/></td>
                </tr>
                <tr>
                  <td>4.</td>
                   <td><input style="border:none"  type="text" id="row4"  value="" readonly="true"/></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 35%"></div>
                    </div>
                  </td>
                  <td><input style="border:none"  type="text" id="col4" value="" readonly="true"/></td>
                </tr>
                <tr>
                  <td>5.</td>
                   <td><input style="border:none"  type="text" id="row5"  value="" readonly="true"/></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 20%"></div>
                    </div>
                  </td>
                  <td><input style="border:none"  type="text" id="col5" value="" readonly="true"/></td>
                </tr>
              </table>
            </div>
         
        </div>
             </div>
        </div>
        </section>
        </div>
<%@include file="Footer.jsp" %>
<!--        <div class="container">
  <h2>Chart.js — Bar Chart Demo</h2>
  <div>
    <canvas id="myChart"></canvas>
  </div>
</div>       -->
       
         
        <!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
<!-- page script -->
<!-- page script -->

    <script>
        var a1=<s:property value="suplist"/>;
        var a2=<s:property value="supcountlist"/>;
        
     //   alert(a1);
     //   alert(a2);
        
        var row1= $('#row1').val(a1[0]);
        var row2= $('#row2').val(a1[1]);
         var row3= $('#row3').val(a1[2]);
          var row4= $('#row4').val(a1[3]);
            var row5= $('#row5').val(a1[4]);
            
           var col1= $('#col1').val(a2[0]);
        var col2= $('#col2').val(a2[1]);
         var col3= $('#col3').val(a2[2]);
          var col4= $('#col4').val(a2[3]);
            var col5= $('#col5').val(a2[4]); 
            
            
    
     </script>




<script>
 $('.EventDetail tr').find('td:eq(2):empty').parent().hide();
  </script>

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

    <script>
   var ctx = document.getElementById("myChart").getContext('2d');

var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: <s:property value="reportlist"/>,
    datasets: [{
      label: 'No. of Sales',
      data: <s:property value="gradecount"/>,
      backgroundColor: "rgba(0,0,255,0.3)"
    }]
  }
});
    </script>
    
  
    
   <script> 
      
   var ctx = document.getElementById('myChart1').getContext('2d');
    var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: <s:property value="rlist"/>,
    datasets: [{
      label: 'Invoice',
      data: <s:property value="invlist"/>,
      backgroundColor: "rgba(0,0,255,0.3)"
    }]
  }
});

</script>

    
    <script>
    
    
    $(function () {
        var name = <s:property value="rlist"/>;
        var data = <s:property value="invlist"/>;
    var final = [];
    
    for(var i=0; i < name.length; i++) {
    	final.push({
            name: name[i],
            y: data[i]			 
        }); 	   
    }    
    
    
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Monthly Sales Percentage Chart'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: "Invoice",
            colorByPoint: true,
            data: final
        }]
    });
});
    
    
    </script>
    
    

    </body>
</html>
