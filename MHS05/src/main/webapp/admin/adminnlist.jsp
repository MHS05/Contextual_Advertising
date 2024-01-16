<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
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
		
		$("#nlistForm").submit();
		
	}
}
</script>
<form id="nlistForm" method="get" action="adminnndelete.jsp">
	<tr>
		<td colspan="6">
			<a href="javascript:Dodelete();"><div class="dbutton" style="background-color:#FD7064;">선택삭제</div></a>
			<a href="adminnwrite.jsp?kind=<%= kind %>">
				<div class="dbutton" style="background-color: #4dd5b0">등록하기</div>
			</a>
			<h2><b>공지사항</b></h2>
			<hr>
		</td>
	</tr>
	<tr>
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo"  value="selectall" onclick='selectAll(this)'>
		</td>
		<td align="center" width="100px">번호</td>
		<td align="center">제목</td>
		<td align="center" width="75px">글쓴이</td>
		<td align="center" width="100px">작성일</td>
		<td align="center" width="50px">조회수</td>
	</tr>
	<tr>
		<td colspan="6"><hr></td>
	</tr>
	<%
	int SeqNo = totalData - (page_no - 1) * 10;
	
	for(CommunityVO vo : list)
	{
	%>
	<tr>
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo" value="<%= vo.getNo() %>" onclick='getCheckedCnt()'>
		</td>
		<td align="center"><%= SeqNo-- %></td>
		<td align="left"><a href="adminnview.jsp?kind=<%= kind %>&no=<%= vo.getNo() %>">
			<div class="div1""><img src="../image/ha.png" style="width:18px; height:18px;">
				<%
				if(vo.getTitle().length() > 50)
				{
					%>
						<%= vo.getTitle().substring(0,49) %>...
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
		<td colspan="6"><hr></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="6" style="text-align:center;">
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
			<a href="adminnlist.jsp?kind=<%= kind %>&page=<%= startBlock - 1 %>">이전</a>
			<%					
		}		
		for(int i=startBlock; i <= endBlock; i++)
		{
			if( i == page_no )
			{
				//현재 페이지임
				%><a style="color:red;" href="adminnlist.jsp?kind=<%= kind %>&page=<%= i %>"><%= i %></a>&nbsp;<%
			}else
			{
				%><a href="adminnlist.jsp?kind=<%= kind %>&page=<%= i %>"><%= i %></a>&nbsp;<%
			}
		}
		
		//다음 블럭 표시하기
		if(endBlock < totalPage)
		{
			%>
			<a href="adminnlist.jsp?kind=<%= kind %>&page=<%= endBlock + 1 %>">다음</a>
			<%					
		}		
		%>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 