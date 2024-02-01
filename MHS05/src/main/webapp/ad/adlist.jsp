<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String ltype = request.getParameter("ltype");
if(ltype == null ) ltype = "num";

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = dto.getadtotal("");

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<AdVO> list = dto.getadlist(page_no,"");

if( ltype.equals("num"))
{
	list = dto.getadlist(page_no, "");
}
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
<form id="nlistForm" method="get" action="addelete.jsp">
	<tr>
		<td colspan="7">
			<a href="javascript:Dodelete();"><div class="dbutton" style="background-color:#FD7064;">선택삭제</div></a>
			<a href="adupload.jsp">
				<div class="dbutton" style="background-color: #4dd5b0">등록하기</div>
			</a>
			<h2><b>광고 게시판</b></h2>
			<hr>
		</td>
	</tr>
	<tr>
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo"  value="selectall" onclick='selectAll(this)'>
		</td>
		<td align="center" width="30px">광고번호</td>
		<td align="center" width="100px">상품이름</td>
		<td align="center" width="50px">키워드</td>
		<td align="center" width="50px">노출횟수</td>
	</tr>
	<tr>
		<td colspan="7"><hr></td>
	</tr>
	<%
	for(AdVO vo : list)
	{
		ClickAdDTO addto = new ClickAdDTO();
		ClickAdVO  advo = addto.Read(vo.getAdno());
		int clickCount = dto.getclickadtotal(vo.getAdno());
	%>
	<tr>
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo" value="<%= vo.getAdno() %>" onclick='getCheckedCnt()'>
		</td>
		<td align="center"><%= vo.getAdno() %></td>
		<td align="center"><a href="adinfo.jsp?adno=<%= vo.getAdno() %>"><%= vo.adname %></a></td>
		<td align="center"><%= vo.adkey %></td>
		<td align="center"><%= clickCount %></td>
	</tr>
	<tr>
		<td colspan="7"><hr></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="7" style="text-align:center;">
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
			<a href="adminnlist.jsp?page=<%= startBlock - 1 %>">이전</a>
			<%					
		}		
		for(int i=startBlock; i <= endBlock; i++)
		{
			if( i == page_no )
			{
				//현재 페이지임
				%><a style="color:red;" href="adminnlist.jsp?page=<%= i %>"><%= i %></a>&nbsp;<%
			}else
			{
				%><a href="adminnlist.jsp?page=<%= i %>"><%= i %></a>&nbsp;<%
			}
		}
		//다음 블럭 표시하기
		if(endBlock < totalPage)
		{
			%>
			<a href="adminnlist.jsp?page=<%= endBlock + 1 %>">다음</a>
			<%					
		}		
		%>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 