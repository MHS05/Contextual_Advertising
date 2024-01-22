<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String adno = request.getParameter("adno");
if( adno == null || adno.equals("") )
{
	response.sendRedirect("adlist.jsp");
	return;
}

AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "adlist.jsp";
	</script>
	<%
	return;
}
%>	
<%
if(adno.equals(vo.getAdno())){
%>
	<tr>
		<td colspan="2" ><h1 style="margin-left: 50px"><%=vo.getName() %></h1></td>
	</tr>
	<tr>
		<td rowspan="6" align="center" width="400px" valign="top">
			<img src="adimagedown.jsp?adno=<%= vo.getAdno() %>" width="350px" height="500px">
		</td>
		<td>
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; line-height:50px; text-align: left;">
				상품타입 : <%= vo.getType() %><font style="font-size: large;"></font> <br>
				상품명 : <%= vo.getName() %><br>
				키워드 : <%= vo.getKeywords() %><br>
				게시기간 : <%= vo.getDate_start() %> ~ <%= vo.getDate_end() %>
			</div>
		</td>
	</tr>
<%
}%>
	<tr height="50px">
		<td colspan="3" align="right">
			<a href="admodify.jsp?adno=<%=vo.getAdno()%>"><span id="span2" style="background-color: lightgray;">수정</span></a>
			<a href="addelete.jsp?adno=<%=vo.getAdno()%>"><span id="span2" style="background-color: red;">삭제</span></a>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="3" height="20px">
			<a href="admincategory.jsp?kind=<%= vo.getPtype() %>"><span id="span2">목록</span></a>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 