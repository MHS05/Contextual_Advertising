<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "V"; 
String pno = request.getParameter("pno");
if( pno == null || pno.equals("") )
{
	response.sendRedirect("category.jsp");
	return;
}

String ptitle = "채소";	//vegetable
if(kind.equals("F")) 		
{
	ptitle = "과일"; 		//fruit
}
if(kind.equals("H"))		
{
	ptitle = "건강식품"; 	//healthfood
}
if(kind.equals("S"))		 
{
	ptitle = "수산";		//seafood
}
if(kind.equals("M"))		 
{
	ptitle = "정육";		//meat
}
CategoryDTO dto = new CategoryDTO();
CategoryVO  vo  = dto.Read(pno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "category.jsp";
	</script>
	<%
	return;
}
%>
<style>
	.submenu
	{
	font-size: 20px;
	}
	
	#button
	{
	}
</style>
<script>

function GoBack()
{
	 history.back();
}

</script>
		<table border="0" align="center" width="1200px" height="1000px">
			<tr>
				<td height="60px">
					<div><a href="category.jsp"><font style="font-size: xx-large; font-weight: bold;"><u>카테고리</u></font></a></div> 
				</td>
				<td colspan="2"><font style="margin-left:50px; font-size: xx-large; font-weight: bold;"><%=vo.getPname() %></u></font></td>
			</tr>
			<tr>
				<td rowspan="10" width="20%" valign="top">
					<div style="width: 220px; height: 300px; box-shadow: 3px 3px 3px 3px lightgray;"> 
						<table border="0" align="left" width="200px" height="50px">
							<tr height="50px">
							<td class="submenu">
							<image width="30px" height="30px" src="../image/vegetable.png">
							<a href="category.jsp?kind=V">
							<%
							if(kind.equals("V")){
							%>
							<b><u>채소</u></b>&nbsp;</a></td><%
							}else{
							%>
							<b>채소</b></a></td><%
							}%>
						</tr>
						<tr height="50px">
							<td class="submenu">
								<image width="30px" height="30px" src="../image/fruit.png">
								<a href="category.jsp?kind=F">
								<%
								if(kind.equals("F")){
								%>
								<b><u>과일</u></b></a></td><%
								}else{
								%>
								<b>과일</b></a></td><%
								}%>
						</tr>
						<tr height="50px">
							<td class="submenu">
								<image width="30px" height="30px" src="../image/health.png">
								<a href="category.jsp?kind=H">
								<%
								if(kind.equals("H")){
								%>
								<b><u>건강식품</u></b></td><%
								}else{
								%>
								<b>건강식품</b></a></td><%
								}%>
						</tr>
						<tr height="50px">
							<td class="submenu">
								<image width="30px" height="30px" src="../image/fish.png">
								<a href="category.jsp?kind=S">
								<%
								if(kind.equals("S")){
								%>
								<b><u>수산</u></b></td><%
								}else{
								%>
								<b>수산</b></a></td><%
								}%>
						</tr>
						<tr height="50px">
							<td class="submenu">
								<image width="30px" height="30px" src="../image/meat.png">
								<a href="category.jsp?kind=M">
								<%
								if(kind.equals("M")){
								%>
								<b><u>정육</u></b></td><%
								}else{
								%>
								<b>정육</b></a></td><%
								}%>
						</tr>
						</table>
					</div>
				</td>
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
				<td><h2>1.기본정보</h2></td>
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
				<a href=<%=vo.getLink() %> target="_blank" style="font-size:20px;">
				<u>Go to the link 마켓컬리</u></a>
				</td>
			</tr>
			<tr>
				<td colspan="3" height="50px">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<a href="javascript:GoBack();"><span id="span2">목록</span></a>
				</td>
			</tr>
		</table>
<%@ include file="../include/tail.jsp" %> 