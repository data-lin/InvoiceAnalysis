package cn.edu.gdpu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.gdpu.bean.outputinvoice;
import cn.edu.gdpu.dao.outputdao;

public class addoutputservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		outputinvoice o=new outputinvoice();
		outputdao od=new outputdao();
		
		String code_output =  request.getParameter("code");
		String number_output = request.getParameter("number");
		String date = request.getParameter("date");
		String customer = request.getParameter("customer");
		String sum_output = request.getParameter("sum");
		String type_output =  request.getParameter("type");
		

		if(!code_output.equals("") && code_output!=null){
			int code = Integer.parseInt(code_output);
			o.setCode(code);
		}
		
		if(!number_output.equals("") && number_output!=null){
			int number = Integer.parseInt(request.getParameter("number"));
			o.setNumber(number);
		}
		
		if(!date.equals("") && date!=null){
			o.setDate(date);
		}
		
		if(!customer.equals("") && customer!=null){
			o.setCustomer(customer);
		}
		
		if(!sum_output.equals("") && sum_output!=null){
			Float sum = Float.parseFloat(request.getParameter("sum"));
			o.setSum(sum);
		}
		
		if(!type_output.equals("") && type_output!=null){
			int type = Integer.parseInt(request.getParameter("type"));
			o.setType(type);
		}
		
		if(!code_output.equals("") && code_output!=null 
			&& !number_output.equals("") && number_output!=null
			&& !date.equals("") && date!=null
			&& !customer.equals("") && customer!=null
			&& !sum_output.equals("") && sum_output!=null
			&& !type_output.equals("") && type_output!=null){
			
			try {
				if(od.hasOutpuInvoice(o.getCode())==true){
					od.addoutputinvoice(o);
				}else{
					out.println("发票代码已存在！");
				}
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			response.sendRedirect("outputservlet?showPage=1");
		}
		
		try {
			od.addoutputinvoice(o);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ArrayList<outputinvoice> list = new ArrayList<outputinvoice>();
		try {
			od.selectoutputinvoice(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		response.sendRedirect("outputservlet?showPage=1");
		
	}

}
