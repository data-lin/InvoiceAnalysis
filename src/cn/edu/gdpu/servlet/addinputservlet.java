package cn.edu.gdpu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.gdpu.bean.inputinvoice;
import cn.edu.gdpu.dao.inputdao;

public class addinputservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		inputinvoice i=new inputinvoice();
		inputdao id=new inputdao();
		
		//修改了接收方式
		
		String code_input =  request.getParameter("code");
		String number_input = request.getParameter("number");
		String date = request.getParameter("date");
		String customer = request.getParameter("customer");
		String sum_input = request.getParameter("sum");
		String type_input =  request.getParameter("type");
		
		if(!code_input.equals("") && code_input!=null){
			int code = Integer.parseInt(code_input);
			i.setCode(code);
		}
		
		if(!number_input.equals("") && number_input!=null){
			int number = Integer.parseInt(request.getParameter("number"));
			i.setNumber(number);
		}
		
		if(!date.equals("") && date!=null){
			i.setDate(date);
		}
		
		if(!customer.equals("") && customer!=null){
			i.setCustomer(customer);
		}
		
		if(!sum_input.equals("") && sum_input!=null){
			Float sum = Float.parseFloat(request.getParameter("sum"));
			i.setSum(sum);
		}
		
		if(!type_input.equals("") && type_input!=null){
			int type = Integer.parseInt(request.getParameter("type"));
			i.setType(type);
		}
		
		if(!code_input.equals("") && code_input!=null 
			&& !number_input.equals("") && number_input!=null
			&& !date.equals("") && date!=null
			&& !customer.equals("") && customer!=null
			&& !sum_input.equals("") && sum_input!=null
			&& !type_input.equals("") && type_input!=null){
			
			try {
				if(id.hasInpuInvoice(i.getCode())==true){
					id.addinputinvoice(i);
				}else{
					out.println("发票代码已存在！");
				}
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			response.sendRedirect("inputservlet?showPage=1");
		}
		
	}

}
