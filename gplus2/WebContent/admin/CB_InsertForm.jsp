<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
function changeUint(id){
  var item = id;
  var m = document.getElementById(item).value;
  parseFloat(m);
  var py = m/3.3058;
  var chID = "ch_"+item;
  document.getElementById(chID).value = py.toFixed(2);
}



function itemChange(){

  var cate1 =["철콘","철골","가설","레미콘"];
  var cate2 =["전기","소방","통신","조명"];
  var cate3 =["설비","가스","상하수도","공조시스템"];
  var cate4 =["토목","기초공사"];
  var cate5 =["미장","방수","조적"];
  var cate6 =["석공사","타일"];
  var cate7 =["금속","창호","강구조물"];
  var cate8 =["외장","지붕"];
  var cate9 =["도장"];
  var cate10 =["수장공사","목공","경량","도배","마루","욕실","주방"];
  var cate11 =["종합건축"];
  var cate12 =["조경","준공청소","포장","준설","보링","수중","기타공사"];

var selectItem = $("#depth01").val();

var changeItem;

if(selectItem == "철콘"){
  changeItem = cate1;
}
else if(selectItem == "전기"){
  changeItem = cate2;
}
else if(selectItem == "설비"){
  changeItem =  cate3;
}
else if(selectItem == "토목"){
  changeItem =  cate4;
}
else if(selectItem == "미방조적"){
  changeItem =  cate5;
}
else if(selectItem == "석공사/타일"){
  changeItem =  cate6;
}
else if(selectItem == "금속/창호"){
  changeItem =  cate7;
}
else if(selectItem == "외장/지붕"){
  changeItem =  cate8;
}
else if(selectItem == "도장"){
  changeItem =  cate9;
}
else if(selectItem == "실내건축"){
  changeItem =  cate10;
}
else if(selectItem == "종합건축"){
  changeItem =  cate11;
}
else if(selectItem == "기타공사"){
  changeItem =  cate12;
}
$('#depth02').empty();

for(var count = 0; count < changeItem.length; count++){
          var option = $("<option>"+changeItem[count]+"</option>");
          $('#depth02').append(option);
      }

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
                <a class="navbar-brand" href="index.html"><img src="./dist/images/logo.png" alt="건축플러스"></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li><a href="index.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
                <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li><a href="index.html"><i class="fa fa-folder fa-fw"></i> 현장정보입력</a></li>
                        <li><a href="data01.html"><i class="fa fa-folder fa-fw"></i> 현장정보집계</a></li>
                        <li><a href="data02.html"><i class="fa fa-folder fa-fw"></i> 회원사정보입력</a></li>
                        <li><a href="data03.html"><i class="fa fa-folder fa-fw"></i> 회원사(건설사)집계</a></li>
                        <li><a href="data04.html"><i class="fa fa-folder fa-fw"></i> 회원사(회원사)집계</a></li>
                        <li><a href="data05.html"><i class="fa fa-folder fa-fw"></i> 현장등록요청 집계</a></li>
                        <li><a href="data06.html"><i class="fa fa-folder fa-fw"></i> 견적참여하기 집계</a></li>
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
                <div class="col-xs-5">
                	<form action="CB_InsertRslt.jsp" method="post">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th>사업명</th>
                                <td colspan="2"><input class="form-control" placeholder="" type="text" name="bus_nm"  value="핫도그 타워 신축"></td>
                            </tr>
                            <tr>
                                <th>A 공종</th>
                                <td>
                                  <div class="form-group">
                                      <select class="form-control" name="cont_cat_id" id="depth01" onChange="itemChange()">
                                        <option>1차 카테고리</option>
                                        <option class="cate01">철콘</option>
                                        <option class="cate02">전기</option>
                                        <option class="cate03">설비</option>
                                        <option class="cate04">토목</option>
                                        <option class="cate05">미방조적</option>
                                        <option class="cate06">석공사/타일</option>
                                        <option class="cate07">금속/창호</option>
                                        <option class="cate08">외장/지붕</option>
                                        <option class="cate09">도장</option>
                                        <option class="cate10">실내건축</option>
                                        <option class="cate11">종합건축</option>
                                        <option class="cate12">기타공사</option>
                                      </select>
                                  </div>
                                </td>
                                <td>
                                  <div class="form-group">
                                      <select class="form-control" id="depth02">
                                      </select>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>B 권역</th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="cont_zone_cd">
                                          <option>권역</option>
                                          <option>서울/수도권</option>
                                          <option>충정권</option>
                                          <option>영남권</option>
                                          <option>강원권</option>
                                          <option>해외/기타</option>
                                          <option>전체</option>
                                      </select>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>C 용도지구</th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="dist_zone_cd_select" id="dist_zone_cd_select" onchange="selectZone()" multiple >
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
                                          <option value="etc">직접입력</option>
                                      </select>
                                  </div>
                                  <input class="form-control" placeholder="" type="text" name="dist_zone_show" id="dist_zone_show" style="margin-top:10px">
                                  <input type=text name="dist_zone_cd" id="dist_zone_cd" value="UCTN">
                                </td>
                            </tr>
                            <tr>
                                <th>D 건축구조</th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="cont_strut_cd" id="structure">
                                          <option value="ICC" selected="selected">철근콘크리트구조</option>
                                          <option value="IHJ">철골조</option>
                                          <option value="LHJ">경량철골조</option>
                                          <option value="CHS">철골철근콘크리트구조</option>
                                          <option value="THS">목조</option>
                                          <option value="SAS">조적조</option>
                                          <option value="etc">직접입력</option>
                                      </select>
                                  </div>
                                  <input class="form-control" placeholder="" type="text" style="margin-top:10px">
                                </td>
                            </tr>
                            <tr>
                                <th>E 건물용도</th>
                                <td colspan="2">
                                  <div class="form-group">
                                      <select class="form-control" name="buld_usag_cd_select" id="buld_usag_cd_select" onchange="selectUsag()" multiple>
                                          <option value="BAH" selected="selected">단독주택</option>
                                          <option value="BCH">공동주택</option>
                                          <option value="FHE">제1종 근린생활시설</option>
                                          <option value="SHE">제2종 근린생활시설</option>
                                          <option value="CDE">문화 및 집회시설</option>
                                          <option value="RGE">종교시설</option>
                                          <option value="SAE">판매시설</option>
                                          <option value="SLE">숙박시설</option>
                                          <option value="FAE">공장</option>
                                          <option value="etc">직접입력</option>
                                      </select>
                                  </div>
                                  <input class="form-control" placeholder="" type="text" name="buld_usag_show" id="buld_usag_show" style="margin-top:10px">
                                  <input type=text name="buld_usag_cd" id="buld_usag_cd" value="BAH">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자 위치</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="bus_area_loc" value="문정동 현대지식산업센터">
                                </td>
                            </tr>
                            <tr>
                                <th>건축규모</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="cont_size" value="20층">
                                </td>
                            </tr>
                            <tr>
                                <th>투입예정월</th>
                                <td colspan="2">
                                  <div class="input-group">
                                   <div class="input-group-addon">
                                    <label for="date"><i class="fa fa-calendar"></i></label>
                                   </div>
                                   <input class="form-control" id="date" name="date"  type="text"/ value="2017년07월24일">
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>대지면적</th>
                                <td><input class="form-control w90" placeholder="" type="text" name="grnd_area_no" value="1000" id="area01" onkeyup="changeUint(this.id)"> ㎡</td>
                                <td><input class="form-control w90" placeholder="" type="text" id="ch_area01"> py</td>
                            </tr>
                            <tr>
                                <th>건축면적</th>
                                <td><input class="form-control w90" placeholder="" type="text" name="const_area_no" value="800"  id="area02" onkeyup="changeUint(this.id)"> ㎡</td>
                                <td><input class="form-control w90" placeholder="" type="text" id="ch_area02"> py</td>
                            </tr>
                            <tr>
                                <th>연면적</th>
                                <td><input class="form-control w90" placeholder="" type="text" name="tot_area_no" value="4000" id="area03" onkeyup="changeUint(this.id)"> ㎡</td>
                                <td><input class="form-control w90" placeholder="" type="text" id="ch_area03"> py</td>
                            </tr>
                            <tr>
                                <th>건폐율</th>
                                <td colspan="2"><input class="form-control w90" placeholder="" type="text" name="flor_area_rat" value="80">%</td>
                            </tr>
                            <tr>
                                <th>용적률</th>
                                <td colspan="2"><input class="form-control w90" placeholder="" type="text" name="use_area_rat" value="500">%</td>
                            </tr>
                            <tr>
                                <th>주차대수</th>
                                <td colspan="2"><input class="form-control w90" placeholder="" type="text" name="prk_no" value="200"> 대</td>
                            </tr>
                            <tr>
                                <th>견적예가</th>
                                <td>
                                  <div class="form-group">
                                    <select class="form-control" name="quot_expt_cd">
                                        <option>공개/비공개</option>
                                        <option value="QOPN" selected="selected">공개</option>
                                        <option value="QCPN">비공개</option>
                                    </select>
                                  </div>
                                </td>
                                <td>
                                  <input class="form-control w90" placeholder="" type="text" name="quot_expt_amt" value="200"> 원
                                </td>
                            </tr>
                            <tr>
                                <th>견적방법</th>
                                <td>
                                  <div class="form-group">
                                    <select class="form-control" name="quot_met_cd">
                                        <option value="PQCD" selected="selected">물량견적</option>
                                        <option value="BQCD">도면견적</option>
                                        <option value="DQCD">직접입력</option>
                                    </select>
                                  </div>
                                </td>
                                <td>
                                  <input class="form-control" placeholder="" type="text" name="quot_met_amt">
                                </td>
                            </tr>
                            <tr>
                                <th>단종면허</th>
                                <td colspan="2">
                                  <div class="form-group">
                                    <select class="form-control" name="one_linc_yn">
                                        <option value="Y">유</option>
                                        <option value="N">무</option>
                                    </select>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <th>전년도 시평액</th>
                                <td colspan="2">
                                  <input class="form-control w80" placeholder="" type="text" name="pre_ym_test_amt" value="200"> 억원 이상
                                </td>
                            </tr>
                            <tr>
                                <th>결제조건</th>
                                <td>
                                  <div class="form-group">
                                    <select class="form-control" name="pay_cond_cd">
                                        <option value="POPN">공개</option>
                                        <option value="PCPN">비공개</option>
                                    </select>
                                  </div>
                                </td>
                                <td>
                                  <input class="form-control" placeholder="" type="text" name="pay_cond_amt" value="100">
                                </td>
                            </tr>
                            <tr>
                                <th>추가정보</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="add_info" value="결제는 바로바로">
                                </td>
                            </tr>
                            <tr>
                                <th>도면 업로드</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="file">
                                </td>
                            </tr>
                            <tr>
                                <th>건설사명</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="const_bus_nm" value="와이즈건설">
                                </td>
                            </tr>
                            <tr>
                                <th>담당자 명</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text"  name="rep_mng_nm" value="핫도그왕">
                                </td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td colspan="2">
                                  <input class="form-control" placeholder="" type="text" name="rep_contat_tel_no" value="010-7777-1234">
                                </td>
                            </tr>
                            <tr>
                                <th>진행사항</th>
                                <td colspan="2">
                                  <div class="form-group">
                                    <select class="form-control" name="quot_prg_stat_cd">
                                        <option value="NCD" selected="selected">신규</option>
                                        <option value="QIG">견적중</option>
                                        <option value="FNZ">완료</option>
                                    </select>
                                  </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="alc">
<!--                       <button type="button" class="btn btn-primary btn-lg" onclick="">저장하기</button> -->
                      <input type="submit" class="btn btn-primary btn-lg" onclick="">저장하기</button>
                    </p>
					</form>
                </div>
            </div>
            <!-- /.row -->


        </div>
        <!-- /#page-wrapper -->
        <footer>COPYRIGHT© 건축플러스 ALL RIGHTS RESERVED.</footer>
    </div>

    <!-- /#wrapper -->
    <!-- jQuery -->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
 <script src="./dist/js/bootstrap.min.js"></script>
 <script src="./dist/metisMenu/metisMenu.min.js"></script>
 <script>
 	$(document).ready(function(){
 		var date_input=$('input[name="date"]'); //our date input has the name "date"
 		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
 		date_input.datepicker({
 			format: 'yyyy년mm월dd일',
 			container: container,
 			todayHighlight: true,
 			autoclose: true,
 		})


 	})
 </script>

</body>
</html>
