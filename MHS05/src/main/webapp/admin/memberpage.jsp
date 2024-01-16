<%@page import="mhs.dto.UserDTO"%>
<%@page import="mhs.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
request.setCharacterEncoding("EUC-KR");
String uno = request.getParameter("uno");
if(uno == null || uno.equals(""))
{
	response.sendRedirect("member.jsp");
	return;
}

UserDTO dto = new UserDTO();
UserVO vo = dto.memberInfo(uno);


%> 
<style>

	input[type=button]
	{
		
		cursor:pointer;
		background-color:lightgray;
		border:0;
		border-radius: 5px;
	
	}
</style>
<script>

var nickcheck = 1;
var nick = "<%= vo.getNickname() %>"
var isretire = "<%= vo.getIsretire() %>"

//닉네임 수정시 변경 할때 마다 중복 확인 해야함
function reNick() 
{
	nickcheck = 0;
}

function changenick() 
{
    $('#membernick').css('display', 'none');
    $('#nickch').css('display', '');
    nickcheck = 0;
}

function nickcancel() 
{
    $('#nickch').css('display', 'none');
    $('#membernick').css('display', '');
    $('#newnickname').val(nick);
    nickcheck = 1;
}


function checkNick()
{
	nick = $("#newnickname").val();	
	
	$.ajax({
		type : "get",
		url : "../login/nickcheck.jsp?nick=" + nick,					
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

function Doisretire() 
{	
	if( isretire == "N")
	{
		if( confirm("<%= vo.getId() %> 회원을 강제탈퇴 하시겠습니까?") == 0)
		{	
			return;
		}else{
			isretire = "Y";
			$("#memberisretire").html(isretire);
			$("#iscancel").css('display', '')
		}
		
	} else
	{
		alert("이미 탈퇴 처리 된 회원입니다.")
	}
}

function iscancel()
{
	isretire = "N";
	$("#memberisretire").html(isretire);
	$("#iscancel").css('display', 'none')
}


function membermodifyok() 
{
	if(nickcheck == "0")
	{
		alert("닉네임 중복확인을 해주세요.")
		return;
	} else
	{
		$.ajax({
			type : "post",
			url : "membermodifyok.jsp",
			data : 
			{
				uno : "<%= uno %>",
				nick : $("#newnickname").val(),
				isretire : isretire
			},
			dataType : "html",
			success : function(data) 
			{
				data = data.trim();
				if(data == "001")
				{
					alert("수정완료")
					document.location.href = "memberpage.jsp?uno=<%=uno%>";
					return;
				}
			}
		});	
	}
}

function DoUserDel() 
{
	if( confirm("<%= vo.getId() %> 회원을 삭제 하시겠습니까?") == 0 )
	{
		return;
	} else
	{
		document.location.href = "memberdelete.jsp?uno=<%=uno%>";
	}
}


</script>
<tr>
	<td colspan="12"><a href="member.jsp"><h2><b>사용자 관리</b></h2></a><hr></td>
</tr>
<tr height="40px">
	<td width="10px" rowspan="13"></td>
	<td style="width:140px; font-size: 20px">회원번호</td>
	<td colspan="2" style="width:140px"><%= vo.getUno() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">아이디</td>
	<td colspan="2"><%= vo.getId() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">이름</td>
	<td colspan="2"><%= vo.getName() %></td>
</tr>
<tr height="40px" id="membernick">
	<td style="font-size: 20px;">닉네임</td>
	<td width="200px"><%= vo.getNickname() %></td>
	<td><input type="button" value="닉네임 수정" style="width:100px; height:30px" onclick="javascript:changenick();"></td>
</tr>
<tr id="nickch" style="display: none; height:40px;" >
	<td height="40px" style="font-size:20px">닉네임*</td>
	<td width="200px">
		<input type="text" id="newnickname" name="newnickname" onkeyup="javascript:reNick();" value="<%= vo.getNickname() %>"style="width:95%; height:25px">
	</td>
	<td>
		<input type="button" value="중복확인" style="width:100px; height:30px; font-size:15px" onclick="javascript:checkNick();">
		<input type="button" value="취소" style="width:50px; height:30px; font-size:15px" onclick="javascript:nickcancel();">
	</td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">성별</td>
	<td colspan="2"><%= vo.getGender() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">생년월일</td>
	<td colspan="2"><%= vo.getBirth() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">이메일</td>
	<td colspan="2"><%= vo.getEmail() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">나의체질</td>
	<td colspan="2"><%= vo.getCon() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">작성글/댓글</td>
	<td colspan="2">
	<a href="userclist.jsp?uno=<%= uno %>"><font color="blue"><%= vo.getCocount() %>개</font></a>&nbsp;/
	<a href="userRlist.jsp?uno=<%= uno %>"><font color="blue"><%= vo.getRecount() %>개</font></a>
	</td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">가입일</td>
	<td colspan="2"><%= vo.getJoindate() %></td>
</tr>
<tr height="40px">
	<td style="font-size: 20px;">탈퇴여부</td>
	<td id="memberisretire"><%= vo.getIsretire() %></td>
	<td>
		<%
		if( !vo.getId().equals("admin"))
		{
			if(vo.getIsretire().equals("N"))
			{
				%>
					<input type="button" value="강제탈퇴" style="width:100px; height:30px" onclick="javascript:Doisretire();">
					<input type="button" id="iscancel" style="display: none; width:50px; height:30px; font-size:15px" value="취소"  onclick="javascript:iscancel();">
				<%
			} else
			{
				%>
					<input type="button" value="유저삭제" style="width:100px; height:30px; background-color: #FD7064;" onclick="javascript:DoUserDel();" >
				<% 
			}
		}
		%>
	</td>
</tr>
<tr height="50px">
	<td colspan="3">
	</td>
</tr>
<tr>
	<td colspan="3" align="center">
		<a href="javascript:membermodifyok();"><input type="button" value="수정완료" style="width:100px; height:35px;"></a>&nbsp;
		<a href="member.jsp"><input type="button" value="취소" style="width:100px; height:35px"></a>
	</td>
</tr>
<%@ include file="../admininclude/tail.jsp" %> 