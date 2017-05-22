<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="cn.edu.gdpu.bean.*,cn.edu.gdpu.dao.*"
	contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>企业增值税发票数据分析系统</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="css/nprogress.css" rel="stylesheet">
	<link href="css/MyStyle.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
  </head>
  
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>发票数据分析系统</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>lindatachn</h2>
              </div>
              <div class="clearfix"></div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>数据分析</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> 进销项数据对比 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
<!--                       <li><a href="cn.edu.gdpu.servlet/contrastmonth">月度统计</a></li>
 -->                      <li><a href="cn.edu.gdpu.servlet/contrastyear">年度统计</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 进项发票统计 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="cn.edu.gdpu.servlet/monthinput?ym=12-01">月度统计</a></li>
                      <li><a href="cn.edu.gdpu.servlet/yearinput">年度统计</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 销项发票统计 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="cn.edu.gdpu.servlet/monthoutput?ym=12-01">月度统计</a></li>
                      <li><a href="cn.edu.gdpu.servlet/yearoutput">年度统计</a></li>
                    </ul>
                  </li>

                </ul>
              </div>
              <div class="menu_section">
                <h3>数据管理</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> 进项发票信息  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="cn.edu.gdpu.servlet/inputservlet?showPage=1">数据展示</a></li>
                      <li><a href="html/addinputinvoice.jsp">数据录入</a></li>

                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 销项发票信息 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="cn.edu.gdpu.servlet/outputservlet">数据展示</a></li>
                      <li><a href="html/addoutputinvoice.jsp">数据录入</a></li>

                    </ul>
                  </li>                
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->

            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">lindatachn
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="index.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>进项发票数据</h3>
              </div>


            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">请输入进项发票信息：</h3>
					</div>
					<div class="panel-body">
						<form action="cn.edu.gdpu.servlet/addinputservlet" id="addForm" method="post">
							<fieldset>
								<div class="form-group alert-text">
									<input class="form-control" placeholder="发票代码：" type="text" 
										name="code" id="code"/>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="发票号码：" type="text"
										name="number" id="number">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="开票日期" type="date"
										name="date" id="date">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="客户名称：" type="text"
										name="customer" id="customer">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="金额：(保留两位小数)" type="text"
										name="sum" id="sum">
								</div>
								
								<select class="form-control" name="type">
									<option >请选择发票类型</option>
								  	<option value ="1">办公用品类</option>
								  	<option value ="2">生活开支类</option>
								  	<option value="3">原材料类</option>
								  	<option value="4">医疗仪器类</option>
								  	<option value="5">服务行业类</option>
								  	<option value="6">餐饮业类</option>
								  	<option value="7">运输行业类</option>
								  	<option value="8">建筑安装行业类</option>
								</select>
								<br>
								
								
								<input type="button" value="添加" id="add_btn"
									class="btn btn-lg btn-success btn-block">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">
				InvoiceAnalysis - design by <a
					href="index.jsp">抓娃微步</a>
			</div>
			<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="js/nprogress.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$('#add_btn').click(function(){
				var code = $('#code').val();
				var number = $('#number').val();
				var date = $('#date').val();
				var customer = $('#customer').val();
				var sum = $('#sum').val();
				
				//发票代码：
				if(code==null || code==""){
					$('#code').attr("placeholder","发票代码不能为空");
					$('#code').addClass("alert-error");
					setTimeout("$('#code').attr(\"placeholder\",\"发票代码：\")",3000);
					setTimeout("$('#code').removeClass(\"alert-error\")",3000);
				}
				
				//发票号码：
				if(date==null || date==""){
					$('#date').attr("placeholder","发票号码不能为空");
					$('#date').addClass("alert-error");
					setTimeout("$('#date').attr(\"placeholder\",\"发票号码：\")",3000);
					setTimeout("$('#date').removeClass(\"alert-error\")",3000);
				}
				
				//发票号码：
				if(number==null || number==""){
					$('#number').attr("placeholder","发票号码不能为空");
					$('#number').addClass("alert-error");
					setTimeout("$('#number').attr(\"placeholder\",\"发票号码：\")",3000);
					setTimeout("$('#number').removeClass(\"alert-error\")",3000);
				}
				
				//开票日期：
				if(date==null || date==""){
					$('#date').addClass("alert-error");
					setTimeout("$('#date').removeClass(\"alert-error\")",3000);
				}
				
				//客户名称：
				if(customer==null || customer==""){
					$('#customer').attr("placeholder","客户名称不能为空");
					$('#customer').addClass("alert-error");
					setTimeout("$('#customer').attr(\"placeholder\",\"客户名称：\")",3000);
					setTimeout("$('#customer').removeClass(\"alert-error\")",3000);
				}
				
				//金额：
				if(sum==null || sum==""){
					$('#sum').attr("placeholder","金额不能为空");
					$('#sum').addClass("alert-error");
					setTimeout("$('#sum').attr(\"placeholder\",\"金额：(保留两位小数)\")",3000);
					setTimeout("$('#sum').removeClass(\"alert-error\")",3000);
				}
				
				if(code!=null && code!="" 
					&& date!=null && date!="" 
					&& customer!=null && customer!="" 
					&& sum!=null && sum!=""){
					$('#addForm').submit();
				}
    		});
    	});
    </script>
  </body>
</html>