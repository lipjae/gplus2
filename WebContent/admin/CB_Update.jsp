<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="java.util.List"%>
<%@page import="dao.LIST_DAO" %>
<%@page import="dto.LIST_CONSTADD_DTO" %>
<%@page import="dto.CONT_CAT_INFO_DTO" %>
<jsp:useBean id="cci_DTO" class="dto.CONT_CAT_INFO_DTO" />
<%
LIST_DAO cci_DAO = new LIST_DAO();
List<CONT_CAT_INFO_DTO> cci1List = cci_DAO.getContCatLv1List(cci_DTO);
%>
<%
String id = request.getParameter("id");
String ccid =request.getParameter("ccid");
LIST_DAO add_DAO = new LIST_DAO();
List<LIST_CONSTADD_DTO> addList = add_DAO.getConstAddInfo(id,ccid);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>건축플러스 관리자 페이지 입니다.</title>
    <link href="./dist/css/bootstrap.css" rel="stylesheet">
    <link href="./dist/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="./dist/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dea589375d751894ac7d649f9e7009d2&libraries=services"></script>
<script>
$(document).ready(function(){
	itemChange();
});

function changeUint(id){
  var item = id;
  var m = document.getElementById(item).value;
  parseFloat(m);
  var py = m/3.3058;
  var chID = "ch_"+item;
  document.getElementById(chID).value = py.toFixed(2);
}

