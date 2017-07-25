function selectCategory(){
	var x = document.getElementById("cont_cat_id").value;
	if(x=="CT006")
    	document.getElementById("det_cat_id").innerHTML = 
    		"<option value='CT007' selected='selected'>전기</option>"
    		+"<option value='CT008'>소방</option>"
    		+"<option value='CT009'>통신</option>"
    		+"<option value='CT010'>조명</option>";
    else if(x=="CT011")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT012' selected='selected'>설비</option>"
    		+"<option value='CT013'>가스</option>"
    		+"<option value='CT014'>상하수도</option>"
    		+"<option value='CT015'>공조시스템</option>";
    else if(x=="CT023")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT024' selected='selected'>석공사</option>"
    		+"<option value='CT025'>타일</option>";
    else if(x=="CT016")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT017' selected='selected'>토목</option>"
    		+"<option value='CT018'>기초공사</option>";
    else if(x=="CT019")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT020' selected='selected'>미장</option>"
    		+"<option value='CT021'>방수</option>"
    		+"<option value='CT022'>조적</option>";
    else if(x=="CT033")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT034' selected='selected'>도장</option>";
    else if(x=="CT035")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT036' selected='selected'>수장공사</option>"
    		+"<option value='CT037'>목공</option>"
    		+"<option value='CT038'>경량</option>"
    		+"<option value='CT039'>도배</option>"
    		+"<option value='CT040'>마루</option>"
    		+"<option value='CT041'>욕실</option>"
    		+"<option value='CT042'>주방</option>";
    else if(x=="CT043")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT044' selected='selected'>종합건축</option>";
    else if(x=="CT030")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT031' selected='selected'>외장</option>"
    		+"<option value='CT032'>지붕</option>";
    else if(x=="CT026")
    	document.getElementById("det_cat_id").innerHTML =
    		" <option value='CT027' selected='selected'>금속</option>"
    		+"<option value='CT028'>창호</option>"
    		+"<option value='CT029'>강구조물</option>";
    else if(x=="CT045")
    	document.getElementById("det_cat_id").innerHTML =
    		"<option value='CT046' selected='selected'>조경</option>"
    		+"<option value='CT047'>준공청소</option>"
    		+"<option value='CT048'>포장</option>"
    		+"<option value='CT049'>준설</option>"
    		+"<option value='CT050'>보링</option>"
    		+"<option value='CT051'>수중</option>"
    		+"<option value='CT052'>기타공사</option>";
    else
    	document.getElementById("det_cat_id").innerHTML = 
    		"<option value='CT002' selected='selected'>철콘</option>"
    		+"<option value='CT003'>철골</option>"
    		+"<option value='CT004'>가설</option>"
    		+"<option value='CT005'>레미콘</option>";
}

function selectSite(){
	var e = document.getElementById("selectEmail").value;
	var resultEmail="";
	if(e=="inputDirect"){
		document.getElementById("writeSite").style.display="inline";
	}
	else{
		document.getElementById("writeSite").style.display="none";
		if(e=="inputDirect"){
			resultEmail=document.getElementById("writeAddr").value+"@";
		}
		else{
			resultEmail=document.getElementById("writeAddr").value+"@"+e;
		}
	}
	//console.log(resultEmail);
	document.getElementById("emai_addr").value=resultEmail;
}

function inputEnd(){
	var emailADDR=document.getElementById("writeAddr").value;
	var writeSite=document.getElementById("writeSite").value;
	var resultEmail=emailADDR+"@"+writeSite;
	//console.log(resultEmail);
	document.getElementById("emai_addr").value=resultEmail;
}