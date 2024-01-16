<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
String kind = request.getParameter("kind");
String uno = request.getParameter("uno");

if(kind == null) kind = "F";
String btitle = "자유게시판";
if(kind.equals("TY"))
{
	btitle = "태양인게시판";
}
if(kind.equals("TE"))
{
	btitle = "태음인게시판";
}
if(kind.equals("SY"))
{
	btitle = "소양인게시판";
}
if(kind.equals("SE"))
{
	btitle = "소음인게시판";
}

if(uno.equals("") || uno == null)
{
	response.sendRedirect("myPage.jsp");
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
int totalData = ldto.GetUserRTotal(uno);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<ReplyVO> list = ldto.GetUserRList(page_no, uno);
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
</style>
<table border="0" align="center" width="1200px">
<form id="clistForm" method="get" action="adminrdelete.jsp">
	<input type="hidden" id="uno" name="uno" value="<%= uno %>">
	<tr>
		<td rowspan="25" width="250px"></td>
		<td colspan="4" height="10px">
			<a href="userRlist.jsp?uno=<%= uno %>"><h2><b><%= vo.getNickname() %> 님이 작성한 댓글 목록</b></h2></a>
		</td>
		<td colspan="3" valign="bottom">
			<a href="javascript:Dodelete();"><div class="dbutton" style="margin-top: 22px">선택삭제</div></a>
		</td>
	</tr>
	<tr>
		<td colspan="5" height="5px">
			<hr>
		</td>
	</tr>
	<tr height="10px">
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo"  value="selectall" onclick='selectAll(this)'>
		</td>
		<td align="center" width="200px">글제목</td>
		<td align="center" width="360px">댓글내용</td>
		<td align="center" width="150px">글쓴이</td>
		<td align="center" width="90px">작성일</td>
	</tr>
	<tr height="10px">
		<td colspan="5">
			<hr>
		</td>
	</tr>
	<%
	if(list.size() == 0)
	{
		%>
		<tr>
			<td align="center" colspan="6">작성된 댓글이 없습니다.</td>
		</tr>
		<%
	}
	
	for(ReplyVO rvo : list)
	{
	%>
	<tr>
		<td align="center" width="10px">
		<input type="checkbox" name="delNo" id="delNo" value="<%= rvo.getNo() %>"  onclick='getCheckedCnt()'>
		</td>
		<td align="left" title="<%= rvo.getTitle() %>">
			<div class="div1">
				<%
					if(rvo.getTitle().length() > 12)
					{
						%>
							<%= rvo.getTitle().substring(0,11) %>...
						<%
					} else
					{
						%><%= rvo.getTitle() %><%
					}
				%>
			</div>
		</td>
		<td align="left"><a href="../community/communityview.jsp?no=<%= rvo.getNo() %>" target="_blank">
			<div class="div2">
				<%
					if(rvo.getRnote().length() > 31)
					{
						%>
							<%= rvo.getRnote().substring(0,30) %>...
						<%
					} else
					{
						%><%= rvo.getRnote() %><%
					}
				%>
			</div></a>
		</td>
		<td align="center"><%= rvo.getNickname() %></td>
		<td align="center"><%= rvo.getRdate() %></td>
	</tr>
	<tr>
		<td colspan="5"><hr></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="5" align="center">
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
					<a href="userRlist.jsp?uno=<%= uno %>&page=<%= startBlock - 1 %>">◀이전</a>
					<%
					
				}
				
				for(int i = startBlock; i <= endBlock; i++)
				{	
					if( i == page_no )
					{
						%>
						<a style="color:red" "href="userRlist.jsp?uno=<%= uno %>&page=<%= i %>"><%= i %></a>&nbsp;
						<%
					}else
					{
						%>
						<a href="userRlist.jsp?uno=<%= uno %>&page=<%= i %>"><%= i %></a>&nbsp;
						<%
					}
				}
				
				//다음블럭 표기
				
				if( endBlock < totalPage)
				{
					%>
					<a href="userRlist.jsp?uno=<%= uno %>&page=<%= endBlock + 1 %>">다음▶</a>
					<%
					
				}
			%>
		</td>
	</tr>
</form>
</table>
<%@ include file="../include/tail.jsp" %> 