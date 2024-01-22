<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.dao.smtp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>pw 찾기</title>
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
		$("#id").focus();
		$("#id,#email,#emailnum").keyup(function(event)
		{
			if (event.keyCode == 13) 
			{
				searchid();
			}
		});
	}
	
	//아이디 유효성 검사
	$(function(){
       $("#id").keyup(function (event) {
            regexp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
            v = $(this).val();
            if (regexp.test(v)) {
                $("#limitid").html("특수문자는 사용 불가능입니다.");
                $("#limitid").css("color","red");
                $(this).val(v.replace(regexp, ''));
            }
        });
	});
	
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
			$("#newpw").css("display","");
			$("#newpwcheck").css("display","");
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
	
	//비밀번호 유효성 검사
	function safetyPasswordPattern(str) 
	{
        var pass = str.value;
        var message = "";
        var color = "";
        var checknum = 0;
        var checksmall = 0;
        var checkbig = 0;
        var checktuk = 0;
        // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
            // 최대 입력 글자수를 제한한다.
            if(pass.length < 8 || pass.length > 12) 
            {
                message = "최소 8자 이상, 최대 12자 이하";
                color = "#FF0000";
            }
            // 문자열의 길이가 8 ~ 16 인경우
            else 
            {
                // 비밀번호 문자열에 숫자 존재 여부 검사
                var pattern1 = /[0-9]/;  // 숫자
                if(pattern1.test(pass) == false) 
                {
                    checknum = checknum + 1;
                }
                // 비밀번호 문자열에 영문 대문자 존재 여부 검사
                var pattern3 = /[A-Z]/;
                if(pattern3.test(pass) == false) 
                {
                    checkbig = checkbig + 1;
                }
                // 비밀번호 문자열에 특수문자 존재 여부 검사
                var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;  // 특수문자
                if(pattern4.test(pass) == false) 
                {
                    checktuk = checktuk + 1;
                }

                if(checknum == 1 || checkbig == 1 || checktuk == 1) 
                {
                    message = "숫자, 영문 대문자, 특수문자를 포함해서 입력해주세요.";
                    color = "#FF0000";
                } 
            }
        }
        else 
        {
            message = "비밀번호를 입력해 주세요";
            color = "#FF0000";
        }

        document.getElementById("limitpw").innerHTML = message;
        document.getElementById("limitpw").style.color = color;
	}
	
	function searchpw()
	{
		if($("#id").val() == "")
		{
			$("#limitid").html("아이디를 입력하세요.");
			$("#limitid").css("color","red");
			$("#id").focus();
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
		if( $("#pw").val() != $("#pwcheck").val() )
		{
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		$.ajax({
			type : "post",
			url  : "idcheck.jsp",
			data : 
			{
				id : $("#id").val(),
			},					
			dataType : "html",
			success : function(data) 
			{
				data = data.trim();
				if( data == "002" )
				{
					alert("없는 이름입니다.");
				}
				else{}
			} 
		});
		
		$.ajax({
			type : "post",
			url  : "pwmodify.jsp",
			data : 
			{
				id : $("#id").val(),
				pw : $("#pw").val(),
			},					
			dataType : "html",
			success : function(data) 
			{
				data = data.trim();
				if( data == "001")
				{
					alert("비밀번호를 입력하세요.");
				}
				else
				{
					alert("변경이 완료되었습니다.");
				}
			} 
		});
		
	}
	</script>
	<form method="post" action="">
		<table width="400px" align="center" border="0" style="margin-top: 20px">
			<tr>
				<td	align="center" colspan="3">
					<h1>비밀번호 찾기</h1>
				</td>
			</tr>
			<tr height="80px">
				<td	align="center" colspan="3"></td>
			</tr>
			<tr height="50px">
				<td	align="center" width="125px">
					아이디*
				</td>
				<td>
					<input type="text" id="id" name="id" maxlength="12" placeholder="아이디를 입력해주세요">
					<div id="limitid" style="font-size:15px;"></div>
				</td>
			</tr>
			<tr height="50px">
				<td	align="center">
					이메일*
				</td>
				<td>
					<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" style="width: 95%; height: 30px">
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
			<tr id="newpw" style="display:none;">
				<td	align="center">
					새로운 비밀번호*
				</td>
				<td>
					<input type="password" name="pw" id="pw" maxlength="12" onkeyup="safetyPasswordPattern(this);" placeholder="새로운 비밀번호를 입력해주세요." style="width: 95%; height: 30px">
					<div id="limitpw" style="font-size:15px;"></div>
				</td>
			</tr>
			<tr id="newpwcheck" style="display:none;">
				<td	align="center">
					비밀번호 확인*
				</td>
				<td>
					<input type="password" name="pwcheck" id="pwcheck" maxlength="12" placeholder="비밀번호를 입력해주세요." style="width: 95%; height: 30px">
					<div id="limitepwcheck" style="font-size:15px;"></div>
				</td>
			</tr>
			<tr height="80px">
				<td colspan="3">
				</td>
			</tr>
			<tr height="50px">
				<td	align="center" colspan="3">
					<span onclick="searchpw()"> 변경</span>
					<span style="background-color: lightgray" onclick="window.history.back()">취소</span>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>