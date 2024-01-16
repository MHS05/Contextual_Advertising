<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 
<%
String uno  = request.getParameter("uno");
String con  = request.getParameter("con");
String pw   = request.getParameter("pw");
String nick = request.getParameter("nickname");

UserDTO dto = new UserDTO();
UserVO vo = dto.Read(uno);
%>
<script>
	var nickcheck   = 1;
	var checknum    = 0;
	var checkbig    = 0;
	var checktuk    = 0;
	var checklength = 0;


	function retest() 
	{
		window.open('../constitution/cTest.jsp?uno=<%= loginVO.getUno() %>', '', 'width=2000, height=1000');
		 $('#mycon').css('display', 'none');
		 $('#dcon').css('display', 'none');
		 $('#choicecon').css('display', '');
	}
	
    function cancel() 
    {
        $('#dcon').css('display', 'none');
        $('#test').css('display', 'none');
        $('#mycon').css('display', 'block');
        $('#retest').css('display', 'block');
    }
    
    function changepw() 
    {
        $('#mypw').css('display', 'none');
        $('#pwchange').css('display', '');
        $('#pwcheck').css('display', '');
    }
    
    function pwcancel() 
    {
        $('#pwchange').css('display', 'none');
        $('#pwcheck').css('display', 'none');
        $('#mypw').css('display', '');
    }
    
    function changenick() 
    {
    	nickcheck = 0;
        $('#mynick').css('display', 'none');
        $('#nickch').css('display', '');
    }
    
    function nickcancel() 
    {
    	nickcheck = 1;
        $('#nickch').css('display', 'none');
        $('#mynick').css('display', '');
    }
    
	function setChildValue(con)
	{	
		//팝업창(자식창)에서 값 전달 받기
		document.getElementById("constitution").value = con;
	}
	

	//비밀번호 유효성 검사
	function safetyPasswordPattern(str) 
	{
        var pass       = str.value;
        var message    = "";
        var color      = "";
        // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
            // 최대 입력 글자수를 제한한다.
            if(pass.length < 8) 
            {
                message = "최소 8자 이상, 최대 12자 이하";
                color = "#FF0000";
            	checklength = checklength + 1;
            }
            // 문자열의 길이가 8 ~ 16 인경우
            else 
            {
                checklength = 0;
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

                if(checknum != 0 || checkbig != 0 || checktuk != 0 || checklength != 0) 
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
	
	function modifypw()
	{
		if( checknum != 0 || checkbig != 0 || checktuk != 0 || checklength != 0 )
		{
			alert("비밀번호를 확인하세요.");
			return;
		}
		
		if( $("#pw").val() == "" ) //pw라는 이름의 pw의 값을 받아서 빈값이면 아래 출력
		{	
			alert("변경할 비밀번호를 입력하세요."); //변경할 비밀번호를 입력하세요.라는 경고문 띄움
			$("#pw").focus();
			return;
		}
		
		if( $("#pwch").val() == "" )
		{	
			alert("확인할 비밀번호를 입력하세요.");
			$("#pwch").focus();
			return;
		}
		
		if( $("#pw").val() != $("#pwch").val() )
		{	
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwch").focus();
			return;
		}
		
		pw = $("#pw").val();
		
		$.ajax({
			type     : "post",
			url      : "pwmodifyok.jsp?pw=" + pw +"&uno=" + <%= vo.getUno() %>,
			dataType : "html"       ,
			success : function(data)
			{
				// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
				data = data.trim();
				alert("비밀번호가 수정되었습니다.");
		        $('#pwchange').css('display', 'none');
		        $('#pwcheck').css('display', 'none');
		        $('#mypw').css('display', '');
			}
		});
		return;
	}
	
	function safetynickPattern(str) 
	{
		var pass = str.value;
        var message = "";
        var color = "";
        
    	 // 입력값이 있을경우에만 실행
        if(pass.length) 
        {
	     	// 입력값이 영문, 한글, 숫자일 경우에만 실행
	      	var nickpattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	        if(nickpattern.test(pass)) 
	        {
	        	pass = pass.replace(nickpattern, '');
	        	console.log("NICK:" + pass);
	        	$("#nick").val(pass);
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
	
	
	
	function checknick()
	{
		nick = $("#nick").val();
		
		$.ajax({
			type     : "get",
			url      : "../login/nickcheck.jsp?nick=" + nick +"&uno=" + <%= vo.getUno() %>,
			dataType : "html"       ,
			success : function(data)
			{
				// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
				data = data.trim();
				if( data == "003" )
				{
					alert("중복된 닉네임입니다.");
					nickcheck = 0;
					return;
				} else
				{
					alert("사용가능한 닉네임 입니다.");
					nickcheck = 1;
				}
			}
		});
	}
	
	function mypage()
	{
		location.href="myPage.jsp?uno=" + <%= uno %>;		
	}
	
	function modifycon()
	{
		if( $("#nick").val() == "" ) 
		{	
			alert("변경할 닉네임을 입력하세요."); 
			$("#nick").focus();
			return;
		}
		
		con = $("#constitution").val();
		nick = $("#nick").val();
		
		if( nickcheck == 1 )
		{
			$.ajax({
				type     : "post",
				url      : "modifycon.jsp?nick=" + nick + "&con=" + con +"&uno=" + <%= vo.getUno() %>,
				dataType : "html"       ,
				success : function(data)
				{
					// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
					data = data.trim();
					alert("수정되었습니다.");
			        location.href="modify.jsp?uno=" + <%= uno %>;
				}
			});
		} else
		{
			alert("닉네임 중복 체크를 해주세요");
		}
	}
</script>
<style>

	input[type=button]
	{
		
		cursor:pointer;
		background-color:lightgray;
		border:0;
		border-radius: 5px;
	
	}
</style>
		<table border="0" width="1200px" align="center" style="margin-top: 10px">
			<tr>
				<td rowspan="12" width="300px"></td>
				<td colspan="3" align="left"> 
					<h2>회원정보수정</h2>
					<hr>
				</td>
				<td rowspan="11" width="100px"></td>
			</tr>
			<tr>
				<td width="120px" height="50px">아이디*</td>
				<td><%= vo.getId() %></td>
				<td></td>
			</tr>
			<tr style="display:;" id="mypw">
				<td height="50px">비밀번호*</td>
				<td id="userpw">********</td>
				<td width="400px">
					<input type="button" onclick="javascript:changepw();" value="비밀번호 수정" style="height:30px; font-size:15px">
				</td>
			</tr>
			<tr style="display:none;" id="pwchange">
				<td height="50px">변경 비밀번호*</td>
				<td>
					<input type="password" id="pw" maxlength="12" style="width:200px;height:20px;" onkeyup="safetyPasswordPattern(this)">
					<div id="limitpw" style="font-size:15px;"></div>
				</td>
				<td width="400px"></td>
			</tr>
			<tr style="display:none;" id="pwcheck">
				<td height="50px">비밀번호 확인*</td>
				<td>
					<input type="password" id="pwch" style="width:200px; height:20px">
				</td>
				<td>
					<input type="button" value="비밀번호 수정" onclick="modifypw();" style="height:30px; font-size:15px">
					<input type="button" value="취소" style="height:30px; font-size:15px" onclick="javascript:pwcancel();">
				</td>
			</tr>
			<tr>
				<td height="50px">이름*</td>
				<td><%= vo.getName() %></td>
				<td></td>
			</tr>
			<tr id="mynick">
				<td height="50px">닉네임*</td>
				<td id="usernick"><%= vo.getNickname() %></td>
				<td>
					<input type="button" value="닉네임 수정" onclick="changenick();" style="height:30px; font-size:15px">
				</td>
			</tr>
			<tr id="nickch" style="display: none">
				<td height="50px">닉네임*</td>
				<td>
					<input type="text" id="nick" name="nick" value="<%= vo.getNickname() %>" onkeyup="safetynickPattern(this);" style="width:250px; height:25px">
					<div id="limitnick" style="font-size:15px;"></div>
				</td>
				<td>
					<input type="button" value="중복확인" onclick="javascript:checknick();" style="height:30px; font-size:15px">
					<input type="button" value="취소" style="height:30px; font-size:15px" onclick="javascript:nickcancel();">
				</td>
			</tr>
			<tr>
				<td height="50px">성별*</td>
				<td><%= vo.getGender() %></td>
				<td></td>
			</tr>
			<tr>
				<td height="50px">생년월일*</td>
				<td><%= vo.getBirth() %></td>
				<td></td>
			</tr>
			<tr>
				<td height="50px">나의 체질*</td>
				<td>
					<%
					if( !vo.getCon().equals("나의 체질 검사하기") )
					{
						%>
						<div name="mycon" id="mycon"><%= vo.getCon() %></div>
						<%
					}
					else
					{
					%>
					<div name="dcon" id="dcon">
						<select name="constitution" id="constitution" style="width: 150px; height: 30px ">
							<option value="나의 체질 검사하기">선택</option>	
							<option value="태양인">태양인</option>	
							<option value="태음인">태음인</option>	
							<option value="소양인">소양인</option>	
							<option value="소음인">소음인</option>
						</select>
					</div>
					<%
					}
					%>
					<div name="choicecon" id="choicecon" style="display:none;">
						<select name="constitution" id="constitution" style="width: 150px; height: 30px ">
							<option <%= loginVO.getCon().equals("나의 체질 검사하기") ? "selected" : "" %> value="나의 체질 검사하기">선택</option>	
							<option <%= loginVO.getCon().equals("태양인") ? "selected" : "" %> value="태양인">태양인</option>	
							<option <%= loginVO.getCon().equals("태음인") ? "selected" : "" %> value="태음인">태음인</option>	
							<option <%= loginVO.getCon().equals("소양인") ? "selected" : "" %> value="소양인">소양인</option>	
							<option <%= loginVO.getCon().equals("소음인") ? "selected" : "" %> value="소음인">소음인</option>
						</select>
					</div>
				</td>
				<td>
					<div name="retest" id="retest">
					<a href="javascript:retest();">
					<input type="button" style="height:30px; font-size:15px" value="나의 체질 재검사하기"></a>
					</div> 
				</td>
			</tr>
			<tr>
				<td height="50px">이메일*</td>
				<td><%= vo.getEmail() %></td>
				<td></td>
			</tr>
			<tr height="50px">
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
						<input type="button" value="수정완료" onclick="modifycon();" style="width:100px; height:30px; font-size:15px; background-color:#4dd5b0;">
					<a href="myPage.jsp?uno=<%= uno %>">
						<input type="button" value="취소" style="width:100px; height:30px; font-size:15px"></a>
				</td>
			</tr>
		</table>
<%@ include file="../include/tail.jsp" %> 