<%@page import="daoLee.wishDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

wishDAO dao = new wishDAO();
String userId = request.getParameter("user");
String companyid = request.getParameter("company");
String companyid2 = request.getParameter("company2");
String wishType = request.getParameter("type");

int res = dao.wish(userId, companyid, companyid2, wishType);
out.print(res);

%>