function itemChange(){
	jQuery.ajax({
		url : "../ajax/contLv2List.jsp",
		type : "POST",
		data : {
			name : $("#depth01").val()
		},
		success : function(data) {
			$('#depth02').empty();
			var s=data.split(',');
			var type = "<%=addList.get(0).getCont_cat_id() %>";
			console.log(type);
			for(var count = 0; count < s.length-1; count++){
				if(type == s[count]){
					var option = $("<option value="+s[count]+" selected> "+s[count+1]+"</option>");
				}else{
					var option = $("<option value="+s[count]+"> "+s[count+1]+"</option>");
				}
			 	
		        $('#depth02').append(option);
		        count=count+1;
			}
		},
		error : function(xhr, status, error) {
			alert("Ajax Error!");
		}
	});

}
</script>
<script type="text/javascript" src="./js/CB_InsertForm.js"></script>
<body>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                </button>
                <a class="navbar-brand" href="/index.jsp"><img src="./dist/images/logo.png" alt="건축플러스"></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li><a href="/index.jsp"><i class="fa fa-home fa-fw"></i> Home</a></li>
                <li><a href="/login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li><a href="CB_InsertForm.jsp"><i class="fa fa-folder fa-fw"></i> 현장정보입력</a></li>
                        <li><a href="Construction_List.jsp"><i class="fa fa-folder fa-fw"></i> 현장정보집계</a></li>
                        <li><a href="CMB_InsertForm.jsp"><i class="fa fa-folder fa-fw"></i> 회원사정보입력</a></li>
                        <li><a href="Member_Site.jsp"><i class="fa fa-folder fa-fw"></i> 회원사(건설사)집계</a></li>
                        <li><a href="Member_Company.jsp"><i class="fa fa-folder fa-fw"></i> 회원사(회원사)집계</a></li>
                        <li><a href="SiteRegister.jsp"><i class="fa fa-folder fa-fw"></i> 현장등록요청 집계</a></li>
                        <li><a href="QuotationJoin.jsp"><i class="fa fa-folder fa-fw"></i> 견적참여하기 집계</a></li>
                        <li><a href="CCI_InsertForm.jsp"><i class="fa fa-folder fa-fw"></i> 공종 추가하기</a></li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">현장정보입력</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            <c:forEach var="info" items="<%=addList%>">
                <div class="col-xs-5">
                	<form action="/gplus2/admin/CB_update_controll.jsp" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th>사업명</th>
                                <td colspan="2"><input class="form-control" placeholder="" type="text" name="bus_nm"  value="${info.bus_nm}" ></td>
                            </tr>
                            <tr>
                                <th>A 공종 <%=addList.get(0).getCont_cat_nm() %> <%=cci1List.get(0).getCat_cd() %>  </th>
                                <td>
                                  <div class="form-group">
                                      <select class="form-control" id="depth01" name="" onChange="itemChange()">
                                        <option>1차 카테고리</option>
                                         <%-- <c:forEach var="cci1" items="<%=cci1List%>">
                                        	<option value="${cci1.cat_cd}" >
											${cci1.cont_cat_nm}</option>
                                        </c:forEach> --%>
                                        <%for(int i=0; i<cci1List.size(); i++){ %>
                                        <option value="<%=cci1List.get(i).getCat_cd()%>" 
                                        <%=(cci1List.get(0).getCat_cd().equals(cci1List.get(i).getCat_cd())) ? "selected" : "" %>>
                                        <%=cci1List.get(i).getCont_cat_nm() %></option>
                                        <%} %>
                                      </select>
                                  </div>
                                  
                                </td>
                                <td>
                                  <div class="form-group">
                                      <select class="form-control" id="depth02" name="cont_cat_id">
                                      <option>2차 카테고리</option>
                                      </select>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>B 권역 </th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="cont_zone_cd">
                                          <option value="">권역</option>
                                          <option value="MAZ" <%=(addList.get(0).getCont_zone_cd().equals("MAZ")) ? "selected" : "" %> >서울/수도권</option>
                                          <option value="CHZ" <%=(addList.get(0).getCont_zone_cd().equals("CHZ")) ? "selected" : "" %>>충청권</option>
										  <option value="YNZ" <%=(addList.get(0).getCont_zone_cd().equals("YNZ")) ? "selected" : "" %>>영남권</option>
										  <option value="HNZ" <%=(addList.get(0).getCont_zone_cd().equals("HNZ")) ? "selected" : "" %>>호남권</option>
										  <option value="KWZ" <%=(addList.get(0).getCont_zone_cd().equals("KWZ")) ? "selected" : "" %>>강원권</option>
										  <option value="OEZ" <%=(addList.get(0).getCont_zone_cd().equals("OEZ")) ? "selected" : "" %>>해외/기타</option>
                                      </select>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>C 용도지구 </th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="dist_zone_cd_select" id="dist_zone_cd_select" onchange="selectZone()" multiple 	>
                                          <option value="UCTZ">도시지역</option>
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
                                  </div>
                                  <input class="form-control" placeholder="" type="text" name="dist_zone_show" id="dist_zone_show" value="${info.dist_zone_nm}"  readonly="readonly" style="margin-top:10px">
                                  <input type="hidden" name="dist_zone_cd" id="dist_zone_cd" value="${info.dist_zone_cd}">
                                </td>
                            </tr>
                            <tr>
                                <th>D 건축구조 </th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="cont_strut_cd" id="structure">
                                          <option value="">선택하세요</option>
                                          <option value="ICC" <%=(addList.get(0).getCont_strut_cd().equals("ICC")) ? "selected" : "" %>>철근콘크리트구조</option>
                                          <option value="IHJ" <%=(addList.get(0).getCont_strut_cd().equals("IHJ")) ? "selected" : "" %>>철골조</option>
                                          <option value="LHJ" <%=(addList.get(0).getCont_strut_cd().equals("LHJ")) ? "selected" : "" %>>경량철골조</option>
                                          <option value="CHS" <%=(addList.get(0).getCont_strut_cd().equals("CHS")) ? "selected" : "" %>>철골철근콘크리트구조</option>
                                          <option value="THS" <%=(addList.get(0).getCont_strut_cd().equals("THS")) ? "selected" : "" %>>목조</option>
                                          <option value="SAS" <%=(addList.get(0).getCont_strut_cd().equals("SAS")) ? "selected" : "" %>>조적조</option>
                                      </select>
                                  </div>
                                  <input class="form-control" placeholder="" type="hidden" style="margin-top:10px">
                                </td>
                            </tr>
                            <tr>
                                <th>E 건물용도</th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="buld_usag_cd_select" id="buld_usag_cd_select" onchange="selectUsag()" multiple >
                                          <option value="BAH">단독주택</option>
                                          <option value="BCH">공동주택</option>
                                          <option value="FHE">제1종 근린생활시설</option>
                                          <option value="SHE">제2종 근린생활시설</option>
                                          <option value="CDE">문화 및 집회시설</option>
                                          <option value="RGE">종교시설</option>
                                          <option value="SAE">판매시설</option>
                                          <option value="SLE">숙박시설</option>
                                          <option value="FAE">공장</option>
                                      </select>
                                  </div>
                                  <input class="form-control" placeholder="" type="text" name="buld_usag_show" id="buld_usag_show" readonly="readonly" value="${info.buld_usag_nm}" style="margin-top:10px">
                                  <input type="hidden" name="buld_usag_cd" id="buld_usag_cd" value="${info.buld_usag_cd}">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자 위치</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" id="sample4_jibunAddress" name="bus_area_loc" value="${info.bus_area_loc}" >
                                  <input type="hidden" id="sample4_postcode" placeholder="우편번호">
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
									<!-- <input class="form-control" type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
									<span id="guide" style="color:#999"></span>
									<input type="hidden" id="lat" name="lat" value="<%=addList.get(0).getLat()%>">
									<input type="hidden" id="lng" name="lng" value="<%=addList.get(0).getLng()%>">
                                </td>
                            </tr>
                            <tr>
                                <th>건축규모</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="cont_size" value="${info.cont_size}" >
                                </td>
                            </tr>
                            <tr>
                                <th>투입예정월 <%=addList.get(0).getInput_expt_dt() %></th>
                                <td colspan="2">
                                  <div class="input-group">
                                   <div class="input-group-addon">
                                    <label for="date"><i class="fa fa-calendar"></i></label>
                                   </div>
                                   <input class="form-control" id="date" name="date"  type="text" value="${info.input_expt_dt}" >
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>대지면적</th>
                                <td><input class="form-control w90" placeholder="" type="text" name="grnd_area_no" value="${info.grnd_area_no}" id="area01"  onkeyup="changeUint(this.id)"> ㎡</td>
                                <td>
                                <fmt:formatNumber var="area01" value="${info.grnd_area_no/3.3058}" pattern=".00"></fmt:formatNumber>
                                <input class="form-control w90" placeholder="" type="text" id="ch_area01" value="${area01}" readonly="readonly" >py
                                </td>
                            </tr>
                            <tr>
                                <th>건축면적</th>
                                <td><input class="form-control w90" placeholder="" type="text" name="const_area_no" value="${info.const_area_no}"  id="area02"  onkeyup="changeUint(this.id)"> ㎡</td>
                                <td>
                                <fmt:formatNumber var="area02" value="${info.const_area_no/3.3058}" pattern=".00"></fmt:formatNumber>
                                <input class="form-control w90" placeholder="" type="text" id="ch_area02" value="${area02}" readonly="readonly" > py
                                </td>
                            </tr>
                            <tr>
                                <th>연면적</th>
                                <td><input class="form-control w90" placeholder="" type="text" name="tot_area_no" value="${info.tot_area_no}" id="area03"  onkeyup="changeUint(this.id)"> ㎡</td>
                                <td>
                                <fmt:formatNumber var="area03" value="${info.tot_area_no/3.3058}" pattern=".00"></fmt:formatNumber>
                                <input class="form-control w90" placeholder="" type="text" id="ch_area03" value="${area03}" readonly="readonly" > py
                                </td>
                            </tr>
                            <tr>
                                <th>건폐율</th>
                                <td colspan="2"><input class="form-control w90" placeholder="" type="text" name="flor_area_rat" value="${info.flor_area_rat}" >%</td>
                            </tr>
                            <tr>
                                <th>용적률</th>
                                <td colspan="2"><input class="form-control w90" placeholder="" type="text" name="use_area_rat" value="${info.use_area_rat}" >%</td>
                            </tr>
                            <tr>
                                <th>주차대수</th>
                                <td colspan="2"><input class="form-control w90" placeholder="" type="text" name="prk_no" value="${info.prk_no}" > 대</td>
                            </tr>
                            <tr>
                                <th>견적예가</th>
                                <td>
                                  <div class="form-group">
                                    <select class="form-control" name="quot_expt_cd" >
                                        <option>공개/비공개</option>
                                        <option value="QOPN" <%=(addList.get(0).getQuot_expt_cd().equals("QOPN")) ? "selected" : "" %> >공개</option>
                                        <option value="QCPN" <%=(addList.get(0).getQuot_expt_cd().equals("QCPN")) ? "selected" : "" %>>비공개</option>
                                    </select>
                                  </div>
                                </td>
                                <td>
                                  <input class="form-control w90" placeholder="" type="text" name="quot_expt_amt" value="${info.quot_expt_amt}" > 원
                                </td>
                            </tr>
                            <tr>
                                <th>견적방법</th>
                                <td>
                                  <div class="form-group">
                                    <select class="form-control" name="quot_met_cd">
                                        <option value="PQCD" <%=(addList.get(0).getQuot_met_cd().equals("PQCD")) ? "selected" : "" %>>물량견적</option>
                                        <option value="BQCD" <%=(addList.get(0).getQuot_met_cd().equals("BQCD")) ? "selected" : "" %>>도면견적</option>
                                        <option value="DQCD" <%=(addList.get(0).getQuot_met_cd().equals("DQCD")) ? "selected" : "" %>>직접입력</option>
                                    </select>
                                  </div>
                                </td>
                                <td>
                                  <input class="form-control" placeholder="" type="text" name="quot_met_amt" value="${info.quot_met_amt}" >
                                </td>
                            </tr>
                            <tr>
                                <th>단종면허 </th>
                                <td colspan="2">
                                  <div class="form-group">
                                    <select class="form-control" name="one_linc_yn">
                                        <option value="Y" <%=(addList.get(0).getOne_linc_yn().equals("Y")) ? "selected" : "" %>>유</option>
                                        <option value="N" <%=(addList.get(0).getOne_linc_yn().equals("N")) ? "selected" : "" %>>무</option>
                                    </select>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>전년도 시평액</th>
                                <td colspan="2">
                                  <input class="form-control w80" placeholder="" type="text" name="pre_ym_test_amt" value="${info.pre_ym_test_amt}" > 억원 이상
                                </td>
                            </tr>
                            <tr>
                                <th>결제조건</th>
                                <td>
                                  <div class="form-group">
                                    <select class="form-control" name="pay_cond_cd">
                                        <option value="POPN" <%=(addList.get(0).getPay_cond_cd().equals("POPN")) ? "selected" : "" %>>공개</option>
                                        <option value="PCPN" <%=(addList.get(0).getPay_cond_cd().equals("PCPN")) ? "selected" : "" %>>비공개</option>
                                    </select>
                                  </div>
                                </td>
                                <td>
                                  <input class="form-control" placeholder="" type="text" name="pay_cond_amt" value="${info.pay_cond_amt}" >
                                </td>
                            </tr>
                            <tr>
                                <th>추가정보</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="add_info" value="${info.add_info}" >
                                </td>
                            </tr>
                            <tr>
                                <th>도면 업로드</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="file" id="uploadFile" name="uploadFile">
                                </td>
                            </tr>
                            <tr>
                                <th>건설사명</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="const_bus_nm" value="${info.const_bus_nm}" >
                                </td>
                            </tr>
                            <tr>
                                <th>담당자 명</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text"  name="rep_mng_nm" value="${info.rep_mng_nm}" >
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="rep_contat_tel_no" value="${info.rep_contat_tel_no}" >
                                </td>
                            </tr>
                            <tr>
                                <th>진행사항</th>
                                <td colspan="2">
                                  <div class="form-group">
                                    <select class="form-control" name="quot_prg_stat_cd">
                                        <option value="NCD" <%=(addList.get(0).getQuot_prg_stat_cd().equals("NCD")) ? "selected" : "" %>>신규</option>
                                        <option value="QIG" <%=(addList.get(0).getQuot_prg_stat_cd().equals("QIG")) ? "selected" : "" %>>견적중</option>
                                        <option value="FNZ" <%=(addList.get(0).getQuot_prg_stat_cd().equals("FNZ")) ? "selected" : "" %>>완료</option>
                                    </select>
                                  </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="alc">
