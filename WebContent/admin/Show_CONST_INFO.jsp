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
List<CONST_BAS_DTO> const_bas_List = const_bas_DAO.get_const_bas_List(const_bas_DTO) ;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<td>NO</td>
	<td>진행사항</td>
	<td>등록일</td>
	<td>현장투입월</td>
	<td>사업명</td>
	<td>공종</td>
	<td>권역</td>
	<td>건설사명</td>
	<td>담당자명</td>
	<td>연락처</td>
</tr>
<c:forEach var="const_bas" items="<%=const_bas_List%>" varStatus="status">
<tr>
	<td>${status.count}</td>
	<td>${const_bas.bus_nm}</td>
</tr> 
</c:forEach>
</table>
</body>
</html>