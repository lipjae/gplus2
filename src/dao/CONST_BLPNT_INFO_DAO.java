package dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dto.CONST_BLPNT_INFO_DTO;
import util.JDBCUtil;

public class CONST_BLPNT_INFO_DAO {
	
	private  Connection CN= null ;  
	private  PreparedStatement  PST= null ;  
	private  ResultSet  RS= null ;
	
	public void const_blpnt_info_Insert(CONST_BLPNT_INFO_DTO const_blpnt_info_DTO){
		
		String blueprint_INSERT = "insert into CONST_BLPNT_INFO values(?,?,0,?,?)";
    	
        try {
            CN = JDBCUtil.getConnection();
            PST = CN.prepareStatement(blueprint_INSERT);
            
            	PST.setString(1, const_blpnt_info_DTO.getConst_id());
                PST.setString(2, const_blpnt_info_DTO.getCont_cat_id());
                PST.setString(3, const_blpnt_info_DTO.getBl_prnt_nm());
                PST.setString(4, const_blpnt_info_DTO.getBl_prnt_url());
                PST.executeUpdate();	
            
            
            System.out.println("=== 도면정보 입력 성공 ===");
        } catch (Exception e) {
        	System.out.println("=== 도면정보 입력 실패 ===");
            e.printStackTrace();
        } finally {
            JDBCUtil.close(PST, CN);
        }
    }

}
