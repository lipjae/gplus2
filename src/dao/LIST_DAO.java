package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.CONT_CAT_INFO_DTO;
import dto.LIST_CONSTADD_DTO;
import dto.LIST_CONST_DTO;
import dto.LIST_MEMBER_DTO;
import dto.LIST_QUOTE_DTO;
import dto.LIST_REGISTER_DTO;
import util.JDBCUtil;

public class LIST_DAO {

	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;

	
	//공종 코드 테이블 레벨 1
	public List<CONT_CAT_INFO_DTO> getContCatLv1List(CONT_CAT_INFO_DTO list){
		String contCatInfo_Query="SELECT * FROM CONT_CAT_INFO WHERE CAT_LVL=1";

		//		 	System.out.println(contCatInfo_Query);
		List<CONT_CAT_INFO_DTO> cci_List = new ArrayList<CONT_CAT_INFO_DTO>();
		try {
			CN = JDBCUtil.getConnection();    
			PST = CN.prepareStatement(contCatInfo_Query);
			RS = PST.executeQuery();
			while(RS.next()){
				CONT_CAT_INFO_DTO cci = new CONT_CAT_INFO_DTO();
				cci.setCont_cat_id(RS.getString("cont_cat_id"));
				cci.setCont_cat_nm(RS.getString("cont_cat_nm"));
				cci.setCat_cd(RS.getString("cat_cd"));
				cci.setDet_cat_cd(RS.getString("det_cat_cd"));
				cci.setCat_lvl(RS.getInt("cat_lvl"));

				cci_List.add(cci);
			}
			System.out.println("=== 공종카테고리 레벨1 불러오기 성공 ===");
		} catch (Exception e) {
			System.out.println("=== 공종카테고리 레벨1 불러오기 실패 ===");
			e.printStackTrace();
		} finally { JDBCUtil.close(RS, PST, CN);  }
		return cci_List;
	}
	
		
	//공종추가등록을 위한 전체정보 집계
	public List<LIST_CONSTADD_DTO> getConstAddInfo(String id, String ccid){
		 String constAdd = 
				 "SELECT\n"
						 +"A.BUS_NM BUS_NM\n"
						 +",B.CONT_CAT_ID CONT_CAT_ID\n"
						 +",D.CONT_CAT_NM CONT_CAT_NM\n"
						 +",A.CONT_ZONE_CD CONT_ZONE_CD\n"
						 +",E.CD_NM CONT_ZONE_NM\n"
						 +",GROUP_CONCAT(DISTINCT F.DIST_ZONE_CD) DIST_ZONE_CD\n"
						 +",GROUP_CONCAT(DISTINCT G.CD_NM) DIST_ZONE_NM\n"
						 +",A.CONT_STRUT_CD CONT_STRUT_CD"
						 +",GROUP_CONCAT(DISTINCT H.BULD_USAG_CD) BULD_USAG_CD\n"
						 +",GROUP_CONCAT(DISTINCT I.CD_NM) BULD_USAG_NM\n"
						 +",A.BUS_AREA_LOC BUS_AREA_LOC\n"
						 +",A.CONT_SIZE CONT_SIZE\n"
						 +",DATE_FORMAT(B.INPUT_EXPT_DT,'%Y년%m월%d일') INPUT_EXPT_DT\n"
						 +",A.GRND_AREA_NO GRND_AREA_NO\n"
						 +",A.CONST_AREA_NO CONST_AREA_NO\n"
						 +",A.TOT_AREA_NO TOT_AREA_NO\n"
						 +",A.FLOR_AREA_RAT FLOR_AREA_RAT\n"
						 +",A.USE_AREA_RAT USE_AREA_RAT\n"
						 +",A.PRK_NO PRK_NO\n"
						 +",A.CONST_BUS_NM CONST_BUS_NM\n"
						 +",B.QUOT_EXPT_CD QUOT_EXPT_CD\n"
						 +",B.QUOT_EXPT_AMT QUOT_EXPT_AMT\n"
						 +",B.QUOT_MET_CD QUOT_MET_CD\n"
						 +",B.QUOT_MET_AMT QUOT_MET_AMT\n"
						 +",B.ONE_LINC_YN ONE_LINC_YN\n"
						 +",B.PRE_YM_TEST_AMT PRE_YM_TEST_AMT\n"
						 +",B.PAY_COND_CD PAY_COND_CD\n"
						 +",B.PAY_COND_AMT PAY_COND_AMT\n"
						 +",A.ADD_INFO ADD_INFO\n"
						 +",A.CONST_BUS_NM\n"
						 +",A.REP_MNG_NM\n"
						 +",A.REP_CONTAT_TEL_NO\n"
						 +",B.QUOT_PRG_STAT_CD QUOT_PRG_STAT_CD\n"
						 +"FROM CONST_BAS A\n"
						 +"LEFT OUTER JOIN CONST_CONT_INFO B\n"
						 +"ON (A.CONST_ID = B.CONST_ID)\n"
						 +"LEFT OUTER JOIN CMN_CD_DTL C\n"
						 +"ON ( B.QUOT_PRG_STAT_CD = C.CMN_CD_ID AND C.CMN_CD_GRP_ID = 'QZCD')\n"
						 +"LEFT OUTER JOIN CONT_CAT_INFO D\n"
						 +"ON ( B.CONT_CAT_ID = D.CONT_CAT_ID)\n"
						 +"LEFT OUTER JOIN CMN_CD_DTL E\n"
						 +"ON ( A.CONT_ZONE_CD = E.CMN_CD_ID AND E.CMN_CD_GRP_ID = 'ZON')\n"
						 +"LEFT OUTER JOIN DIST_ZONE_INFO F\n"
						 +"ON ( A.CONST_ID = F.CONST_ID)\n"
						 +"LEFT OUTER JOIN CMN_CD_DTL G\n"
						 +"ON ( F.DIST_ZONE_CD = G.CMN_CD_ID AND G.CMN_CD_GRP_ID = 'UDZ')\n"
						 +"LEFT OUTER JOIN BULD_USAG_INFO H\n"
						 +"ON ( A.CONST_ID = H.CONST_ID)\n"
						 +"LEFT OUTER JOIN CMN_CD_DTL I\n"
						 +"ON ( H.BULD_USAG_CD = I.CMN_CD_ID AND I.CMN_CD_GRP_ID = 'BUC')\n"
						 +"WHERE A.CONST_ID=? AND B.CONT_CAT_ID=?\n";
		 
		 List<LIST_CONSTADD_DTO> constAddList = new ArrayList<LIST_CONSTADD_DTO>();
		 try {
			 CN = JDBCUtil.getConnection();    
			 PST = CN.prepareStatement(constAdd);
			 PST.setString(1, id);
			 PST.setString(2, ccid);
			 RS = PST.executeQuery();
			 while(RS.next()){
				 LIST_CONSTADD_DTO con = new LIST_CONSTADD_DTO();
				 con.setBus_nm(RS.getString("bus_nm"));
				 con.setCont_cat_id(RS.getString("cont_cat_id"));
				 con.setCont_cat_nm(RS.getString("cont_cat_nm"));
				 con.setCont_zone_cd(RS.getString("cont_zone_cd"));
				 con.setCont_zone_nm(RS.getString("cont_zone_nm"));
				 con.setDist_zone_cd(RS.getString("dist_zone_cd"));
				 con.setDist_zone_nm(RS.getString("dist_zone_nm"));
				 con.setCont_strut_cd(RS.getString("cont_strut_cd"));
				 con.setBuld_usag_cd(RS.getString("buld_usag_cd"));
				 con.setBuld_usag_nm(RS.getString("buld_usag_nm"));
				 con.setBus_area_loc(RS.getString("bus_area_loc"));
				 con.setCont_size(RS.getString("cont_size"));
				 con.setInput_expt_dt(RS.getString("input_expt_dt"));
				 con.setGrnd_area_no(RS.getInt("grnd_area_no"));
				 con.setConst_area_no(RS.getInt("const_area_no"));
				 con.setTot_area_no(RS.getInt("tot_area_no"));
				 con.setFlor_area_rat(RS.getInt("flor_area_rat"));
				 con.setUse_area_rat(RS.getInt("use_area_rat"));
				 con.setPrk_no(RS.getInt("prk_no"));
				 con.setConst_bus_nm(RS.getString("const_bus_nm"));
				 con.setQuot_expt_cd(RS.getString("quot_expt_cd"));
				 con.setQuot_expt_amt(RS.getInt("quot_expt_amt"));
				 con.setQuot_met_cd(RS.getString("quot_met_cd"));
				 con.setQuot_met_amt(RS.getInt("quot_met_amt"));
				 con.setOne_linc_yn(RS.getString("one_linc_yn"));
				 con.setPre_ym_test_amt(RS.getInt("pre_ym_test_amt"));
				 con.setPay_cond_cd(RS.getString("pay_cond_cd"));
				 con.setPay_cond_amt(RS.getInt("pay_cond_amt"));
				 con.setAdd_info(RS.getString("add_info"));
				 con.setConst_bus_nm(RS.getString("const_bus_nm"));
				 con.setRep_mng_nm(RS.getString("rep_mng_nm"));
				 con.setRep_contat_tel_no(RS.getString("rep_contat_tel_no"));
				 con.setQuot_prg_stat_cd(RS.getString("quot_prg_stat_cd"));
				 
				 constAddList.add(con);
			 }
			 System.out.println("=== 공종추가등록 정보 불러오기 성공 ===");
		 } catch (Exception e) {
			 System.out.println("=== 공종추가등록 정보 불러오기 실패 ===");
			 e.printStackTrace();
		 } finally { JDBCUtil.close(RS, PST, CN);  }
		 return constAddList;
	 }
	
	
	//현장정보 집계
	public List<LIST_CONST_DTO> getCBList(LIST_CONST_DTO list){
		String list_const_Query=
				"SELECT @ROWNUM := @ROWNUM+1 NO\n"
						+ ",A.CONST_ID"
						+ ",C.CD_NM PRG_STAT_NM\n"
						+ ",B.QUOT_PRG_STAT_CD\n"
						+ ",B.REG_DT\n"
						+ ",DATE_FORMAT(B.INPUT_EXPT_DT,'%Y.%m') INPUT_EXPT_DT\n"
						+ ",A.BUS_NM      \n"
						+ ",B.CONT_CAT_ID\n"
						+ ",D.CONT_CAT_NM\n"
						+ ",A.CONT_ZONE_CD\n"
						+ ",E.CD_NM ZONE_NM\n"
						+ ",A.CONST_BUS_NM\n"
						+ ",A.REP_MNG_NM\n"
						+ ",A.REP_CONTAT_TEL_NO\n"
						+ ",B.MNG_QUOT_JOIN_CNT\n"
						+ "FROM CONST_BAS A LEFT OUTER JOIN CONST_CONT_INFO B\n"
						+ "ON (A.CONST_ID = B.CONST_ID)\n"
						+ "LEFT OUTER JOIN CMN_CD_DTL C\n"
						+ "ON ( B.QUOT_PRG_STAT_CD = C.CMN_CD_ID \n"
						+ "AND C.CMN_CD_GRP_ID = 'QZCD') \n"
						+ "LEFT OUTER JOIN CONT_CAT_INFO D\n"
						+ "ON ( B.CONT_CAT_ID = D.CONT_CAT_ID) \n"
						+ "LEFT OUTER JOIN CMN_CD_DTL E\n"
						+ "ON ( A.CONT_ZONE_CD = E.CMN_CD_ID \n"
						+ "AND E.CMN_CD_GRP_ID = 'ZON') ,\n"
						+ "(SELECT @ROWNUM := 0) F  ";

		//		 	System.out.println(const_bas_Query);
		List<LIST_CONST_DTO> cb_ALL_List = new ArrayList<LIST_CONST_DTO>();
		try {
			CN = JDBCUtil.getConnection();    
			PST = CN.prepareStatement(list_const_Query);
			RS = PST.executeQuery();
			while(RS.next()){
				LIST_CONST_DTO cb_all_dto = new LIST_CONST_DTO();
				cb_all_dto.setNo(RS.getInt("no"));
				cb_all_dto.setConst_id(RS.getString("const_id"));
				cb_all_dto.setPrg_stat_nm(RS.getString("prg_stat_nm"));
				cb_all_dto.setQuot_prg_stat_cd(RS.getString("quot_prg_stat_cd"));
				cb_all_dto.setReg_dt(RS.getDate("reg_dt"));
				cb_all_dto.setInput_expt_dt(RS.getString("input_expt_dt"));
				cb_all_dto.setBus_nm(RS.getString("bus_nm"));
				cb_all_dto.setCont_cat_id(RS.getString("cont_cat_id"));
				cb_all_dto.setCont_cat_nm(RS.getString("cont_cat_nm"));
				cb_all_dto.setCont_zone_cd(RS.getString("cont_zone_cd"));
				cb_all_dto.setZone_nm(RS.getString("zone_nm"));
				cb_all_dto.setConst_bus_nm(RS.getString("const_bus_nm"));
				cb_all_dto.setRep_mng_nm(RS.getString("rep_mng_nm"));
				cb_all_dto.setRep_contat_tel_no(RS.getString("rep_contat_tel_no"));
				cb_all_dto.setMng_quot_join_cnt(RS.getInt("mng_quot_join_cnt"));
				cb_ALL_List.add(cb_all_dto);
			}
			System.out.println("=== 현장정보 불러오기 성공 ===");
		} catch (Exception e) {
			System.out.println("=== 현장정보 불러오기 실패 ===");
			e.printStackTrace();
		} finally { JDBCUtil.close(RS, PST, CN);  }
		return cb_ALL_List;
	} 

