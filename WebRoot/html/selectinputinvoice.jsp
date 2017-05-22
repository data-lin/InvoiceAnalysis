<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="cn.edu.gdpu.bean.*,cn.edu.gdpu.dao.*"
	contentType="text/html; charset=utf-8"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
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

<!-- 自定义样式 -->
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
						<a href="index.jsp" class="site_title"><span>发票数据分析系统</span> </a>
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
										<li><a href="cn.edu.gdpu.servlet/contrastyear">年度统计</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> 进项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthinput?ym=12-01">月度统计</a>
										</li>
										<li><a href="cn.edu.gdpu.servlet/yearinput">年度统计</a>
										</li>
									</ul></li>
								<li><a><i class="fa fa-desktop"></i> 销项发票统计 <span
										class="fa fa-chevron-down"></span> </a>
									<ul class="nav child_menu">
										<li><a href="cn.edu.gdpu.servlet/monthoutput?ym=12-01">月度统计</a>
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
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>进项发票数据</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<%
						Properties pro = (Properties) request.getSession().getAttribute("pro");
												String code = "";
												String number = "";
												String customer = "";
												String begin_date = "";
												String end_date = "";
												if(pro.getProperty("code")!=null){
													code = pro.getProperty("code");
												}
												if(pro.getProperty("number")!=null){
													number = pro.getProperty("number");
												}
												if(pro.getProperty("customer")!=null){
													customer = pro.getProperty("customer");
												}
												if(pro.getProperty("begin_date")!=null){
													begin_date = pro.getProperty("begin_date");
												}
												if(pro.getProperty("end_date")!=null){
													end_date = pro.getProperty("end_date");
												}
					%>
					<a class="btn btn-primary" style="width:100%" role="button"
						data-toggle="collapse" href="#searchPanel" aria-expanded="true">
						条件查询 </a>
					<!-- 条件查询框 -->
					<div class="collapse" id="searchPanel">
						<form id="searchForm" action="servlet/InputListServlet">
							<table class="table search-table">
								<tr>
									<td align="center"><span class="form-control-text">发票代码</span>
									</td>
									<td><input type="text" name="code" value="<%=code%>" />
									</td>
									<td align="center"><span class="form-control-text">发票号码</span>
									</td>
									<td><input type="text" name="number" value="<%=number%>" />
									</td>
									<td><span class="form-control-text">客户名称</span>
									</td>
									<td><input type="text" name="customer"
										value="<%=customer%>" />
									</td>
								</tr>
								<tr>
									<td align="center"><span class="form-control-text">开票日期</span>
									</td>
									<td colspan="3"><span class="form-control-text">从</span> <input
										type="date" name="begin_date" id="begin_date"
										value="<%=begin_date%>" /> <span class="form-control-text">到</span>
										<input type="date" name="end_date" id="end_date"
										value="<%=end_date%>" />
									</td>
									<td><input type="button" class="btn btn-block"
										id="clear_btn" value="清空" /></td>
									<td><input type="button" class="btn btn-block"
										id="search_btn" value="查询" /></td>

								</tr>
							</table>
						</form>
					</div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">

								<table class="table">
									<tr>
										<th align="center">发票代码</th>
										<th align="center">发票号码</th>
										<th align="center">开票日期</th>
										<th align="center">客户名称</th>
										<th align="center">金额</th>
										<th align="center">类型</th>
									</tr>
									<%!int showPage; //目前显示第几页
	int recordCount; //总记录数%>
									<%
										PageController pc = (PageController)session.getAttribute("pc");
																								inputdao input = new inputdao();
																								recordCount = pc.getRecordCount();
																								showPage = pc.getShowPage();
																								List<inputinvoice> p = (List<inputinvoice>) request.getAttribute("list");
																								for (int i = 0; i < p.size(); i++) {
									%>
									<tr>
										<td><span><%=p.get(i).getCode()%></span>
										</td>

										<td><span><%=p.get(i).getNumber()%></span>
										</td>

										<td><span><%=p.get(i).getDate()%></span>
										</td>

										<td><span><%=p.get(i).getCustomer()%></span>
										</td>

										<td><span><%=p.get(i).getSum()%></span>
										</td>

										<td><span><%=p.get(i).getType()%></span>
										</td>

									</tr>
									<%
										}
									%>
								</table>

								<div class="pageNav">
									<ul class="pagination pagination-lg">
										<li><a href="servlet/InputListServlet?showPage=1"> <span
												aria-hidden="true">首页</span> </a>
										</li>
										<li><a
											href="servlet/InputListServlet?showPage=<%=pc.getPreviousPage()%>"
											aria-label="Previous"> <span aria-hidden="true">上一页</span>
										</a>
										</li>

										<%
											if(pc.getPageCount()>8){
																											for(int i=showPage;i<=showPage+7;i++){
																												if(showPage>=pc.getPageCount()-7){
																														break;
																												}else{
										%>
										<li><a href="servlet/InputListServlet?showPage=<%=i%>"><%=i%></a>
										</li>
										<%
											}
																											} 
																											if(showPage>=pc.getPageCount()-7){
																												for(int i=pc.getPageCount()-7;i<=pc.getPageCount();i++){
										%>
										<li><a href="servlet/InputListServlet?showPage=<%=i%>"><%=i%></a>
										</li>
										<%
											}
																											}
																										}else{
																										for(int i=1;i<=pc.getPageCount();i++){
										%>
										<li><a href="servlet/InputListServlet?showPage=<%=i%>"><%=i%></a>
										</li>
										<%
											} 
																										}
										%>

										<li><a
											href="servlet/InputListServlet?showPage=<%=pc.getNextPage()%>"
											aria-label="Next"> <span aria-hidden="true">下一页</span> </a>
										</li>
										<li><a
											href="servlet/InputListServlet?showPage=<%=pc.getPageCount()%>">
												<span aria-hidden="true">尾页</span> </a>
										</li>
									</ul>
									<p align="center">
										<span class="h4 pageNumber">第<%=pc.getShowPage()%>页</span> <span
											class="h4 pageNumber">共<%=pc.getPageCount()%>页</span>
									</p>
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
<script type="text/javascript">
	$('#clear_btn').click(
			function() {
				$(':input', '#searchForm').not(
						':button, :submit, :reset, :hidden').val('');
			});

	$("#search_btn").click(function() {
		var begin_date = new Date($("#begin_date").val());
		var end_date = new Date($("#end_date").val());

		if (begin_date > end_date) {
			alert("日期错误！");
		} else {
			$("#searchForm").submit();
		}

		if ($("#begin_date").val() == "" && $("#end_date").val() == "") {
			$("#searchForm").submit();
		}
	});
</script>
</html>