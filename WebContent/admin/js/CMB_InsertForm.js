function makeEmail(){
	var addr=document.getElementById('emailAddr').value;
	var site=document.getElementById('emailSite').value;
	
	if(site=='etc'){
		document.getElementById('emailAddr').value="직접입력";
		document.getElementById('emailAddr').disabled=true;
		document.getElementById('emai_addr').value="";
	}
	else{
		document.getElementById('emailAddr').value="";
		document.getElementById('emai_addr').value=addr+"@"+site;
		document.getElementById('emailAddr').disabled=false;
	}
}

function writeAddr(){
	var a=document.getElementById('emailAddr').value;
	var b=document.getElementById('emailSite').value;
	document.getElementById('emai_addr').value=a+'@'+b;
}

function checkPW(){
	var pw = $("#pass_no").val();
	var pwc = $("#pass_con").val();
	if(pw!=pwc){
		alert("비밀번호가 다릅니다");
	}	
}