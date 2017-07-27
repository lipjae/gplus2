package daoLee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dtoLee.ListDTO;
import util.JDBCUtil;

public class memberDAO {
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public List<ListDTO> listType(String id,String type ) throws SQLException{
		String sql="";
		List<ListDTO> res = new ArrayList<>();
		sql = "SELECT * FROM gplus2.QUOT_JOIN_INFO\r\n" + 
				"where CUST_COMP_ID = ? \r\n" + 
				"and CONST_LIKE_CD = ?";
		
		
		CN = JDBCUtil.getConnection();
		 PST = CN.prepareStatement(sql); // 쿼리 준비
		 PST.setString(1, id);
		 PST.setString(2, type);
		 RS = PST.executeQuery();
		
		 while(RS.next()) {
			 ListDTO vo = new ListDTO();
			 vo.setColumn1(RS.getString(1));
			 vo.setColumn2(RS.getString(2));
			 vo.setColumn3(RS.getString(3));
			 vo.setColumn4(RS.getString(4));
			 res.add(vo);
		 }
		
		return res;
	}
	
}
