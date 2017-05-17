package cn.edu.gdpu.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.gdpu.bean.inputinvoice;
import cn.edu.gdpu.bean.outputinvoice;
import cn.edu.gdpu.dao.PageController;
import cn.edu.gdpu.dao.inputdao;
import cn.edu.gdpu.dao.outputdao;

public class outputservlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		outputdao dao=new outputdao();

		Properties pro = new Properties();
//		if((Properties) request.getSession().getAttribute("pro")!=null){
//			pro = (Properties) request.getSession().getAttribute("pro");
//		}
//		
		PageController pc = new PageController();
		if((PageController) request.getSession().getAttribute("pc")!=null){
			pc = (PageController) request.getSession().getAttribute("pc");
		}
		
		//增加区间
		String code = request.getParameter("code");
		String number = request.getParameter("number");
		String customer = request.getParameter("customer");
		String begin_date = request.getParameter("begin_date");
		String end_date = request.getParameter("end_date");
		
		String showpages = request.getParameter("showPage");
		
		if( (code==null || code.equals("")==true) && 
			(number==null || number.equals("")==true)&& 
			(customer==null || customer.equals("")==true) && 
			(begin_date==null || begin_date.equals("")==true) && 
			(end_date==null || end_date.equals("")==true)){
			pro.clear();
		}
		
		int showPage = 1;
		if(showpages!=null && showpages.equals("")!=true && showpages.equals("0")!=true){
			showPage = Integer.parseInt(showpages);
		}
		
		//如果不为空，放进Property对象
		if(code!=null && code.trim().equals("")!=true){
			pro.setProperty("code", code);
		}
		
		if(number!=null && number.trim().equals("")!=true){
			pro.setProperty("number", number);
		}
		
		if(customer!=null && customer.trim().equals("")!=true){
			pro.setProperty("customer", customer);
		}
		
		if(begin_date!=null && begin_date.trim().equals("")!=true){
			
			if(end_date!=null && end_date.trim().equals("")!=true){
				String sql = " between '" + begin_date + "' and '" +end_date +"' ";
				pro.setProperty("date", sql);
			}
		}
		
		
		int recordCount = dao.getRecordCount(pro);
//		int recordCount = dao.getRecordCount();
		
		pc.setRecordCount(recordCount);
		pc.setPageCount(recordCount);
		pc.setShowPage(showPage);
		
		//增加区间
		
		List<outputinvoice> list = new ArrayList<outputinvoice>();
		try {
			list = dao.queryConditionInvoice(pro, pc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pc", pc);
		request.setAttribute("showPage", showPage);
		request.setAttribute("list", list);
		request.getSession().setAttribute("pro", pro);
		request.getSession().setAttribute("pc", pc);
		request.getRequestDispatcher("/html/selectoutputinvoice.jsp").forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