<!--                       <button type="button" class="btn btn-primary btn-lg" onclick="">저장하기</button> -->
					  <input type=hidden name="constid" value="<%=id%>">
                      <input type="submit" class="btn btn-primary btn-lg" onclick="" value="저장하기">
                    </p>
					</form>
                </div>
                


				</c:forEach>
            </div>
            <!-- /.row -->


        </div>
        <!-- /#page-wrapper -->
        <footer>COPYRIGHT© 건축플러스 ALL RIGHTS RESERVED.</footer>
    </div>
<div style="display: none;">    
    <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
</div>

    <!-- /#wrapper -->
    <!-- jQuery -->
<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
 <script src="./dist/js/bootstrap.min.js"></script>
 <script src="./dist/metisMenu/metisMenu.min.js"></script>
 <script>
 	$(document).ready(function(){
 		var date_input=$('input[name="date"]'); //our date input has the name "date"
 		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
 		date_input.datepicker({
 			format: 'yyyy-mm-dd',
 			container: container,
 			todayHighlight: true,
 			autoclose: true,
 		})


 	})
 </script>
 <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	    
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                
             	latLng(fullRoadAddr);
                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script>
function latLng(obj){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(obj, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		console.log(result);
		$('#lat').val(result[0].y);
		$('#lng').val(result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
}
	

    
</script>
</body>
</html>
