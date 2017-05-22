package cn.edu.gdpu.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.gdpu.dao.monthinputdao;
import cn.edu.gdpu.dao.monthoutputdao;

import net.sf.json.JSONObject;

public class monthoutput extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
        monthoutputdao md = new monthoutputdao();
		Map<String, float[]> map = new HashMap<String, float[]>();

        try {
        	map = md.monthquery();
		} catch (Exception e) {
			e.printStackTrace();
		}
        	
        String ym = request.getParameter("ym");
                
        request.setAttribute("ym", ym);
        request.setAttribute("map", map);
		request.getRequestDispatcher("/html/monthoutputinvoice.jsp").forward(request, response);			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

	}

}
