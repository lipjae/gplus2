<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.CONT_CAT_INFO_DAO" %>
<%@ page import="dto.CONT_CAT_INFO_DTO" %>
<jsp:useBean id="CONT_CAT_INFO_DTO" class="dto.CONT_CAT_INFO_DTO" />
<%
CONT_CAT_INFO_DAO CONT_CAT_INFO_DAO = new CONT_CAT_INFO_DAO();
List<CONT_CAT_INFO_DTO> catList = CONT_CAT_INFO_DAO.getCatList();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>공종 입력 테스트</title>
    <link href="./dist/css/bootstrap.css" rel="stylesheet">
    <link href="./dist/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="./dist/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
$(document).ready(function(){
	
	//조회한 리스트 변수에 담기
	/* var catList =  $("#catList");
	alert(catList[0].cont_cat_nm); */
	/* <c:forEach items="${catLists}" var="item">
		alert("${item.cont_cat_nm}");
		console.debug("${item.cont_cat_nm}");
	</c:forEach> */
	
	//리스트에 담은 내용을 뎁스1에 붙여주기
	/* for(var count = 0; count < catList.size(); count++){
	    var option = $("<option class='catList' value='" + catList.get(count).getCont_cat_id + "'>" + catList.get(count).getCont_cat_nm + "</option>");
	    $('#depth01').append(option);
	} */

});

function itemChange(){
	var selectedItem = $("#depth01").val();
	var catCd = $("#catCd");
	var detCatCd = $("#detCatCd");
	
	catCd.attr("value", selectedItem);
	detCatCd.attr("value", selectedItem);
}

</script>

<script type="text/javascript" src="./js/CB_InsertForm.js"></script>

