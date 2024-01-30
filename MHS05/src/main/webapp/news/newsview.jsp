<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
String category = request.getParameter("category");
if(category == null) category = "D";
String htitle = "다이어트";
if(category.equals("F"))
{
	htitle = "음식";
}
if(category.equals("E"))
{
	htitle = "운동";
}
if(category.equals("N"))
{
	htitle = "영양제";
}
if(category.equals("M"))
{
	htitle = "남성건강";
}
if(category.equals("F2"))
{
	htitle = "여성건강";
}

String nno = request.getParameter("nno");

NewsDTO dto = new NewsDTO();
NewsVO  vo  = dto.Read(nno);

if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "newslist.jsp";
	</script>
	<%
	return;
}
%>
<style>
#newstitle
{
	margin-left: 15px;
}


#newsimage
{
	text-align: center;	
}

#adimage
{	
	margin-top : 20px;
	text-align:center;
}

#newsnote
{	
	width: 750px;
	font-size : large;
	margin: auto;
}

#listbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
}

#fixed 
{
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 100px;
	padding: 5px;
	color: white;
}
</style>
<div id="fixed" style="width:50px; height: 50px;">
	<a href="#top"><img style="width:50px; height: 50px;" src="../image/topbutton.png"></a>
</div>
<table border="0" align="center" width="1200px">
	<tr>
		<td width="200px" valign="top" >		
			<div><a href="news.jsp"><h1><u>건강소식</u></h1></a></div> 	
			<div style="width:220px; height:360px; box-shadow: 3px 3px 3px 3px lightgray">
				<table border="0" align="left" width="200px" height="50px">
					<tr height="50px">
						<%
						if(category.equals("D"))
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=D"><b><u>다이어트</u></b></a></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=D"><b>다이어트</b></a></td>
						<%
						}
						%>
					</tr>
					<tr height="50px">
						<%
						if(category.equals("F"))
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=F"><b><u>음식</u></b></a></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=F"><b>음식</b></a></td>
						<%
						}
						%>
					</tr>
					<tr height="50px">
						<%
						if(category.equals("E"))
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=E"><b><u>운동</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=E"><b>운동</b></td>
						<%
						}
						%>
					</tr>
					<tr height="50px">
						<%
						if(category.equals("N"))
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=N"><b><u>영양제</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=N"><b>영양제</b></td>
						<%
						}
						%>
					</tr>
					<tr height="50px">
						<%
						if(category.equals("M"))
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=M"><b><u>남성건강</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=M"><b>남성건강</b></td>
						<%
						}
						%>
					</tr>
					<tr height="50px">
						<%
						if(category.equals("F2"))
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=F2"><b><u>여성건강</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../news/newslist.jsp?category=F2"><b>여성건강</b></td>
						<%
						}
						%>
					</tr>
					<tr height="50px">
						<td></td>
					</tr>
				</table>
			</div>
		</td>
		<td width="20px">
		</td>
		<td valign="top">
			<div style="border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2></div>
			<div id="newstitle"><h2><%= vo.getTitle() %></h2>
				<span><font color="gray" size="2px"><%= vo.getWdate() %></time></font></span><br>
				<span>관리자</span>
			</div>
			<div style="height:50px"></div>
			<div id="newsimage">
				<img src="../admin/newsimagedown.jsp?nno=<%= nno %>">
			</div>
			<%
			if(vo.getEmotion().equals("부정"))
			{
			%>
				<div id="adimage">X</div>
			<%
			}else
			{	
				if( vo.getAdno().equals("N") || vo.getAdno().equals(""))
				{
					%>
					<div id="adimage">X</div>
					<%
					
				} else 
				{
					String adno =  vo.getAdno();
					AdDTO addto = new AdDTO();
					AdVO advo = addto.Read(adno);
					%>
					<div id="adimage">
						<a href="../highchart/highchart01.jsp?nno=<%= vo.getNno() %>" target="_blank">
							<img width="800px" height="140px" src="../admin/adimagedown.jsp?adno=<%= adno %>">
						</a>
					</div>
					<%
				}
			}
			%>
			<div style="height:50px"></div>
			<div id="newsmain" style="">
				<div id="newsnote">
					<%= vo.getNote() %>
				</div>
			</div>
			<div style="height: 20px"></div>
			<div style="text-align: center;">
				<a href="newslist.jsp"><div id="listbutton">목록</div></a>
			</div>
		</td>
	</tr>
</table>
<%@ include file="../include/tail.jsp" %>