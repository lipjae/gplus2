<%@page import="daoLee.loginDAO"%>
<%@page import="dtoLee.loginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
loginDTO dto = new loginDTO();
loginDAO dao = new loginDAO();

String id = request.getParameter("loginId");
String pw = request.getParameter("loginPw");
String logout;

if(request.getParameter("logout") != null){
	session.removeAttribute("id");
	session.invalidate();
}

String res = dao.loginCheck(id, pw);
String finRes = res.trim();

if(res.equals("true")){
	session.setAttribute("id", id);	
}


	

out.print(finRes.trim());
%>
