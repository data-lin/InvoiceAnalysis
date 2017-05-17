<%@ page language="java" import="java.util.*,net.sf.json.JSONObject"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<!-- 引入 ECharts 文件 -->
<script src="js/echarts.js"></script>
<!-- 引入echarts主题 -->
<script type="text/javascript" src="js/shine.js"></script>
<script type="text/javascript" src="js/roma.js"></script>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="css/nprogress.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.jsp" class="site_title"><i class="fa fa-paw"></i>
							<span>发票数据分析系统</span> </a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="images/img.jpg" alt="..."
								class="img-circle profile_img">
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
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>数据分析</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> 进销项数据对比 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/contrastmonth">月度统计</a>
										</li>
										<li><a href="cn.edu.gdpu.servlet/contrastyear">年度统计</a>
										</li>
									</ul>
								</li>
								<li><a><i class="fa fa-edit"></i> 进项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthinput">月度统计</a></li>
										<li><a href="cn.edu.gdpu.servlet/yearinput">年度统计</a></li>
									</ul>
								</li>
								<li><a><i class="fa fa-desktop"></i> 销项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthoutput">月度统计</a></li>
										<li><a href="cn.edu.gdpu.servlet/yearoutput">年度统计</a></li>
									</ul>
								</li>
							</ul>
						</div>

						<div class="menu_section">
							<h3>数据管理</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> 进项发票信息 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/inputservlet?showPage=1">数据展示</a>
										</li>
										<li><a href="html/addinputinvoice.jsp">数据录入</a></li>

									</ul>
								</li>
								<li><a><i class="fa fa-windows"></i> 销项发票信息 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/outputservlet">数据展示</a>
										</li>
										<li><a href="html/addoutputinvoice.jsp">数据录入</a></li>
									</ul>
								</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
			<!-- /sidebar menu -->

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i> </a>
					</div>

					<ul class="nav navbar-nav navbar-right">
						<li class=""><a href="javascript:;"
							class="user-profile dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"> <img src="images/img.jpg" alt="">lindatachn
								<span class=" fa fa-angle-down"></span> </a>
							<ul class="dropdown-menu dropdown-usermenu pull-right">
								<li><a href="index.jsp"><i
										class="fa fa-sign-out pull-right"></i> Log Out</a></li>
							</ul>
						</li>
					</ul>

					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">

				<!-- 插入一个搜索，按照输入的月份显示该月份的统计表格 -->
				<div>
					<form role="form">
						<label>输入月份</label> <input type="date" name="select_date"
							id="select_date" value="" />
						<button type="submit" class="btn btn-primary">提交</button>
					</form>
				</div>
				<!-- 搜索代码结束 -->

				<!--统计图  -->
				<div class="row clearfix">
					<div class="col-md-7 column">
						<h3>xx月各类药物卖出情况-折线图</h3>
						<!--折线图-->
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
						<div id="main2" style="width: 605px;height:440px"></div>

						<script type="text/javascript">
							// 基于准备好的dom，初始化echarts实例
							var myChart2 = echarts.init(document
									.getElementById('main2'), 'shine');

							option2 = {
								title : {
									text : ' ',
									subtext : '单位：元'
								},
								tooltip : {
									trigger : 'axis'
								},
								legend : {
									data : [ '当月卖出金额' ]
								},
								xAxis : {
									type : 'category',
									boundaryGap : false,
									data : [ '预防药物', '诊断药物', '治疗药物', '药剂附加药物',
											'其他药物' ]
								},
								yAxis : {
									type : 'value',
									axisLabel : {
										formatter : '{value} 元'
									}
								},
								series : [ {
									name : '当月卖出情况',
									type : 'line',
									data : [ 11000, 13400, 15700, 23100, 12800 ],
									markPoint : {
										symbol : 'circle',
										data : [ {
											type : 'max',
											name : '最大值'
										}, {
											type : 'min',
											name : '最小值'
										} ]
									},
									markLine : {
										data : [ {
											type : 'average',
											name : '平均值'
										} ]
									}
								} ]
							};
							// 使用刚指定的配置项和数据显示图表。
							myChart2.setOption(option2);
						</script>
						<!--/折线图-->

					</div>
					<div class="col-md-5 column">
						<h3>xx月各类药物卖出情况-饼图</h3>
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
						<div id="main3" style="width: 500px;height:440px"></div>

						<script type="text/javascript">
							// 基于准备好的dom，初始化echarts实例
							var myChart3 = echarts.init(document
									.getElementById('main3'), 'shine');

							option3 = {
								title : {
									text : ' ',
									subtext : '单位：元',
									x : 'center'
								},
								tooltip : {
									trigger : 'item',
									formatter : "{a} <br/>{b} : {c} ({d}%)"
								},
								legend : {
									orient : 'vertical',
									left : 'left',
									data : [ '预防药物', '诊断药物', '治疗药物', '药剂附加药物',
											'其他药物' ]
								},
								series : [ {
									name : '当月卖出金额',
									type : 'pie',
									radius : '55%',
									center : [ '50%', '60%' ],
									data : [ {
										value : 11000,
										name : '预防药物'
									}, {
										value : 13400,
										name : '诊断药物'
									}, {
										value : 15700,
										name : '治疗药物'
									}, {
										value : 23100,
										name : '药剂附加药物'
									}, {
										value : 12800,
										name : '其他药物'
									},

									],
									itemStyle : {
										emphasis : {
											shadowBlur : 10,
											shadowOffsetX : 0,
											shadowColor : 'rgba(0, 0, 0, 0.5)'
										}
									}
								} ]
							};

							// 使用刚指定的配置项和数据显示图表。
							myChart3.setOption(option3);
						</script>
					</div>

				</div>
				<!--/统计图  -->
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">
				InvoiceAnalysis - design by <a href="index.jsp">抓娃微步</a>
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
</body>
</html>
