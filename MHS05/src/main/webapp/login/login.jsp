<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>로그인</title>
		<script src="../js/jquery-3.7.1.js"></script>
	</head>
	<body>
	<style>
	a 
	{
		text-decoration: none;
		color: black;
	}
	
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
	
	</style>
<script>
	window.onload = function()
	{
		$("#id").focus();
		
		$("#id,#pw").keyup(function (event)
		{
			if (event.keyCode == 13) 
			{
				DoLogin();
			}
			
		});
	}
	
	function DoLogin()
    {	
		if( $("#id").val() == "")
		{
			//alert("아이디를 입력하세요.");
			$("#msg").html("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if( $("#pw").val() == "")
		{
			//alert("비밀번호를 입력하세요.");
			$("#msg").html("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}		
    	$("#loginform").submit();
    }
</script>
	<form id="loginform" name="loginform" method="get" action="loginok.jsp">
		<table width="360px" align="center" border="0" style="margin-top: 20px">
			<tr height="70px">
				<td	align="center" colspan="2">
					<h1>로그인</h1>
				</td>
			</tr>
			<tr>
				<td	align="center" colspan="2" height="120px">
					<img src="../image/loginimage.png" style="width:100px; height:100px">
				</td>
			</tr>
			<tr height="10px">
				<td colspan="2" >
				</td>
			</tr>
			<tr height="50px">
				<td	align="center">
					아이디
				</td>
				<td>
					<input type="text" id="id" name="id" maxlength="12" placeholder="아이디를 입력해 주세요">
				</td>
			</tr>
			<tr height="50px">
				<td	align="center">
					비밀번호
				</td>
				<td>
					<input type="password" id="pw" name="pw" maxlength="12" placeholder="비밀번호를 입력해 주세요">
				</td>
			</tr>
			<tr height="25px">
				<td	align="center" colspan="2">
				<div id="msg" style="color:#ff6600"></div>
				</td>
			</tr>			
			<tr>
				<td	align="center" colspan="2">
					<a href="selectID.jsp">아이디 찾기</a>
				</td>
			</tr>
			<tr>
				<td	align="center" colspan="2">
					<a href="selectPW.jsp">비밀번호 찾기</a>
				</td>
			</tr>
			<tr height="10px">
				<td colspan="2" >
				</td>
			</tr>
			<tr height="50px">
				<td	align="center" colspan="2">
					<a href="javascript:DoLogin();"><span>로그인</span></a> <!-- 클릭하면 setParentText 실행 -->
					<span style="background-color: lightgray" onclick="window.close()">취소</span>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>