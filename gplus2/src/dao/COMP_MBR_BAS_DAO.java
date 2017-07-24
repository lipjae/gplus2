package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.COMP_MBR_BAS_DTO;
import util.JDBCUtil;

public class COMP_MBR_BAS_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public void comp_mbr_bas_Insert(COMP_MBR_BAS_DTO comp_mbr_bas_DTO){
    	String comp_mbr_bas_INSERT = "insert into COMP_MBR_BAS values(?,?,?,?,?,?,?,?,?,?)";
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(comp_mbr_bas_INSERT);
            
            PST.setString(1, comp_mbr_bas_DTO.getCust_comp_id());
            PST.setString(2, comp_mbr_bas_DTO.getComp_nm());
            PST.setString(3, comp_mbr_bas_DTO.getCont_cat_id());
            PST.setString(4, comp_mbr_bas_DTO.getMng_nm());
            PST.setString(5, comp_mbr_bas_DTO.getPass_no());
            PST.setString(6, comp_mbr_bas_DTO.getWire_tel_no());
            PST.setString(7, comp_mbr_bas_DTO.getWirel_tel_no());
            PST.setString(8, comp_mbr_bas_DTO.getEmai_addr());
            PST.setString(9, comp_mbr_bas_DTO.getVeri_no());
            PST.setString(10, comp_mbr_bas_DTO.getJoin_type_cd());
    
            PST.executeUpdate();
            System.out.println("===> 회원사 정보 COMP_MBR_BAS_insert 성공 ===");
        } catch (Exception e) {
        	System.out.println("===> 회원사 정보 COMP_MBR_BAS_insert 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }

}
