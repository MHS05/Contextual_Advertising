<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<style>
#headline
{
	color : #4dd5b0;
	font-family: 'Anton', sans-serif;
	font-size: 30px;
	font-style: oblique;
}

#type  
{
	width : 100px;
	text-align:center;
	padding-top:30px;
	padding-bottom:30px;
	background-color : white;
	border-radius: 15px;
	cursor: pointer;
	float: left;
	margin-right: 15px;
	box-shadow: 1px 3px 5px 3px lightgray;
}
</style>
<tr>
	<td width="100%">
		<table border="0" align="center" width="100%" height="800px" >
			<tr align="center">
				<td colspan="3" width="700px" height="500px"><a href="newsview.jsp"><img style="width:100%px; height:100%px "src="../image/news1.jpg"></a></td>
				<td rowspan="2" valign="top" width="220px" align="right">
					<div style="float: right; width:230px; height:100%px; box-shadow: 0px 3px 3px 3px lightgray; display: ">
						<table style="margin-left: 10px" border="0" align="left" width="210px" height="50px">
							<tr>
								<td height="120px">
									<div><font size="5"><b><u>TOP 10<br>News</u></b></font><br>2024-01-03 10:55 기준</div> 
								</td>
							</tr>
							<%for(int i = 1; i <= 10; i++)
							{
								%>
									<tr height="40px">
										<td style="font-size: 20px;"><a href="category.jsp"><b><%= i %>번째 뉴스</a><br><hr></td>
									</tr>
								<%
							}
							%>
						</table>
					</div>							
				</td>
			</tr>
			<tr>
				<td colspan="3" height="150px" valign="top">
					<span id="headline">Headline News</span><br>
					<font style="font-family: 'Black Han Sans', sans-serif;
							     font-family: 'Noto Sans KR', sans-serif;
							     font-size: xx-large;
							     ">“아침 꼭 드세요”… 달걀·양배추·귀리 먹으면 체중에 변...</font>
				</td>
			</tr>
			<tr>
				<td colspan="4" height="30px" valign="bottom">
					<hr>
				</td>
			</tr>
			<tr>
				<td colspan="4" height="120px" align="center">
					<a href="newslist.jsp"><div id="type" style="margin-left: 125px">다이어트</div></a>
					<a href="newslist.jsp"><div id="type">음식</div></a>
					<a href="newslist.jsp"><div id="type">운동</div></a>
					<a href="newslist.jsp"><div id="type">영양제</div></a>
					<a href="newslist.jsp"><div id="type">남성건강</div></a>
					<a href="newslist.jsp"><div id="type">여성건강</div></a>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table border="0" width="700px" height="300px" align="center">
						<tr>
							<td>
								<a href="newsview.jsp"><img style="width:250px; height:150px" src="../image/news1.jpg"><br>첫번째 부가 기사 제목입니다.</a><br>
								<span style="color:gray">1시간 전</span>
							</td>
							<td></td>
							<td>
								<a href="newsview.jsp"><img style="width:250px; height:150px" src="../image/news1.jpg"><br>첫번째 부가 기사 제목입니다.</a><br>
								<span style="color:gray">1시간 전</span>
							</td>
							<td></td>
							<td>
								<a href="newsview.jsp"><img style="width:250px; height:150px" src="../image/news1.jpg"><br>첫번째 부가 기사 제목입니다.</a><br>
								<span style="color:gray">1시간 전</span>
							</td>		
						</tr>
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						<tr>
							<td colspan="5">
								<table border="0" width="800px" height="100px" align="center">
									<tr>
										<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a><br>
										<span style="color:gray">1시간 전</span></td>
										<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
										<td></td>
										<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a><br>
										<span style="color:gray">1시간 전</span></td>
										<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
										<td></td> 
										<td colspan="2"><hr></td>
									</tr>
									<tr>
										<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a><br>
										<span style="color:gray">1시간 전</span></td>
										<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
										<td></td>
										<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a><br>
										<span style="color:gray">1시간 전</span></td>
										<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
										<td></td> 
										<td colspan="2"><hr></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>
<%@ include file="../admininclude/newstail.jsp" %>