	//회원사(현장등록 건설사) 집계
	public List<LIST_MEMBER_DTO> getMemSiteList(LIST_MEMBER_DTO list){
		String member_site_Query=
				"SELECT @ROWNUM := @ROWNUM+1 NO\n"
						+",A.CUST_COMP_ID CUST_COMP_ID\n"        
						+",A.JOIN_DT JOIN_DT\n"
						+",A.COMP_NM COMP_NM\n"
						+",A.CONT_CAT_ID CONT_CAT_ID\n"
						+",C.CONT_CAT_NM CONT_CAT_NM\n"
						+",A.MNG_NM MNG_NM\n"
						+",A.WIRE_TEL_NO WIRE_TEL_NO\n"
						+",A.WIREL_TEL_NO WIREL_TEL_NO\n"
						+",A.EMAI_ADDR EMAI_ADDR\n"
						+",A.CUST_REG_STAT_CD CUST_REG_STAT_CD\n"
						+",B.CD_NM CD_NM\n"
						+"FROM COMP_MBR_BAS A\n" 
						+"LEFT OUTER JOIN CMN_CD_DTL B\n"
						+"ON (A.CUST_REG_STAT_CD = B.CMN_CD_ID AND B.CMN_CD_GRP_ID = 'CRP')\n" 
						+"LEFT OUTER JOIN CONT_CAT_INFO C\n"
						+"ON (A.CONT_CAT_ID = C.CONT_CAT_ID) ,\n"
						+"(SELECT @ROWNUM := 0) D\n" 
						+"WHERE A.JOIN_TYPE_CD='JPN'\n";

		//		 	System.out.println(member_site_Query);
		List<LIST_MEMBER_DTO> memberSiteList = new ArrayList<LIST_MEMBER_DTO>();
		try {
			CN = JDBCUtil.getConnection();    
			PST = CN.prepareStatement(member_site_Query);
			RS = PST.executeQuery();
			while(RS.next()){
				LIST_MEMBER_DTO site = new LIST_MEMBER_DTO();
				
				site.setNo(RS.getInt("no"));
				site.setCust_comp_id(RS.getString("cust_comp_id"));
				site.setJoin_dt(RS.getDate("join_dt"));
				site.setComp_nm(RS.getString("comp_nm"));
				site.setCont_cat_id(RS.getString("cont_cat_id"));
				site.setCont_cat_nm(RS.getString("cont_cat_nm"));
				site.setMng_nm(RS.getString("mng_nm"));
				site.setWire_tel_no(RS.getString("wire_tel_no"));
				site.setWirel_tel_no(RS.getString("wirel_tel_no"));
				site.setEmai_addr(RS.getString("emai_addr"));
				site.setCust_reg_stat_cd(RS.getString("cust_reg_stat_cd"));
				site.setCd_nm(RS.getString("cd_nm"));

				memberSiteList.add(site);
			}
			System.out.println("=== 현장등록 건설사 불러오기 성공 ===");
		} catch (Exception e) {
			System.out.println("=== 현장등록 건설사 불러오기 실패 ===");
			e.printStackTrace();
		} finally { JDBCUtil.close(RS, PST, CN);  }
		return memberSiteList;
	} 
	
