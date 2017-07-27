function logout(){
	  $.ajax({
		  url:'/gplus2/loginajax.jsp?logout=out',
		  success:function(res){
			  console.log(res);
		  }
	  });
  }

function Scene(obj){
	var session = obj;
	console.log(session);
	if(obj == null){
		alert('로그인이 필요 합니다.');
		location.href = "/gplus2/login.jsp";
	}
}