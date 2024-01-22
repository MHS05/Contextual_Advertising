<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>비밀번호 변경</title>
	</head>
	<body>
	<style>
	
	input
	{
		width:97%; 
		height:35px;
	}
	
	span
	{
		
		padding: 7px 30px;
		background-color : #4dd5b0;
		border-radius: 15px;
		cursor: pointer;
	
	}
	
			.button
		{
			text-decoration: none;
			color: black;
		}
		
		a
		{
			text-decoration: none;
			color: black;
		}
	
	</style>
	<form type="post" action="changePWOK.jsp">
		<table width="360px" align="center" border="0" style="margin-top: 20px">
			<tr>
				<td	align="center" colspan="2">
					<h1>비밀번호 변경하기</h1>
				</td>
			</tr>
			<tr height="80px">
				<td	align="center" colspan="2">
				</td>
			</tr>
			<tr height="50px">
				<td	align="center" width="140px">
					문자열*
				</td>
				<td>
					<input type="text" placeholder="메일로 받은 문자열 입력">
				</td>
			</tr>
			<tr height="50px">
				<td	align="center" width="140px">
					새로운 비밀번호*
				</td>
				<td>
					<input type="text" placeholder="새로운 비밀번호 입력">
				</td>
			</tr>
			<tr height="50px">
				<td	align="center" width="140px">
					비밀번호 확인*
				</td>
				<td>
					<input type="text" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr height="80px">
				<td colspan="2">
				</td>
			</tr>
			<tr height="50px">
				<td	align="center" colspan="2">
					<a href="login.jsp"><span> 비밀번호 변경</span></a>
					<span style="background-color: lightgray" onclick="window.close()">취소</span>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>