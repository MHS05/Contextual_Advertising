<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<style>
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
	<table border="0" align="center" width="1200px">
			<tr>
				<td rowspan="3" width="200px" valign="top" >		
					<div><a href="news.jsp"><h1><u>건강소식</u></h1></a></div> 	
					<div style="width:220px; height:360px; box-shadow: 3px 3px 3px 3px lightgray">
						<table border="0" align="left" width="200px" height="50px">
							<tr height="50px">
								<td style="font-size: 20px;"><a href="category.jsp"><b>다이어트</b></a></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="category.jsp"><b><u>음식</u></b></a></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="category.jsp"><b>운동</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="category.jsp"><b>영양제</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="category.jsp"><b>남성건강</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="category.jsp"><b>여성건강</b></td>
							</tr>
							<tr height="50px">
								<td></td>
							</tr>
						</table>
					</div>
				</td>	
			</tr>
			<tr>
				<td valign="top" colspan="2">
					<table border="1" align="center" width="100%" height="800px" >
						<tr align="center">
							<td colspan="3"><a href="newsview.jsp"><img style="width:700px; height:450px "src="../image/news1.jpg"></a></td>
							<td rowspan="4" valign="top" width="220px" align="right">
								<div style="float: right; width:230px; height:820px; box-shadow: 0px 3px 3px 3px lightgray; display: ">
									<table style="margin-left: 10px" border="0" align="left" width="210px" height="50px">
										<tr>
											<td height="150px">
												<div><font size="5"><b><u>TOP 10<br>News</u></b></font><br>2024-01-03 10:55 기준</div> 
											</td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>1번째 뉴스</a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>2번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>3번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>4번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>5번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>6번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>7번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>8번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>9번째 뉴스</b></a><br><hr></td>
										</tr>
										<tr height="65px">
											<td style="font-size: 20px;"><a href="category.jsp"><b>10번째 뉴스</b></a><br><hr></td>
										</tr>
									</table>
								</div>							
							</td>
						</tr>
						<tr>
							<td colspan="3" height="100px"><h2>“아침 꼭 드세요”… 달걀·양배추·귀리 먹으면 체중에 변화?</h2></td>
						</tr>
						<tr>
							<td rowspan="2" align="center" valign="top"><a href="newsview.jsp"><img style="width:95%; height:85%" src="../image/news1.jpg"></a></td>
							<td rowspan="2" align="center" valign="top"><a href="newsview.jsp"><img style="width:95%; height:85%" src="../image/news1.jpg"></a></td>
							<td rowspan="2" align="center" valign="top"><a href="newsview.jsp"><img style="width:95%; height:85%" src="../image/news1.jpg"></a></td>
						</tr>
						<tr>
							<td style="display:none">
							</td>
						</tr>
						<tr>
							<td width="800px" height="150px" colspan="4" align="center" valign="middle">
								<img style="width:90%; height:100% "src="../image/news2.png">
							</td>
						</tr>
						<tr>
							<td colspan="4" height="100px" align="center">
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
										<td><a href="newsview.jsp"><img style="width:250px; height:150px" src="../image/news1.jpg"><br>첫번째 부가 기사 제목입니다.</a></td>
										<td></td>
										<td><a href="newsview.jsp"><img style="width:250px; height:150px" src="../image/news1.jpg"><br>첫번째 부가 기사 제목입니다.</a></td>
										<td></td>
										<td><a href="newsview.jsp"><img style="width:250px; height:150px" src="../image/news1.jpg"><br>첫번째 부가 기사 제목입니다.</a></td>		
									</tr>
									<tr>
										<td colspan="5"><hr></td>
									</tr>
									<tr>
										<td colspan="5">
											<table border="0" width="800px" height="100px" align="center">
												<tr>
													<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a></td>
													<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
													<td></td>
													<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a></td>
													<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
												</tr>
												<tr>
													<td colspan="2"><hr></td>
													<td></td> 
													<td colspan="2"><hr></td>
												</tr>
												<tr>
													<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a></td>
													<td><a href="newsview.jsp"><img style="width:100px; height:60px" src="../image/news1.jpg"></a></td>
													<td></td>
													<td><a href="newsview.jsp">첫번째 부가 기사 제목입니다.</a></td>
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
	</table>
<%@ include file="../include/tail.jsp" %>