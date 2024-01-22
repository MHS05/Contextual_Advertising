<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "F";
String btitle = "자유게시판";
if(kind.equals("TY"))
{
	btitle = "태양인게시판";
}
if(kind.equals("TE"))
{
	btitle = "태음인게시판";
}
if(kind.equals("SY"))
{
	btitle = "소양인게시판";
}
if(kind.equals("SE"))
{
	btitle = "소음인게시판";
}

String no = request.getParameter("no");
if( loginVO == null || no == null || no.equals("") )
{
	response.sendRedirect("communitylist.jsp");
	return;
}
CommunityDTO dto = new CommunityDTO();
CommunityVO  vo  = dto.Read(no, false);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "communitylist.jsp";
	</script>
	<%
	return;
}

if( !loginVO.getId().equals(vo.getId()) )
{
	response.sendRedirect("communitylist.jsp");
	return;	
}
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	window.onload = function()
	{
		$("#title").focus();
	}
	
	function DoModify()
	{
		if( $("#title").val() == "")
		{
			alert("제목을 입력하세요");
			$("#title").focus();	
			return false;
		}		
		if( $("#note").val() == "")
		{
			alert("내용을 입력하세요");
			$("#note").focus();	
			return false;
		}
		if(confirm("게시물을 변경하시겠습니까?") == 0)
		{
			return false;	
		}
		return true;
	}	
</script>
<style>
		.submenu
	{
	font-size: 20px;
	}
	.btn-upload 
	{	
		width: 130px;
		height: 30px;
		background: #fff;
		border: 1px solid rgb(77,77,77);
		border-radius: 10px;
		font-weight: 200;
		cursor: pointer;
		display: flex;
		align-items: center;
		justify-content: center;
		&:hover 
		{
			background: rgb(77,77,77);
			color: #fff;
		}
	}
	
	#image {
	  display: none;
	}
	
	#submitbutton
	{	
		width:100px;
		height:30px; 
		font-size:15px;
		cursor:pointer;
		background-color:#4dd5b0;
		border:0;
		border-radius: 5px;
	}
	
	#cancelbutton
	{	
		width:100px;
		height:30px; 
		font-size:15px;
		cursor:pointer;
		background-color:lightgray;
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

function check() 
{	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
	//스마트 에디터 값을 텍스트컨텐츠로 전달
	$("#modifyform").submit();
}
</script>
	<form id="modifyform" name="modifyform" method="post" action="communitymodifyok.jsp" enctype="multipart/form-data" onsubmit="return DoModify();">
	<input type="hidden" id="no" name="no" value="<%= no %>"> 
		<table border="0" align="center" width="1200px">
			<tr>
				<td rowspan="26" width="20%" valign="top">
					<div><a href="communitylist.jsp"><h1><u>커뮤니티</u></h1></a></div> 
					<div style="width: 220px; height: 300px; box-shadow: 3px 3px 3px 3px lightgray;">
						<table border="0" align="left" width="200px" height="50px">
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/free.png">
								<a href="communitylist.jsp?kind=F" >
								<%
								if(kind.equals("F")){
								%>
								<b><u>자유게시판</u></b></a></td><%
								}else{
								%>
								<b>자유게시판</b></a></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/ty.png">
								<a href="communitylist.jsp?kind=TY">
								<%
								if(kind.equals("TY")){
								%>
								<b><u>태양인게시판</u></b></a></td><%
								}else{
								%>
								<b>태양인게시판</b></a></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/te.png">
								<a href="communitylist.jsp?kind=TE">
								<%
								if(kind.equals("TE")){
								%>
								<b><u>태음인게시판</u></b></a></td><%
								}else{
								%>
								<b>태음인게시판</b></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/sy.png">
								<a href="communitylist.jsp?kind=SY">
								<%
								if(kind.equals("SY")){
								%>
								<b><u>소양인게시판</u></b></a></td><%
								}else{
								%>
								<b>소양인게시판</b></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/se.png">
								<a href="communitylist.jsp?kind=SE">
								<%
								if(kind.equals("SE")){
								%>
								<b><u>소음인게시판</u></b></a></td><%
								}else{
								%>
								<b>소음인게시판</b></td><%
								}%>
							</tr>
						</table>
					</div>
				</td>
				<td colspan="4" height="50px"><h2>자유게시판</h2></td>
			</tr>
			<tr>
				<td colspan="4" height="20px"><hr></td>
			<tr>
			<tr>
				<td colspan="4" height="50px"><h2>※글수정</h2></td>
			</tr>
			<tr>
				<td width="80px" height="50px">제목 :</td>
				<td colspan="3"><input type="text" id="title" name="title" style="width:700px;height:30px;" value="<%= vo.getTitle().replace("\"", "&quot;") %>"></td>
			</tr>
			<tr>
				<td height="50px">구분 :</td>
				<td width="320px">
					<select name="type" style="width:300px;height:30px;">
						<option id="type" name="type" value="F"  <%= kind.equals("F") ? "selected" : "" %>>자유게시판</option>
						<option id="type" name="type" value="TY" <%= kind.equals("TY") ? "selected" : "" %>>태양인게시판</option>
						<option id="type" name="type" value="TE" <%= kind.equals("TE") ? "selected" : "" %>>태음인게시판</option>
						<option id="type" name="type" value="SY" <%= kind.equals("SY") ? "selected" : "" %>>소양인게시판</option>
						<option id="type" name="type" value="SE" <%= kind.equals("SE") ? "selected" : "" %>>소음인게시판</option>
					</select>
				</td>
				<td width="135px">
					<label for="image">
					  <span class="btn-upload" style="padding: 0px 0px">이미지 업로드</span>
					</label>
					<input type="file" name="image" id="image" accept="image/*">
				</td>
				<td>
				<p id="originName" style="display : inline-block">
					<%
					if( vo.getImage() != null && !vo.getImage().equals("") )
					{
						%><ins><%= vo.getImage()%></ins><%
					}else
					{
						%>등록된 첨부파일이 없습니다.<%
					}
					%>
				</p>
				</td>
			</tr>
			<tr>
				<td valign="top" height="200px">내용 :</td>
				<td valign="top" colspan="3">
				<textarea name="ir1" id="ir1" rows="10" cols="100"><%= vo.getNote() %></textarea>
					<script id="smart" type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "ir1",
						 sSkinURI: "../se2/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
						});
					</script>
				</td>
			</tr>
			<tr>
				<td height="50px">첨부파일 :</td>
				<td colspan="4"><input id="attach" name="attach" type="file"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="4">
					<%
					if( vo.getFname() != null && !vo.getFname().equals("") )
					{
						%><a href="down.jsp?no=<%= no %>"><%= vo.getFname() %></a><%
					}else
					{
						%>등록된 첨부파일이 없습니다.<%
					}
					%>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center" height="20px"><input type="button" id="submitbutton" value="수정" onclick="check();" style="background-color:#4dd5b0;">&nbsp;
				<a href="communityview.jsp?no=<%= no %>"><input type="button" id="cancelbutton" value="취소"></a></td>
			</tr>
		</table>
	</form>
<%@ include file="../include/tail.jsp" %>