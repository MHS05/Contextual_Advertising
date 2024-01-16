	<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%

String uno = request.getParameter("uno");
if(uno.equals("") || uno == null)
{
	response.sendRedirect("member.jsp");
	return;
}

UserDTO dto = new UserDTO();
UserVO vo = dto.memberInfo(uno);

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO ldto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = ldto.GetUserCTotal(uno);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<CommunityVO> list = ldto.GetUserCList(page_no, uno);
%>

<script>
var selectedElementsCnt = 0; //체크된 체크박스 갯수

function getCheckedCnt()  
{
	// 선택된 목록 가져오기
	const query = 'input[name="delNo"]:checked';
	const selectedElements = document.querySelectorAll(query);
	  
	  // 선택된 목록의 갯수 세기
	selectedElementsCnt = selectedElements.length;
}

//전체선택
function selectAll(selectAll)  
{
	getCheckedCnt();
	const checkboxes = document.getElementsByName("delNo");
	checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}

function Dodelete() 
{
	if(selectedElementsCnt == "0")
	{
		alert("삭제할 게시물을 선택 해주세요.")
	} else {
		
		$("#clistForm").submit();
		
	}
}

</script>
<style>
	.div1
	{	
		width:400px;
		overflow: hidden;
		text-overflow:clip;
	    text-overflow:ellipsis;
	}

</style>
<form id="clistForm" method="get" action="admincdelete.jsp">
<input type="hidden" id="uno" name="uno" value="<%= uno %>"> 
<tr>
	<td colspan="6">
		<a href="javascript:Dodelete();"><div class="dbutton" style="margin-top: 22px; background-color:#FD7064;">선택삭제</div></a>
		<a href="userclist.jsp?uno=<%= uno %>"><h2><b><%= vo.getNickname() %> 님이 작성한 글 목록</b></h2></a>
		<hr>
	</td>
</tr>
<tr>
	<td align="center" width="10px">
		<input type="checkbox" name="delNo" id="delNo"  value="selectall" onclick='selectAll(this)'>
	</td>
	<td align="center" width="100px">번호</td>
	<td align="center" width="350px">제목</td>
	<td align="center" width="180px">글쓴이</td>
	<td align="center" width="100px">작성일</td>
	<td align="center" width="50px">조회수</td>
</tr>
<tr>
	<td colspan="6"><hr></td>
</tr>
<%

if(list.size() == 0)
{
	%>
	<tr>
		<td align="center" colspan="6">작성된 글이 없습니다.</td>
	</tr>
	<%
}

for(CommunityVO cvo : list)
{
	%>
	<tr>
		<td align="center" width="10px">
		<input type="checkbox" name="delNo" id="delNo" value="<%= cvo.getNo() %>"  onclick='getCheckedCnt()'>
		</td>
		<td align="center"><%= cvo.getNo() %></td>
		<td align="left"><a href="adminCview.jsp?no=<%= cvo.getNo() %>" target="_blank">
			<div class="div1"">
				<%
				if(cvo.getTitle().length() > 36)
				{
					%>
						<%= cvo.getTitle().substring(0,35) %>...
					<%
				} else
				{
				%><%= cvo.getTitle() %><%
				}
				%>
				</a>
				<%
					if( !cvo.getRecount().equals("0"))
					{
						%><span style="padding: 0px 0px; background-color:white; color:#ff6600">(<%= cvo.getRecount() %>)</span><%
								
					}			
				%>
			</div></a>
		</td>
		<td align="center">
			<a href="memberpage.jsp?uno=<%= uno %>"><%= cvo.getNickname() %></a>
		</td>
		<td align="center"><%= cvo.getWdate() %></td>
		<td align="center"><%= cvo.getHit() %></td>
	</tr>
	<tr>
		<td colspan="6"><hr></td>
	</tr>
	<%
}
%>
</form>
<tr>
	<td colspan="6" align="center">
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
				<a href="userclist.jsp?uno=<%= uno %>&page=<%= startBlock - 1 %>">◀이전</a>
				<%
				
			}
			
			for(int i = startBlock; i <= endBlock; i++)
			{	
				if( i == page_no )
				{
					%>
					<a style="color:red" "href="userclist.jsp?uno=<%= uno %>&page=<%= i %>"><%= i %></a>&nbsp;
					<%
				}else
				{
					%>
					<a href="userclist.jsp?uno=<%= uno %>&page=<%= i %>"><%= i %></a>&nbsp;
					<%
				}
			}
			
			//다음블럭 표기
			
			if( endBlock < totalPage)
			{
				%>
				<a href="userclist.jsp?uno=<%= uno %>&page=<%= endBlock + 1 %>">다음▶</a>
				<%
				
			}
		%>
	</td>
</tr>
<%@ include file="../admininclude/tail.jsp" %> 