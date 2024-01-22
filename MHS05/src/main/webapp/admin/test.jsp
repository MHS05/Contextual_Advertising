<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>나만의 건강 쇼핑몰</title>
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
		
		.community
		{
			margin-left: 30px;
			margin-top: 20px;
			width: 910px;
			height: 300px; 
	        background-color: white;
	        box-shadow: 2px 2px 2px 2px lightgray;
       		overFlow : auto
	        
		}
		.category, .member
		{
			margin-left: 30px;
			margin-top: 10px;
			width: 440px;
			height: 300px; 
	        background-color: white;
	        box-shadow: 2px 2px 2px 2px lightgray;
       		overFlow : auto;
			float: left;
		}
		
		.admin
		{
			margin-left: 30px;
			width: 910px;
		}
		
		.dbutton
		{
			background-color: lightgray; 
			width: 70px; 
			height: 22px;
			float: right;
			margin-top: 42px;
			margin-right: 5px;
			font-size: small;
			text-align: center;
			padding-top: 5px;
			border-radius: 5px;
		}
		
		span
		{
			
			padding: 7px 30px;
			background-color : #4dd5b0;
			border-radius: 15px;
			cursor: pointer;
		
		}
		
		
	</style>
		<form>
			<table border="0" width="1200px" align="center">
				<tr>
					<td rowspan="2" width="250px">
						<a href="admin.jsp"><img style="width:250px; height: 200px;" src="../image/logo.png"></a>
					</td>
					<td colspan="4" height="50px" align="right" valign="bottom" style="font-size: 14px; font-weight: 700;">
						<div class="button" style="background-color: white; width:10px;"></div>
						관리자님
						<div class="button" style="background-color: white; width:10px;"></div>
						<a href="../main/index.jsp"><ins>로그아웃</ins></a>
					</td>
				</tr>
				<tr>
					<td class="nav">
						<div>
							<a href="admincategory.jsp"><h1>카테고리</h1></a>
						</div> 
						<div>
							<a href="adminclist.jsp"><h1>커뮤니티</h1></a>
						</div> 
						<div>
							<a href="adminnlist.jsp"><h1>공지사항</h1></a>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<table border="0" align="center" width="1200px" >
			<tr >
				<td>
					<a href="member.jsp"><h1>사용자관리</h1></a> 
				</td>
				<td rowspan="3" valign="top">
					<div class="admin">
						<a href="admin.jsp"><h1>나만의 건강 쇼핑몰(관리자)</h1></a>
					</div>
					<table border="0" width="910px" align="center">
						<tr>
							<td colspan="3">
								<h2><b>공지사항</b></h2>
								<hr>
							</td>
						</tr>
						<!-- 여기까찌 -->
						
						
						<!-- 여기까찌 -->
					</table>	
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
					<table border="0" width="200px" height="50px">
						<tr>
							<td>
								<div><a href="admincategory.jsp"><h1>카테고리</h1></a></div> 
							</td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="vegetable.jsp"><b>채소</b></a></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="fruit.jsp"><b>과일</b></a></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="healthFood.jsp"><b>건강식품</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="fish.jsp"><b>수산</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="meat.jsp"><b>정육</b></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table border="0" align="left" width="200px" height="50px">
						<tr>
							<td>
							<div><a href="adminclist.jsp"><h1>커뮤니티</h1></a></div> 
							</td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="vegetable.jsp"><b>자유게시판</b></a></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="fruit.jsp"><b>태양인게시판</b></a></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="healthFood.jsp"><b>태음인게시판</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="fish.jsp"><b>소양인게시판</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="meat.jsp"><b>소음인게시판</b></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<table border="0" width="1200px" align="center" height="150px">
				<tr>
					<td rowspan="5" width="250px" align="center">
						<img style="width:100px; height: 100px;" src="../image/market.png">
					</td>
					<td rowspan="5" width="10px">
					</td>
					<td colspan="2" height="15px" align="right">
						<hr>
					</td>
				</tr>
				<tr>
					<td width="450px">
						상담가능시간
					</td>
					<td>
						회사정보
					</td>
				</tr>
				<tr>
					<td>
						평일 : 오전 09:00 ~ 오후 06:00
					</td>
					<td>
						회사이름 : ezen  |  전화번호 : 010-0000-0000
					</td>
				</tr>
				<tr>
					<td>
						점심시간 : 오후 12:00 ~ 오후 01:00
					</td>
					<td>
						이메일 : asdf@naver.com  |  대한민국 전주시
					</td>
				</tr>
				<tr>
					<td>
						주말 휴무
					</td>
					<td>
						팩스 : 00-000-0000
					</td>
				</tr>
			</table>
	</body>
</html>