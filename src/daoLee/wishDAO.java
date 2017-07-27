package daoLee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dtoLee.wishDTO;
import util.JDBCUtil;




public class wishDAO {
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;
	private  PreparedStatement  PST2= null ;
	private  ResultSet  RS= null ;
	private  int  RS2;
	private  int res;
	
	public int wish(String user,String company,String company2,String type) throws SQLException{
		
		String sql;
		String sql2;
		
		sql = "select count(*) from QUOT_JOIN_INFO \r\n" + 
				"where CUST_COMP_ID = ? \r\n" + 
				"and CONST_ID= ? \r\n" + 
				"and CONT_CAT_ID= ? \r\n" + 
				"and CONST_LIKE_CD= ?";
		sql2 = "insert into QUOT_JOIN_INFO(CUST_COMP_ID,CONST_ID,CONT_CAT_ID,CONST_LIKE_CD,QUOT_JOIN_DT)\r\n" + 
				"values(?,?,?,?,sysdate());";
		
		CN = JDBCUtil.getConnection();
		PST = CN.prepareStatement(sql); 
		PST.setString(1, user);
		PST.setString(2, company);
		PST.setString(3, company2);
		PST.setString(4, type);
		
		RS = PST.executeQuery();
		
		while(RS.next()) {
			res = RS.getInt(1);
			
		}
		if(res != 1) {
			CN = JDBCUtil.getConnection();
			PST2 = CN.prepareStatement(sql2); 
			PST2.setString(1, user);
			PST2.setString(2, company);
			PST2.setString(3, company2);
			PST2.setString(4, type);
			
			RS2 = PST2.executeUpdate();
			System.out.println(RS2);
		}else {
			RS2 =0;
		}
		
		return RS2;
	}
	
}
