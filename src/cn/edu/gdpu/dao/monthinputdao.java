package cn.edu.gdpu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import cn.edu.gdpu.util.DBHelper;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;


public class monthinputdao {
	
	//查询数据
	private Connection connect=null;
	private PreparedStatement state=null;
	private ResultSet result=null;
	
	//用于月度统计
	public Map monthquery() throws Exception {
			
		String []date =new String[255];  //取出数据库中的date值
		float []sum =new float[255];     //取出数据库中的sum值
		
		String []dateym=new String[255]; //存储中间值，确认后再放入datelym数组
		float []sumym=new float[255];    //存储中间值，确认后再放入sumlym数组
		
		String []datelym=new String[255]; //存储最终放入list集合的date数组
		float []sumlym=new float[255];    //存储最终放入list集合的sum数组
		
		int i = 0; //用于遍历
		int j = 0; //用于存储当前数据库调出的值
		int k = 0; //用于存储存进dateym数组的值
		int m = 0; //存储k的值，用于遍历
		int flag = 0;//标记是否在之前找到对应月份找到修改为1
		
		//ArrayList<String> listdate = new ArrayList<String>();
		//ArrayList<Float> listsum = new ArrayList<Float>();

		Map<String, float[]> map = new HashMap<String, float[]>();
		
		connect=(Connection) DBHelper.getConnection();
		String sql= "select * from inputinvoice";
		state = (PreparedStatement) connect.prepareStatement(sql);
		result = state.executeQuery();
				
		while (result.next()) {
			date[i]=result.getString("date");
			sum[i]=result.getFloat("sum");
			
		    dateym[i]=date[i].substring(2, 7); //截取出月份
		    
			//datelym[i]=dateym[i];
			
			i++;
		}
		
		
		for(j=0;j<i;j++){	    
			System.out.println(date[j]);
	        System.out.println(sum[j]);
	    }

	    //map.put("2012-01", sum);
		return map;
	}		
	
	//用于年度统计
	public JSONObject query() throws Exception {
		
		JSONObject jo = new JSONObject();
		
		ArrayList<String> listdate = new ArrayList<String>();
		ArrayList<Float> listsum = new ArrayList<Float>();

	
		String []date =new String[255];  //取出数据库中的date值
		float []sum =new float[255];     //取出数据库中的sum值
		
		String []dateym=new String[255]; //存储中间值，确认后再放入datelym数组
		float []sumym=new float[255];    //存储中间值，确认后再放入sumlym数组
		
		String []datelym=new String[255]; //存储最终放入list集合的date数组
		float []sumlym=new float[255];    //存储最终放入list集合的sum数组

		connect=(Connection) DBHelper.getConnection();
		String sql= "select * from inputinvoice";
		state = (PreparedStatement) connect.prepareStatement(sql);
		result = state.executeQuery();
		
		int i = 0; //用于遍历
		int j = 0; //用于存储当前数据库调出的值
		int k = 0; //用于存储存进dateym数组的值
		int m = 0; //存储k的值，用于遍历
		int flag = 0;//标记是否在之前找到对应月份找到修改为1
		
		try{			
			while (result.next()) {
				date[i]=result.getString("date");
				sum[i]=result.getFloat("sum");
				
			    dateym[i]=date[i].substring(2, 7); //截取出月份
				sumym[i]=sum[i];
				
                if(i==0){ //第一个值直接存入
                	datelym[i]=dateym[i];
                	sumlym[i]=sumym[i];		
                	flag=1;
                }
				
				for(j=i ; i>0 ; i--){		
				
					for(m=k ; m>=0 ; m--){					
						if(dateym[j].equals(datelym[m])){						
							sumlym[m]=sumlym[m]+sumym[j];						
							flag = 1;
							m=0;
							i=0;}
					}			    	
				}	
				
				if(flag==0) {					
					k=k+1;									
                	datelym[k]=dateym[j];
                	sumlym[k]=sumym[j];
				}
				
				flag = 0;
				i=j;
				i++;
				
			}
		}catch(SQLException e){
			 e.printStackTrace();
		}
		
		//将值存入list中
		int q = 0;		
		while(k>=0){			
			listdate.add(datelym[q]);						
			listsum.add(sumlym[q]);
			k--;
			q++;
		}	
		
		//将值放入JSONObject对象中
		jo.put("date",listdate);	
		jo.put("sum",listsum);	
				
		return jo;
	}	
}
