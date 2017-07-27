package daoLee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CMN_CD_DTO;
import dtoLee.ListDTO;
import util.JDBCUtil;


public class ListDAO {
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	
public  List<ListDTO> listSql(String listType) throws SQLException {
		String sql="";
		String equal = "ALL";
		List<ListDTO> vo_list = new ArrayList<ListDTO>();
		if(listType.equals(equal)) {
			 sql = "select a.BUS_NM as 이름,\r\n" + 
			 		"	   (select CD_NM from CMN_CD_DTL where CMN_CD_ID = a.CONT_ZONE_CD) as 지역,\r\n" + 
			 		"       a.TOT_AREA_NO as 연면적,\r\n" + 
			 		"       (select CD_NM from CMN_CD_DTL where CMN_CD_ID = b.QUOT_PRG_STAT_CD) as 진행상태,\r\n" + 
			 		"       b.INPUT_EXPT_DT as 예정일,\r\n" + 
			 		"       (select CD_NM from CMN_CD_DTL where CMN_CD_ID =b.QUOT_EXPT_CD) as 견적예가,\r\n" + 
			 		"       b.ONE_LINC_YN as 단종면허,\r\n" + 
			 		"       (select CONT_CAT_NM from CONT_CAT_INFO where CONT_CAT_ID=b.CONT_CAT_ID) 종류,\r\n" + 
			 		"       (select CD_NM from CMN_CD_DTL where CMN_CD_ID = c.BULD_USAG_CD) 건물용도,\r\n" + 
			 		"       a.CONST_ID as id\r\n" + 
			 		"       \r\n" + 
			 		"from CONST_BAS a\r\n" + 
			 		"left join CONST_CONT_INFO b\r\n" + 
			 		"on a.CONST_ID = b.CONST_ID\r\n" + 
			 		"left join BULD_USAG_INFO c\r\n" + 
			 		"on b.CONST_ID = c.CONST_ID\r\n" + 
			 		"left join CONT_CAT_INFO d\r\n" + 
			 		"on b.CONT_CAT_ID = d.CONT_CAT_ID;";
			 
			 System.out.println(sql);
			 CN = JDBCUtil.getConnection();
			 PST = CN.prepareStatement(sql); // 쿼리 준비
			 /*PST.setString(1, listType);*/
			 RS = PST.executeQuery();
			 
			 while(RS.next()) {
				 System.out.println(RS.getString("이름"));
				 ListDTO vo = new ListDTO();
				 vo.setColumn1(RS.getString("이름"));
				 vo.setColumn2(RS.getString("지역"));
				 vo.setColumn3(RS.getString("연면적"));
				 vo.setColumn4(RS.getString("진행상태"));
				 vo.setColumn5(RS.getString("예정일"));
				 vo.setColumn6(RS.getString("견적예가"));
				 vo.setColumn7(RS.getString("단종면허"));
				 vo.setColumn8(RS.getString("종류"));
				 vo.setColumn9(RS.getString("건물용도"));
				 vo.setColumn10(RS.getString("id"));
				 vo_list.add(vo);
				/*vo.(RS.getString("cd_nm"));
				vo_list.add(vo);*/
			 }
			 
			 
		}else {
			 sql = "select a.BUS_NM as 이름,\r\n" + 
					"	   (select CD_NM from CMN_CD_DTL where CMN_CD_ID = a.CONT_ZONE_CD) as 지역,\r\n" + 
					"       a.TOT_AREA_NO as 연면적,\r\n" + 
					"       (select CD_NM from CMN_CD_DTL where CMN_CD_ID = b.QUOT_PRG_STAT_CD) as 진행상태,\r\n" + 
					"       b.INPUT_EXPT_DT as 예정일,\r\n" + 
					"       (select CD_NM from CMN_CD_DTL where CMN_CD_ID =b.QUOT_EXPT_CD) as 견적예가,\r\n" + 
					"       b.ONE_LINC_YN as 단종면허,\r\n" + 
					"       (select CONT_CAT_NM from CONT_CAT_INFO where CONT_CAT_ID=b.CONT_CAT_ID) 종류,\r\n" + 
					"       (select CD_NM from CMN_CD_DTL where CMN_CD_ID = c.BULD_USAG_CD) 건물용도,\r\n" + 
					"       a.CONST_ID as id\r\n" + 
			 		"       \r\n" + 
					"from CONST_BAS a\r\n" + 
					"left join CONST_CONT_INFO b\r\n" + 
					"on a.CONST_ID = b.CONST_ID\r\n" + 
					"left join BULD_USAG_INFO c\r\n" + 
					"on b.CONST_ID = c.CONST_ID\r\n" + 
					"left join CONT_CAT_INFO d\r\n" + 
					"on b.CONT_CAT_ID = d.CONT_CAT_ID\r\n" + 
					"where d.CAT_CD = ?";
			 
			 
			 
			 System.out.println(sql);
			 CN = JDBCUtil.getConnection();
			 PST = CN.prepareStatement(sql); // 쿼리 준비
			 PST.setString(1, listType);
			 RS = PST.executeQuery();
			 
			 while(RS.next()) {
				 System.out.println(RS.getString("이름"));
				 ListDTO vo = new ListDTO();
				 vo.setColumn1(RS.getString("이름"));
				 vo.setColumn2(RS.getString("지역"));
				 vo.setColumn3(RS.getString("연면적"));
				 vo.setColumn4(RS.getString("진행상태"));
				 vo.setColumn5(RS.getString("예정일"));
				 vo.setColumn6(RS.getString("견적예가"));
				 vo.setColumn7(RS.getString("단종면허"));
				 vo.setColumn8(RS.getString("종류"));
				 vo.setColumn9(RS.getString("건물용도"));
				 vo.setColumn10(RS.getString("id"));
				 
				 vo_list.add(vo);
				/*vo.(RS.getString("cd_nm"));
				vo_list.add(vo);*/
				
				
			 }
		}
		
		
		
		
		 
		 
		return vo_list;
	}
}
