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
import cn.edu.gdpu.dao.PageController;
import cn.edu.gdpu.dao.inputdao;

public class InputListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		inputdao dao=new inputdao();

		Properties pro = (Properties) request.getSession().getAttribute("pro");

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
		
		int showPage = 1;
		if(showpages!=null && showpages.equals("")!=true && showpages.equals("0")!=true){
			showPage = Integer.parseInt(showpages);
		}
		
//		if( (code==null || code.equals("")==true) && 
//				(number==null || number.equals("")==true)&& 
//				(customer==null || customer.equals("")==true) && 
//				(begin_date==null || begin_date.equals("")==true) && 
//				(end_date==null || end_date.equals("")==true)){
//				pro.clear();
//		}
		
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
				pro.setProperty("begin_date", begin_date);
				pro.setProperty("end_date", end_date);
				
				String sql = " between '" + begin_date + "' and '" +end_date +"' ";
				pro.setProperty("date", sql);
			}
		}
		
		
		
		int recordCount = dao.getRecordCount(pro);
		
		pc.setRecordCount(recordCount);
		pc.setPageCount(recordCount);
		pc.setShowPage(showPage);
		
		//增加区间
		
		List<inputinvoice> list = new ArrayList<inputinvoice>();
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
		request.getRequestDispatcher("/html/selectinputinvoice.jsp").forward(request, response);
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	
}
