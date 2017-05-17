package cn.edu.gdpu.util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
	
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/invoice?useUnicode=true&characterEncoding=UTF-8";
	private static String username="root";
	private static String password="";
	private static Connection conn =null;
	
	static{
		try{
			Class.forName(driver);			
		}catch(Exception e){			
			e.printStackTrace();
		}
			
	}
	
	public static Connection getConnection() throws Exception{
		if(conn==null){			
			conn=DriverManager.getConnection(url,username,password);
			return conn;
		}
		return conn;	
	}

	public static void main(String[] args){
	
	try {
		Connection conn = DBHelper.getConnection();
		if(conn!=null){
			System.out.println("连接成功");		
		}
		else{
			System.out.println("连接失败");			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}

	public static void close(Object obj) {
		
	}
}
