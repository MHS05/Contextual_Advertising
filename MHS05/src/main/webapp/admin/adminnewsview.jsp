<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
if( loginVO == null)
{	
	//로그인 하지 않은 경우 처리
	response.sendRedirect("../main/index.jsp");
	return;
}
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
String page_no = request.getParameter("page");
if(page_no == null || page_no.equals("")) page_no = "";

NewsDTO dto = new NewsDTO();
NewsVO  vo  = dto.Read(nno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "adminnewslist.jsp";
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

#delbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
	position:absolute;
	right: 10px;
	top:0px;
}

#modbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
	position:absolute;
	right: 100px;
	top:0px;
}
.del
{
	border: 0;
	background-color:lightgray;
	font-size: 16px;
	cursor: pointer;
}
</style>
<script>
	function del()
	{
		if(confirm("뉴스를 삭제하시겠습니까?") == false)
		{
			return;	
		}else 
		{
			$.ajax({
				type : "post",
				url: "newsdelok.jsp",
				data :
				{	
					nno : <%= vo.getNno() %>,
				},		
				dataType : "html",	
				success : function(data) 
				{
					data = data.trim();
					alert("뉴스가 삭제되었습니다.");
					document.location = "adminnewslist.jsp";
				}				
			});
		}
	}
</script>
<tr>
	<td valign="top">
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2>
			<div align="center" id="modbutton"><a href="../admin/modifynews.jsp">수정</a></div>
			<div align="center" id="delbutton"><input type="button" class="del" id="del" value="삭제" onclick="del()"></div>
		</div>
		<div id="newstitle"><h2><%= vo.getTitle() %></h2>
			<span><font color="gray" size="2px">입력&nbsp;<time><%= vo.getWdate() %></time></font></span><br>
			<span><%= loginVO.getName() %></span>
		</div>
		<div style="height:50px"></div>
		<div id="newsimage">
			<img style="width:100%;height:100%;" src="newsimagedown.jsp?nno=<%= nno %>">
		</div>
		<%
		if(vo.getEmotion().equals("부정"))
		{
		%>
		<div id="adimage">
		</div>
		<%
		}else
		{	
			String adno = vo.getAdno();
			AdDTO addto = new AdDTO();
			AdVO advo = addto.Read(adno);
		%>
		<div id="adimage">
			<a href="../highchart/highchart01.jsp" target="_blank"><img width="800px" height="140px" src="../image/ad.jpg"></a>
		</div>
		<%
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
			<a href="adminnewslist.jsp"><div id="listbutton">목록</div></a>
		</div>
	</td>
</tr>
</table>	
				</td>
			</tr>
			<tr>
				<td height="80px">
					<div><a href="../admin/adminnews.jsp"><h1>건강소식</h1></a></div> 
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
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b><u>다이어트</u></b></a></td>
							<%
							}else
							{
							%>
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>다이어트</b></a></td>
							<%
							}
							%>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>음식</b></a></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>운동</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>영양제</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>남성건강</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>여성건강</b></td>
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