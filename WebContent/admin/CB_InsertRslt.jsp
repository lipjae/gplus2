<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@page import="dao.CONST_BAS_DAO" %>
<%@page import="dao.DIST_ZONE_INFO_DAO" %>
<%@page import="dao.BULD_USAG_INFO_DAO" %>
<%@page import="dao.CONST_CONT_INFO_DAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="const_bas_DTO" class="dto.CONST_BAS_DTO" />
<jsp:useBean id="dist_zone_info_DTO" class="dto.DIST_ZONE_INFO_DTO" />
<jsp:useBean id="buld_usag_info_DTO" class="dto.BULD_USAG_INFO_DTO" />
<jsp:useBean id="const_cont_info_DTO" class="dto.CONST_CONT_INFO_DTO" />
<jsp:setProperty name="const_bas_DTO" property="*" />
<jsp:setProperty name="dist_zone_info_DTO" property="*" />
<jsp:setProperty name="buld_usag_info_DTO" property="*" />
<jsp:setProperty name="const_cont_info_DTO" property="*" />
<%
String a=request.getParameter("date");
String sumStr=a.substring(0,4)+"-"+a.substring(5,7)+"-"+a.substring(8,10);
Date resultDate=Date.valueOf(sumStr);
const_cont_info_DTO.setInput_expt_dt(resultDate);
%>
<%
//공사기본정보 입력
CONST_BAS_DAO const_bas_DAO = new CONST_BAS_DAO();
const_bas_DAO.const_bas_Insert(const_bas_DTO);
/* 
//공사ID 추출
String resultID=const_bas_DAO.getConst_id(const_bas_DTO);
const_bas_DTO.setConst_id(resultID);
dist_zone_info_DTO.setConst_id(resultID);
buld_usag_info_DTO.setConst_id(resultID);
const_cont_info_DTO.setConst_id(resultID);
//용도지구 입력
DIST_ZONE_INFO_DAO dist_zone_info_DAO = new DIST_ZONE_INFO_DAO();
dist_zone_info_DAO.dist_zone_info_Insert(dist_zone_info_DTO);
//건물용도 입력
BULD_USAG_INFO_DAO buld_usag_info_DAO = new BULD_USAG_INFO_DAO();
buld_usag_info_DAO.buld_usag_info_Insert(buld_usag_info_DTO);
//공사공종정보 입력
CONST_CONT_INFO_DAO const_cont_info_DAO = new CONST_CONT_INFO_DAO();
const_cont_info_DAO.const_cont_info_Insert(const_cont_info_DTO);
 */%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
공사정보 입력완료~
</body>
</html>