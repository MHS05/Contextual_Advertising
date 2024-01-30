<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
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
%>
<style>
	.title
	{
		position : absolute;
		top      : 400px;
		left     : 620px;
	}
	.type
	{
		position : absolute;
		top      : 450px;
		left     : 620px;
	}
	.mainyn
	{
		position : absolute;
		top      : 500px;
		left     : 620px;
	}
	.image
	{
		position : absolute;
		top      : 550px;
		left     : 620px;
	}
	.btn-upload 
	{	
		position         : absolute;
		top              : 560px;
		left             : 750px;
		padding          : 10px 10px;
		border-radius    : 10px;
		background-color : #4dd5b0;
	}
	.upload
	{
		position : absolute;
		top      : 600px;
		left     : 620px;
	}
	#image {
	  display: none;
	}
	.displayi
	{	
		position : absolute;
		top      : 600px;
		left     : 620px;
	}
	.image_container
	{
		position    : absolute;
		top         : 650px;
		left        : 620px;
		height      : 300px;
		width       : 900px;
		border      : 1px solid black;
		text-align  : center;
		line-height : 300px;
	}
	.note
	{
		position : absolute;
		top      : 950px;
		left     : 620px;
	}
	.noteinput
	{
		position : absolute;
		top      : 1020px;
		left     : 620px;
		width    : 960px;
	}
	.submit
	{
		position         : absolute;
		top              : 1600px;
		left             : 900px;
		background-color : #4dd5b0;
		padding          : 0px 0px;
		border           : 1px solid #4dd5b0;
		border-radius    : 10px;
	}
	.cancel
	{
		position         : absolute;
		top              : 1600px;
		left             : 1150px;
		background-color : lightgrey;
		padding          : 10px 50px;
		border           : 1px solid lightgrey;
		border-radius    : 10px;
	}
	#submitbutton
	{	
		width:130px;
		height:45px; 
		font-size:17px;
		cursor:pointer;
		background-color:#4dd5b0;
		border:0;
		border-radius: 5px;
	}
</style>
<script>
window.onload=function()
{
	target=document.getElementById('image'); // file 아이디 선언
	target.addEventListener('change',function(){ // change 함수
		
		if(target.value.length){ // 파일 첨부인 상태일경우 파일명 출력
			$('#originName').html("<ins>"+target.files[0].name+"</ins>");
		}else{ //버튼 클릭후 취소(파일 첨부 없을 경우)할때 파일명값 안보이게
			$('#originName').html("");
		}
		
	});
}

function DoWrite()
{	
	if($("#title").val() == "")
	{
		alert("제목을 입력하세요.")
		$("#title").focus();
		return false;
	}
	
	if($("#note").val() == "내용 : ")
	{
		alert("내용을 입력하세요.")
		$("#note").focus();
		return false;
	}
	
	if(confirm("뉴스를 수정하시겠습니까?") == 0)
	{
		return false;
	}
	return true;
}

function check() 
{	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
	//스마트 에디터 값을 텍스트컨텐츠로 전달
	$("#write").submit();
}

function setThumbnail(event) 
{
	$("#image_container").html("");
	
    var reader = new FileReader();

    reader.onload = function(event)
    {
      var img = document.createElement("img");
      img.style.width  = "900px";
      img.style.height = "300px";
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}
</script>
	<form id="write" name="upload" method="post" action="modifynewsok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
	<input type="hidden" id="nno" name="nno" value="<%= nno %>"> 
		<tr>
			<td colspan="12"><h2><b>건강소식</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td>
				<div class="title">
					<h4>제목 : 
						<input id="title" name="title" type="text" style="width:700px;height:20px;" placeholder="<%= vo.getTitle()%>">
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="type">
					<h4>카테고리 : 
						<select style="width:100px;" name="category">
							<option id="category" name="category" value="D" <%= vo.getCategory().equals("D") ? "selected" : "" %>>다이어트</option>
							<option id="category" name="category" value="F" <%= vo.getCategory().equals("F") ? "selected" : "" %>>음식</option>
							<option id="category" name="category" value="E" <%= vo.getCategory().equals("E") ? "selected" : "" %>>운동</option>
							<option id="category" name="category" value="N" <%= vo.getCategory().equals("N") ? "selected" : "" %>>영양제</option>
							<option id="category" name="category" value="M" <%= vo.getCategory().equals("M") ? "selected" : "" %>>남성건강</option>
							<option id="category" name="category" value="F2" <%= vo.getCategory().equals("F2") ? "selected" : "" %>>여성건강</option>
						</select>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="mainyn" id="mainyn">
					<h4>메인여부 : 
						<label><input type="radio" id="main" name="main" value="Y" <%= vo.getMainyn().equals("Y") ? "checked" : "" %>>Y</label>
						<label><input type="radio" id="main" name="main" value="Y" <%= vo.getMainyn().equals("N") ? "checked" : "" %>>N</label>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="image"><h4>이미지 업로드 : </h4></div>
				<div class="uploadbutton" id="uploadbutton">
					<label for="image">
						<span class="btn-upload" id="btn-upload">이미지 업로드</span>
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="upload" id="upload">
					<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="displayi"><h4>이미지 나오는 곳 : </h4></div>
				<div class="image_container" id="image_container"><img src="../image/<%=vo.getImage() %>" width="900px" height="300px"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="note"><h2>내용 : </h2></div>
				<div class="noteinput" id="noteinput">
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:900px;height:500px;">
						<%= vo.getNote() %>
					</textarea>
					<script id="smart" type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "ir1",
						 sSkinURI: "../se2/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
						});
					</script>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="submit" id="submit"><input type="submit" value="수정" id="submitbutton" onclick="check()"></span>
				<span class="cancel" id="cancel"><a href="adminnewsview.jsp">취소</a></span>
			</td>
		</tr>
	</form>
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