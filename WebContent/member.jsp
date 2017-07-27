<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 Object ses = session.getAttribute("id");
 String id = (String)ses;
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
            
            <a href="/gplus2/login.jsp" onclick="logout();" class="btn btn_bg_white w99"><span>로그아웃</span></a>
            
            <a href="/gplus2/member.jsp" class="btn btn_bg_white w99"><span>참여/찜</span></a>
            
            <%-- <a href="#" onclick="Scene(<%=id %>);" class="btn btn_bg_white w99"><span>로그인</span></a>
            <a href="/gplus2/join.jsp" class="btn btn_bg_white w99"><span>회원가입</span></a> --%>
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
        <ul>
          <li><a href="#none">전체보기</a></li>
          <li><a href="#none">철콘</a></li>
          <li><a href="#none">전기</a></li>
          <li><a href="#none">설비</a></li>
          <li><a href="#none">토목</a></li>
          <li><a href="#none">미방조적</a></li>
          <li><a href="#none">석공사</a></li>
          <li><a href="#none">금속/창호</a></li>
          <li><a href="#none">외장/지붕</a></li>
          <li><a href="#none">도장</a></li>
          <li><a href="#none">실내건축</a></li>
          <li><a href="#none">종합건축</a></li>
          <li><a href="#none">기타공사</a></li>
        </ul>
      </div>
      </nav>
    </section>
    <section id="container">
      <div class="inner">
        <dl class="list">
          <dt class="result member">견적참여현황</dt>
          <dd class="cboth">
            <div class="classify">
              <div>
              <span class="item">철콘</span>
              <span class="area">충정권</span>
              </div>
            </div>
            <div class="cont">
              <div class="title">
                <h2>천안시 안서동 근린생활시설 신축공사</h2>
                <span class="plus plus01">+</span>
              </div>
              <ul class="cboth">
                <li><em>연면적 : </em><span>840.12</span></li>
                <li><em>건물연적 : </em><span>근린생활시설</span></li>
                <li><em>단종면허 : </em><span>무</span></li>
                <li><em>견적예가 : </em><span>공개</span></li>
                <li><em>투입예정 : </em><span>2017.09</span></li>
                <li><em>견적진행 : </em><span class="stat">신규</span></li>
              </ul>
            </div>
          </dd>
          <dd class="cboth">
            <div class="classify">
              <div>
                <span class="item">철콘</span>
                <span class="area">충정권</span>
              </div>
            </div>
            <div class="cont">
              <div class="title">
                <h2>천안시 안서동 근린생활시설 신축공사</h2>
                <span class="plus plus02">++</span>
              </div>
              <ul class="cboth">
                <li><em>연면적 : </em><span>840.12</span></li>
                <li><em>건물연적 : </em><span>근린생활시설</span></li>
                <li><em>단종면허 : </em><span>무</span></li>
                <li><em>견적예가 : </em><span>공개</span></li>
                <li><em>투입예정 : </em><span>2017.09</span></li>
                <li><em>견적진행 : </em><span class="stat">신규</span></li>
              </ul>
            </div>
          </dd>
          <dd class="cboth">
            <div class="classify">
              <div>
              <span class="item">철콘</span>
              <span class="area">충정권</span>
            </div>
            </div>
            <div class="cont">
              <div class="title">
                <h2>천안시 안서동 근린생활시설 신축공사</h2>
                <span class="plus plus03">++</span>
              </div>
              <ul class="cboth">
                <li><em>연면적 : </em><span>840.12</span></li>
                <li><em>건물연적 : </em><span>근린생활시설</span></li>
                <li><em>단종면허 : </em><span>무</span></li>
                <li><em>견적예가 : </em><span>공개</span></li>
                <li><em>투입예정 : </em><span>2017.09</span></li>
                <li><em>견적진행 : </em><span class="stat">신규</span></li>
              </ul>
            </div>
          </dd>
        </dl>

        <dl class="list">
          <dt class="result member">찜한 현장</dt>
          <dd class="cboth">
            <div class="classify">
              <div>
              <span class="item">철콘</span>
              <span class="area">충정권</span>
              </div>
            </div>
            <div class="cont">
              <div class="title">
                <h2>천안시 안서동 근린생활시설 신축공사</h2>
                <span class="plus plus01">+</span>
              </div>
              <ul class="cboth">
                <li><em>연면적 : </em><span>840.12</span></li>
                <li><em>건물연적 : </em><span>근린생활시설</span></li>
                <li><em>단종면허 : </em><span>무</span></li>
                <li><em>견적예가 : </em><span>공개</span></li>
                <li><em>투입예정 : </em><span>2017.09</span></li>
                <li><em>견적진행 : </em><span class="stat">신규</span></li>
              </ul>
            </div>
          </dd>
          <dd class="cboth">
            <div class="classify">
              <div>
                <span class="item">철콘</span>
                <span class="area">충정권</span>
              </div>
            </div>
            <div class="cont">
              <div class="title">
                <h2>천안시 안서동 근린생활시설 신축공사</h2>
                <span class="plus plus02">++</span>
              </div>
              <ul class="cboth">
                <li><em>연면적 : </em><span>840.12</span></li>
                <li><em>건물연적 : </em><span>근린생활시설</span></li>
                <li><em>단종면허 : </em><span>무</span></li>
                <li><em>견적예가 : </em><span>공개</span></li>
                <li><em>투입예정 : </em><span>2017.09</span></li>
                <li><em>견적진행 : </em><span class="stat">신규</span></li>
              </ul>
            </div>
          </dd>
          <dd class="cboth">
            <div class="classify">
              <div>
              <span class="item">철콘</span>
              <span class="area">충정권</span>
            </div>
            </div>
            <div class="cont">
              <div class="title">
                <h2>천안시 안서동 근린생활시설 신축공사</h2>
                <span class="plus plus03">++</span>
              </div>
              <ul class="cboth">
                <li><em>연면적 : </em><span>840.12</span></li>
                <li><em>건물연적 : </em><span>근린생활시설</span></li>
                <li><em>단종면허 : </em><span>무</span></li>
                <li><em>견적예가 : </em><span>공개</span></li>
                <li><em>투입예정 : </em><span>2017.09</span></li>
                <li><em>견적진행 : </em><span class="stat">신규</span></li>
              </ul>
            </div>
          </dd>
        </dl>
      </div>
    </section>
    <section id="footer">
      <div class="c_menu">
        <div class="inner">
          <ul class="cboth">
          <li><a href="#none">서비스 소개</a></li>
          <li><a href="#" onclick="Scene(<%=id %>);">현장 등록하기</a></li>
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
  <script src="js/script.js"></script>
  <script src="js/lee.js"></script>
  </body>
</html>
