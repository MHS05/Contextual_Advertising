<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page errorPage = "../main/errorpage.jsp" %>
<% 
//로그인한 아이디 쿠키 굽기
UserVO loginVO = (UserVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>나만의 건강 쇼핑몰</title>		
		<script src="../js/jquery-3.7.1.js"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">
	</head>
	<body>
	<style>
		.button
		{
			background-color: lightgray;
			text-align: center;
			vertical-align : middle;
			padding-top : 4px;
			height: 25px;
			width : 80px;
			float:right;
			border-radius: 15px;
		}
	
		.nav
		{
			background-color: #4dd5b0;

		}
		.nav div
		{
			float:left; 
			margin-left: 60px;

		}
		a, .nav div a, .month 
		{
			text-decoration: none;
			color: black;
		}
		
		#span2
		{
			
			padding: 7px 30px;
			background-color : #4dd5b0;
			border-radius: 15px;
			cursor: pointer;
		
		}
		
		.join td
		{
			font-size: 20px;
		
		}
	
		.join tr
		{
			height: 50px;
		
		}
		
		#a
		{
		
			padding: 0px 0px;
			background-color : white;
			border-radius: 15px;
			cursor: pointer;
		
		}
		
		#span1
		{
		
			padding: 7px 30px;
			background-color : #66FFCC;
			border-radius: 5px;
			text-align: center;
		}
	</style>
	<script>
	
		function openlogin() 
		{
			//로그인 팝업창 가운데에 띄우기
			var _width = '380';
			var _height = '540';
				
			var _left = Math.ceil((window.screen.width - _width )/2);
			var _top = Math.ceil((window.screen.height - _height )/2);
			
			window.open('../login/login.jsp', '', 'width=450, height=650, left=' + _left +', top=' + (_top - 250)); return false;
			
		}
	</script>
		<form>
			<table border="0" width="1200px" align="center">
				<tr>
					<td rowspan="2" width="250px">
						<a href="../main/index.jsp"><img style="width:250px; height: 200px;" src="../image/logo.png"></a>
					</td>
					<%
					if(loginVO == null)
					{
						//로그인 하지 않은 경우
						%>
							<td colspan="4" height="50px" align="right">
								<a href="../login/join.jsp"><div class="button">회원가입</div></a>
								<div class="button" style="background-color: white; width:10px;"></div>
								<a href="javascript:openlogin();"><div class="button">로그인</div></a>
							</td>
						<%
					}else if(loginVO.getId().equals("admin"))
					{
						//관리자로 로그인한 경우
						%>
							<script>
								document.location.href = "../admin/member.jsp";
							</script>
						<% 
						
					}else
					{
						%>
							<td colspan="4" height="50px" align="right" valign="bottom" style="font-size: 14px; font-weight: 700;">
								<%
								if(loginVO.getCon().equals("나의 체질 검사하기"))
								{
								%>
									<a href="../myPage/modify.jsp?uno=<%=loginVO.getUno() %>"><ins>나의 체질 검사하기</ins></a>
								<%
								}else
								{
								%>
									[<%= loginVO.getCon() %>]
								<%
								}
								%>
								<div class="button" style="background-color: white; width:10px;"></div>
								<%= loginVO.getName() %>님
								<div class="button" style="background-color: white; width:10px;"></div>
								<a href="../myPage/myPage.jsp?uno=<%= loginVO.getUno() %>"><ins>마이페이지</ins></a>
								<div class="button" style="background-color: white; width:10px;"></div>
								<a href="../login/logout.jsp"><ins>로그아웃</ins></a>
							</td>						
						<%			
					}
					%>
				</tr>
				<a name="top"></a>
				<tr>
					<td class="nav">
						<div>
							<a href="../news/newslist.jsp"><h1>건강소식</h1></a>
						</div>
						<div>
							<a href="../category/category.jsp?kind=V"><h1>카테고리</h1></a>
						</div> 
						<div>
							<a href="../community/communitylist.jsp"><h1>커뮤니티</h1></a>
						</div> 
						<div>
							<a href="../notice/noticelist.jsp"><h1>공지사항</h1></a>
						</div>
					</td>
				</tr>
			</table>
		</form>