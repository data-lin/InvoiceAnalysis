package cn.edu.gdpu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import cn.edu.gdpu.bean.outputinvoice;
import cn.edu.gdpu.util.DBHelper;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class outputdao {
	
	private Connection connect=null;
	private PreparedStatement state=null;
	
	//2017年3月20日20:32:07增加
	private ResultSet result = null;
	

	public boolean hasOutpuInvoice(int code) throws Exception{
		connect=(Connection) DBHelper.getConnection();
		String sql = "select * from outputinvoice where code=?";
		try {
			state = (PreparedStatement) connect.prepareStatement(sql);
			state.setInt(1, code);
			
			result = state.executeQuery();
		    
			if(result!=null)
				return true;
			else
				return false;
		}catch (Exception e){
			e.printStackTrace();
			return false;	
		}
		finally
		{
			DBHelper.close(state);
			DBHelper.close(connect);
		}
	}
	
	//添加
	public boolean addoutputinvoice(outputinvoice o) throws Exception {
		connect=(Connection) DBHelper.getConnection();
		String sql= "insert into outputinvoice(code,number,date,customer,sum,type) values(?,?,?,?,?,?)";
		try {
			state = (PreparedStatement) connect.prepareStatement(sql);
			state.setInt(1, o.getCode() );
			state.setInt(2, o.getNumber() );
			state.setString(3, o.getDate() );
			state.setString(4, o.getCustomer() );
			state.setFloat(5, o.getSum() );
			state.setFloat(6, o.getType() );
			
			int result = state.executeUpdate();
		    
			if(result==0)
				return false;
			else
				return true;
		}catch (Exception e){
			e.printStackTrace();
			return false;	
		}
		finally
		{
			DBHelper.close(state);
			DBHelper.close(connect);
		}
	}
	
	//返回所有
	public ArrayList<outputinvoice> selectoutputinvoice(ArrayList<outputinvoice> list) throws Exception {
		connect=(Connection) DBHelper.getConnection();
		String sql= "select * from outputinvoice";
		state = (PreparedStatement) connect.prepareStatement(sql);
		ResultSet result = state.executeQuery();

		try{
			while (result.next()) {
				outputinvoice i = new outputinvoice();
				i.setCode(result.getInt("code"));
				i.setNumber(result.getInt("number"));
				i.setDate(result.getString("date"));
				i.setCustomer(result.getString("customer"));
				i.setSum(result.getFloat("sum"));
				i.setType(result.getInt("type"));
				list.add(i);	
			}
		}catch(SQLException e){
			 e.printStackTrace();
		}
		
			return list;
	}
	
	/*
	 * 2017年4月14日16:02:00添加
	 * 
	 */

	//带上分页控制的查询
	public List<outputinvoice> findOutputinvoice(PageController pc){
		String sql = "select * from outputinvoice limit ?,?";
		List<outputinvoice> output = getOutputinvoice(sql,pc);
		return output;
	}
	
	
	//无条件查询总记录数
	public int getRecordCount(){
		String sql = "select count(*) from outputinvoice";
		int pageCount = getRows(sql);
		return pageCount;
	}
	
	//按照条件查询总记录数
	public int getRecordCount(Properties pro){
		String sql = "select count(*) from outputinvoice";
		String finalSql = getSQL(sql, pro);
		int pageCount = getRows(finalSql);
		return pageCount;
	}
	
	
	//查询总记录数
	public int getRows(String sql){
		int pageCount = 0;
		try {
			connect=(Connection) DBHelper.getConnection();
			state = (PreparedStatement) connect.prepareStatement(sql);
			result = state.executeQuery();
			
			while(result.next()){
				pageCount = result.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBHelper.close(state);
			DBHelper.close(connect);
			DBHelper.close(result);
		}
		return pageCount;
		
	}
	
	
	
	//按每页查询条数
	public List<outputinvoice> getOutputinvoice(String sql,PageController pc){
		List<outputinvoice> list = new ArrayList<outputinvoice>();
		
		//2017年4月12日修改
		outputinvoice outvoice = null;
				
		try {
			connect=(Connection) DBHelper.getConnection();
			state = (PreparedStatement) connect.prepareStatement(sql);
			state.setInt(1, pc.getPosition());
			state.setInt(2, pc.getPageSize());
			try {
				result = state.executeQuery();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			while(result.next()){
				
				/*
				 * 修改了invoice的格式
				 */
				
				outvoice = new outputinvoice();
				
				outvoice.setCode(result.getInt("code"));
				outvoice.setNumber(result.getInt("number"));
				outvoice.setDate(result.getString("date"));
				outvoice.setCustomer(result.getString("customer"));
				outvoice.setSum(result.getFloat("sum"));
				outvoice.setType(result.getInt("type"));
				
				list.add(outvoice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBHelper.close(state);
			DBHelper.close(connect);
			DBHelper.close(result);
		}
		return list;
	}
	
	//通过配置读取条件的值传入，拼接进行查询
	public List<outputinvoice> queryConditionInvoice(Properties pro, PageController pc){
		String sql = "select * from outputinvoice";
		String finalSql = getSQL(sql, pro) + " limit ?,?"; 
		List<outputinvoice> list = getOutputinvoice(finalSql, pc);
		return list;
		
	}
	
	
	//生成组合条件的sql语句
	public String getSQL(String sql,Properties pro){
		StringBuilder finalSQL = new StringBuilder(sql);
		
		if(pro!=null && pro.size()>0){
			finalSQL.append(" where ");
			String time = "";
			Set<Object> keys = pro.keySet();
			for(Object obj : keys){
				String key = (String) obj;
				String value = pro.getProperty(key);
				if(key.equals("begin_date")==true || key.equals("end_date")==true){
					break;
				}
				if(key.equals("date")==true){
					finalSQL.append(key + " "+value+" and ");
				}else{
				finalSQL.append(key + " = '"+value+"' and ");
				}
			}
			finalSQL.delete(finalSQL.lastIndexOf("and"), finalSQL.length() - 1);
		}
		return finalSQL.toString();
	}
	
	
}
