var resultZone="UCTN";
var resultName="도시지역"
function selectZone(){
	var selZ = document.getElementById("dist_zone_cd_select").value;
	if(resultZone.indexOf(selZ)==-1) resultZone=resultZone+','+selZ;
	console.log(resultZone);
	document.getElementById("dist_zone_cd").value = resultZone;
	
	var selID = document.getElementById("dist_zone_cd_select");
	var selNM = selID.options[selID.selectedIndex].text;
	var resultIdx=resultName.indexOf(selNM);
	if(resultIdx==-1) resultName=resultName+','+selNM;
	else if(resultIdx!=-1) resultName=resultName.substring(resultIdx-1,selNM.length);
	console.log(resultName);
	document.getElementById("dist_zone_show").value = resultName;	
}


var resultUsag="BAH";
function selectUsag(){
	var selU = document.getElementById("buld_usag_cd_select").value;
	if(resultUsag.indexOf(selU)==-1) resultUsag=resultUsag+','+selU;
	console.log(resultUsag);
	document.getElementById("buld_usag_cd").value = resultUsag;
}