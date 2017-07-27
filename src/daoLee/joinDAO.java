package daoLee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dtoLee.joinDTO;
import util.JDBCUtil;

public class joinDAO {
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  int  RS= 0 ;
	
	
	
	public int join(String company,String name,String tel,String sector,String email,String type) throws SQLException {
		System.out.println(name);
		
		joinDTO dto = new joinDTO();
		String sql = "";
		sql = "insert into COMP_MBR_BAS(COMP_NM,MNG_NM,WIRE_TEL_NO,EMAI_ADDR,JOIN_TYPE_CD,CUST_REG_STAT_CD,BUS_CAT,CONT_CAT_ID,CUST_COMP_ID) "
				+ "values(?,?,?,?,?,?,?,?,F_GET_ID('CS'))";
		
		System.out.println(sql);
		CN = JDBCUtil.getConnection();
	    PST = CN.prepareStatement(sql); // 쿼리 준비
		PST.setString(1, company);
		PST.setString(2, name);
		PST.setString(3, tel);
		PST.setString(4, email);
		PST.setString(5, type);
		PST.setString(6, "CMG1");
		PST.setString(7, sector);
		PST.setString(8, "temp");
		
		RS = PST.executeUpdate();
		
		return RS;
	}
	
	public void test(String a) {
		System.out.println(a);
	}
}
