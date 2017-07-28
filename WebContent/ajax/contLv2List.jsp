<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.CONT_CAT_INFO_DTO"%>
<%@ page import="util.JDBCUtil"%>
<%
	String sname = request.getParameter("name");
// 	String sname = "CM";

	Connection CN= null ;  
	PreparedStatement  PST= null ;  
	ResultSet  RS= null ;
	
	String contCatInfo_Query="SELECT * FROM CONT_CAT_INFO WHERE CAT_LVL=2 AND CAT_CD=?";

	//		 	System.out.println(contCatInfo_Query);
	List<CONT_CAT_INFO_DTO> cci_List = new ArrayList<CONT_CAT_INFO_DTO>();
	CN = JDBCUtil.getConnection();    
	PST = CN.prepareStatement(contCatInfo_Query);
	PST.setString(1, sname);
	RS = PST.executeQuery();
	
	while(RS.next()){
		out.print(RS.getString("cont_cat_id")+",");
 		out.print(RS.getString("cont_cat_nm")+",");
	}
	

%>


