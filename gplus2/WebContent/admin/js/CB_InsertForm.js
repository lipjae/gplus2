var resultZone="UCTN";
function selectZone(){
	var selZ = document.getElementById("dist_zone_cd_select").value;
	if(resultZone.indexOf(selZ)==-1) resultZone=resultZone+','+selZ;
	console.log(resultZone);
	document.getElementById("dist_zone_cd").value = resultZone;
	
	var showZ = document.getElementById("dist_zone_cd_show").value
	var selID = document.getElementById("dist_zone_cd_select");
	console.log(selID.options[selID.selectedIndex].text);
}


var resultUsag="BAH";
function selectUsag(){
	var selU = document.getElementById("buld_usag_cd_select").value;
	if(resultUsag.indexOf(selU)==-1) resultUsag=resultUsag+','+selU;
	console.log(resultUsag);
	document.getElementById("buld_usag_cd").value = resultUsag;
}