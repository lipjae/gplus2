<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.COMP_MBR_BAS_DAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comp_mbr_bas_DTO" class="dto.COMP_MBR_BAS_DTO" />
<jsp:setProperty name="comp_mbr_bas_DTO" property="*" />
<%
//회원사정보 입력
COMP_MBR_BAS_DAO comp_mbr_bas_DAO = new COMP_MBR_BAS_DAO();
comp_mbr_bas_DAO.comp_mbr_bas_Insert(comp_mbr_bas_DTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
입력완료~~
</body>
</html>