
<!-- 관리자 회원사 정보 입력 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 회원사 정보 입력</title>
</head>
<script type="text/javascript" src="./js/COMP_MBR_BAS_InsertForm.js"></script>
<body>
<form action="COMP_MBR_BAS_InsertRslt.jsp" method="post">
회원사ID : <input type=text name="cust_comp_id" value="hotdog486"><br>
비밀번호 : <input type=text name="pass_no" value="12341234"><br>
회사명 : <input type=text name="comp_nm" value="핫도그매니아"><br>
공종 : <select name="cont_cat_id" id="cont_cat_id" onchange="selectCategory()">
	           <option value="CT001" selected="selected">철콘</option>
	           <option value="CT006">전기</option>
	           <option value="CT011">설비</option>
	           <option value="CT023">석공사/타일</option>
	           <option value="CT016">토목</option>
	           <option value="CT019">미방조적</option>
	           <option value="CT033">도장</option>
	           <option value="CT035">실내건축</option>
	           <option value="CT043">종합건축</option>
	           <option value="CT030">외장/지붕</option>
	           <option value="CT026">금속/창호</option>
			   <option value="CT045">기타공사</option>
        </select>
상세선택 : 
		<select id="det_cat_id">
				<option value="CT002" selected="selected">철콘</option>
		        <option value="CT003">철골</option>
		        <option value="CT004">가설</option>
		        <option value="CT005">레미콘</option>
		</select>
<br>
담당자명 : <input type=text name="mng_nm" value="핫도그"><br>
유선전화 : <input type=text name="wire_tel_no" value="02-8888-1111"><br>
무선전화 : <input type=text name="wirel_tel_no" value="010-8888-9999"><br>
이메일주소 : 	<input type=hidden name="emai_addr" id="emai_addr" value="">
				<input type=text name="writeAddr" id="writeAddr" value="hotdog"> @
				<select id="selectEmail" onchange="selectSite()">
						<option>선택하세요</option> 
						<option value="daum.net">daum.net</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="inputDirect">직접입력</option>
				</select>
				<input type=text id="writeSite" style=display:none; onblur="inputEnd()">
<br>
인증번호 : <input type=text name="veri_no" value="123401234"><br>
가입유형코드 : <select name="join_type_cd">
						<option value="JPN" selected="selected">현장 등록 건설사</option>
						<option value="JHS">협력 회원사</option>
				  </select>
<br>
<input type=submit value="가입 승인">
</form>
</body>
</html>