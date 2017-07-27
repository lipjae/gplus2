
<%@page import="daoLee.ListDAO"%>
<%@page import="dtoLee.ListDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List"%>
<%@ page import="dao.CMN_CD_DAO" %>
<%@ page import="dto.CMN_CD_DTO" %>
<%
CMN_CD_DTO dto = new CMN_CD_DTO(); /* dto */
CMN_CD_DAO dao = new CMN_CD_DAO(); /* dao */

ListDTO dtolist = new ListDTO();
ListDAO daolist = new ListDAO();

String logout;

Object ses = session.getAttribute("id");
String id = (String)ses;

request.getParameter("name");
if(request.getParameter("logout") != null){
	 logout = request.getParameter("logout");
	 if(logout.equals("out")){
		 	session.removeAttribute("id");
			session.invalidate();
		}
}
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건설플러스</title>
    <link href="css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
  <div id="wrap">
    <section id="header">
      <div class="inner">
        <div class="user">
          <h1 class="logo"><a href="/gplus2/index.jsp"><img src="./images/logo.png" alt="건설플러스"></a></h1>
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
              <li><a href="#none" onclick="Scene(<%=id %>);" class="btn btn_trans"><span>현장 등록하기</span></a></li>
              <li><a href="/gplus2/list.jsp?type=ALL" class="btn btn_trans"><span>견적 참여하기</span></a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="container">
      <div class="inner">
        <div class="main_list">
          <ul>
            <li><a href="/gplus2/list.jsp?type=CM" class="menu01"><span class="text"><p><strong>철콘</strong></p><p>철콘/철골/가설/레미콘</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=EL" class="menu02"><span class="text"><p><strong>전기</strong></p><p>전기/소방/통신/조명</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=EO" class="menu03"><span class="text"><p><strong>설비</strong></p><p>설비/가스/상하수도/공조시스템</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=CE" class="menu04"><span class="text"><p><strong>토목</strong></p><p>토목공사/기초공사</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=BR" class="menu05"><span class="text"><p><strong>미방조적</strong></p><p>미장/방수/조적</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=ST" class="menu06"><span class="text"><p><strong>석공사/타일</strong></p><p>석공사/타일공사</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=IW" class="menu07"><span class="text"><p><strong>금속/창호</strong></p><p>금속/창호/유리/강구조물</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=OC" class="menu08"><span class="text"><p><strong>외장/지붕</strong></p><p>외장공사/지붕공사</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=PT" class="menu09"><span class="text"><p><strong>도장</strong></p><p>도장공사</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=IS" class="menu10"><span class="text"><p><strong>실내건축</strong></p><p>목공/경량/도배/마루/욕실/주방</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=SC" class="menu11"><span class="text"><p><strong>종합건축</strong></p><p>주택/빌딩/근생/공장</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=EC" class="menu12"><span class="text"><p><strong>기타공사</strong></p><p>조경/준공청소 등</p></span></a></li>
            <li><a href="/gplus2/list.jsp?type=ALL" class="menu13"><span class="text"><p><strong>전체보기</strong></p></span></a></li>
            <li><a href="http://www.gunsulplus.com" class="menu14"><span class="text"><img src="./images/banner01.png" alt=""></span></a></li>
          </ul>
        </div>
      </div>
    </section>
    <section id="footer">
      <div class="c_menu">
        <div class="inner">
          <ul class="cboth">
          <li><a href="#none">서비스 소개</a></li>
          <li><a href="#none" onclick="Scene(<%=id %>);">현장 등록하기</a></li>
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
    