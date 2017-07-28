<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.util.List"%>
<%@page import="dao.LIST_DAO" %>
<%@page import="dto.CONT_CAT_INFO_DTO" %>
<jsp:useBean id="cci_DTO" class="dto.CONT_CAT_INFO_DTO" />
<%
LIST_DAO cci_DAO = new LIST_DAO();
List<CONT_CAT_INFO_DTO> cci1List = cci_DAO.getContCatLv1List(cci_DTO);
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
<script>

function itemChange(){
	jQuery.ajax({
		url : "../ajax/contLv2List.jsp",
		type : "POST",
		data : {
			name : $("#depth01").val()
		},
		success : function(data) {
			$('#depth02').empty();
			var s=data.split(',');
			for(var count = 0; count < s.length-1; count++){
			 	var option = $("<option value="+s[count]+">"+s[count+1]+"</option>");
		        $('#depth02').append(option);
		        count=count+1;
			}
		},
		error : function(xhr, status, error) {
			alert("Ajax Error!");
		}
	});

}
</script>
<script type="text/javascript" src="./js/CMB_InsertForm.js"></script>
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
        	<form action="CMB_InsertRslt.jsp" method="post">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">관리자 회원사 정보 입력</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-6">
                  
                  <table class="table">
                    <tbody>
                        <tr>
                            <th>회사명</th>
                            <td colspan="2"><input class="form-control" placeholder="" type="text" name="comp_nm" value="핫도그매니아"></td>
                        </tr>
                        <tr>
                            <th>A. 공종</th>
                              <td>
                                <div class="form-group">
                                    <select class="form-control" id="depth01" onChange="itemChange()">
                                        <option>1차 카테고리</option>
                                        <c:forEach var="cci1" items="<%=cci1List%>">
                                        	<option value="${cci1.cat_cd}">${cci1.cont_cat_nm}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                              </td>
                              <td>
                                <div class="form-group">
                                    <select class="form-control" id="depth02" name="cont_cat_id">
                                      <option>2차 카테고리</option>
                                    </select>
                                </div>
                              </td>
                        </tr>
                        <tr>
                            <th>담당자 명</th>
                            <td colspan="2"><input class="form-control" placeholder="" type="text" name="mng_nm" value="핫도그"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td colspan="2">
                              <input class="form-control w30" placeholder="" type="text" name="wire_tel_1" value="010">-
                              <input class="form-control w30" placeholder="" type="text" name="wire_tel_2" value="7777">-
                              <input class="form-control w30" placeholder="" type="text" name="wire_tel_3" value="1234">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일주소</th>
                            <td colspan="2">
                              <input class="form-control w45" placeholder="" type="text" id="emailAddr" value="hotdog" onkeyup="writeAddr()">@
                              <div class="form-group w50">
                                  <select class="form-control" id="emailSite" onchange="makeEmail()">
                                      <option value="naver.com" selected="selected">naver.com</option>
                                      <option value="daum.net">daum.net</option>
                                      <option value="gmail.com">gmail.com</option>
                                      <option value="etc">직접입력</option>
                                  </select>
                              </div>
                              <input class="form-control" placeholder="" type="text" name="emai_addr" id="emai_addr" readonly style="background-color:white;margin-top:10px">
                            </td>
                        </tr>
                    </tbody>
                  </table>
                </div>
                <div class="col-xs-6">
                  <table class="table">
                    <tbody>
                        <tr>
                            <th>ID부여</th>
                            <td><input class="form-control" placeholder="" type="text" name="cust_comp_id" value="hotdog486"></td>
                        </tr>
                        <tr>
                            <th>비밀번호 부여</th>
                            <td><input class="form-control" placeholder="" type="password" name="pass_no" id="pass_no" value="12341234"></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input class="form-control" placeholder="" type="password" name="pass_con" id="pass_con" value="12341234" onblur="checkPW()"></td>
                        </tr>
                        <tr>
                            <th>가입유형</th>
                            <td>
                              <div class="form-group">
                                  <select class="form-control" name="join_type_cd">
                                      <option value="JPN" selected="selected">현장 등록 건설사</option>
                                      <option  value="JHS">협력 회원사</option>
                                  </select>
                              </div>
                            </td>
                        </tr>
                    </tbody>
                  </table>
                </div>
				
            </div>
            
            <!-- /.row -->
            <p class="alc">
<!--               <button type="button" class="btn btn-primary btn-lg">가입 승인하기</button> -->
              <input type="submit" class="btn btn-primary btn-lg" value="가입 승인하기">
            </p>
			</form>
        </div>
        <!-- /#page-wrapper -->
        <footer>COPYRIGHT© 건축플러스 ALL RIGHTS RESERVED.</footer>
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./dist/metisMenu/metisMenu.min.js"></script>

</body>
</html>
