<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.util.List"%>
<%@page import="dao.LIST_DAO" %>
<%@page import="dto.LIST_CONST_DTO" %>
<jsp:useBean id="cb_List_DTO" class="dto.LIST_CONST_DTO" />
<%
LIST_DAO list_const_DAO = new LIST_DAO();
List<LIST_CONST_DTO> cbList = list_const_DAO.getCBList(cb_List_DTO) ;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>건축플러스 관리자 페이지 입니다.</title>
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
function procChange(){
	alert($("#proc_change").val());
	alert($("#const_id").val());
	alert($("#cont_cat_id").val());
	jQuery.ajax({
		url : "../ajax/change_Process.jsp",
		type : "POST",
		data : {
			proc : $("#proc_change").val(),
			id : $("#const_id").val(),
			ccid : $("#cont_cat_id").val()
		},
		success : function(data) {
				var a=document.getElementById("proc_change");
				var message = a.options[a.selectedIndex].text
				alert("진행사항이 '"+message+"'(으)로 변경되었습니다");
				location.reload();
		},
		error : function(xhr, status, error) {
			alert("Ajax Error!");
		}
	});
}
</script>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="./dist/images/logo.png" alt="건축플러스"></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li><a href="index.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
                <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
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
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">현장정보 집계</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                  <table class="table">
                      <thead>
                          <tr>
                              <th>No.</th>
                              <th>진행사항</th>
                              <th>등록일</th>
                              <th>현장투입월</th>
                              <th>사업명</th>
                              <th>공종</th>
                              <th>권역</th>
                              <th>건설사명</th>
                              <th>담당자명</th>
                              <th>연락처</th>
                              <th colspan="4">추가 및 수정</th>
                          </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="list" items="<%=cbList%>" varStatus="status">
                          <tr>
								<td>${list.no}</td>
								<td id="prg_stat_nm">${list.prg_stat_nm}</td>
								<td>${list.reg_dt}</td>
								<td>${list.input_expt_dt}</td>
								<td>${list.bus_nm}</td>
								<td>${list.cont_cat_nm}</td>
								<td>${list.zone_nm}</td>
								<td>${list.const_bus_nm}</td>
								<td>${list.rep_mng_nm}</td>
								<td>${list.rep_contat_tel_no}</td>
                              <td><button type="button" class="btn btn-primary btn-sm btn-block">공종 추가 등록하기</button></td>
                              <td>
                                <div class="form-group">
                                    <select class="form-control" id="proc_change" onchange="procChange()">
                                    	<option value="">진행사항 변경하기</option>
                                        <option value="NCD/${list.const_id}/${status.count}">신규</option>
                                        <option value="QIG">견적중</option>
                                        <option value="FNZ">완료</option>
                                    </select>
                                    <input type="hidden" id="const_id" value="${list.const_id}">${status.count}
                                    <input type="hidden" id="cont_cat_id" value="${list.cont_cat_id}">
                                </div>
                              </td>
                              <td><button type="button" class="btn btn-primary btn-sm btn-block">수정하기</button></td>
                              <td>
                                <div class="form-group">
                                  <select class="form-control">
                                      <option>카운팅 추가삭제</option>
                                      <option>추가하기</option>
                                      <option>삭제하기</option>
                                  </select>
                              </div>
                            </td>
                          </tr>
                          </c:forEach>
                      </tbody>
                  </table>

                </div>
            </div>
            <!-- /.row -->


        </div>
        <!-- /#page-wrapper -->
      <footer>COPYRIGHT© 건축플러스 ALL RIGHTS RESERVED.</footer>
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="./dist/js/bootstrap.min.js"></script>
 <script src="./dist/metisMenu/metisMenu.min.js"></script>
</body>
</html>