	//회원사(협력회원사) 집계
	public List<LIST_MEMBER_DTO> getMemComList(LIST_MEMBER_DTO list){
		String member_company_Query=
				"SELECT @ROWNUM := @ROWNUM+1 NO\n"
						+",A.CUST_COMP_ID CUST_COMP_ID\n"        
						+",A.JOIN_DT JOIN_DT\n"
						+",A.COMP_NM COMP_NM\n"
						+",A.CONT_CAT_ID CONT_CAT_ID\n"
						+",C.CONT_CAT_NM CONT_CAT_NM\n"
						+",A.MNG_NM MNG_NM\n"
						+",A.WIRE_TEL_NO WIRE_TEL_NO\n"
						+",A.WIREL_TEL_NO WIREL_TEL_NO\n"
						+",A.EMAI_ADDR EMAI_ADDR\n"
						+",A.CUST_REG_STAT_CD CUST_REG_STAT_CD\n"
						+",B.CD_NM CD_NM\n"
						+"FROM COMP_MBR_BAS A\n" 
						+"LEFT OUTER JOIN CMN_CD_DTL B\n"
						+"ON (A.CUST_REG_STAT_CD = B.CMN_CD_ID AND B.CMN_CD_GRP_ID = 'CRP')\n" 
						+"LEFT OUTER JOIN CONT_CAT_INFO C\n"
						+"ON (A.CONT_CAT_ID = C.CONT_CAT_ID) ,\n"
						+"(SELECT @ROWNUM := 0) D\n" 
						+"WHERE A.JOIN_TYPE_CD='JHS'\n";

		//		 	System.out.println(member_company_Query);
		List<LIST_MEMBER_DTO> memberCompanyList = new ArrayList<LIST_MEMBER_DTO>();
		try {
			CN = JDBCUtil.getConnection();    
			PST = CN.prepareStatement(member_company_Query);
			RS = PST.executeQuery();
			while(RS.next()){
				LIST_MEMBER_DTO company = new LIST_MEMBER_DTO();
				
				company.setNo(RS.getInt("no"));
				company.setCust_comp_id(RS.getString("cust_comp_id"));
				company.setJoin_dt(RS.getDate("join_dt"));
				company.setComp_nm(RS.getString("comp_nm"));
				company.setCont_cat_id(RS.getString("cont_cat_id"));
				company.setCont_cat_nm(RS.getString("cont_cat_nm"));
				company.setMng_nm(RS.getString("mng_nm"));
				company.setWire_tel_no(RS.getString("wire_tel_no"));
				company.setWirel_tel_no(RS.getString("wirel_tel_no"));
				company.setEmai_addr(RS.getString("emai_addr"));
				company.setCust_reg_stat_cd(RS.getString("cust_reg_stat_cd"));
				company.setCd_nm(RS.getString("cd_nm"));

				memberCompanyList.add(company);
			}
			System.out.println("=== 협력 회원사 불러오기 성공 ===");
		} catch (Exception e) {
			System.out.println("=== 협력 회원사 불러오기 실패 ===");
			e.printStackTrace();
		} finally { JDBCUtil.close(RS, PST, CN);  }
		return memberCompanyList;
	} 

