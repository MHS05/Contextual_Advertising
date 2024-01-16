<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.dao.smtp" %>
<%@ include file="../include/head.jsp" %> 

<% 
//로그인 객체 있으면 메인화면으로 강제 이동
if(loginVO != null)
{
	response.sendRedirect("../main/index.jsp");	
}
%>

<script>
	var nickcheck        = 1;
	var checknum         = 0;
	var checkbig         = 0;
	var checktuk         = 0;
	var checklength      = 1;
	var checkidlength    = 1;
	var checkpwlength    = 1;
	var checkbirthlength = 1;
	var checkbirthnum    = 1;
	
	//로딩시 id 입력에 포커스
	window.onload = function() 
	{
		document.joinform.id.focus();
	}
	
	//아이디 유효성 검사
	function safetyidPattern(str) 
	{
        var pass    = str.value;
        var message = "";
        var color   = "";
        // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
            // 최대 입력 글자수를 제한한다.
            if(pass.length < 8 || pass.length > 12) 
            {
                message = "최소 8자 이상, 최대 12자 이하";
                color = "#FF0000";
                checkidlength = checkidlength + 1;
            }
            // 문자열의 길이가 8 ~ 12 인경우
            else
           	{
            	checkidlength = 0;
            	message = "";
            	color = "#000000";
           	}
        }
        else 
        {
        	checkidlength = 1;
            message = "아이디를 입력하세요.";
            color = "#FF0000";
        }
        document.getElementById("makyText").innerHTML = message;
        document.getElementById("makyText").style.color = color;
    }
	
	//비밀번호 유효성 검사
	function safetyPasswordPattern(str) 
	{
        var pass    = str.value;
        var message = "";
        var color   = "";
        // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
            // 최대 입력 글자수를 제한한다.
            if(pass.length < 8) 
            {
                message = "최소 8자 이상, 최대 12자 이하";
                color = "#FF0000";
                checkpwlength = checkpwlength + 1;
            }
            // 문자열의 길이가 8 ~ 16 인경우
            else 
            {
            	checkpwlength = 0;
                // 비밀번호 문자열에 숫자 존재 여부 검사
                var pattern1 = /[0-9]/;  // 숫자
                if(pattern1.test(pass) == false) 
                {
                    checknum = checknum + 1;
                } else
                {
                	checknum = 0;
                }
                // 비밀번호 문자열에 영문 대문자 존재 여부 검사
                var pattern3 = /[A-Z]/;
                if(pattern3.test(pass) == false) 
                {
                    checkbig = checkbig + 1;
                } else
                {
                	checkbig = 0;
                }
                // 비밀번호 문자열에 특수문자 존재 여부 검사
                var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;  // 특수문자
                if(pattern4.test(pass) == false) 
                {
                    checktuk = checktuk + 1;
                } else
                {
                	checktuk = 0;
                }
                if(checknum != 0 || checkbig != 0 || checktuk != 0 || checkpwlength != 0) 
                {
                    message = "숫자, 영문 대문자, 특수문자를 포함해서 입력해주세요.";
                    color = "#FF0000";
                }
            }
        }
        else 
        {
        	checkpwlength = 1;
            message = "비밀번호를 입력해 주세요";
            color = "#FF0000";
        }
        document.getElementById("limitpw").innerHTML = message;
        document.getElementById("limitpw").style.color = color;
    }
	
	//이름 유효성 검사
	function safetynamePattern(str) 
	{
		var pass    = str.value;
        var message = "";
        var color   = "";
    	 // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
	     	// 입력값이 한글일 경우에만 실행
	      	var pattern = /[0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	        if(pattern.test(pass)) 
	        {
	        	pass = pass.replace(pattern, '');
	        	console.log("NAME:" + pass);
	        	$("#name").val(pass);
	        	//str.value = pass;
	        	message = "숫자나 특수문자는 사용할 수 없습니다.";
	            color = "#FF0000";
	        }	        
        }   	 
        else 
        {
            message = "숫자나 특수문자는 사용할 수 없습니다.";
            color = "#FF0000";
        }
        document.getElementById("limitname").innerHTML   = message;
        document.getElementById("limitname").style.color = color;
	}
	//닉네임 유효성 검사
	function safetynickPattern(str) 
	{
		var pass    = str.value;
        var message = "";
        var color   = "";
    	 // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
	     	// 입력값이 영문, 한글, 숫자일 경우에만 실행
	      	var nickpattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	        if(nickpattern.test(pass)) 
	        {
	        	pass = pass.replace(nickpattern, '');
	        	console.log("NICK:" + pass);
	        	$("#nickName").val(pass);
	        	//str.value = pass;
	        	message = "특수문자는 이용할 수 없습니다.";
	            color = "#FF0000";
	        }	        
        }   	 
        else 
        {
            message = "특수문자는 이용할 수 없습니다.";
            color = "#FF0000";
        }
        document.getElementById("limitnick").innerHTML   = message;
        document.getElementById("limitnick").style.color = color;
	}
	
	//생년월일 유효성 검사
	function safetybirthPattern(str) {
        var pass    = str.value;
        var message = "";
        var color   = "";
        // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
            // 최대 입력 글자수를 제한한다.
            if( pass.length > 6  || pass.length < 6) 
            {
                message = "생년월일 6자를 입력해주세요.";
                color = "#FF0000";
                checkbirthlength = checkbirthlength + 1;
            }
            // 문자열의 길이가 6자인경우
            else if ( pass.length == 6 ) 
            {
            	checkbirthlength = 0;
                // 생년월일 문자열에 숫자 존재 여부 검사
                var pattern1 = /[^0-9]/g;  // 숫자
                if(pattern1.test(pass)) 
                {
                	pass = pass.replace(pattern1, '');
    	        	console.log("BIRTH:" + pass);
    	        	$("#birth").val(pass);
                    checkbirthnum = checkbirthnum + 1;
                    message = "숫자만 입력해주세요.";
    	            color = "#FF0000";
                } else
                {
                	checkbirthnum = 0;
                }
            }
        }
        else 
        {
            message = "생년월일을 입력해 주세요";
            color = "#FF0000";
        }
        document.getElementById("limitbirth").innerHTML   = message;
        document.getElementById("limitbirth").style.color = color;
    }
	
	//중복확인 여부 체크
	var nickcheck = 0;
	var idcheck = 0;
	
	//아이디 닉네임 수정 하는 순간 중복확인여부 0으로 바뀌면서 다시 중복확인 해야함	
	function reID() 
	{
		idcheck = 0;
	}
	
	function reNick() 
	{
		nickcheck = 0;
	}
	
	//ID중복체크
	function checkID()
	{
		id = $("#id").val();	
		
		$.ajax({
			type : "get",
			url : "idcheck.jsp?id=" + id,
			dataType : "html",
			success : function(data) 
			{	
				data = data.trim();
				if( data == "002")
				{
					alert("사용 가능한 아이디 입니다.") //사용가능한 아이디일 경우에만 중복체크여부 1로 바뀜
					idcheck = 1;
					return;
				}
				else if( data == "003")
				{
					alert("중복된 아이디 입니다.");
					idcheck = 0;
					return;
				}
				else if ( data == "004")
				{
					alert("아이디 길이를 확인하세요.");
					idcheck = 0;
					return;
				}
				else
				{
					alert("아이디를 입력해 주세요.");
					idcheck = 0;
					return;
				}
			}, 
			error : function(xhr, status, error) 
			{
			},
			complete : function(data) 
			{
			}
		});
	}
	
	//닉네임 중복체크
	function checkNick()
	{
		nick = $("#nickName").val();	
		
		$.ajax({
			type : "get",
			url : "nickcheck.jsp?nick=" + nick,					
			dataType : "html",
			success : function(data) 
			{
				data = data.trim();
				if( data == "002")
				{
					alert("사용 가능한 닉네임 입니다.") //사용가능한 닉네임일 경우에만 중복체크여부 1로 바뀜
					nickcheck = 1;
					return;
				} else if( data == "003")
				{
					alert("중복된 닉네임 입니다.");
					nickcheck = 0;
					return;
				} else
				{
					alert("닉네임을 입력해 주세요.");
					nickcheck = 0;
					return;
				}
				
			}, 
			error : function(xhr, status, error) 
			{
			},
			complete : function(data) 
			{
			}
		});		
	}
	
	//각 항목 입력 돼있는지 여부 확인, 안돼있으면 자동 포커스
	function check() 
	{
		if( document.joinform.id.value == "" )
		{
			alert("아이디를 입력하세요.")
			document.joinform.id.focus();
			return;
		}
		
		if( document.joinform.pw.value == "" )
		{
			alert("비밀번호를 입력하세요.")
			document.joinform.pw.focus();
			return;
		}
		
		if( document.joinform.pw.value != document.joinform.pwcheck.value )
		{
			alert("비밀번호를 확인하세요.")
			document.joinform.pw.focus();
			return;
		}
		
		if( document.joinform.name.value == "" )
		{
			alert("이름을 입력하세요.")
			document.joinform.name.focus();
			return;
		}
		
		if( document.joinform.nickName.value == "" )
		{
			alert("닉네임을 입력하세요.")
			document.joinform.nickName.focus();
			return;
		}
		
		if( document.joinform.birth.value == "" )
		{
			alert("생년월일을 입력하세요.")
			document.joinform.birth.focus();
			return;
		}
		
		if( document.joinform.email.value == "" )
		{
			alert("이메일을 입력하세요.")
			document.joinform.email.focus();
			return;

		}
		
		dojoin(); //다 입력 돼있으면 로그인 시도
		
	}
	
	function dojoin() 
	{	
		//아이디 닉네임 중복체크여부 확인해서 둘다 사용가능일때만 submit
		if(idcheck == 1 && nickcheck == 1 && checkcheck == 1 && checknum == 0 && checkbig == 0 && checktuk == 0 && checkidlength == 0 && checkpwlength == 0 && checkbirthlength == 0 && checkbirthnum == 0)
		{
			joinform.submit();
		} 
		else
		{	//중복체크 여부 둘 중 하나라도 안돼있으면 확인요청
			if( idcheck == 0 || nickcheck == 0 )
			{
				alert("아이디 또는 닉네임 확인을 해주세요.");
			}
			else if( checkcheck == 0 )
			{
				alert("이메일 인증을 완료해주세요.");
			}
			else if( checknum != 0 || checkbig != 0 || checktuk != 0 )
			{
				alert("비밀번호를 확인해주세요.");
			}
			else if( checkidlength != 0 )
			{
				alert("아이디를 확인해주세요.");
			}
			else if ( checkpwlength != 0 )
			{
				alert("비밀번호를 확인해주세요.");
			}
			else if ( checkbirthlength != 0 || checkbirthnum != 0)
			{
				alert("생년월일을 확인해주세요.")
			}
		}
	}
	
	function setChildValue(con)
	{	
		//팝업창(자식창)에서 값 전달 받기
		document.getElementById("constitution").value = con;
	}
	
	
	
	//이메일 인증
	function sendmail() //이메일 인증버튼 클릭시
	{
	
	//이메일 인풋에 값이 있는지 확인
	if( $("#email").val() == "")
	{
		alert("이메일을 입력해주세요");
		$("#email").focus();	
		return;
	}
	$("#msgload").css("display","");
	$("#msg").html("인증 메일 발송중입니다. 잠시만 기다려 주세요...");
	
	//sendmail 페이지로 비동기 요청
	$.ajax({
		type : "post",
		url  : "sendmail.jsp",
		data : 
		{
			email : $("#email").val(),
		},
		dataType : "html",	
		success  : function(data) 
		{	
			
			//sendmail 페이지에서 값을 받아와서 emailnum 히든값에 저장
			data = data.trim();
			if(data == "001"){
				alert("이메일을 입력해주세요");
			}
			if(data == "002"){
				alert("이메일 발송에 실패 했습니다.");
			}
			$("#hiddennum").val(data);
			$("#msg").html("이메일이 전송됐습니다.");
			//인증메일 전송후 이메일값 변경 안되도록
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
		else if( $("#emailnum").val() == $("#hiddennum").val() )
		{
			alert("인증 성공");
			checkcheck = 1;
			DoMsgChange();
			return;
		}
	}
	
	function DoMsgChange()
	{
		$("#msg").html("인증이 완료됐습니다.");
	}


	
</script>
	<form method="post" name="joinform" id="joinform" action="joinok.jsp">
		<table class="join" border="0" width="1200px" align="center" style="margin-top: 10px">
			<tr>
				<td rowspan="14" width="300px">
				<td colspan="3" align="left"> 
					<h3>회원가입</h3>
					<hr>
				</td>
				<td rowspan="11" width="100px"></td>
			</tr>
			<tr>
				<td width="150px">아이디(*)</td>
				<td width="400px">
					<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" maxlength="12" onkeyup="safetyidPattern(this);" style="width: 95%; height: 30px" onkeyup="javascript:reID();">
					<div id="makyText" style="font-size:15px;"></div> 							
				</td>
				<td><input type="button" value="중복확인" onclick="javascript:checkID();"></td>
			</tr>
			<tr>
				<td width="120px">비밀번호(*)</td>
				<td>
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요" maxlength="12" onkeyup="safetyPasswordPattern(this);" oninput='limitpw(this,8,12)' style="width: 95%; height: 30px">
					<div id="limitpw" style="font-size:15px;"></div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td width="120px">비밀번호 확인(*)</td>
				<td><input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호를 한번 더 입력해주세요" style="width: 95%; height: 30px"></td>
				<td></td>
			</tr>
			<tr>
				<td width="120px">이름(*)</td>
				<td>
					<input type="text" name="name" id="name" placeholder="이름을 입력해주세요" maxlength="12" onkeyup="safetynamePattern(this);" style="width: 95%; height: 30px">
					<div id="limitname" style="font-size:15px;"></div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td width="120px">닉네임(*)</td>
				<td>
					<input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력해주세요" maxlength="12" onkeyup="safetynickPattern(this);" style="width: 95%; height: 30px" onkeyup="javascript:reNick();">
					<div id="limitnick" style="font-size:15px;"></div>
				</td>
				<td><input type="button" value="중복확인" onclick="javascript:checkNick();"></td>
			</tr>
			<tr>
				<td width="120px">성별(*)</td>
				<td>
					<input type="radio" name="gender" id="gender" value="M" checked>남자
					<input type="radio" name="gender" id="gender" value="W">여자
				</td>
				<td></td>
			</tr>
			<tr>
				<td width="120px">생년월일(*)</td>
				<td>
					<input type="text" name="birth" id="birth" placeholder="예)940812" maxlength="6" onKeyup="safetybirthPattern(this)" style="width: 95%; height: 30px">
					<div id="limitbirth" style="font-size:15px;"></div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td width="120px">이메일(*)</td>
				<td>
					<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" style="width: 95%; height: 30px">
				</td>
				<td>
					<input type="button" value="이메일 보내기" onclick="sendmail();">
				</td>
			</tr>
			<tr id="msgload" style="display:none;">
				<td></td>
				<td id="msg"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="hidden" id="hiddennum" name="hiddennum">
					<input type="text" name="emailnum" id="emailnum" placeholder="인증번호를 입력해주세요." style="width:95%;height:30px;">
				</td>
				<td>
					<input type="button" id="emailnumcheck" name="emailnumcheck" onclick="emailNumCheck();" value="인증번호 확인">
				</td>
			</tr>
			<tr>
				<td width="120px">나의 체질</td>
				<td>
					<select name="constitution" id="constitution" style="width: 150px; height: 30px ">
						<option value="나의 체질 검사하기">선택</option>	
						<option value="태양인">태양인</option>	
						<option value="태음인">태음인</option>	
						<option value="소양인">소양인</option>	
						<option value="소음인">소음인</option>
					</select>
					&nbsp;
					<a href="../constitution/cTest.jsp" onClick="window.open(this.href, '', 'width=2000, height=1000'); return false;"><input type="button" value="나의 체질 검사하기"></a>	
				</td>
				<td></td>
			</tr>
			<tr height="50px">
				<td></td>
				<td colspan="3" valign="top"><font size="3">※회원가입 후 에도 체질검사가 가능합니다</font></td>
			</tr>
			<tr>
				<td colspan="4" align="center" style="color: white;">
					<span id="span2" onclick="javascript:check();">회원가입</span>
					<a href="../main/index.jsp"><span id="span2" style="background-color: lightgray" onclick="JoinCancle();">취소</span></a>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="../include/tail.jsp" %> 