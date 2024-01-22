<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page errorPage = "../main/errorpage.jsp" %>
<% 
//로그인한 아이디 쿠키 굽기
UserVO loginVO = (UserVO)session.getAttribute("login");
if(loginVO == null)
{
	response.sendRedirect("../main/index.jsp");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>나만의 건강 쇼핑몰</title>
		 <link rel="stylesheet" href="../admin/admin.css"/>
		 <script src="../js/jquery-3.7.1.js"></script>
	</head>
	<body>
		<form>
			<table border="0" width="1200px" align="center">
				<tr>
					<td rowspan="2" width="250px">
						<a href="member.jsp"><img style="width:250px; height: 200px;" src="../image/logo.png"></a>
					</td>
					<td colspan="4" height="50px" align="right" valign="bottom" style="font-size: 14px; font-weight: 700;">
						<div class="button" style="background-color: white; width:10px;"></div>
						<a href="../ad/adupload.jsp"><ins>광고등록</ins></a>
						<div class="button" style="background-color: white; width:10px;"></div>
						관리자님
						<div class="button" style="background-color: white; width:10px;"></div>
						<a href="../login/logout.jsp"><ins>로그아웃</ins></a>
					</td>
				</tr>
				<a name="top"></a>
				<tr>
					<td class="nav">
						<div>
							<a href="admincategory.jsp"><h1>카테고리</h1></a>
						</div> 
						<div>
							<a href="adminclist.jsp?type=F""><h1>커뮤니티</h1></a>
						</div> 
						<div>
							<a href="adminnlist.jsp"><h1>공지사항</h1></a>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<table border="0" align="center" width="1200px">
			<tr>
				<td height="100px">
					<a href="member.jsp"><h1>사용자관리</h1></a> 
				</td>
				<td rowspan="0" valign="top">
					<div class="admin">
						<a href="member.jsp"><h1>나만의 건강 쇼핑몰(관리자)</h1></a>
					</div>	
					<table border="1" width="910px" align="center">
						<!-- 여기까찌 -->