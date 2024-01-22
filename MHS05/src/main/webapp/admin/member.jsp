<%@page import="mhs.dto.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mhs.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<%
String isretire = request.getParameter("isretire");
String newest	= request.getParameter("newest");
String gender   = request.getParameter("gender");
String key      = request.getParameter("key");
if(newest == null)   newest   = "";
if(isretire == null) isretire = "";
if(gender == null)   gender   = "";
if(key == null)      key   	  = "";

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = dto.GetuTotal(isretire,key,gender);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<UserVO> list = dto.GetuList(page_no, isretire , key, newest, gender);
%>
<script>

window.onload = function() 
{
	$("#key").keyup(function (event)
	{
		if (event.keyCode == 13) 
		{
			DoSearch();
		}
		
	});
}

function DoSearch() 
{
	var nick = $("#key").val();
	if(nick == null || nick == "")
	{
		alert("검색어를 입력해 주세요.");
		return;
	}
	
	document.location.href = "member.jsp?gender=<%= gender %>&isretire=<%= isretire %>&newest=<%= newest %>&key="+nick;
}

function ChangeGender() 
{
	$("#memberGender").css('display','none');
	$("#gender").css('display','');
}

function DoSearchGender() 
{
	var gen = $("#gender").val();
	document.location.href = "member.jsp?gender=" + gen + "&isretire=<%= isretire %>&newest=<%= newest %>&key=<%= key %>";
}

</script>
<tr>
	<td colspan="11"><a href="member.jsp"><font style="font-size: 30px; font-weight: bold;">사용자 관리</font></a>
		<span style="background-color: white; padding: 0 0; margin-left: 560px">
			<%
			if( key == null || key.equals(""))
			{
				%>
				<input type="text" id="key" name="key" placeholder="닉네임검색" style="width:100px;">
				<%
			} else
			{
				%>
				<input type="text" id="key" name="key" value="<%= key %>" style="width:100px;">
				<%
			}
			%>
			<input type="button" value="검색" onclick="DoSearch();">
		</span>
		<hr>
	</td>
</tr>
<tr height="30px">
	<td align="center" width="70px">
		<%
			if(newest.equals("newest"))
			{
				%>
					<a href="member.jsp?gender=<%= gender %>&isretire=<%= isretire %>&key=<%= key %>">회원번호▼</a>
				<%
			}else
			{
				%>
					<a href="member.jsp?gender=<%= gender %>&isretire=<%= isretire %>&newest=newest&key=<%= key %>">회원번호▲</a>
				<%	
			}
		%>
	</td>
	<td align="center" width="110px">아이디</td>
	<td align="center" width="110px">닉네임</td>
	<td align="center" width="70px">이름</td>
	<td align="center" width="55px">
		<select name="gender" id="gender" onchange="DoSearchGender();" style="display: none; width: 54px; height: 25px" >
			<option value="" <%= gender.equals("") ? "selected" : "" %>>성별</option>
			<option value="M" <%= gender.equals("M") ? "selected" : "" %>>남성</option>
			<option value="W" <%= gender.equals("W") ? "selected" : "" %>>여성</option>
		</select>
		<%
			if(gender == null || gender.equals(""))
			{
				%>
					<a href="javascript:ChangeGender();" id="memberGender">성별</a>
				<%
			}else if(gender.equals("M"))
			{
				%>
					<a href="javascript:ChangeGender();" id="memberGender"><font color="red"><b>남성</b></font></a>
				<%	
			} else if(gender.equals("W"))
			{
				%>
					<a href="javascript:ChangeGender();" id="memberGender"><font color="red"><b>여성</b></font></a>
				<%	
			}
		%>
	</td>
	<td align="center" width="80px">생년월일</td>
	<td align="center" width="70px">보유체질</td>
	<td align="center" width="80px">가입일</td>
	<td align="center" width="40px">
		<%
			if(isretire.equals("Y"))
			{
				%>
					<a href="member.jsp?gender=<%= gender %>&newest=<%= newest %>&key=<%= key %>"><font color="red"><b>탈퇴</b></font></a>
				<%
			}else
			{
				%>
					<a href="member.jsp?gender=<%= gender %>&isretire=Y&newest=<%= newest %>&key=<%= key %>">탈퇴</a>
				<%	
			}
		%>
	</td>
	<td align="center" width="20px"></td>
</tr>
<tr>
	<td colspan="11"><hr></td>
</tr>
<%

if(list.size() == 0)
{
	%>
	<tr height="50px">
		<td align="center" colspan="11">회원이 없습니다.</td>
	</tr>
	<%
}


for(UserVO vo : list)
{
	%>
		<tr>
			<td align="center"><%= vo.getUno() %></td>
			<td align="center">
				<a href="memberpage.jsp?uno=<%= vo.getUno() %>"><%= vo.getId() %></a>
			</td>
			<td align="center">
				<a href="memberpage.jsp?uno=<%= vo.getUno() %>"><%= vo.getNickname() %></a>
			</td>
			<td align="center"><%= vo.getName() %></td>
			<td align="center"><%= vo.getGender() %></td>
			<td align="center"><%= vo.getBirth() %></td>
			<td align="center">
			<%
			if(vo.getCon().equals("나의 체질 검사하기"))
			{
				%>X<%
			}else
			{
				%>
					<%= vo.getCon() %>
				<%
			}
			%>
			</td>
			<td align="center"><%= vo.getJoindate() %></td>
			<td align="center"><%= vo.getIsretire() %></td>
			<td valign="middle">
				<a href="memberpage.jsp?uno=<%= vo.getUno() %>">
				<img src="../image/setup.png" style="width:20px; height: 20px"></a>
			</td>
		</tr>
		<tr>
			<td colspan="11"><hr></td>
		</tr>
	<%
}
%>
<tr>
	<td colspan="11" align="center">
		<%
			//페이징 5단계 : 시작, 종료 블럭 페이지 계산
			//현제 페이지 번호가 16일때 시작 블럭 페이지 : 11, 종료 블럭 페이지 :20
			int startBlock = ((page_no-1)/10)*10; //시작 블록 페이지
			startBlock  += 1;
			int endBlock = startBlock + 10 - 1; //종료 블럭 페이지
			if(endBlock > totalPage)
			{
				//종료 블록 페이지가 전체 페이지보다 크면
				endBlock = totalPage;
			}
			
			//페이징 6단계 : 이전 , 다음 을 표시한다.
			
			if( startBlock > 10)
			{
				%>
				<a href="member.jsp?gender=<%= gender %>&page=<%= startBlock - 1 %>&isretire=<%= isretire %>&newest=<%= newest %>&key=<%= key %>">◀이전</a>
				<%
				
			}
			
			for(int i = startBlock; i <= endBlock; i++)
			{	
				if( i == page_no )
				{
					%>
					<a style="color:red" "href="member.jsp?gender=<%= gender %>&page=<%= i %>&isretire=<%= isretire %>&newest=<%= newest %>&key=<%= key %>"><%= i %></a>&nbsp;
					<%
				}else
				{
					%>
					<a href="member.jsp?&page=<%= i %>&gender=<%= gender %>&isretire=<%= isretire %>&newest=<%= newest %>&key=<%= key %>"><%= i %></a>&nbsp;
					<%
				}
			}
			
			//다음블럭 표기
			
			if( endBlock < totalPage)
			{
				%>
				<a href="member.jsp?gender=<%= gender %>&page=<%= endBlock + 1 %>&isretire=<%= isretire %>&newest=<%= newest %>&key=<%= key %>">다음▶</a>
				<%
			}
		%>
	</td>
</tr>
<%@ include file="../admininclude/tail.jsp" %> 