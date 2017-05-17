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
<!-- 引入主题  -->
<script type="text/javascript" src="js/infographic.js"></script>
<script type="text/javascript" src="js/shine.js"></script>
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
										<li><a href="cn.edu.gdpu.servlet/contrastyear">年度统计</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> 进项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthinput">月度统计</a>
										</li>
										<li><a href="cn.edu.gdpu.servlet/yearinput">年度统计</a>
										</li>
									</ul></li>
								<li><a><i class="fa fa-desktop"></i> 销项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthoutput">月度统计</a>
										</li>
										<li><a href="cn.edu.gdpu.servlet/yearoutput">年度统计</a>
										</li>
									</ul></li>

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
										<li><a href="html/addinputinvoice.jsp">数据录入</a>
										</li>

									</ul></li>
								<li><a><i class="fa fa-windows"></i> 销项发票信息 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/outputservlet">数据展示</a>
										</li>
										<li><a href="html/addoutputinvoice.jsp">数据录入</a>
										</li>

									</ul></li>
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
			<%
				JSONObject array = new JSONObject();

				array = (JSONObject) request.getAttribute("array");

				String i = new String();
				i = array.get("sum").toString();

				String j = new String();
				j = i.substring(1, i.length() - 1);

				String str[] = j.split(",");

                int strint[] = new int[str.length];
                
                 for(int index=0;index<str.length;index++){
                      strint[index]=Integer.parseInt(str[index]);
                  }

			%>
			<div class="right_col" role="main">
				<div class="container">


					<div class="row clearfix">
						<h3>&nbsp;&nbsp;进项发票季度统计</h3>
						<div class="col-md-3 column">
							<section class="panel">
							<div class="">
								<h3>春季</h3>
								<h4><%=strint[2]+strint[3]+strint[4] %>元</h4>
							</div>
							</section>
						</div>
						<div class="col-md-3 column">
							<section class="panel">
							<div class="">
								<h3>夏季</h3>
								<h4><%=strint[5]+strint[6]+strint[7] %>元</h4>
							</div>
							</section>
						</div>
						<div class="col-md-3 column">
							<section class="panel">
							<div class="">
								<h3>秋季</h3>
								<h4><%=strint[8]+strint[9]+strint[10] %>元</h4>
							</div>
							</section>
						</div>
						<div class="col-md-3 column">
							<section class="panel">
							<div class="">
								<h3>冬季</h3>
								<h4><%=strint[11]+strint[0]+strint[1] %>元</h4>
							</div>
							</section>
						</div>
					</div>

					<div class="row clearfix">
						<div class="col-md-8 column">
							<h3>进项发票月份总开支-柱状图</h3>
							<!-- 柱状图 -->
							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							<div id="main" style="width: 700px;height:350px; float: left"></div>

							<script type="text/javascript">
								// 基于准备好的dom，初始化echarts实例
								var myChart = echarts.init(document
										.getElementById('main'), 'infographic');
								// 指定图表的配置项和数据

								var option = {
									title : {
										text : '进项发票每月支出统计',
										subtext : '参考数据以月份为单位',
										x : 'center'
									},
									tooltip : {
										trigger : 'axis',
										axisPointer : { // 坐标轴指示器，坐标轴触发有效
											type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
										}
									},
									legend : {
										x : 'right',
										data : [ "金额" ]
									},
									grid : {
										left : '3%',
										right : '4%',
										bottom : '3%',
										containLabel : true
									},
									xAxis : [ {
										type : 'category',
										data :
							<%=array.get("date")%>
								} ],
									yAxis : [ {
										type : 'value'
									} ],
									series : [ {
										name : '金额',
										type : 'bar',
										label : {
											normal : {
												show : true,
												position : 'outside'
											}
										},
										//color : '#FFCC67',
										data :
							<%=array.get("sum")%>
								} ]
								};
								myChart.setOption(option);// 使用刚指定的配置项和数据显示图表。
							</script>
							<!-- 柱状图 -->
						</div>
						<div class="col-md-4 column">
							<h3>进项发票月份总开支-饼图</h3>
							<!--饼图-->
							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							<div id="main1" style="width: 366px;height:360px; float: left"></div>

							<script type="text/javascript">
								// 基于准备好的dom，初始化echarts实例
								var myChart1 = echarts.init(document
										.getElementById('main1'));

								var data = [ {
									value :
							<%=str[0]%>
								,
									name : '1月'
								}, {
									value :
							<%=str[1]%>
								,
									name : '2月'
								}, {
									value :
							<%=str[2]%>
								,
									name : '3月'
								}, {
									value :
							<%=str[3]%>
								,
									name : '4月'
								}, {
									value :
							<%=str[4]%>
								,
									name : '5月'
								}, {
									value :
							<%=str[5]%>
								,
									name : '6月'
								}, {
									value :
							<%=str[6]%>
								,
									name : '7月'
								}, {
									value :
							<%=str[7]%>
								,
									name : '8月'
								}, {
									value :
							<%=str[8]%>
								,
									name : '9月'
								}, {
									value :
							<%=str[9]%>
								,
									name : '10月'
								}, {
									value :
							<%=str[10]%>
								,
									name : '11月'
								}, {
									value :
							<%=str[11]%>
								,
									name : '12月'
								} ];
								var option1 = {
									backgroundColor : '#fff',
									title : {
										text : '月份开支',
										subtext : '2012年',
										x : 'center',
										y : 'center',
										textStyle : {
											fontWeight : 'normal',
											fontSize : 16
										}
									},
									tooltip : {
										show : true,
										trigger : 'item',
										formatter : "{b}: {c} ({d}%)"
									},
									legend : {
										orient : 'horizontal',
										bottom : '0%',
										data : [ '1月', '2月', '3月', '4月', '5月',
												'6月', '7月', '8月', '9月', '10月',
												'11月', '12月' ]
									},
									series : [ {
										type : 'pie',
										selectedMode : 'single',
										radius : [ '33%', '75%' ],
										color : [ '#86D560', '#AF89D6',
												'#59ADF3', '#FF999A',
												'#FFCC67', '#FA5858' ],

										label : {
											normal : {
												position : 'inner',
												formatter : '{d}%',

												textStyle : {
													color : '#fff',
													fontWeight : 'bold',
													fontSize : 14
												}
											}
										},
										labelLine : {
											normal : {
												show : false
											}
										},
										data : data
									} ]
								};

								// 使用刚指定的配置项和数据显示图表。
								myChart1.setOption(option1);
							</script>
							<!--饼图-->
						</div>
					</div>
				</div>


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
