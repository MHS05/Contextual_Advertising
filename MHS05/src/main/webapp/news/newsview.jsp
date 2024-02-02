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
.icon
{
	position:absolute;
	right:432px;
	margin-top:5px;
}

#ad {
	margin-left:72px;
    display: block; /* 초기에는 보이게 설정 */
}

#confirm-btn {
    display: none; /* 초기에는 숨김 */
    text-align:center;
    margin-left:190px;
    font-size:20px;
    position:relative;
    top:50px;
}

#ad2
{	
	left:675px;
    position:absolute;
}
</style>
<script>
	function openreason() 
	{
		$.ajax
		({
			type : "post",
			url  : "countad.jsp",
			data :
			{
				nno   : <%= vo.getNno() %>,
				adno  : <%= adno %>,
			},		
			dataType : "html",	
			success : function(data) 
			{
				data = data.trim();
			}				
		});		
		
		var _width = '1200';
		var _height = '1000';
			
		var _left = Math.ceil((window.screen.width - _width )/2);
		var _top = Math.ceil((window.screen.height - _height )/2);
		
		window.open('../highchart/highchart01.jsp?nno=<%= vo.getNno() %>&adno=<%= adno %>', '', 'width=1200, height=1000, left=' + _left +', top=' + (_top - 250)); return false;
		
	}
	
	function cancel()
	{	
		if(confirm("광고를 닫으시겠습니까?") == 0)
		{
			return;
		}else
		{
			$("#adimage").css("display","none");
		}	
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
				<img style="width:100%;height:100%;" src="../admin/newsimagedown.jsp?nno=<%= nno %>">
			</div>
			<%
			if(vo.getEmotion().equals("부정"))
			{
			%>
				<div id="adimage">부정 기사 입니다</div>
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
					<div id="adimage" style="width:800px; height:140px">
						<a href="javascript:openreason()">
							<img class="ad" id="ad" style="border:3px solid lightgray" width="800px" height="140px" src="../admin/adimagedown.jsp?adno=<%= adno %>">
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
			<div style="height:30px;"></div>
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