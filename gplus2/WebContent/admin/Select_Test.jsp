<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List"%>
<%@ page import="dao.CMN_CD_DAO" %>
<%@ page import="dto.CMN_CD_DTO" %>
<%	CMN_CD_DTO cmn_cd_DTO = new CMN_CD_DTO();
		CMN_CD_DAO cmn_cd_DAO = new CMN_CD_DAO() ;
		List<CMN_CD_DTO> cmn_cd_List = cmn_cd_DAO.get_cmn_cd_List(cmn_cd_DTO) ;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<c:forEach var="cmn" items="<%=cmn_cd_List%>">
<tr align="center" height="30">
	<td>${cmn.cmn_cd_grp_id}</td>
	<td>${cmn.cmn_cd_grp_nm}</td>
	<td>${cmn.uper_cmm_cd_grp_id}</td>
	<td>${cmn.cmn_cd_len}</td>
	<td>${cmn.cd_attr_1}</td>
</tr>
</c:forEach>
</table>
</body>
</html>