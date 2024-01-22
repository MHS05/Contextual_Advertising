<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "N";
String no = request.getParameter("no");
if( no == null || no.equals("") )
{
	response.sendRedirect("adminnlist.jsp");
	return;
}

CommunityDTO dto = new CommunityDTO();
CommunityVO  vo  = dto.Read(no, true);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "adminnlist.jsp";
	</script>
	<%
	return;
}
%>
<script>
function DoDelete()
{
	if( confirm("해당 게시물을 삭제 하시겠습니까?") == 0)
	{
		return;	
	}
	document.location = "adminndelete.jsp?kind=<%=kind %>&no=<%= no %>";
}
</script>
<style>
	#listbutton
	{	
		width:100px;
		height:30px; 
		font-size:15px;
		cursor:pointer;
		background-color:#4dd5b0;
		border:0;
		border-radius: 5px;
	}
</style>
						<tr>
							<td colspan="3">
								<h2><b>공지사항</b></h2>
								<hr>
							</td>
						</tr>
						<tr>
							<td colspan="3" width="100px" height="50px"><h2><%= vo.getTitle() %></h2></td>
						</tr>
						<tr>
							<td height="20px">관리자</td>
							<td width="100px" height="20px">조회수 : <%= vo.getHit() %>회</td>
							<td height="20px">작성일 : <%= vo.getWdate() %></td>
						</tr>
						<tr>
							<td colspan="3" height="20px"><hr></td>
						<tr>
						<tr height="300px">
							<td colspan="3"  valign="top">
							<%
							if( vo.getImage() != null && !vo.getImage().equals("") )
							{
								%>
									<img style="width:40%;height:40%;" src="imagedown.jsp?no=<%= no %>"><br>
									<%= vo.getNote().replace("\n","<br>\n") %>	
								<%
							}else
							{
								%>
									<%= vo.getNote().replace("\n","<br>\n") %>
								<%
							}
							%>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="3" height="20px">
							<%
							if(loginVO != null && loginVO.getId().equals(vo.getId()))
							{
								%>
								<a href="adminnmodify.jsp?no=<%= no %>"><span id="span2" style="background-color: lightgray;">수정</span></a>
								<a href="javascript:DoDelete();"><span id="span2" style="background-color: lightgray;">삭제</span></a>
								<%
							}
							%>
							</td>
						</tr>
						<tr>
							<td colspan="3" height="20px"><hr></td>
						<tr>
						<tr>
							<td width="70px" height="20px">첨부파일:</td>
							<td colspan="2" height="20px">
							<%
							if( vo.getFname() != null && !vo.getFname().equals("") )
							{
								%><a href="down.jsp?no=<%= no %>"><%= vo.getFname() %></a><%
							}else
							{
								%>등록된 첨부파일이 없습니다.<%
							}
							%>
							</td>
						</tr>
						<tr>
							<td colspan="3" height="20px"><hr></td>
						<tr>
						<tr>
							<td align="center" colspan="3" height="20px">
								<a href="adminnlist.jsp?kind=<%= kind %>">
									<input type="button" id="listbutton" value="목록" style="background-color:#4dd5b0;">
								</a>
							</td>
						</tr>
<%@ include file="../admininclude/tail.jsp" %> 