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

function joinPro(obj,obj2,obj3,obj4){
	console.log(obj);
	console.log(obj2);
	console.log(obj3);
	console.log(obj4);
	
	if(obj == 'null'){
		alert('로그인이 필요 합니다.');
		location.href = "/gplus2/login.jsp";
	}else{
		
			$.ajax({
				type:'post',
				dataType:'json',
				url:'/gplus2/wishajax.jsp',
				data:{
					user: obj,
					company:obj2,
					company2:obj3,
					type:obj4
				},
				success:function(res){
					console.log(res);
					if(res == 1){
						alert('참여가 완료 되었습니다.');
					}else{
						alert('이미 참여된 현장입니다.');
					}
				}
				
			});
		
	}
}

function fnMove(seq){
    var offset = $("#div" + seq).offset();
    console.log(offset);
    $('html, body').animate({scrollTop : offset.top}, 0);
}


