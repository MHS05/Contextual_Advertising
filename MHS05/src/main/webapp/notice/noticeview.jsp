<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "N";
String no = request.getParameter("no");
if( no == null || no.equals("") )
{
	response.sendRedirect("noticelist.jsp");
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
		document.location = "noticelist.jsp";
	</script>
	<%
	return;
}
%>
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
		<table border="0" align="center" width="1200px">
			<tr>
				<td rowspan="14" width="20%" height="700px" valign="top"></td>
				<td colspan="5" height="50px"><h2>공지사항</h2></td>
			</tr>
			<tr>
				<td colspan="5" height="20px"><hr></td>
			<tr>
			<tr>
				<td colspan="5" width="100px" height="50px"><h2><%= vo.getTitle() %></h2></td>
			</tr>
			<tr>
				<td height="20px">관리자</td>
				<td width="90px" height="20px"><%= vo.getHit() %>회</td>
				<td height="20px"><%= vo.getWdate() %></td>
			</tr>
			<tr>
				<td colspan="5" height="20px"><hr></td>
			<tr>
			<tr>
				<td colspan="5" heigth="500px" valign="top">
					<%= vo.getNote().replace("\n","<br>\n") %>
				</td>
			</tr>
			<tr>
				<td colspan="5" height="20px"><hr></td>
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
				<td colspan="5" height="20px"><hr></td>
			<tr>
			<tr>
				<td align="center" colspan="3" height="20px">
					<a href="noticelist.jsp?kind=<%= kind %>">
					<input type="button" id="listbutton" value="목록" style="background-color:#4dd5b0;"></a>
				</td>
			</tr>
		</table>
	</body>
<%@ include file="../include/tail.jsp" %> 