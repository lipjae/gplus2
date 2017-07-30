package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.CONST_BAS_DTO;
import dto.LIST_CONST_DTO;
import util.JDBCUtil;

public class CONST_BAS_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	 public String getConst_id(CONST_BAS_DTO const_bas){
		 String const_bas_const_id = "select CONST_ID from CONST_BAS where BUS_NM=? and CONT_ZONE_CD=?";
		 try {
			 CN = JDBCUtil.getConnection();    
			 PST = CN.prepareStatement(const_bas_const_id);
			 PST.setString(1, const_bas.getBus_nm());
			 PST.setString(2, const_bas.getCont_zone_cd());
			 RS = PST.executeQuery();
			 if(RS.next()){
				 const_bas.setConst_id(RS.getString("const_id"));
			 }
		 } catch (Exception e) {
			 System.out.println("===> 공사기본정보 CONST_ID 불러오기 실패 ===");
			 e.printStackTrace();
		 } finally { JDBCUtil.close(RS, PST, CN);  }
		 return const_bas.getConst_id();
	 }
	 
	public void const_bas_Insert(CONST_BAS_DTO const_bas_DTO){
    	String const_bas_INSERT = "insert into CONST_BAS values"
    			+ "(F_GET_ID('ST')"
    			+ ",?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate(),?,?,?,?)";
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(const_bas_INSERT);
            
            PST.setString(1, const_bas_DTO.getBus_nm());
            PST.setString(2, const_bas_DTO.getBus_nm());
            PST.setString(3, const_bas_DTO.getCont_zone_cd());
            PST.setInt(4, const_bas_DTO.getTot_area_no());
            PST.setString(5, const_bas_DTO.getPlace_loc());
            PST.setString(6, const_bas_DTO.getBus_area_loc());
            PST.setString(7, const_bas_DTO.getCont_strut_cd());
            PST.setString(8, const_bas_DTO.getCont_size());
            PST.setInt(9, const_bas_DTO.getGrnd_area_no());
            PST.setInt(10, const_bas_DTO.getConst_area_no());
            PST.setInt(11, const_bas_DTO.getFlor_area_rat());
            PST.setInt(12, const_bas_DTO.getUse_area_rat());
            PST.setInt(13, const_bas_DTO.getPrk_no());
            PST.setString(14, const_bas_DTO.getConst_bus_nm());
            PST.setString(15, const_bas_DTO.getRep_mng_nm());
            PST.setString(16, const_bas_DTO.getRep_contat_tel_no());
            PST.setString(17, const_bas_DTO.getAdd_info());
            PST.setDate(18, const_bas_DTO.getReg_req_dt());
            PST.setString(19, const_bas_DTO.getRep_mng_email());
            PST.setFloat(20,const_bas_DTO.getLati_pos());
            PST.setFloat(21,const_bas_DTO.getLongi_pos());

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
