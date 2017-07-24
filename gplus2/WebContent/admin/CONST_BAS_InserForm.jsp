
<!-- 관리자 현장 정보 입력 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 현장 정보 입력</title>
</head>
<!-- 달력 Start-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="./js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<!-- 달력 End -->
<script type="text/javascript" src="./js/CONST_BAS_InsertForm.js"></script>
<body>
<form action="CONST_BAS_InsertRslt.jsp" method="post">
공사ID : <input type=text name="const_id" value="KJJ001"><br>
사업명 : <input type=text name="bus_nm"  value="핫도그 타워 신축"><br>
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
현장명 : <input type=text name="place_nm"  value="문정동 핫도그 타워"><br>
권역 : <select name="cont_zone_cd">
			<option value="MAZ" selected="selected">서울/수도권</option>
			<option value="CHZ">충청권</option>
			<option value="YNZ">영남권</option>
			<option value="HNZ">호남권</option>
			<option value="KWZ">강원권</option>
			<option value="OEZ">해외/기타</option>
  		</select><br>
건물용도 : <select name="buld_usag_cd_select" id="buld_usag_cd_select" onchange="selectUsag()">
				<option value="BAH" selected="selected">단독주택</option>
				<option value="BCH" >공동주택</option>
				<option value="FHE">제1종 근린생활시설</option>
				<option value="SHE">제2종 근린생활시설</option>
				<option value="CDE">문화 및 집회시설</option>
				<option value="RGE">종교시설</option>
				<option value="SAE">판매시설</option>
				<option value="SLE">숙박시설</option>
				<option value="FAE">공장</option>
			 </select>
			 <input type=text name="buld_usag_cd" id="buld_usag_cd" value="BAH">
			 <br>
용도지구 : <select name="dist_zone_cd_select" id="dist_zone_cd_select" onchange="selectZone()">
				<option value="UCTN" selected="selected">도시지역</option>
				<option value="UMNZ">관리지역</option>
				<option value="UARZ">농림지역</option>
				<option value="UNEZ">자연환경보전지역</option>
				<option value="UFUZ">제1종전용주거지역</option>
				<option value="USUZ">제2종전용주거지역</option>
				<option value="UFLZ">제1종일반주거지역</option>
				<option value="USLZ">제2종일반주거지역</option>
				<option value="UTLZ">제3종일반주거지역</option>
				<option value="USIZ">준주거지역</option>
				<option value="UCCZ">중심상업지역</option>
				<option value="UNCZ">일반상업지역</option>
				<option value="UKCZ">근린상업지역</option>
				<option value="UUCZ">유통상업지역</option>
				<option value="URTZ">전용공업지역</option>
				<option value="ULTZ">일반공업지역</option>
				<option value="USBZ">준공업지역</option>
				<option value="UGNZ">보전녹지지역</option>
				<option value="UINZ">생산녹지지역</option>
				<option value="UNNZ">자연녹지지역</option>
				<option value="USNZ">보전관리지역</option>
				<option value="UCNZ">생산관리지역</option>
				<option value="UDNZ">계획관리지역</option>
				<option value="UNLZ">자연경관지구</option>
				<option value="UWLZ">수변경관지구</option>
				<option value="UMLZ">시가지경관지구</option>
				<option value="UCLZ">중심지미관지구</option>
				<option value="UHLZ">역사문화미관지구</option>
				<option value="ULLZ">일반미관지구</option>
				<option value="UMHZ">최고고도지구</option>
				<option value="ULZZ">최저고도지구</option>
				<option value="UFIZ">방화지구</option>
			 </select>
			 <input type=text name="dist_zone_cd" id="dist_zone_cd" value="UCTN">
			 <input type=text name="dist_zone_show" id="dist_zone_show" value="도시지역">
			 
			 <br>
현장위치 : <input type=text name="place_loc" value="문정동 핫도그"><br>
사업지 위치 : <input type=text name="bus_area_loc" value="문정동 현대지식산업센터"><br>
건축구조 : <select name="cont_strut_cd">
				<option value="ICC" selected="selected">철근콘크리트구조</option>
				<option value="IHJ">철골조</option>
				<option value="LHJ">경량철골조</option>
				<option value="CHS">철골철근콘크리트구조</option>
				<option value="THS">목조</option>
				<option value="SAS">조적조</option>
	  		 </select><br>
건축규모 : <input type=text name="cont_size" value="20층"><br>
대지면적 : <input type=text name="grnd_area_no" id="grnd_area_no" value="1000" onkeyup="convertToPYa()">m²<b id="a"></b><br>
건축면적 : <input type=text name="const_area_no" id="const_area_no" value="800" onkeyup="convertToPYb()">m²<b id="b"></b><br>
연면적 : <input type=text name="tot_area_no" id="tot_area_no" value="4000" onkeyup="convertToPYc()">m²<b id="c"></b><br>
건폐율 : <input type=text name="flor_area_rat" value="80">%<br>
용적률 : <input type=text name="use_area_rat" value="500">%<br>
주차대수 : <input type=text name="prk_no" value="200">대<br>
견적예가 : <input type=text name="quot_expt_amt" value="200">원
			 <input type="radio" name="quot_expt_cd" value="QOPN" checked>공개
			 <input type="radio" name="quot_expt_cd" value="QCPN">비공개<br>
견적방법 : <input type="radio" name="quot_met_cd" value="PQCD" checked onclick="inputQuotNoShow()">물량견적
			 <input type="radio" name="quot_met_cd" value="BQCD" onclick="inputQuotNoShow()">도면견적
			 <input type="radio" id="quot_met_cd" name="quot_met_cd" value="DQCD" onclick="inputQuot()">직접입력
			 <input type=text id="quot_met_amt" name="quot_met_amt" value="" style=display:none;><br>
단종면허 : <input type="radio" name="one_linc_yn" value="Y" checked>유
			 <input type="radio" name="one_linc_yn" value="N">무<br>
전년도 시평액 : <input type=text name="pre_ym_test_amt" value="200">억원<br>
결제조건 : <input type=text name="pay_cond_amt" value="100">
			 <input type="radio" name="pay_cond_cd" value="POPN" checked>공개
			 <input type="radio" name="pay_cond_cd" value="PCPN">비공개<br>
추가정보 : <input type=text name="add_info" value="결제는 바로바로"><br>
건설사명 : <input type=text name="const_bus_nm" value="와이즈건설"><br>
대표 담당자명 : <input type=text name="rep_mng_nm" value="핫도그왕"><br>
대표 연락처 : <input type=text name="rep_contat_tel_no" value="010-7777-1234"><br>
진행사항 : <input type="radio" name="quot_prg_stat_cd" value="NCD" checked>신규
			 <input type="radio" name="quot_prg_stat_cd" value="QIG">견적중
			 <input type="radio" name="quot_prg_stat_cd" value="FNZ">완료<br>
투입예정월 : <input type="text" name="input_expt_dt_str" id="datepicker" value="2017-07-24"><br>
**도면 업로드 : <br>			 
<input type=submit  value="등록"><br>
</form>
</body>
</html>