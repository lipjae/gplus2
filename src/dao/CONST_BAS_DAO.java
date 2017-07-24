package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.CONST_BAS_DTO;
import util.JDBCUtil;

public class CONST_BAS_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	 public List<CONST_BAS_DTO> get_const_bas_List(CONST_BAS_DTO vo){
		 	String const_bas_LIST = "select * from CONST_BAS A,DIST_ZONE_INFO B,BULD_USAG_INFO C where A.CONST_ID=B.CONST_ID";
	        List<CONST_BAS_DTO> const_bas_List = new ArrayList<CONST_BAS_DTO>();
	        try {
	            CN = JDBCUtil.getConnection();    
	            PST = CN.prepareStatement(const_bas_LIST);
	            RS = PST.executeQuery();
	            while(RS.next()){
	            	CONST_BAS_DTO const_bas = new CONST_BAS_DTO();
	            	const_bas.setBus_nm(RS.getString("bus_nm"));
	            	const_bas_List.add(const_bas);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally { JDBCUtil.close(RS, PST, CN);  }
	        return const_bas_List;
	    }    
	
	public void const_bas_Insert(CONST_BAS_DTO const_bas_DTO){
    	String const_bas_INSERT = "insert into CONST_BAS values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate())";
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(const_bas_INSERT);
            
            PST.setString(1, const_bas_DTO.getConst_id());
            PST.setString(2, const_bas_DTO.getBus_nm());
            PST.setString(3, const_bas_DTO.getPlace_nm());
            PST.setString(4, const_bas_DTO.getCont_zone_cd());
            PST.setInt(5, const_bas_DTO.getTot_area_no());
            PST.setString(6, const_bas_DTO.getPlace_loc());
            PST.setString(7, const_bas_DTO.getBus_area_loc());
            PST.setString(8, const_bas_DTO.getCont_strut_cd());
            PST.setString(9, const_bas_DTO.getCont_size());
            PST.setInt(10, const_bas_DTO.getGrnd_area_no());
            PST.setInt(11, const_bas_DTO.getConst_area_no());
            PST.setInt(12, const_bas_DTO.getFlor_area_rat());
            PST.setInt(13, const_bas_DTO.getUse_area_rat());
            PST.setInt(14, const_bas_DTO.getPrk_no());
            PST.setString(15, const_bas_DTO.getConst_bus_nm());
            PST.setString(16, const_bas_DTO.getRep_mng_nm());
            PST.setString(17, const_bas_DTO.getRep_contat_tel_no());
            PST.setString(18, const_bas_DTO.getAdd_info());

            PST.executeUpdate();
            System.out.println("===> 공사기본정보 CONST_BAS _insert 성공 ===");
        } catch (Exception e) {
        	System.out.println("===> 공사기본정보 CONST_BAS_insert 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }

}
