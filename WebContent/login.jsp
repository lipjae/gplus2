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
  <body>
  <div id="wrap">
    <section id="header">
      <div class="inner">
        <div class="user">
          <h1 class="logo"><a href="/gplus2/index.jsp"><img src="./images/logo.png" alt="건축플러스"></a></h1>
          <div class="u_menu">
            <span class="">건플 직거래관</span>
            <a href="/gplus2/login.jsp" class="btn btn_bg_white w99"><span>로그인</span></a>
            <a href="/gplus2/join.jsp" class="btn btn_bg_white w99"><span>회원 가입</span></a>
          </div>
        </div>
      </div>
      <div class="visual">
        <div class="inner">
          <h2>민간건설 입찰에 참여 하세요</h2>
          <p>국내 최대 규모의 민간건설 입찰 서비스</p>
          <div class="main_btns">
            <ul>
              <li><a href="#none" class="btn btn_trans"><span>현장 등록하기</span></a></li>
              <li><a href="#none" class="btn btn_trans"><span>견적 참여하기</span></a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="container">
      <div class="inner">
        <div class="form login">
			<h2>로그인</h2>
			<p>로그인 후 건설플러스의 다양한 혜택을 누리실 수 있습니다.</p>
			<div class="wh_box">
				<input id="loginId" type="text" class="inp_txt wd100" placeholder="아이디를 입력하세요"/>
				<input id="loginPw" type="text" class="inp_txt wd100" placeholder="비밀번호를 입력하세요"/>
				<p><input type="checkbox" class="inp_chk" id="id_save"/><label for="id_save" class="chk_box"> <span>아이디 저장</span></label></p>
				<button id="loginBtn" class="l_button bt_login">로그인</button>
				<p class="p_warn">아직 회원이 아니세요? 회원 가입과 함께 건설플러스의 혜택을 누려보세요.</p>
				<button class="l_button bt_join">회원가입</button>
			</div>
		</div>
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
  <script src="js/script.js"></script>
  <script src="js/jquery.cookie.js"></script>
  </body>
  <script>
  $(document).ready(function(){
	  if($.cookie('id')){
		  $('#loginId').val($.cookie('id'));
		  $('#id_save').attr('checked',true);
	  }
  });
  
  $('#id_save').click(function(){
	  var id_save = $('#id_save').is(':checked');
	  if(id_save == false){
		 $.removeCookie('id');
	  }
	  
  });
  	$('#loginBtn').click(function(){
  		var loginid = $('#loginId').val();
  		var loginpw = $('#loginPw').val();
  		var id_save = $('#id_save').is(':checked');
  		
  		if(loginid != '' && loginpw != ''){
  			
  			$.ajax({
  				type:'post',
  				
  				url:'/gplus2/loginajax.jsp',
  				data:{
  					loginId: loginid,
  					loginPw: loginpw
  				},
  				success:function(res){
  					console.log(res);
  					if($.trim(res) == "true"){
  						console.log(id_save);
  						if(id_save == true){
  							$.cookie('id',loginid);
  						}
  						alert('로그인 되었습니다.');
  						location.href = '/gplus2/index.jsp';
  					}else{
  						alert('아디이 및 비밀번호가 일치하지 않습니다.');
  						$('#loginId').val();
  				  		$('#loginPw').val('');
  						return false;
  					}
  				}
  			});
  		}else{
  			alert('아이디 및 비밀번호를 정확히 입력해주세요.');
  		}
  	});
  </script>
</html>
