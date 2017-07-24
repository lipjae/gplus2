package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.CONST_CONT_INFO_DTO;
import util.JDBCUtil;

public class CONST_CONT_INFO_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public void const_cont_info_Insert(CONST_CONT_INFO_DTO const_cont_info_DTO){
    	String const_cont_info_INSERT = "insert into CONST_CONT_INFO values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate())";
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(const_cont_info_INSERT);
            
            PST.setString(1, const_cont_info_DTO.getConst_id());
        	PST.setString(2, const_cont_info_DTO.getCont_cat_id());
        	PST.setString(3, const_cont_info_DTO.getQuot_prg_stat_cd());
        	PST.setDate(4, const_cont_info_DTO.getInput_expt_dt());
        	PST.setString(5, const_cont_info_DTO.getQuot_expt_cd());
        	PST.setInt(6, const_cont_info_DTO.getQuot_expt_amt());
        	PST.setString(7, const_cont_info_DTO.getQuot_met_cd());
        	PST.setInt(8, const_cont_info_DTO.getQuot_met_amt());
        	PST.setString(9, const_cont_info_DTO.getPay_cond_cd());
        	PST.setInt(10, const_cont_info_DTO.getPay_cond_amt());
        	PST.setString(11, const_cont_info_DTO.getOne_linc_yn());
        	PST.setInt(12, const_cont_info_DTO.getPre_ym_test_amt());
        	
            PST.executeUpdate();
            System.out.println("===> 공사공종정보 CONST_CONT_INFO_insert 성공 ===");
        } catch (Exception e) {
        	System.out.println("===> 공사공종정보 CONST_CONT_INFO_insert 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }


}
