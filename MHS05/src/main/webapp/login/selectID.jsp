<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.dao.smtp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>id 찾기</title>
		<script src="../js/jquery-3.7.1.js"></script>
	</head>
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
	<body>
	<script>
	window.onload=function()
	{
		$("#name").focus();
		$("#name,#email,#emailnum").keyup(function (event)
		{
			if (event.keyCode == 13) 
			{
				searchid();
			}
		});
	}
	
	//이름 유효성 검사
	$(function(){
       $("#name").keyup(function (event) {
    	   regexp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
            v = $(this).val();
            if (regexp.test(v)) {
                $("#limitname").html("특수문자는 사용 불가능입니다.");
                $("#limitname").css("color","red");
                $(this).val(v.replace(regexp, ''));
            }
        });
	});
	
	function searchid()
	{
		if($("#name").val() == "")
		{
			$("#limitname").html("이름을 입력하세요.");
			$("#limitname").css("color","red");
			$("#name").focus();
			return;
		}
		if($("#email").val() == "")
		{
			$("#limitemail").html("이메일을 입력하세요.");
			$("#limitemail").css("color","red");
			$("#email").focus();
			return;
		}
		if($("#emailnum").val() == "")
		{
			$("#limitemailnum").html("인증번호를 입력하세요.");
			$("#limitemailnum").css("color","red");
			$("#emailnum").focus();
			return;
		}
		
		$.ajax({
			type : "post",
			url  : "namecheck.jsp",
			data : 
			{
				name : $("#name").val(),
			},					
			dataType : "html",
			success : function(data) 
			{
				data = data.trim();
				if( data == "002" )
				{
					alert("없는 이름입니다.");
				}else
				{
					$("#showid").val(data);
					$("#showid").html("회원님의 아이디 : " + data);
				}
			} 
		});
	}
	
	//이메일 인증번호 보내기
	function sendmail()
	{
		$.ajax({
			type : "post",
			url  : "sendmail.jsp",
			data : 
			{
				email : $("#email").val(),
			},					
			dataType : "html",
			success : function(data) 
			{
				data = data.trim();
				if(data == "001")
				{
					alert("이메일을 입력해주세요");
				}
				if(data == "002")
				{
					alert("이메일 발송에 실패 했습니다.");
				}
				else
				{
					$("#hiddennum").val(data);
				}
			} 
		});		
	}
	
	var checkcheck = 0; 
	function emailNumCheck()
	{
		if( $("#emailnum").val() == "" || $("#hiddennum").val() == "" )
		{
			alert("인증 실패");
			checkcheck = 0;
			return;
		}
		if( $("#emailnum").val() == $("#hiddennum").val() )
		{
			alert("인증 성공");
			checkcheck = 1;
			return;
		}
		if( $("#emailnum").val() != $("#hiddennum").val() )
		{
			alert("인증 실패");
			checkcheck = 0;
			return;
		}
	}
	</script>
	<form method="post" action="">
		<table width="360px" align="center" border="0" style="margin-top: 20px">
			<tr>
				<td	align="center" colspan="3">
					<h1>아이디 찾기</h1>
				</td>
			</tr>
			<tr height="80px">
				<td	align="center" colspan="3"></td>
			</tr>
			<tr height="50px">
				<td	align="center" width="100px">이름*</td>
				<td colspan="2">
					<input type="text" id="name" name="name" maxlength="12" placeholder="이름을 입력해주세요." style="ime-mode:auto;">
					<div id="limitname" style="font-size:15px;"></div>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr height="50px">
				<td	align="center">
					이메일*
				</td>
				<td>
					<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." style="width: 95%; height: 30px">
					<div id="limitemail" style="font-size:15px;"></div>
				</td>
				<td>
					<input type="button" value="전송" onclick="sendmail()" style="width: 100%; height: 30px">
				</td>
			</tr>
			<tr>
				<td	align="center">
					인증번호*
				</td>
				<td>
					<input type="hidden" id="hiddennum" name="hiddennum">
					<input type="text" name="emailnum" id="emailnum" placeholder="인증번호를 입력해주세요." style="width: 95%; height: 30px">
					<div id="limitemailnum" style="font-size:15px;"></div>
				</td>
				<td>
					<input type="button" name="numcheck" id="numcheck" value="확인" onclick="emailNumCheck()" style="width: 100%; height: 30px">
				</td>
			</tr>
			<tr height="80px">
				<td align="center" colspan="3" id="showid"></td>
			</tr>
			<tr height="50px">
				<td	align="center" colspan="3">
					<span id="search" onclick="searchid()">아이디 확인</span>
					<span style="background-color: lightgray" onclick="window.history.back()">취소</span>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>