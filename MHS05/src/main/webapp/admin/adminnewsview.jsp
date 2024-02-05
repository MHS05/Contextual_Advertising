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

ListDTO listdto = new ListDTO();
String adno = "";

ArrayList<AdVO> adlist = listdto.getAdList(nno);
if( adlist.size() == 0)
{
	adno = "";
} else 
{
	
	Collections.shuffle(adlist);
	adno = adlist.get(0).getAdno();
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
	margin : 20px;
	padding : 20px;
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
#yes_btn
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	border-radius: 12px;
	cursor: pointer;
	font-size:18px;
	border: none;
}
#no_btn
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	border-radius: 12px;
	cursor: pointer;
	font-size:18px;
	border: none;
}
.del
{
	border: 0;
	background-color:lightgray;
	font-size: 16px;
	cursor: pointer;
}
.icon
{
	position:absolute;
	right:432px;
	margin-top:5px;
}

#ad {
    display: block; /* 초기에는 보이게 설정 */
}

#confirm-btn {
    display: none; /* 초기에는 숨김 */
    text-align:center;
    margin-left:50px;
    font-size:20px;
    position:relative;
    top:50px;
}

#ad2
{	
	left:660px;
    position:absolute;
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
	
	function openreason() 
	{
		//로그인 팝업창 가운데에 띄우기
		var _width = '1200';
		var _height = '1000';
			
		var _left = Math.ceil((window.screen.width - _width )/2);
		var _top = Math.ceil((window.screen.height - _height )/2);
		
		window.open('../highchart/highchart01.jsp?nno=<%= vo.getNno() %>&adno=<%= adno %>', '', 'width=1200, height=1000, left=' + _left +', top=' + (_top - 250)); return false;
		
	}
	
// X 버튼 클릭 시 이벤트 처리
	function cancel() 
	{
		document.getElementById('ad').style.display = 'none';
		document.getElementById('ad2').style.display = '';
		document.getElementById('icon').style.display = 'none';
		document.getElementById('confirm-btn').style.display = 'block';
	};
	
	function adnone()
	{
		$("#adimage").css("display","none");
	}
	
	function adview()
	{	
		$("#ad2").css("display","none");
		$("#confirm-btn").css("display","none");
		$("#ad").css("display","");
		$("#icon").css("display","");
	}
</script>
<tr>
	<td valign="top">
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2>
			<div align="center" id="modbutton"><a href="modifynews.jsp?nno=<%= vo.getNno() %>">수정</a></div>
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
			<div id="adimage">부정 기사 입니다<img src="../image/devil.png" style="width:25px; height:25px;"></div>
		<%
		}else
		{	
			if(adno.equals(""))
			{
				%>
				<div id="adimage">키워드 유사도가 높은 기사가 없습니다</div>
				<%
				
			} else 
			{
				%>
				<div id="adimage" style="width:800px; height:150px">
					<a href="javascript:openreason();">
						<img id="ad" style="border:3px solid lightgray" width="800px" height="140px" src="adimagedown.jsp?adno=<%= adno %>">
					</a>
					<img id="ad2" style="display:none; border:3px solid lightgray" width="800px" height="140px" src="../image/gray.png">
					<span id="confirm-btn">광고를 닫으시겠습니까?<br>
						 <input id="yes_btn" type="button" value="예" onclick="adnone()">
					   	 <input id="no_btn" type="button" value="아니오" onclick="adview()">
				    </span>
					<span id="icon" class="icon" style="margin-right:2px">
					<img src="../image/ad.png" width="40px" height="19px" valign="top" style="border-radius:5px">
					<img id="close-btn" src="../image/x.png" width="30px" height="20px" valign="top" style="cursor:pointer" onclick="cancel()">
					</span>
				</div>
				<%
			}
		}
		%>
		<div id="newsmain" style="">
			<div id="newsnote">
				<%= vo.getNote() %>
			</div>
		</div>
		<div style="height: 20px"></div>
		<div style="text-align: center;">
			<a href="adminnewslist.jsp"><div id="listbutton" style="background-color: #4dd5b0;">목록</div></a>
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