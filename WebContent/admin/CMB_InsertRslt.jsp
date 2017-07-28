<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.COMP_MBR_BAS_DAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comp_mbr_bas_DTO" class="dto.COMP_MBR_BAS_DTO" />
<jsp:setProperty name="comp_mbr_bas_DTO" property="*" />
<%
String a=request.getParameter("wire_tel_1");
String b=request.getParameter("wire_tel_2");
String c=request.getParameter("wire_tel_3");
String tel=a+"-"+b+"-"+c;
comp_mbr_bas_DTO.setWire_tel_no(tel);
%>
<%
//회원사정보 입력
COMP_MBR_BAS_DAO comp_mbr_bas_DAO = new COMP_MBR_BAS_DAO();
comp_mbr_bas_DAO.comp_mbr_bas_Insert(comp_mbr_bas_DTO);
%>
<%response.sendRedirect("/gplus2/index.jsp");%>
