package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.DIST_ZONE_INFO_DTO;
import util.JDBCUtil;

public class DIST_ZONE_INFO_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public void dist_zone_info_Insert(DIST_ZONE_INFO_DTO dist_zone_info_DTO){
    	String dist_zone_info_INSERT = "insert into DIST_ZONE_INFO values(?,?)";
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(dist_zone_info_INSERT);
            
            String allZone=dist_zone_info_DTO.getDist_zone_cd();
            String[] zone=allZone.split(",");
            
            for(int i=0;i<zone.length;i++){
            	PST.setString(1, dist_zone_info_DTO.getConst_id());
            	PST.setString(2, zone[i]);
            	PST.executeUpdate();
            }
            
            System.out.println("===> 용도지구 DIST_ZONE_INFO_insert 성공 ===");
        } catch (Exception e) {
        	System.out.println("===> 용도지구 DIST_ZONE_INFO_insert 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }

}
