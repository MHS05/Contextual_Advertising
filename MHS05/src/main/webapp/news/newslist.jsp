<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<% 
String category = request.getParameter("category");
if(category == null) category = "D";
String ntitle = "다이어트";
if(category.equals("F"))
{
	ntitle = "음식";
}
if(category.equals("E"))
{
	ntitle = "운동";
}
if(category.equals("N"))
{
	ntitle = "영양제";
}
if(category.equals("M"))
{
	ntitle = "남성건강";
}
if(category.equals("F2"))
{
	ntitle = "여성건강";
}

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = dto.getnewstotal(category,"");

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<NewsVO> list = dto.getnewslist(page_no, category, "");
%>
<style>
.submenu
{
	font-size: 20px;
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
								<td class="submenu">
									<image width="30px" height="30px" src="../image/diet.png">
									<a href="../news/newslist.jsp?category=D">
									<%
									if(category.equals("D"))
									{
									%>
										<b><u>다이어트</u></b></a></td>
									<%
									}else
									{
									%>
										<b>다이어트</b></a></td>
									<%
									}
									%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/food.png">
									<a href="../news/newslist.jsp?category=F">
								<%
								if(category.equals("F"))
								{
								%>
									<b><u>음식</u></b></a></td>
								<%
								}else
								{
								%>
									<b>음식</b></a></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/excercise.png">
									<a href="../news/newslist.jsp?category=E">
								<%
								if(category.equals("E"))
								{
								%>
									<b><u>운동</u></b></td>
								<%
								}else
								{
								%>
									<b>운동</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/nutrition.png">
									<a href="../news/newslist.jsp?category=N">
								<%
								if(category.equals("N"))
								{
								%>
									<b><u>영양제</u></b></td>
								<%
								}else
								{
								%>
									<b>영양제</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/man.png">
									<a href="../news/newslist.jsp?category=M">
								<%
								if(category.equals("M"))
								{
								%>
									<b><u>남성건강</u></b></td>
								<%
								}else
								{
								%>
									<b>남성건강</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/woman.png">
									<a href="../news/newslist.jsp?category=F2">
								<%
								if(category.equals("F2"))
								{
								%>
									<b><u>여성건강</u></b></td>
								<%
								}else
								{
								%>
									<b>여성건강</b></td>
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
					<div style="border-bottom: 1px solid lightgray; "><h2><%= ntitle %></h2></div>
					<%
					for(NewsVO vo : list)
					{
					%>
					<div style="border-bottom: 1px solid lightgray; position: relative;">
						<div style="width: 650px;" >
							<div>
								<div style="width:650px;">
									<h2><a href="../news/newsview.jsp?nno=<%= vo.getNno() %>&category=<%=category %>"><%= vo.getTitle() %></a></h2>
									<div style="color: #999999; font-size: 16px;margin: 10px 0px 0px;padding: 0px 0px 10px;">
										<% 
											String content = vo.getNote(); 
											String hangulOnly = content.replaceAll("[^가-힝\\s]", "");
											
											if(hangulOnly.length() > 100)
											{
												%>
													<a style="color: #999999;" href="../news/newsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly.substring(16,120) %>...</a>
												<%
											} else
											{
												%><a style="color: #999999;" href="../news/newsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly %></a><%
											}
										%>
	                           		 </div>
		                            <div style="padding: 20px 0px 0px;font-size: 12px;color: #777777;">
		                           		 	<span><time><%= vo.getWdate() %></time></span>
		                           	</div>
		                       	</div>
	                       	</div>
	                    </div>
	                    <div style="background-color : white; position:absolute; bottom:15px; right:45px; width:210px; height:130px;" >
	                    	<a href="../news/newsview.jsp?nno=<%= vo.getNno() %>">
	                    		<img width="210px" height="130px" src="../admin/newsimagedown.jsp?nno=<%= vo.getNno() %>">
                    		</a>
	                    </div>
                    </div>
                    <%
					}
                   	%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				</td>
				<td align="center">
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
							<a href="newslist.jsp?category=<%= category %>&page=<%= startBlock - 1 %>">◀이전</a>
							<%
							
						}
						
						for(int i = startBlock; i <= endBlock; i++)
						{	
							if( i == page_no )
							{
								%>
								<a style="color:red" "href="newslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
								<%
							}else
							{
								%>
								<a href="newslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
								<%
							}
						}
						
						//다음블럭 표기
						
						if( endBlock < totalPage)
						{
							%>
							<a href="newslist.jsp?category=<%= category %>&page=<%= endBlock + 1 %>">다음▶</a>
							<%
						}
					%>
				</td>
			</tr>
	</table>
<%@ include file="../include/tail.jsp" %>