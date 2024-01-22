<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "N";
String btitle = "공지사항 게시판";

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = dto.GetTotal(kind,"");

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<CommunityVO> list = dto.GetList(page_no, kind, "");
%>
<table border="0" align="center" width="1200px">
	<tr>
		<td rowspan="26" width="20%" valign="top"></td>
		<td height="50px" colspan="5"><h2>공지사항</h2></td>
	</tr>
	<tr>
		<td colspan="5"><hr></td>
	<tr>
	<tr>
		<td align="center" width="50px">번호</td>
		<td align="center" width="200px">제목</td>
		<td align="center" width="75px">글쓴이</td>
		<td align="center" width="100px">작성일</td>
		<td align="center" width="50px">조회수</td>
	</tr>
	<tr>
		<td colspan="5"><hr></td>
	</tr>
	<%
	int SeqNo = totalData - (page_no - 1) * 10;
	
	for(CommunityVO vo : list)
	{
	%>
	<tr>
		<td align="center"><%= SeqNo-- %></td>
		<td align="left"><a href="noticeview.jsp?kind=<%= kind %>&no=<%= vo.getNo() %>"><div class="div1"">
		<img src="../image/ha.png" style="width:18px; height:18px;">
			<%
			if(vo.getTitle().length() > 50)
			{
				%>
					<%= vo.getTitle().substring(0,35) %>...
				<%
			} else
			{
			%><%= vo.getTitle() %><%
			}
			%>
			</a>
			<%
				if( !vo.getRecount().equals("0"))
				{
					%><span style="padding: 0px 0px; background-color:white; color:#ff6600">(<%= vo.getRecount() %>)</span><%
							
				}			
			%>
			</div></a>
		</td>
		<td align="center">관리자</td>
		<td align="center"><%= vo.getWdate() %></td>
		<td align="center"><%= vo.getHit() %></td>
	</tr>
	<tr>
		<td colspan="5"><hr></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="5" style="text-align:center;">
		<%
		//페이징 5단계 : 시작 블럭 페이지와 종료 블럭 페이지 계산
		//현재 페이지 번호가 16일때 시작 블럭 페이지 : 11 , 종료 블럭 페이지 : 20 으로 계산
		int startBlock = ((page_no-1)/10)*10; //시작 블록 페이지
		startBlock += 1;
		int endBlock = startBlock  + 10 - 1;  //종료 블록 페이지
		if( endBlock > totalPage)
		{
			//종료 블록 페이지가 전체 페이지보다 크면....
		    endBlock = totalPage;
		}		
		
		//페이징 6단계 : 이전  [ 페이지 번호 목록 ] 다음  을 표시한다.
		//이전 블럭 표시하기
		if(startBlock > 10)
		{
			%>
			<a href="noticelist.jsp?kind=<%= kind %>&page=<%= startBlock - 1 %>">이전</a>
			<%					
		}		
		for(int i=startBlock; i <= endBlock; i++)
		{
			if( i == page_no )
			{
				//현재 페이지임
				%><a style="color:red;" href="index.jsp?kind=<%= kind %>&page=<%= i %>"><%= i %></a>&nbsp;<%
			}else
			{
				%><a href="noticelist.jsp?kind=<%= kind %>&page=<%= i %>"><%= i %></a>&nbsp;<%
			}
		}
		
		//다음 블럭 표시하기
		if(endBlock < totalPage)
		{
			%>
			<a href="noticelist.jsp?kind=<%= kind %>&page=<%= endBlock + 1 %>">다음</a>
			<%					
		}		
		%>
		</td>
	</tr>
</table>
<%@ include file="../include/tail.jsp" %>