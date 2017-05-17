package cn.edu.gdpu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import cn.edu.gdpu.dao.monthoutputdao;

public class yearoutput extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
        monthoutputdao md = new monthoutputdao();
        JSONObject array = new JSONObject();        
        
        try {
			array = md.query();
		} catch (Exception e) {
			e.printStackTrace();
		}
        //System.out.println(array.getString("sum"));
        request.setAttribute("array", array);
		request.getRequestDispatcher("/html/yearoutputinvoice.jsp").forward(request, response);	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
