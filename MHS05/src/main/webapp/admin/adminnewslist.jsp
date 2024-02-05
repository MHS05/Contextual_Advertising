<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
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

#delbutton
{	
	width: 80px;
	height:30px;
	background-color:#4dd5b0;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
	position:absolute;
	right: 10px;
	top:0px;
	
	
}
</style>

<tr>
	<td valign="top">
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2>

			<div align="center" id="delbutton"><a href="writenews.jsp?">등록</a></div>
		</div>
		<%
		for(NewsVO vo : list)
		{
		%>
		<div style="border-bottom: 1px solid lightgray; position: relative; height: 145px;">
			<div style="width: 650px;" >
				<div>
					<div style="width:650px;">
						<h3><a href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= vo.getTitle() %></a></h3>
						<div id=note style="height:30px; color: #999999; font-size: 16px;margin: 0px 10px 5px;padding: 10px 10px 10px">
							<% 
								String content = vo.getNote(); 
								String hangulOnly = content.replaceAll("[^가-힝\\s]", "");
								
								if(hangulOnly.length() > 100)
								{
									%>
										<a style="color: #999999;" href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly.substring(16,120) %>...</a>
									<%
								} else
								{
									%><a style="color: #999999;" href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly %></a><%
								}
							%>
						</div>
                        <div style="padding: 20px 0px 0px;font-size: 12px;color: #777777;">
                      		 	<span><time><%= vo.getWdate() %></time></span>
                      	</div>
                    </div>
                </div>
            </div>
            <div style="position:absolute; bottom:15px; right:45px; width:210px; height:130px;" >
            	<a href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><img width="210px" height="130px" src="newsimagedown.jsp?nno=<%= vo.getNno() %>"></a>
            </div>
       	</div>
       	<%
		}
       	%>
	</td>
</tr>
<tr>
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
				<a href="adminnewslist.jsp?category=<%= category %>&page=<%= startBlock - 1 %>">◀이전</a>
				<%
				
			}
			
			for(int i = startBlock; i <= endBlock; i++)
			{	
				if( i == page_no )
				{
					%>
					<a style="color:red" "href="adminnewslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
					<%
				}else
				{
					%>
					<a href="adminnewslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
					<%
				}
			}
			
			//다음블럭 표기
			
			if( endBlock < totalPage)
			{
				%>
				<a href="adminnewslist.jsp?category=<%= category %>&page=<%= endBlock + 1 %>">다음▶</a>
				<%
				
			}
		%>
	</td>
</tr>
</table>	
			</td>
		</tr>
		<tr>
			<td height="80px">
				<div><a href="../admin/adminnewslist.jsp"><h1>건강소식</h1></a></div> 
			</td>
		</tr>
		<tr height="310px">
			<td width="20%" valign="top">
				<div style="width: 220px; height: 310px; box-shadow: 3px 3px 3px 3px lightgray;">
					<table border="0" width="200px" height="50px">
						<tr height="50px">
						<%
						if(category.equals("D"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=D"><b><u>다이어트</u></b></a></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=D"><b>다이어트</b></a></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("F"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F"><b><u>음식</u></b></a></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F"><b>음식</b></a></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("E"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=E"><b><u>운동</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=E"><b>운동</b></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("N"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=N"><b><u>영양제</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=N"><b>영양제</b></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("M"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=M"><b><u>남성건강</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=M"><b>남성건강</b></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("F2"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F2"><b><u>여성건강</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F2"><b>여성건강</b></td>
						<%
						}
						%>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td height="80px">
				<a href="../admin/admincategory.jsp"><h1>카테고리</h1></a>
			</td>
		</tr>
		<tr>
			<td height="80px">
				<a href="../admin/adminclist.jsp"><h1>커뮤니티</h1></a>
			</td>
		</tr>
		<tr>
			<td height="80px">
				<a href="../ad/adlist.jsp"><h1>광고관리</h1></a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			</td>
		</tr>
	</table>
	<br>
	<br>
	<table border="0" width="1200px" align="center" height="150px">
			<tr>
				<td rowspan="5" width="250px" align="center">
					<img style="width:100px; height: 100px;" src="../image/market.png">
				</td>
				<td rowspan="5" width="10px">
				</td>
				<td colspan="2" height="15px" align="right">
					<hr>
				</td>
			</tr>
			<tr>
				<td width="450px">
					상담가능시간
				</td>
				<td>
					회사정보
				</td>
			</tr>
			<tr>
				<td>
					평일 : 오전 09:00 ~ 오후 06:00
				</td>
				<td>
					회사이름 : ezen  |  전화번호 : 010-0000-0000
				</td>
			</tr>
			<tr>
				<td>
					점심시간 : 오후 12:00 ~ 오후 01:00
				</td>
				<td>
					이메일 : asdf@naver.com  |  대한민국 전주시
				</td>
			</tr>
			<tr>
				<td>
					주말 휴무
				</td>
				<td>
					팩스 : 00-000-0000
				</td>
			</tr>
		</table>
	</body>
</html>