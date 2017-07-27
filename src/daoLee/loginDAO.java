package daoLee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dtoLee.loginDTO;
import util.JDBCUtil;

public class loginDAO {

	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	private  String login;
	
	public String loginCheck(String id,String pw) throws SQLException {
		System.out.println(id);
		System.out.println(pw);
		String sql = "";
		String res = "";
		String finRes="";
		sql = "select count(*) from COMP_MBR_BAS where CUST_COMP_ID = ? and PASS_NO =?";
		
		CN = JDBCUtil.getConnection();
		PST = CN.prepareStatement(sql); // 쿼리 준비
		
		PST.setString(1, id);
		PST.setString(2, pw);
		
		RS = PST.executeQuery();
		if(RS.next()) {
			 res = RS.getString(1);
			 System.out.println(res);
		}
		if(res.equals("1")) {
			finRes = "true";
		}
		System.out.println(finRes);
		return finRes;
	} // end loginCheck
	
	
	
	
}
