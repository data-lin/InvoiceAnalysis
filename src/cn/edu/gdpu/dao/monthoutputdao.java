package cn.edu.gdpu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.edu.gdpu.util.DBHelper;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class monthoutputdao {
	//查询数据
	private Connection connect=null;
	private PreparedStatement state=null;
	private ResultSet result=null;
	
	//用于月度统计
		public Map monthquery() throws Exception {
				
			String []date =new String[255];  //取出数据库中的date值
			float []sum =new float[255];     //取出数据库中的sum值
			int []type=new int[255];
			
			String []dateym=new String[255]; //存储中间值，确认后再放入datelym数组
			float []sumym=new float[255];    //存储中间值，确认后再放入sumlym数组
			
			String []datelym=new String[12]; //存储最终放入list集合的date数组
			float []sumlym1=new float[5];    
			float []sumlym2=new float[5]; 
			float []sumlym3=new float[5]; 
			float []sumlym4=new float[5]; 
			float []sumlym5=new float[5]; 
			float []sumlym6=new float[5]; 
			float []sumlym7=new float[5]; 
			float []sumlym8=new float[5]; 
			float []sumlym9=new float[5]; 
			float []sumlym10=new float[5]; 
			float []sumlym11=new float[5]; 
			float []sumlym12=new float[5]; 
			
			
			int i = 0; //用于遍历
			int j = 0; //用于存储当前数据库调出的值
			int k = 0; //用于存储存进dateym数组的值
			int m = 0; //存储k的值，用于遍历
			int flag = 0;//标记是否在之前找到对应月份找到修改为1
			int index=0;
			

			Map<String, float[]> map = new HashMap<String, float[]>();
			
			connect=(Connection) DBHelper.getConnection();
			String sql= "select * from outputinvoice";
			state = (PreparedStatement) connect.prepareStatement(sql);
			result = state.executeQuery();
					
			while (result.next()) {
						
				date[i]=result.getString("date");
				sum[i]=result.getFloat("sum");
				type[i]=result.getInt("type");
				
			    dateym[i]=date[i].substring(2, 7); //截取出月份
			    sumym[i]=sum[i];
			    
			    if(i==0){
			    	datelym[i]=dateym[i];
	            	sumlym1[type[i]-1]=sumym[i];		
	            	m++;
			    }
			    
			    if(i!=0){	    	
				    for(k=0;k<12;k++){
				    	if(dateym[i].equals(datelym[k])){			    		
				    		if(dateym[i].equals("12-01"))
				    			sumlym1[type[i]-1]=sumlym1[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-02"))
				    			sumlym2[type[i]-1]=sumlym2[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-03"))
				    			sumlym3[type[i]-1]=sumlym3[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-04"))
				    			sumlym4[type[i]-1]=sumlym4[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-05"))
				    			sumlym5[type[i]-1]=sumlym5[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-06"))
				    			sumlym6[type[i]-1]=sumlym6[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-07"))
				    			sumlym7[type[i]-1]=sumlym7[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-08"))
				    			sumlym8[type[i]-1]=sumlym8[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-09"))
				    			sumlym9[type[i]-1]=sumlym9[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-10"))
				    			sumlym10[type[i]-1]=sumlym10[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-11"))
				    			sumlym11[type[i]-1]=sumlym11[type[i]-1]+sumym[i];
				    		if(dateym[i].equals("12-12"))
				    			sumlym12[type[i]-1]=sumlym12[type[i]-1]+sumym[i];
							flag = 1;			    	
				    	}			    		
				    }
			    	    
				if(flag==0) {					
	            	datelym[m]=dateym[i];           	
		    		if(dateym[i].equals("12-01"))
		    			sumlym1[type[i]-1]=sumlym1[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-02"))
		    			sumlym2[type[i]-1]=sumlym2[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-03"))
		    			sumlym3[type[i]-1]=sumlym3[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-04"))
		    			sumlym4[type[i]-1]=sumlym4[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-05"))
		    			sumlym5[type[i]-1]=sumlym5[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-06"))
		    			sumlym6[type[i]-1]=sumlym6[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-07"))
		    			sumlym7[type[i]-1]=sumlym7[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-08"))
		    			sumlym8[type[i]-1]=sumlym8[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-09"))
		    			sumlym9[type[i]-1]=sumlym9[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-10"))
		    			sumlym10[type[i]-1]=sumlym10[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-11"))
		    			sumlym11[type[i]-1]=sumlym11[type[i]-1]+sumym[i];
		    		if(dateym[i].equals("12-12"))
		    			sumlym12[type[i]-1]=sumlym12[type[i]-1]+sumym[i];
	            	m++;
					}		
			    }
				i++;
				flag=0;
				j++;		
			}
			//System.out.println(Arrays.toString(datelym));
			//System.out.println(Arrays.toString(sumlym1));
			//System.out.println(Arrays.toString(sumlym6));
			//System.out.println(Arrays.toString(sumlym12));
			
			map.put(datelym[0],sumlym1);
			map.put(datelym[1],sumlym2);
			map.put(datelym[2],sumlym3);
			map.put(datelym[3],sumlym4);
			map.put(datelym[4],sumlym5);
			map.put(datelym[5],sumlym6);
			map.put(datelym[6],sumlym7);
			map.put(datelym[7],sumlym8);
			map.put(datelym[8],sumlym9);
			map.put(datelym[9],sumlym10);
			map.put(datelym[10],sumlym11);
			map.put(datelym[11],sumlym12);
			
			return map;
		}		
	
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
		String sql= "select * from outputinvoice";
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
