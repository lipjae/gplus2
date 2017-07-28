<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="java.util.List"%>
<%@page import="dao.LIST_DAO" %>
<%@page import="dto.LIST_MEMBER_DTO" %>
<jsp:useBean id="memberCompany_List_DTO" class="dto.LIST_MEMBER_DTO" />
<%
LIST_DAO memberCompany_DAO = new LIST_DAO();
List<LIST_MEMBER_DTO> memberList = memberCompany_DAO.getMemComList(memberCompany_List_DTO);
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
                    <h2 class="page-header">회원사(회원사 가입) 정보집계</h2>
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
                              <th>가입일</th>
                              <th>회사명</th>
                              <th>공종</th>
                              <th>담당자명</th>
                              <th>전화번호</th>
                              <th>이메일주소</th>
                              <th>등록 상태</th>
                              <th>&nbsp;</th>
                              <th>&nbsp;</th>
                          </tr>
                      </thead>
                      <tbody>
                      	  <c:forEach var="list" items="<%=memberList%>">
                          <tr>
	                            <td>${list.no}</td>
								<td>
									<c:if test="${list.cust_reg_stat_cd eq 'CMG1'}">N/A</c:if>
                              		<c:if test="${list.cust_reg_stat_cd eq 'CMG2'}">${list.join_dt}</c:if>
								</td>
								<td>${list.comp_nm}</td>
								<td>${list.cont_cat_nm}</td>
								<td>${list.mng_nm}</td>
								<td>${list.wire_tel_no}</td>
								<td>${list.emai_addr}</td>
								<td>${list.cd_nm}</td>
								<td>&nbsp;</td>
                              	<td>
	                              	<c:if test="${list.cust_reg_stat_cd eq 'CMG1'}"><button type="button" class="btn btn-primary btn-sm btn-block">회원 승인</button></c:if>
                              		<c:if test="${list.cust_reg_stat_cd eq 'CMG2'}">&nbsp;</c:if>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./dist/metisMenu/metisMenu.min.js"></script>
</body>
</html>
