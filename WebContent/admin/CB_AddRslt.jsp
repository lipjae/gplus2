<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@page import="dao.CONST_CONT_INFO_DAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="const_cont_info_DTO" class="dto.CONST_CONT_INFO_DTO" />
<jsp:setProperty name="const_cont_info_DTO" property="*" />
<%
//공사ID 
String constID=request.getParameter("constid");
const_cont_info_DTO.setConst_id(constID);
//공사 공종 추가 입력
CONST_CONT_INFO_DAO const_cont_info_DAO = new CONST_CONT_INFO_DAO();
const_cont_info_DAO.const_cont_info_Insert(const_cont_info_DTO);
 %>
<%response.sendRedirect("Construction_List.jsp");%>