	//현장등록요청 집계
	public List<LIST_REGISTER_DTO> getRegisterList(LIST_REGISTER_DTO list){
		String siteRegister_Query=
				"SELECT @ROWNUM := @ROWNUM+1 NO\n"
						+",A.REG_DT REG_DT\n"
						+",A.BUS_NM BUS_NM\n"
						+",A.REG_REQ_DT REG_REQ_DT\n"
						+",A.CONST_BUS_NM CONST_BUS_NM\n"
						+",C.CONT_CAT_NM CONT_CAT_NM\n"
						+",A.REP_MNG_NM REP_MNG_NM\n"
						+",A.REP_CONTAT_TEL_NO REP_CONTAT_TEL_NO\n"
						+",A.REP_MNG_EMAIL REP_MNG_EMAIL\n"
						+"FROM CONST_BAS A\n"
						+"LEFT OUTER JOIN CONST_CONT_INFO B\n"
						+"ON (A.CONST_ID = B.CONST_ID)\n"
						+"LEFT OUTER JOIN CONT_CAT_INFO C\n"
						+"ON (B.CONT_CAT_ID = C.CONT_CAT_ID) ,\n"          
						+"(SELECT @ROWNUM := 0) D\n";

		//		 	System.out.println(siteRegister_Query);
		List<LIST_REGISTER_DTO> siteRegisterList = new ArrayList<LIST_REGISTER_DTO>();
		try {
			CN = JDBCUtil.getConnection();    
			PST = CN.prepareStatement(siteRegister_Query);
			RS = PST.executeQuery();
			while(RS.next()){
				LIST_REGISTER_DTO register = new LIST_REGISTER_DTO();
				
				register.setNo(RS.getInt("no"));
				register.setReg_dt(RS.getDate("reg_dt"));
				register.setBus_nm(RS.getString("bus_nm"));
				register.setReg_req_dt(RS.getDate("reg_req_dt"));
				register.setCont_cat_nm(RS.getString("cont_cat_nm"));
				register.setConst_bus_nm(RS.getString("const_bus_nm"));
				register.setRep_mng_nm(RS.getString("rep_mng_nm"));
				register.setRep_contat_tel_no(RS.getString("rep_contat_tel_no"));
				register.setRep_mng_email(RS.getString("rep_mng_email"));

				siteRegisterList.add(register);
			}
			System.out.println("=== 현장등록요청 불러오기 성공 ===");
		} catch (Exception e) {
			System.out.println("=== 현장등록요청 불러오기 실패 ===");
			e.printStackTrace();
		} finally { JDBCUtil.close(RS, PST, CN);  }
		return siteRegisterList;
	}
	
