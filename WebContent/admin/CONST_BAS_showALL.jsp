<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List"%>
<%@page import="dao.CONST_BAS_DAO" %>
<%@page import="dto.CONST_BAS_DTO" %>
<jsp:useBean id="const_bas_DTO" class="dto.CONST_BAS_DTO" />
<jsp:setProperty name="const_bas_DTO" property="*" />
<%
CONST_BAS_DAO const_bas_DAO = new CONST_BAS_DAO();
List<CONST_BAS_DTO> mconst_bas_List = const_bas_DAO.get_const_bas_List(const_bas_DTO) ;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 현장정보 집계</title>
</head>
<body>

</body>
</html>