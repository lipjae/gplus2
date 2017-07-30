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
	String scount = request.getParameter("count");
	String sid = request.getParameter("id");
	String sccid = request.getParameter("ccid");

	Connection CN= null ;  
	PreparedStatement  PST= null ;  
	ResultSet  RS= null ;
	
	String count_plus_Query=
			"UPDATE CONST_CONT_INFO\n" 
			+"SET MNG_QUOT_JOIN_CNT=MNG_QUOT_JOIN_CNT+1\n"
			+"WHERE CONST_ID=? AND CONT_CAT_ID=?";
	
	String count_minus_Query=
			"UPDATE CONST_CONT_INFO\n" 
			+"SET MNG_QUOT_JOIN_CNT=IF(MNG_QUOT_JOIN_CNT-1<0,0,MNG_QUOT_JOIN_CNT-1)\n" 
			+"WHERE CONST_ID=? AND CONT_CAT_ID=?";

	CN = JDBCUtil.getConnection();    
	
	if(scount.equals("plus")) PST = CN.prepareStatement(count_plus_Query);
	else PST = CN.prepareStatement(count_minus_Query);
	
	
	PST.setString(1, sid);
	PST.setString(2, sccid);
	int result = PST.executeUpdate();
	
	out.print(result);
	

%>
