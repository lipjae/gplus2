package daoLee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dtoLee.detailDTO;
import util.JDBCUtil;

public class detailDAO {

	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public List<detailDTO> detail(String id) throws SQLException{
		List<detailDTO> res_list = new ArrayList<>();
		String sql;
		
		sql="select  a.BUS_AREA_LOC as 사업자위치,\r\n" + 
				"a.TOT_AREA_NO as 연면적,\r\n" + 
				" group_concat(distinct (select CD_NM from CMN_CD_DTL where CMN_CD_ID = b.BULD_USAG_CD)) as 건물용도,\r\n" + 
				"c.ONE_LINC_YN 단종면허,\r\n" + 
				"(select CD_NM from CMN_CD_DTL where CMN_CD_ID = c.QUOT_EXPT_CD) as 견적예가,\r\n" + 
				"c.INPUT_EXPT_DT as 투입예정,\r\n" + 
				"(select CD_NM from CMN_CD_DTL where CMN_CD_ID = c.PAY_COND_CD) as 결제조건,\r\n" + 
				"a.BUS_NM as 사업명,\r\n" + 
				"(select CD_NM from CMN_CD_DTL where CMN_CD_ID = (select DIST_ZONE_CD from DIST_ZONE_INFO where CONST_ID = a.CONST_ID)) as 용도지구,\r\n" + 
				"a.CONT_SIZE as 건축규모,\r\n" + 
				"(select CD_NM from CMN_CD_DTL where CMN_CD_ID =a.CONT_STRUT_CD) as 건축구조,\r\n" + 
				"a.GRND_AREA_NO as 대지면적,\r\n" + 
				"a.CONST_AREA_NO as 건축면적,\r\n" + 
				"a.FLOR_AREA_RAT as 건폐율,\r\n" + 
				"a.USE_AREA_RAT as 용적률,\r\n" + 
				"a.PRK_NO as 주차대수,\r\n" + 
				"c.QUOT_EXPT_AMT as 견적예가금액,\r\n" + 
				"(select CD_NM from CMN_CD_DTL where CMN_CD_ID = c.QUOT_MET_CD) as 견적방법,\r\n" + 
				"c.PRE_YM_TEST_AMT as 시평액,\r\n" + 
				"c.PAY_COND_AMT as 결제조건,\r\n" + 
				"a.ADD_INFO as 추가정보,\r\n" + 
				"(select CD_NM from CMN_CD_DTL where CMN_CD_ID = c.QUOT_PRG_STAT_CD) as 진행상태,\r\n" + 
				"a.MNG_QUOT_JOIN_CNT as 참여수,\r\n" + 
				"c.CONT_CAT_ID 공종\r\n" + 
				"from CONST_BAS a\r\n" + 
				"left join BULD_USAG_INFO b\r\n" + 
				"on a.CONST_ID = b.CONST_ID\r\n" + 
				"left join CONST_CONT_INFO c\r\n" + 
				"on a.CONST_ID = c.CONST_ID\r\n" + 
				"where a.CONST_ID = ?";
		
		System.out.println(sql);
		 CN = JDBCUtil.getConnection();
		 PST = CN.prepareStatement(sql); // 쿼리 준비
		 PST.setString(1, id);
		 RS = PST.executeQuery();
		 
		 while(RS.next()) {
			 detailDTO res = new detailDTO();
			 res.setColunm1(RS.getString("사업자위치"));
			 res.setColunm2(RS.getString("연면적"));
			 res.setColunm3(RS.getString("건물용도"));
			 res.setColunm4(RS.getString("단종면허"));
			 res.setColunm5(RS.getString("견적예가"));
			 res.setColunm6(RS.getString("투입예정"));
			 res.setColunm7(RS.getString("결제조건"));
			 res.setColunm8(RS.getString("사업명"));
			 res.setColunm9(RS.getString("용도지구"));
			 res.setColunm10(RS.getString("건축규모"));
			 res.setColunm11(RS.getString("대지면적"));
			 res.setColunm12(RS.getString("건축면적"));
			 res.setColunm13(RS.getString("건폐율"));
			 res.setColunm14(RS.getString("용적률"));
			 res.setColunm15(RS.getString("주차대수"));
			 res.setColunm16(RS.getString("견적예가금액"));
			 res.setColunm17(RS.getString("견적방법"));
			 res.setColunm18(RS.getString("시평액"));
			 res.setColunm19(RS.getString("결제조건"));
			 res.setColunm20(RS.getString("건축구조"));
			 res.setColunm21(RS.getString("추가정보"));
			 res.setColunm22(RS.getString("진행상태"));
			 res.setColunm23(RS.getString("참여수"));
			 res.setColunm24(RS.getString("공종"));
			 /*res.setColunm20(RS.getString("사업자위치"));
			 res.setColunm21(RS.getString("사업자위치"));
			 res.setColunm22(RS.getString("사업자위치"));*/
			 res_list.add(res);
			 
			 
			 
		 }
		
		return res_list;
	}
	
	
	
	
}
