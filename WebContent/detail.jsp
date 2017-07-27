<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="daoLee.detailDAO"%>
<%@page import="dtoLee.detailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
detailDTO detailDto = new detailDTO();
detailDAO detailDao = new detailDAO();
request.setCharacterEncoding("UTF-8");


Object ses = session.getAttribute("id");
String id = (String)ses;
String busId = request.getParameter("id");
String type = request.getParameter("type");

String area = (String)request.getParameter("area");
area = new String(area.getBytes("8859_1"),"UTF-8");
type = new String(type.getBytes("8859_1"),"UTF-8");

List<detailDTO> dto = detailDao.detail(busId);
String[] array;
int count = Integer.parseInt(dto.get(0).getColunm23());
array = dto.get(0).getColunm3().split(",");

String company2 = dto.get(0).getColunm24();

%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건축플러스</title>
    <link href="css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body id="sub">
  <div id="wrap">
    <section id="header">
      <div class="inner">
        <div class="user">
          <h1 class="logo"><a href="/gplus2/index.jsp"><img src="./images/logo.png" alt="건축플러스"></a></h1>
          <div class="u_menu">
            <span class=""><a href="http://www.gunsulplus.com">건플직거래관</a></span>
            <%if(id == null){ %>
            <a href="/gplus2/login.jsp" class="btn btn_bg_white w99"><span>로그인</span></a>
            <%}else{ %>
            <a href="/gplus2/index.jsp" onclick="logout();" class="btn btn_bg_white w99"><span>로그아웃</span></a>
            <%} %>
            <%if(id == null){ %>
            <a href="/gplus2/join.jsp" class="btn btn_bg_white w99"><span>회원가입</span></a>
            <%}else{ %>
            <a href="/gplus2/member.jsp" class="btn btn_bg_white w99"><span>참여/찜</span></a>
            <%} %>
          </div>
        </div>
      </div>
      <div class="visual">
        <div class="inner">
          <h2>민간건설 입찰에 참여 하세요</h2>
          <p>국내 최대 규모의 민간건설 입찰 서비스</p>
          <div class="main_btns">
            <ul>
              <li><a href="#" onclick="Scene(<%=id %>);" class="btn btn_trans"><span>현장 등록하기</span></a></li>
              <li><a href="/gplus2/list.jsp?type=ALL" class="btn btn_trans"><span>견적 참여하기</span></a></li>
            </ul>
          </div>
        </div>
      </div>
      <nav id="nav">
        <div class="inner">
        <ul class="cboth">
          <li><a href="/gplus2/list.jsp?type=ALL&name=전체보기">전체보기</a></li>
          <li><a href="/gplus2/list.jsp?type=CM&name=철콘">철콘</a></li>
          <li><a href="/gplus2/list.jsp?type=EL&name=전기">전기</a></li>
          <li><a href="/gplus2/list.jsp?type=EO&name=설비">설비</a></li>
          <li><a href="/gplus2/list.jsp?type=CE&name=토목">토목</a></li>
          <li><a href="/gplus2/list.jsp?type=BR&name=미방조적">미방조적</a></li>
          <li><a href="/gplus2/list.jsp?type=ST&name=석공사">석공사</a></li>
          <li><a href="/gplus2/list.jsp?type=IW&name=금속/창호">금속/창호</a></li>
          <li><a href="/gplus2/list.jsp?type=OC&name=외장/지붕">외장/지붕</a></li>
          <li><a href="/gplus2/list.jsp?type=PT&name=도장">도장</a></li>
          <li><a href="/gplus2/list.jsp?type=IS&name=실내건축">실내건축</a></li>
          <li><a href="/gplus2/list.jsp?type=SC&name=종합건축">종합건축</a></li>
          <li><a href="/gplus2/list.jsp?type=EC&name=기타공사">기타공사</a></li>
        </ul>
      </div>
      </nav>
    </section>
    <section id="container">
      <div class="inner">
        <div class="detail">
          <h2><%=dto.get(0).getColunm1() %> <span class="stat"><%=dto.get(0).getColunm22() %></span></h2>
          <div class="box">
            <div class="classify">
              <span class="item"><%=type %></span>
              <span class="area"><%=area %></span>
            </div>
            <ul>
              <li class="w100"><em>사업지 : </em><span><%=dto.get(0).getColunm1() %></span></li>
              <li><em>연면적 : </em><span><%=dto.get(0).getColunm2() %></span></li>
              <li><em>건물용도 : </em><span><%=array[0] %></span></li>
              <li><em>단종면허 : </em><span><%=dto.get(0).getColunm4() %></span></li>
              <li><em>견적예가 : </em><span><%=dto.get(0).getColunm5() %></span></li>
              <li><em>투입예정 : </em><span><%=dto.get(0).getColunm6() %></span></li>
              <li><em>결제조건 : </em><span><%=dto.get(0).getColunm7() %></span></li>
            </ul>
          </div>
          <div class="tab_wrap">
            <div class="tab_menu">
              <ul class="cboth">
                <li class="on"><a href="#tab01" >현장 정보</a></li>
                <li><a href="#tab02" onclick="fnMove(1)" >견적 조건</a></li>
                <li><a href="#tab03" onclick="fnMove(2)">도면 보기</a></li>
              </ul>
            </div>
            <div id="tab01" class="tab_cont">
              <h3>건축개요</h3>
              <div class="box">
                <ul class="t_list">
                  <li class="w100"><strong>사업명</strong><span><%=dto.get(0).getColunm8() %></span></li>
                  <li class="w100"><strong>용도지구</strong><span><%=dto.get(0).getColunm9() %></span></li>
                  <li class="w100"><strong>건축규모</strong><span><%=dto.get(0).getColunm10() %></span></li>
                  <li class="w100"><strong>건축구조</strong><span><%=dto.get(0).getColunm20() %></span></li>
                  <li class="w100"><strong>건물용도</strong><span><%=dto.get(0).getColunm3() %></span></li>
                </ul>
              </div>

              <h3>설계개요</h3>
              <div class="box">
                <ul class="t_list">
                  <li class="w100"><strong>대지면적</strong><span class="num"><%=dto.get(0).getColunm11() %>㎡</span><!-- (309.46 py) --></li>
                  <li class="w100"><strong>건축면적</strong><span class="num"><%=dto.get(0).getColunm12() %>㎡</span><!-- (63.62 py) --></li>
                  <li class="w100"><strong>연면적</strong><span class="num"><%=dto.get(0).getColunm2() %>㎡</span><!-- (254.14 py) --></li>
                  <li class="w100"><strong>건폐율</strong><span class="num"><%=dto.get(0).getColunm13() %> %</span></li>
                  <li class="w100"><strong>용적률</strong><span class="num"><%=dto.get(0).getColunm14() %> %</span></li>
                  <li class="w100"><strong>주차대수</strong><span class="num"><%=dto.get(0).getColunm15() %> 대</span></li>
                </ul>
              </div>

              <h3>위치정보</h3>
              <div style="font:normal normal 400 12px/normal dotum, sans-serif; width:100%; height:356px; color:#333; position:relative"><div style="height: 355px;"><a target="_blank" href="http://map.daum.net/?urlX=487982.0&amp;urlY=1106665.0&amp;itemId=23903988&amp;q=%EB%82%A8%EA%B4%91%EB%B9%8C%EB%9D%BC&amp;srcid=23903988&amp;map_type=TYPE_MAP&amp;from=roughmap"><img class="map" src="http://t1.daumcdn.net/roughmap/imgmap/621684f68ec52b681926ae73213a6ba6e1ff2642860236deef985efb4bb8a0b6" width="100%" height="100%" style="border:1px solid #ccc;"></a></div></div>
              <h3 id="div1">견적 예가</h3>
              <div class="box">
                <ul class="t_list">
                  <li class="w100"><strong>견적예가</strong><span><%=dto.get(0).getColunm16() %> 원</span></li>
                </ul>
              </div>
              <h3>견적 방법</h3>
              <div class="box">
                <ul class="t_list">
                  <li class="w100"><strong>견적방법</strong><span><%=dto.get(0).getColunm17() %></span></li>
                </ul>
              </div>
              <h3>견적 참여조건</h3>
              <div class="box">
                <ul class="t_list">
                  <li class="w100"><strong>단종면허</strong><span><%=dto.get(0).getColunm4() %></span></li>
                  <li class="w100"><strong class="wd100">전년도 시평액</strong><span><%=dto.get(0).getColunm18() %>억원 이상</span></li>
                </ul>
              </div>
              <h3>결제 조건</h3>
              <div  class="box">
                <ul class="t_list">
                  <li class="w100"><strong>결제조건</strong><span><%=dto.get(0).getColunm19() %></span></li>
                </ul>
              </div>
              <h3 id="div2">건축 도면 보기</h3>
              <div class="button">
                <a href="#none">건축 도면 보기 클릭</a>
              </div>
              <h3>추가정보</h3>
              <div class="box">
                <%=dto.get(0).getColunm21() %>
              </div>
            </div>
            <div id="tab02" class="tab_cont" style="display:none">
              tab2
            </div>
            <div id="tab03" class="tab_cont" style="display:none">
              tab3
            </div>
          </div>
        </div>
        <aside id="aside">
          <div class="co_work">
            <p>참여회원사</p>
            <span class="plus plus02">
            
            </span>
            <a href="#none" onclick="joinPro('<%=id %>','<%=busId %>','<%=company2 %>','OUC');" class="btn bg_blue"><span>견적 참여하기</span></a>
            <a href="#none" onclick="joinPro('<%=id %>','<%=busId %>','<%=company2 %>','ZUC');" class="btn bg_white"><span>현장 찜하기</span></a>
          </div>
          <div class="qa">
            <p>견적 문의</p>
            <strong>031-8076-3880</strong>
          </div>

          <div class="banner">
            <a href="#none">
              <p class="b1">우수한 협력사와 함께하세요!</p>
              <p class="b2"> <a href="http://www.gunsulplus.com">건플 직거래관</a></p>
              <p class="b3">바로가기</p>
            </a>
          </div>
        </aside>
      </div>
    </section>
    <section id="footer">
      <div class="c_menu">
        <div class="inner">
          <ul class="cboth">
          <li><a href="#none">서비스 소개</a></li>
          <li><a href="#none">현장 등록하기</a></li>
          <li><a href="#none">가입문의</a></li>
          <li><a href="#none">이용약관</a></li>
          <li><a href="#none">개인정보보호방침</a></li>
          </ul>
        </div>
      </div>
      <address>
        <div class="inner">
          <span class="f_logo"><a href="#none"><img src="./images/foo_logo.png" alt=""></a></span>
          <div class="addr">
            <p><strong>스타투업(주)</strong></p>
            <p>경기도 고양시 일산동구 백마로 195 SK타워 12F  11   스타투업(주)       대표 : 김영진       사업자등록번호 : 176-88-00019</p>
            <p>통신판매업 신고번호 :  2017-고양일산동-0117         Email : help@gunsulplus.com          FAX 031-8076-3881</p>
            <p class="cs"><strong>고객센터 : </strong> 031-8076-3880 <em>(09:00~18:00)</em></p>
            <p class="warn">건설플러스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 건설플러스는 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
          </div>
        </div>
      </address>
    </section>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!-- <script src="js/script.js"></script> -->
  <script src="js/lee.js"></script>
  </body>
</html>
