<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String pno = request.getParameter("pno");
if( pno == null || pno.equals("") )
{
	response.sendRedirect("admincategory.jsp");
	return;
}

CategoryDTO dto = new CategoryDTO();
CategoryVO  vo  = dto.Read(pno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "admincategory.jsp";
	</script>
	<%
	return;
}
%>	
<%
if(pno.equals(vo.getPno())){
%>
	<tr>
		<td colspan="2" ><h1 style="margin-left: 50px"><%=vo.getPname() %></h1></td>
	</tr>
	<tr>
		<td rowspan="6" align="center" width="400px" valign="top">
			<img src="categoryimagedown.jsp?pno=<%= vo.getPno() %>" width="350px" height="500px">
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; line-height:50px; text-align: left;">
				칼로리 : <%= vo.getCalorie() %> Kcal <font style="font-size: large;">(100g 당)</font> <br>
				<%
				
				if( !vo.getPtype().equals("M"))
				{
					if( Integer.parseInt(vo.getMonth_start()) <= 12)
					{
					%>
					제철 : <%= vo.getMonth_start() %>월 ~ <%= vo.getMonth_end() %>월까지 <br> <%
					}
					%>
					체질 : <%= vo.getPcon() %><br>
					성별 : <%= vo.getPgender() %><br>
					연령 : <%= vo.getTag_age() %> <%
				}
				%>
			</div>
		</td>
		<td><h2>1.기본정보 및 효능</h2></td>
	</tr>
	<tr>
		<td style="height:200px"><b><%=vo.getInfo().replace("\n", "<br>\n") %></b></td>
	</tr>
	<tr>
		<td><h2>2.섭취정보</h2></td>
	</tr>
	<tr>
		<td style="height:200px"><b><%=vo.getTakeinfo().replace("\n", "<br>\n") %></b></td>
	</tr>
	<tr>
		<td><h2>3.구매링크</h2></td>
	</tr>
	<tr>
		<td height="100px">
		<a href="<%=vo.getLink() %>" target="_blank" style="font-size:20px;">
		<u>Go to the link 마켓컬리</u></a>
		</td>
	</tr>
<%
}%>
	<tr height="50px">
		<td colspan="3" align="right">
			<a href="adminProudctModify.jsp?pno=<%=pno%>"><span id="span2" style="background-color: lightgray;">수정</span></a>
			<a href="adminProductDelete.jsp?pno=<%=pno%>"><span id="span2" style="background-color: red;">삭제</span></a>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="3" height="20px">
			<a href="admincategory.jsp?kind=<%= vo.getPtype() %>"><span id="span2">목록</span></a>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 