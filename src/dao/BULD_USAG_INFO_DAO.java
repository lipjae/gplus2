package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.BULD_USAG_INFO_DTO;
import dto.CONST_BAS_DTO;
import util.JDBCUtil;

public class BULD_USAG_INFO_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public void buld_usag_info_Insert(BULD_USAG_INFO_DTO buld_usag_info_DTO){
    	String buld_usag_info_INSERT = "insert into BULD_USAG_INFO values(?,?)";
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(buld_usag_info_INSERT);
            
            String allUsag=buld_usag_info_DTO.getBuld_usag_cd();
            String[] usag=allUsag.split(",");
            
            for(int i=0;i<usag.length;i++){
            	PST.setString(1, buld_usag_info_DTO.getConst_id());
                PST.setString(2, usag[i]);
                PST.executeUpdate();	
            }
            
            System.out.println("===> 건물용도 BULD_USAG_INFO_insert 성공 ===");
        } catch (Exception e) {
        	System.out.println("===> 건물용도 BULD_USAG_INFO_insert 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }


}
