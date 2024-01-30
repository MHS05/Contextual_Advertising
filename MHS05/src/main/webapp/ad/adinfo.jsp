<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<% 

String adno = request.getParameter("adno");

AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);

ClickAdDTO addto = new ClickAdDTO();
ClickAdVO  advo = addto.Read(adno);
if(advo != null)
{
	ClickAdVO  advo1 = addto.Read(adno);
	
}else
{
	ClickAdVO  advo2  = addto.Read2(adno);
}
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

ListDTO listdto = new ListDTO();

ArrayList<ClickAdVO> list = listdto.getclickadlist(adno);

%>
	<tr>
		<td colspan="2"><h1><%= vo.getAdname() %></h1></td>
	</tr>
	<tr>
		<td height="50px" align="right">
			<a href="admodify.jsp?adno=<%= vo.getAdno() %>"><span id="span1" style="background-color: #4dd5b0;">수정</span></a>
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
			<table border="1" width="800px" height="100px" align="center">
				<tr>
					<td></td>
					<td>날짜</td>
					<td>게시물 제목</td>
				</tr>
				<%
				for(ClickAdVO clickadvo : list)
				{
				%>
				<tr>
					<td><%= clickadvo.getCcount() %></td>
					<td><%= clickadvo.getCdate() %></td>
					<td><%= clickadvo.getTitle() %></td>
				</tr>
				<%
				}
				%>
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