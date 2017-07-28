var resultZone="";
var resultName="";
function selectZone(){
	var selZ = document.getElementById("dist_zone_cd_select").value;
	var resultIdxZ=resultZone.indexOf(selZ);
	if(resultZone.length==0) resultZone=resultZone+selZ;
	else if(resultZone.indexOf(selZ)==-1) resultZone=resultZone+','+selZ;
	else if(resultIdxZ==0)
		resultZone=resultZone.substring(0, resultZone.indexOf(selZ)-1) + resultZone.substring(resultZone.indexOf(selZ)+selZ.length+1);
	else if(resultIdxZ>0)
		resultZone=resultZone.substring(0, resultZone.indexOf(selZ)-1) + resultZone.substring(resultZone.indexOf(selZ)+selZ.length);
	//console.log(resultZone);
	document.getElementById("dist_zone_cd").value = resultZone;
	
	var selID = document.getElementById("dist_zone_cd_select");
	var selNM = selID.options[selID.selectedIndex].text;
	var resultIdx=resultName.indexOf(selNM);
	
	if(resultName.length==0) resultName=resultName+selNM;
	else if(resultIdx==-1) resultName=resultName+','+selNM;
	else if(resultIdx==0)
		resultName=resultName.substring(0, resultName.indexOf(selNM)-1) + resultName.substring(resultName.indexOf(selNM)+selNM.length+1);
	else if(resultIdx>0)
		resultName=resultName.substring(0, resultName.indexOf(selNM)-1) + resultName.substring(resultName.indexOf(selNM)+selNM.length);
	
	//console.log(resultName);
	document.getElementById("dist_zone_show").value = resultName;	
}


var resultUsag="";
var resultUNM="";
function selectUsag(){
	var selU = document.getElementById("buld_usag_cd_select").value;
	var resultIdxU=resultUsag.indexOf(selU);
	
	if(resultUsag.length==0) resultUsag=resultUsag+selU;
	else if(resultUsag.indexOf(selU)==-1) resultUsag=resultUsag+','+selU;
	else if(resultIdxU==0)
		resultUsag=resultUsag.substring(0, resultUsag.indexOf(selU)-1) + resultUsag.substring(resultUsag.indexOf(selU)+selU.length+1);
	else if(resultIdxU>0)
		resultUsag=resultUsag.substring(0, resultUsag.indexOf(selU)-1) + resultUsag.substring(resultUsag.indexOf(selU)+selU.length);
	//console.log(resultUsag);
	document.getElementById("buld_usag_cd").value = resultUsag;
	
	var selUID = document.getElementById("buld_usag_cd_select");
	var selUNM = selUID.options[selUID.selectedIndex].text;
	var resultIdxUNM = resultUNM.indexOf(selUNM);
	
	if(resultUNM.length==0) resultUNM=resultUNM+selUNM;
	else if(resultIdxUNM==-1) resultUNM=resultUNM+','+selUNM;
	else if(resultIdxUNM==0)
		resultUNM=resultUNM.substring(0, resultUNM.indexOf(selUNM)-1) + resultUNM.substring(resultUNM.indexOf(selUNM)+selUNM.length+1);
	else if(resultIdxUNM>0)
		resultUNM=resultUNM.substring(0, resultUNM.indexOf(selUNM)-1) + resultUNM.substring(resultUNM.indexOf(selUNM)+selUNM.length);
	
	//console.log(resultUNM);
	document.getElementById("buld_usag_show").value = resultUNM;
}