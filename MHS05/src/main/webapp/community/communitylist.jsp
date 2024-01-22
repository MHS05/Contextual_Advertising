<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
String kind = request.getParameter("kind");
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
<style>
	.submenu
	{
	font-size: 20px;
	}
	
	#writebutton
	{	
		width:100px;
		height:30px; 
		font-size:15px;
		cursor:pointer;
		background-color:lightgray;
		border:0;
		border-radius: 5px;
	}
	
	.div1
	{	
		width:400px;
		overflow: hidden;
		text-overflow:clip;
	    text-overflow:ellipsis;
	}

</style>
		<table border="0" align="center" width="1200px">
			<tr>
				<td rowspan="26" width="20%" valign="top">
					<div><a href="communitylist.jsp"><h1><u>커뮤니티</u></h1></a></div> 
					<div style="width: 220px; height: 300px; box-shadow: 3px 3px 3px 3px lightgray;">
						<table border="0" align="left" width="200px" height="50px">
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/free.png">
								<a href="communitylist.jsp?kind=F" >
								<%
								if(kind.equals("F")){
								%>
								<b><u>자유게시판</u></b></a></td><%
								}else{
								%>
								<b>자유게시판</b></a></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/ty.png">
								<a href="communitylist.jsp?kind=TY">
								<%
								if(kind.equals("TY")){
								%>
								<b><u>태양인게시판</u></b></a></td><%
								}else{
								%>
								<b>태양인게시판</b></a></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/te.png">
								<a href="communitylist.jsp?kind=TE">
								<%
								if(kind.equals("TE")){
								%>
								<b><u>태음인게시판</u></b></a></td><%
								}else{
								%>
								<b>태음인게시판</b></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/sy.png">
								<a href="communitylist.jsp?kind=SY">
								<%
								if(kind.equals("SY")){
								%>
								<b><u>소양인게시판</u></b></a></td><%
								}else{
								%>
								<b>소양인게시판</b></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/se.png">
								<a href="communitylist.jsp?kind=SE">
								<%
								if(kind.equals("SE")){
								%>
								<b><u>소음인게시판</u></b></a></td><%
								}else{
								%>
								<b>소음인게시판</b></td><%
								}%>
							</tr>
						</table>
					</div>
				</td>
				<td height="50px" colspan="4"><a href="communitylist.jsp?kind=<%= kind %>"><h2><%= btitle %></h2></td>
				<td align="center" width="100px" valign="bottom">
					<%
					if(loginVO != null)
					{
						%><a href="communitywrite.jsp?kind=<%= kind %>&uno=<%= loginVO.getUno() %>"><input type="button" id="writebutton" value="글쓰기"></a><%
					}
					%>	
				</td>
			</tr>
			<tr height="10px">
				<td colspan="5"><hr></td>
			<tr>
			<tr height="25px">
				<td align="center" width="120px">번호</td>
				<td align="center" >제목</td>
				<td align="center" width="120px">글쓴이</td>
				<td align="center" width="150px">작성일</td>
				<td align="center">조회수</td>
			</tr>
			<tr height="10px">
				<td colspan="5"><hr></td>
			</tr>
			<%
			for(CommunityVO vo : list)
			{
			%>
				<tr height="25px">
					<td align="center"><%= vo.getNo() %></td>
					<td align="left"><a href="communityview.jsp?kind=<%= kind %>&no=<%= vo.getNo() %>&page=<%= page_no %>"><div class="div1"">
						<%
						if(vo.getTitle().length() > 36)
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
							if( vo.getImage() == null || vo.getImage().equals(""))
							{
								
							} else
							{
								
								%>
									<span style="padding: 0px 0px; background-color:white; color:#ff6600">
									<img src="../image/image.png" style="width: 15px; height: 15px;"></span>
								<%
							}
						%>
						<%
							if( !vo.getRecount().equals("0"))
							{
								%><span style="padding: 0px 0px; background-color:white; color:#ff6600">(<%= vo.getRecount() %>)</span><%
										
							}			
						%>
						</div></a>
					</td>
					<td align="center"><%= vo.getNickname() %></td>
					<td align="center"><%= vo.getWdate() %></td>
					<td align="center"><%= vo.getHit() %></td>
				</tr>
				<tr height="10px">
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
							<a href="communitylist.jsp?kind=<%= kind %>&page=<%= startBlock - 1 %>">◀이전</a>
							<%
							
						}
						
						for(int i = startBlock; i <= endBlock; i++)
						{	
							if( i == page_no )
							{
								%>
								<a style="color:red" "href="communitylist.jsp?kind=<%= kind %>&page=<%= i %>"><%= i %></a>&nbsp;
								<%
							}else
							{
								%>
								<a href="communitylist.jsp?kind=<%= kind %>&page=<%= i %>"><%= i %></a>&nbsp;
								<%
							}
						}
						
						//다음블럭 표기
						
						if( endBlock < totalPage)
						{
							%>
							<a href="communitylist.jsp?kind=<%= kind %>&page=<%= endBlock + 1 %>">다음▶</a>
							<%
							
						}
					%>
				</td>
			</tr>
		</table>
	</body>
<%@ include file="../include/tail.jsp" %>