package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.CONT_CAT_INFO_DTO;
import util.JDBCUtil;

public class CONT_CAT_INFO_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	//아이디 최대값 읽어 오기
	public String getMaxId() {
		
		String getMaxId = "select max(CONT_CAT_ID)"
    					+ " from CONT_CAT_INFO";
		CONT_CAT_INFO_DTO CONT_CAT_INFO_DTO = new CONT_CAT_INFO_DTO();
		
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(getMaxId);
			
			RS = PST.executeQuery();
			
			if(RS.next()){
				CONT_CAT_INFO_DTO.setCont_cat_id(RS.getString("max(CONT_CAT_ID)"));
			 }
			System.out.println(CONT_CAT_INFO_DTO.getCont_cat_id());
			
			System.out.println("===> 공사공종정보 max(CONT_CAT_ID) 조회 성공 ===");
		} catch (Exception e) {
			System.out.println("===> 공사공종정보 max(CONT_CAT_ID) 조회 실패 ===");
			e.printStackTrace();
		} finally {
			JDBCUtil.close(PST, CN);
		}
		
		return CONT_CAT_INFO_DTO.getCont_cat_id();
	}
	//상세코드 최대값 읽어 오기
	public String getMaxDetCd(CONT_CAT_INFO_DTO CONT_CAT_INFO_DTO) {
		CONT_CAT_INFO_DTO dto2 = new CONT_CAT_INFO_DTO();
		System.out.println(CONT_CAT_INFO_DTO.getCat_cd());
		String getMaxDetCd = "select max(DET_CAT_CD)"
    					+ " from CONT_CAT_INFO"
						+ " where CAT_CD = ?";
		//CONT_CAT_INFO_DTO CONT_CAT_INFO_DTO = new CONT_CAT_INFO_DTO();
		
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(getMaxDetCd);
			PST.setString(1, CONT_CAT_INFO_DTO.getCat_cd());
			
			RS = PST.executeQuery();
			
			if(RS.next()){
				dto2.setDet_cat_cd(RS.getString("max(DET_CAT_CD)"));
			 }
			System.out.println(dto2.getDet_cat_cd());
			
			System.out.println("===> 공사공종정보 max(DET_CAT_CD) 조회 성공 ===");
		} catch (Exception e) {
			System.out.println("===> 공사공종정보 max(DET_CAT_CD) 조회 실패 ===");
			e.printStackTrace();
		} finally {
			JDBCUtil.close(PST, CN);
		}
		if(dto2.getDet_cat_cd() == null) {
			dto2.setDet_cat_cd(CONT_CAT_INFO_DTO.getCat_cd());
		}
		System.out.println(dto2.getDet_cat_cd()+"Null Test");
		System.out.println(dto2.getDet_cat_cd().length());
		return dto2.getDet_cat_cd();
	}
	//카테고리 목록 읽어오기
	public List<CONT_CAT_INFO_DTO> getCatList() {
		String getCatList = "SELECT CONT_CAT_ID, CONT_CAT_NM, CAT_CD, DET_CAT_CD, CAT_LVL "
						+ " FROM CONT_CAT_INFO "
						+ " WHERE CAT_LVL = 1;";

		List<CONT_CAT_INFO_DTO> catList = new ArrayList<CONT_CAT_INFO_DTO>();
		
		try {
			CN = JDBCUtil.getConnection();
			PST = CN.prepareStatement(getCatList);
			
			RS = PST.executeQuery();
			
			while(RS.next()){
				CONT_CAT_INFO_DTO CONT_CAT_INFO_DTO = new CONT_CAT_INFO_DTO();
				
				CONT_CAT_INFO_DTO.setCont_cat_id(RS.getString("CONT_CAT_ID"));
				CONT_CAT_INFO_DTO.setCont_cat_nm(RS.getString("CONT_CAT_NM"));
				CONT_CAT_INFO_DTO.setCat_cd(RS.getString("CAT_CD"));
				CONT_CAT_INFO_DTO.setDet_cat_cd(RS.getString("DET_CAT_CD"));
				CONT_CAT_INFO_DTO.setCat_lvl(RS.getInt("CAT_LVL"));
				
				catList.add(CONT_CAT_INFO_DTO);
			 }
			
			System.out.println("===> 공사공종 1차 카테고리 읽어오기 성공 ===");
		} catch (Exception e) {
			System.out.println("===> 공사공종 1차 카테고리 읽어오기 실패 ===");
			e.printStackTrace();
		} finally {
			JDBCUtil.close(PST, CN);
		}
		
		return catList;
	}
	// 카테고리 입력하기
	public void insertContCatInfo(CONT_CAT_INFO_DTO CONT_CAT_INFO_DTO){
    	String const_cont_info_INSERT = "insert into CONT_CAT_INFO "
					    			+ " (cont_cat_nm, cat_cd, det_cat_cd, cat_lvl, cont_cat_id) "
					    			+ " values(?,?,?,?,?)";
    	try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(const_cont_info_INSERT);
            
            PST.setString(1, CONT_CAT_INFO_DTO.getCont_cat_nm());
        	PST.setString(2, CONT_CAT_INFO_DTO.getCat_cd());
        	PST.setString(3, CONT_CAT_INFO_DTO.getDet_cat_cd());
        	PST.setInt(4, CONT_CAT_INFO_DTO.getCat_lvl());
        	PST.setString(5, CONT_CAT_INFO_DTO.getCont_cat_id());
        	
            PST.executeUpdate();
            System.out.println("===> 공사공종정보 CONT_CAT_INFO_insert 성공 ===");
        } catch (Exception e) {
        	System.out.println("===> 공사공종정보 CONT_CAT_INFO_insert 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }


}
