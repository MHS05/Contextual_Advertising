<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<% 
String adno = request.getParameter("adno");

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO listdto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = listdto.getclickadtotal(adno);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

NewsDTO newdto = new NewsDTO();
AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 광고를 조회 할 수 없습니다.");
		document.location = "adlist.jsp";
	</script>
	<%
	return;
}

ArrayList<ClickAdVO> list = listdto.getclickadlist(adno,page_no);

%>
	<tr>
		<td colspan="2">
			<font style="font-size: xx-large; font-weight: 800;"><%= vo.getAdname() %></font>
			<a href="admodify.jsp?adno=<%= vo.getAdno() %>">
				<span id="modspan" style="background-color: #4dd5b0;">수정</span>
			</a>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td align="center" width="650px" valign="top">
			<img src="../admin/adimagedown.jsp?adno=<%= adno %>" width="800px" height="140px">
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; text-align: left;">
				<h4>1. 키워드</h4>
				<font style="font-size: 20px"><b><%= vo.getAdkey() %></b></font><br>
			</div>
		</td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td>
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; text-align: left;">
				<h4>2.노출정보</h4>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table border="1" width="800px" align="center" style="border-collapse: collapse; ">
				<tr height="40px">
					<td width="50px" align="center">횟수</td>
					<td width="200px" align="center">날짜</td>
					<td align="center">게시물 제목</td>
				</tr>
				<%
				
				int SeqNo = listdto.getclickadtotal(adno) - (page_no - 1) * 10;
				
				for(ClickAdVO clickadvo : list)
				{
					NewsVO newsvo = newdto.Read(clickadvo.getNno());
				%>
				<tr height="30px">
					<td align="center"><%= SeqNo-- %></td>
					<td><%= clickadvo.getCdate() %></td>
					<td><a href="../admin/adminnewsview.jsp?nno=<%= clickadvo.getNno() %>"><%= newsvo.getTitle() %></a></td>
				</tr>
				<%
				}
				%>
			</table>
			<table border="0" width="800px" align="center">
				<tr>
					<td align="center">
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
								<a href="adinfo.jsp?adno=<%= adno %>&page=<%= startBlock - 1 %>">이전</a>
								<%					
							}		
							for(int i=startBlock; i <= endBlock; i++)
							{
								if( i == page_no )
								{
									//현재 페이지임
									%><a style="color:red;" href="adinfo.jsp?adno=<%= adno %>&page=<%= i %>"><%= i %></a>&nbsp;<%
								}else
								{
									%><a href="adinfo.jsp?adno=<%= adno %>&page=<%= i %>"><%= i %></a>&nbsp;<%
								}
							}
							
							//다음 블럭 표시하기
							if(endBlock < totalPage)
							{
								%>
								<a href="adinfo.jsp?adno=<%= adno %>&page=<%= endBlock + 1 %>">다음</a>
								<%					
							}		
						%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td align="center" colspan="3" height="20px">
			<a href="adlist.jsp"><span id="span2">목록</span></a>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 