	//견적참여하기 집계
	public List<LIST_QUOTE_DTO> getQuoteList(LIST_QUOTE_DTO list){
		String quote_Query=
				"SELECT @ROWNUM := @ROWNUM+1 NO\n"
						+",B.QUOT_JOIN_DT QUOT_JOIN_DT\n" 
						+",A.COMP_NM COMP_NM\n" 
						+",E.CONT_CAT_NM CONT_CAT_NM\n"
						+",A.MNG_NM MNG_NM\n"
						+",A.WIRE_TEL_NO WIRE_TEL_NO\n"
						+",A.WIREL_TEL_NO WIREL_TEL_NO\n"
						+",A.EMAI_ADDR EMAI_ADDR\n"
						+",D.PLACE_NM PLACE_NM\n"
						+"FROM COMP_MBR_BAS A INNER JOIN QUOT_JOIN_INFO B\n"
						+"ON ( A.CUST_COMP_ID = B.CUST_COMP_ID)\n" 
						+"INNER JOIN CONST_CONT_INFO C\n"
						+"ON ( B.CONST_ID = C.CONST_ID\n"
						+"AND B.CONT_CAT_ID = C.CONT_CAT_ID)\n" 
						+"INNER JOIN CONST_BAS D\n"
						+"ON ( C.CONST_ID = D.CONST_ID)\n"
						+"LEFT OUTER JOIN CONT_CAT_INFO E\n"
						+"ON(A.CONT_CAT_ID=E.CONT_CAT_ID),\n"
						+"(SELECT @ROWNUM := 0) F\n";

		//		 	System.out.println(siteQuote_Query);
		List<LIST_QUOTE_DTO> quoteList = new ArrayList<LIST_QUOTE_DTO>();
		try {
			CN = JDBCUtil.getConnection();    
			PST = CN.prepareStatement(quote_Query);
			RS = PST.executeQuery();
			while(RS.next()){
				LIST_QUOTE_DTO quote = new LIST_QUOTE_DTO();
				
				quote.setNo(RS.getInt("no"));
				quote.setQuot_join_dt(RS.getDate("quot_join_dt"));
				quote.setComp_nm(RS.getString("comp_nm"));
				quote.setCont_cat_nm(RS.getString("cont_cat_nm"));
				quote.setMng_nm(RS.getString("mng_nm"));
				quote.setWire_tel_no(RS.getString("wire_tel_no"));
				quote.setWirel_tel_no(RS.getString("wirel_tel_no"));
				quote.setEmai_addr(RS.getString("emai_addr"));
				quote. setPlace_nm(RS.getString("place_nm"));

				quoteList.add(quote);
			}
			System.out.println("=== 견적참여하기 불러오기 성공 ===");
		} catch (Exception e) {
			System.out.println("=== 견적참여하기 불러오기 실패 ===");
			e.printStackTrace();
		} finally { JDBCUtil.close(RS, PST, CN);  }
		return quoteList;
	} 
}
