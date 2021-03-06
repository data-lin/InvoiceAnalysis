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
<!-- 										<li><a href="cn.edu.gdpu.servlet/contrastmonth">月度统计</a>
										</li> -->
										<li><a href="cn.edu.gdpu.servlet/contrastyear">年度统计</a>
										</li>
									</ul>
								</li>
								<li><a><i class="fa fa-edit"></i> 进项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthinput?ym=12-01">月度统计</a></li>
										<li><a href="cn.edu.gdpu.servlet/yearinput">年度统计</a></li>
									</ul>
								</li>
								<li><a><i class="fa fa-desktop"></i> 销项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
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
										class="fa fa-sign-out pull-right"></i> Log Out</a>
								</li>
							</ul></li>
					</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
			<%
				Map<String, float[]> map = new HashMap<String, float[]>();

				map = (Map)request.getAttribute("map");

				String ym = (String)request.getAttribute("ym");
				
				//System.out.println("jsp"+ym);		
                //System.out.println(Arrays.toString(map.get(ym)));
                //System.out.println(map.get(ym)[1]);	
			%>

				<!-- 插入一个搜索，按照输入的月份显示该月份的统计表格 -->
				<div>
					<form action="cn.edu.gdpu.servlet/monthinput" role="form" method="get">
					

						<label>请选择月份:</label> 
					<select name="ym">
					  <option value ="12-01">-请选择-</option>	
					  <option value ="12-01">12-01</option>
					  <option value ="12-02">12-02</option>
					  <option value="12-03">12-03</option>
					  <option value="12-04">12-04</option>
					  <option value ="12-05">12-05</option>
					  <option value ="12-06">12-06</option>
					  <option value="12-07">12-07</option>
					  <option value="12-08">12-08</option>
					  <option value ="12-09">12-09</option>
					  <option value ="12-10">12-10</option>
					  <option value="12-11">12-11</option>
					  <option value="12-12">12-12</option>
					</select>
						<button type="submit" class="btn btn-primary">提交</button>
					</form>
				</div>
				<!-- 搜索代码结束 -->

				<!--统计图  -->
				<div class="row clearfix">
					<div class="col-md-7 column">
						<h3><%=ym %>月支出板块排行-折线</h3>
						<!--折线图-->
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
						<div id="main2" style="width: 605px;height:440px"></div>

						<script type="text/javascript">
							// 基于准备好的dom，初始化echarts实例
							var myChart2 = echarts.init(document
									.getElementById('main2'), 'infographic');

							option2 = {
								title : {
									text : ' ',
									subtext : '单位：元'
								},
								tooltip : {
									trigger : 'axis'
								},
								legend : {
									data : [ '月份支出' ]
								},
								xAxis : {
									type : 'category',
									boundaryGap : false,
									data : [ '办公用品', '生活开支', '原材料', '医疗仪器',
											'服务行业', '餐饮业', '运输行业', '建筑安装' ]
								},
								yAxis : {
									type : 'value',
									axisLabel : {
										formatter : '{value} 元'
									}
								},
								series : [ {
									name : '月份支出',
									type : 'line',
									data : <%=Arrays.toString(map.get(ym)) %>,
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
						<!--折线图-->
					</div>
					<div class="col-md-5 column">
						<h3><%=ym %>月支出板块排行-饼图</h3>
						<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
						<div id="main3" style="width: 500px;height:440px"></div>

						<script type="text/javascript">
							// 基于准备好的dom，初始化echarts实例
							var myChart3 = echarts.init(document
									.getElementById('main3'), 'infographic');

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
									data : [ '办公用品', '生活开支', '原材料', '医疗仪器',
											'服务行业', '餐饮业', '运输行业', '建筑安装' ]
								},
								series : [ {
									name : '月份支出',
									type : 'pie',
									radius : '55%',
									center : [ '50%', '60%' ],
									data : [ {
										value : <%=map.get(ym)[0]%>,
										name : '办公用品'
									}, {
										value : <%=map.get(ym)[1]%>,
										name : '生活开支'
									}, {
										value : <%=map.get(ym)[2]%>,
										name : '原材料'
									}, {
										value : <%=map.get(ym)[3]%>,
										name : '医疗仪器'
									}, {
										value : <%=map.get(ym)[4]%>,
										name : '服务行业'
									}, {
										value : <%=map.get(ym)[5]%>,
										name : '餐饮业'
									}, {
										value : <%=map.get(ym)[6]%>,
										name : '运输行业'
									}, {
										value : <%=map.get(ym)[7]%>,
										name : '建筑安装'
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
				<!--统计图  -->

				<!-- test -->


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