<body>
	<div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                </button>
                <a class="navbar-brand" href="/index.jsp"><img src="./dist/images/logo.png" alt="건축플러스"></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li><a href="/index.jsp"><i class="fa fa-home fa-fw"></i> Home</a></li>
                <li><a href="/login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li><a href="CB_InsertForm.jsp"><i class="fa fa-folder fa-fw"></i> 현장정보입력</a></li>
                        <li><a href="Construction_List.jsp"><i class="fa fa-folder fa-fw"></i> 현장정보집계</a></li>
                        <li><a href="CMB_InsertForm.jsp"><i class="fa fa-folder fa-fw"></i> 회원사정보입력</a></li>
                        <li><a href="Member_Site.jsp"><i class="fa fa-folder fa-fw"></i> 회원사(건설사)집계</a></li>
                        <li><a href="Member_Company.jsp"><i class="fa fa-folder fa-fw"></i> 회원사(회원사)집계</a></li>
                        <li><a href="SiteRegister.jsp"><i class="fa fa-folder fa-fw"></i> 현장등록요청 집계</a></li>
                        <li><a href="QuotationJoin.jsp"><i class="fa fa-folder fa-fw"></i> 견적참여하기 집계</a></li>
                        <li><a href="CCI_InsertForm.jsp"><i class="fa fa-folder fa-fw"></i> 공종 추가하기</a></li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">공종 입력 테스트 화면</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>

			<!-- 1차 2차 카테고리 탭으로 나누기 -->
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
					<a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">1차 카테고리</a>
				</li>
				<li role="presentation" class="">
					<a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">2차 카테고리</a>
				</li>
			</ul>
	
			<!-- 1차 카테고리 탭의 내용 부분 -->
			<div id="myTabContent" class="tab-content"> 
			<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab"> 
				<div class="row">
	                <div class="col-xs-5">
	                	<form action="CCI_InsertRslt.jsp" method="post">
	                    <table class="table">
	                        <tbody>
	                        	<tr>
									<th>카테고리명</th>
			                        <td colspan="2"><input class="form-control" placeholder="" type="text" name="cont_cat_nm"  value=""></td>
			                     </tr>
			                     <tr>
	                                <th>카테고리코드(영문2자, ex:CM, EL등..)</th>
									<td colspan="2"><input class="form-control" placeholder="" type="text" name="cat_cd"  value=""></td>
								</tr>
	                        </tbody>
	                    </table>
	                    <p class="alc">
						<!-- <button type="button" class="btn btn-primary btn-lg" onclick="">저장하기</button> -->
	                      <input type="submit" class="btn btn-primary btn-lg" onclick="" value="저장하기">
	                    </p>
	                    <input type="hidden" name="cat_lvl"  value="1">
						</form>
	                </div>
	            </div>
			</div> 
			
			<!-- 2차 카테고리 탭의 내용 부분 -->
			<%-- <c:forEach var="list" items="<%= catList %>">
				<p>${ list.cont_cat_id }</p>
				<p>${ list.cont_cat_nm }</p>
				<p>${ list.cat_cd }</p>
			</c:forEach> --%>
			<%-- <input type="hidden" id="catList" value="<%= catList %>">
			<input type="text" value="<%= catList.get(0).getCont_cat_nm() %>">
			<input type="text" value="<%= catList %>"> --%>
			
			<c:set var="catLists" value="<%= catList %>"></c:set>
			<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab"> 
				<div class="row">
	                <div class="col-xs-5">
	                	<form action="CCI_InsertRslt2.jsp" method="post">
	                    <table class="table">
	                        <tbody>
	                            <tr>
	                                <th>1차 카테고리 목록</th>
	                                <td>
	                                  <div class="form-group">
	                                      <select class="form-control" id="depth01" onChange="itemChange()">
	                                        <option>1차 카테고리</option>
	                                        <c:forEach var="list" items="${ catLists }">
	                                        	<option class="catList" id="${ list.cont_cat_id }" value="${ list.cat_cd }">${ list.cont_cat_nm }</option>
	                                        </c:forEach>
	                                      </select>
	                                  </div>
	                                </td>	
	                            </tr>
	                            
	                           <!--  <tr>
									<th>공종카테고리ID</th>
			                        <td colspan="2"><input class="form-control" placeholder="" type="text" name="cont_cat_id"  value=""></td>
			                     </tr> -->
			                     <tr>
									<th>카테고리명</th>
			                        <td colspan="2"><input class="form-control" type="text" name="cont_cat_nm"  value=""></td>
			                        <!-- <td colspan="2"><input class="form-control" type="text" name="cont_cat_nm" value="${ list.cont_cat_nm }" readonly="readonly"></td> -->
			                     </tr>
			                     <tr>
	                                <th>카테고리코드(상위카테고리의 코드, ex:CM, EL등..)</th>
									<td colspan="2"><input class="form-control" id="catCd" type="text" name="cat_cd"  value="" readonly="readonly"></td>
								</tr>
	                            <!-- <tr>
									<th>상세카테고리코드(카테고리코드 + 2자리 숫자, ex:CM01, EL02등..)</th>
			                        <td colspan="2"><input class="form-control" id="detCatCd" type="text" name="det_cat_cd"  value=""></td>
			                    </tr> -->
			                   
	                        </tbody>
	                    </table>
	                    <p class="alc">
							<input type="submit" class="btn btn-primary btn-lg" onclick="" value="저장하기">
	                    </p>
	                    <input type="hidden" name="cat_lvl"  value="2">
						</form>
	                </div>
	            </div>
			</div>
			<!-- 카테고리 저장 끝 -->

        </div>
        <!-- /#page-wrapper -->
        <footer>COPYRIGHT© 건축플러스 ALL RIGHTS RESERVED.</footer>
		</div>
	</div>
    <!-- /#wrapper -->
    <!-- jQuery -->
 
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
 <script src="./dist/js/bootstrap.min.js"></script>
 <script src="./dist/metisMenu/metisMenu.min.js"></script>
 <script>
 	$(document).ready(function(){
 		var date_input=$('input[name="date"]'); //our date input has the name "date"
 		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
 		date_input.datepicker({
 			format: 'yyyy년mm월dd일',
 			container: container,
 			todayHighlight: true,
 			autoclose: true,
 		})


 	})
 </script>

</body>
</html>
