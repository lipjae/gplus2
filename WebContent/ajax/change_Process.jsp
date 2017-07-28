<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.CONT_CAT_INFO_DTO"%>
<%@ page import="util.JDBCUtil"%>
<%
	String sproc = request.getParameter("proc");
	String sid = request.getParameter("id");
	String sccid = request.getParameter("ccid");

	Connection CN= null ;  
	PreparedStatement  PST= null ;  
	ResultSet  RS= null ;
	
	String process_change_Query="UPDATE CONST_CONT_INFO SET QUOT_PRG_STAT_CD=? WHERE CONST_ID=? AND CONT_CAT_ID=?";

	List<CONT_CAT_INFO_DTO> cci_List = new ArrayList<CONT_CAT_INFO_DTO>();
	CN = JDBCUtil.getConnection();    
	PST = CN.prepareStatement(process_change_Query);
	PST.setString(1, sproc);
	PST.setString(2, sid);
	PST.setString(3, sccid);
	int result = PST.executeUpdate();
	
	out.print(result);
	

%>
