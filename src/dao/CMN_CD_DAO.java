package dao;
import java.sql.*;
import java.util.*;
import dto.CMN_CD_DTO;
import util.JDBCUtil;

public class CMN_CD_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ; 
	private final String CMN_CD_LIST = "select * from CMN_CD";
   
    public List<CMN_CD_DTO> get_cmn_cd_List(CMN_CD_DTO vo){
        List<CMN_CD_DTO> cnm_cd_List = new ArrayList<CMN_CD_DTO>();
        try {
            CN = JDBCUtil.getConnection();    
            PST = CN.prepareStatement(CMN_CD_LIST);
            RS = PST.executeQuery();
            while(RS.next()){
            	CMN_CD_DTO cnm_cd = new CMN_CD_DTO();
            	cnm_cd.setCmn_cd_grp_id(RS.getString("cmn_cd_grp_id"));
            	cnm_cd.setCmn_cd_grp_nm(RS.getString("cmn_cd_grp_nm"));
            	cnm_cd.setUper_cmm_cd_grp_id(RS.getString("uper_cmm_cd_grp_id"));
            	cnm_cd.setCmn_cd_len(RS.getInt("cmn_cd_len"));
            	cnm_cd.setCd_attr_1(RS.getString("cd_attr_1"));
            	cnm_cd_List.add(cnm_cd);
            	System.out.println(cnm_cd_List);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally { JDBCUtil.close(RS, PST, CN);  }
        return cnm_cd_List;
    }    
    
  
} // CLASS
