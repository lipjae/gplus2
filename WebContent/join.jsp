<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<%
String logout;
request.getParameter("name");

Object ses = session.getAttribute("id");
String id = (String)ses;

if(request.getParameter("logout") != null){
	 logout = request.getParameter("logout");
	 if(logout.equals("out")){
		 session.removeAttribute("id");
			session.invalidate();
		}
}
%>  
  <body>
  
  <div id="wrap">
    <section id="header">
      <div class="inner">
        <div class="user">
          <h1 class="logo"><a href="/gplus2/index.jsp"><img src="./images/logo.png" alt="건축플러스"></a></h1>
          <div class="u_menu">
            <span class=""><a href="http://www.gunsulplus.com">건플직거래관</a></span>
            <% if(id != null){ %>
            <a href="/gplus2/login.jsp" onclick="logout();" class="btn btn_bg_white w99"><span>로그아웃</span></a>
            <%}else{ %>
            <a href="/gplus2/login.jsp" class="btn btn_bg_white w99"><span>로그인</span></a>
            <%} %>
            
            <a href="#/gplus2/join.jsp" class="btn btn_bg_white w99"><span>회원가입</span></a>
          </div>
        </div>
      </div>
      <div class="visual">
        <div class="inner">
          <h2>민간건설 입찰에 참여 하세요</h2>
          <p>국내 최대 규모의 민간건설 입찰 서비스</p>
          <div class="main_btns">
            <ul>
              <li><a  href="#" onclick="Scene(<%=id %>);" class="btn btn_trans"><span>현장 등록하기</span></a></li>
              <li><a  href="/gplus2/list.jsp?type=ALL" class="btn btn_trans"><span>견적 참여하기</span></a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="container">
      <div class="inner">
      	
        <div class="form">
        <input type="hidden" id="joinType" name="joinType" value="JPN">
			<h2>회원가입</h2>
			<p>회원 가입을 하시면 건설플러스의 서비스 혜택을 누리실 수 있습니다.</p>
			  <div class="tab_wrap">
				<div class="tab_menu">
				  <ul class="cboth">
					<li onclick="joinType('JPN');" class="on"><a href="#tab01">현장 등록 건설사 가입</a></li>
					<li><a onclick="joinType('JHS');" id="tab2" href="#tab02">협력 회원사 가입</a></li>
				  </ul>
				</div>
				<div id="tab01" class="tab_cont">
					<div class="wh_box">
						<p><label for="cname">회사명</label><input type="text" class="inp_txt wd100" id="cname"></p>
						<p><label for="sname">담당자명</label><input type="text" class="inp_txt wd100" id="sname"></p>
						<p><label>전화번호</label>
							<span class="block"><input id="tel1" type="text" class="inp_txt wd30"><span class="dash">-</span>
							<input id="tel2" type="text" class="inp_txt wd30"><span class="dash">-</span>
							<input id="tel3" type="text" class="inp_txt wd30"></span>
						</p>
						<p><label>주요업종</label>
              <span >
              	<input id="sector" class="inp_txt wd100" type="text" value="">
                <!-- <select class="sel">
                  <option>test</option>
                  <option>test</option>
                  <option>test</option>
                  <option>test</option>
                </select>-->
              </span>
            </p>
						<p><label>이메일</label>
              <input id="email1" type="text" class="inp_txt email"><span class="at">@</span>
              <span class="styled-select wd50">
                <select id="email2" class="sel w50">
                  <option value="@naver.com">naver.com</option>
                  <option value="@daum.com">daum.net</option>
                  <option value="@gmail.com">gmail.com</option>
                  
                </select>
              </span>
            </p>
						<p>
							<label for="agree" class="wauto"><span>이용약관 및 개인정보 수집 이용 동의</span></label><input type="checkbox" class="chk" id="agree"/>
              <span class="view">
							<a href="#none">이용약관 보기</a>
							<a href="#none">개인정보보호정책보기</a>
              </span>
						</p>
						<button id="joinBtn" class="l_button bt_join">회원가입 승인요청</button>
					</div>
				</div>
				<!-- <div id="tab02" class="tab_cont">
				</div> -->
			</div>

		</div>
		
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
  <!-- <script src="js/script.js"></script> -->
  <script src="js/lee.js"></script>
  </body>
  <script>
  var $tab = $(".tab_wrap");
  var $tabMenu =$(".tab_menu li");
  $(document).ready(function(){
    if($tab.length > 0){
      $(".tab_menu li a").click(function(){
        var $target =$(this).attr("href");
        $tabMenu.removeClass("on");
        $(this).parent().addClass("on");
        $($target).show();
        /* 
        $( ".tab_cont" ).not($target).hide(); */
      //  alert($target)
        return false
      })
    }
  })

  $("#agree").click(function(){
    if($("#agree").prop("checked","true")){
      $(".wauto").toggleClass("on");
    }
  })
  
  $('#joinBtn').click(function(){
	  var company = $('#cname').val();
	  var name = $('#sname').val();
	  var tel1 = $('#tel1').val();
	  var tel2 = $('#tel2').val();
	  var tel3 = $('#tel3').val();
	  var sector =  $('#sector').val();
	  var email1 = $('#email1').val();
	  var email2 = $('#email2').val();
	  var joinType = $('#joinType').val();
	  var agree = $('#agree').prop('checked');
	  var email = email1+email2;
	  var tel = tel1+'-'+tel2+'-'+tel3;
	  console.log(company);
	  console.log(name);
	  console.log(tel);
	  console.log(sector);
	  console.log(email);
	  console.log(agree);
	  console.log(joinType);
	  if(company != '' && name != '' && tel != '' && sector!='' && email1!=''){
		  if(agree == true){
			  $.ajax({
				  type:"post",
				  dataType:"json",
				  url:"/gplus2/joinajax.jsp",
				  data:{
					  company:company,
					  name: name,
					  tel:tel,
					  sector: sector,
					  email:email,
					  joinType: joinType
				  },
				  success:function(res){
					  console.log(res);
					  if(res == 1){
						  alert('회원가입이 요청되었습니다.');
						  location.href = "/gplus2/login.jsp";
					  }
				  }
			  });
		  }else{
			  alert('약관에 동의해 주세요.');
			  return false;
		  }
	  }else{
		  alert('누락된 정보가 있습니다. 다시 입력해 주세요.');
		  return false;
	  }
	  
  });
  
  function joinType(obj){
	  $('#joinType').val(obj);
  }
  
  function logout(){
	  $.ajax({
		  url:'/gplus2/loginajax.jsp?logout=out',
		  success:function(res){
			  console.log(res);
		  }
	  });
  }
  	
  </script>
</html>
