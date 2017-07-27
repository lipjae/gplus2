<%@page import="daoLee.joinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
joinDAO dao = new  joinDAO();

String name = request.getParameter("name");
String company = request.getParameter("company");
String tel = request.getParameter("tel");
String sector = request.getParameter("sector");
String email = request.getParameter("email");
String joinType = request.getParameter("joinType");

int rs = dao.join(company, name, tel, sector, email, joinType);
/* dao.test("qweqwe"); */
out.print(rs);
%>
