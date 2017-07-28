<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>

<%@page import="dao.CONT_CAT_INFO_DAO" %>
<%@page import="dao.CONST_BAS_DAO" %>

<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="CONT_CAT_INFO_DTO" class="dto.CONT_CAT_INFO_DTO" />
<jsp:setProperty name="CONT_CAT_INFO_DTO" property="*" />


<%
CONT_CAT_INFO_DAO CONT_CAT_INFO_DAO = new CONT_CAT_INFO_DAO();
//가장 큰 아이디 받아오기
String maxId = CONT_CAT_INFO_DAO.getMaxId();
//앞의 문자만 자르기
String tempStr = maxId.substring(0,2);
//뒤의 숫자만 자르고 1 더해주기
int tempNo = Integer.parseInt(maxId.substring(2,5));
tempNo = tempNo + 1;
//int를 사용하므로 조회 된 결과가 2자리일 경우 맨 앞의 0이 생략되므로 문자로 변경하고 앞에 0을 붙여 준다
String tempNo2 = "";
if (tempNo < 100) {
	tempNo2 = "0" + String.valueOf(tempNo);
} else {
	tempNo2 = String.valueOf(tempNo);
}
CONT_CAT_INFO_DTO.setCont_cat_id(tempStr + tempNo2);

//가장 큰 상세 코드 값 받아오고 1 더해주기
String maxDetCd = CONT_CAT_INFO_DAO.getMaxDetCd(CONT_CAT_INFO_DTO);
if(maxDetCd == null || maxDetCd.length() < 3) {
	System.out.println("3보다 작다");
	CONT_CAT_INFO_DTO.setDet_cat_cd(maxDetCd + "01");
} else {
	System.out.println("3보다 크다");
	String tempDetStr = maxDetCd.substring(0, 2);
	int tempDetNo = Integer.parseInt(maxDetCd.substring(2, 4));
	tempDetNo = tempDetNo +1;
	String tempDetNo2 = "";
	if(tempDetNo < 10) {
		tempDetNo2 = "0" + String.valueOf(tempDetNo);
	} else {
		tempDetNo2 = String.valueOf(tempDetNo);
	}
	CONT_CAT_INFO_DTO.setDet_cat_cd(tempDetStr + tempDetNo2);
}

//공사 종류 입력
CONT_CAT_INFO_DAO.insertContCatInfo(CONT_CAT_INFO_DTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공종 입력2 완료</title>
</head>
<body>
공종2 입력완료~<br/>
<a href="CCI_InsertForm.jsp">이전 화면으로</a>
</body>
</html>