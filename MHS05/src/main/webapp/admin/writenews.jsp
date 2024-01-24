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
%>
<script>
	function check() 
	{	
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
		//스마트 에디터 값을 텍스트컨텐츠로 전달
		$("#").submit();
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
<style>
	.title1
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
		padding          : 10px 50px;
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
	
	if(confirm("게시물을 등록하시겠습니까?") == 0)
	{
		return false;
	}
	return true;
}
</script>
	<form name="wirtenewsok" method="post" action="wirtenewsok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>건강뉴스</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td>
				<div class="title1">
					<h4>제목 : 
						<input id="title" type="text" style="width:700px;height:20px;" placeholder="제목을 입력해주세요.">
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="type" class="type">
					<h4>카테고리 : 
						<select style="width:100px;">
							<option value="선택">선택</option>
							<option value="다이어트">다이어트</option>
							<option value="음식">음식</option>
							<option value="운동">운동</option>
							<option value="영양제">영양제</option>
							<option value="남성건강">남성건강</option>
							<option value="여성건강">여성건강</option>
						</select>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="mainyn" id="mainyn">
					<h4>메인여부 : 
						<label><input type="radio" name="main" value="Y">Y</label>
						<label><input type="radio" name="main" value="N">N</label>
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
				<div class="image_container" id="image_container">※이미지 출력※</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="note"><h2>내용 : </h2></div>
				<div class="noteinput" id="noteinput">
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:900px;height:500px;">내용을 입력해주세요.</textarea>
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
				<span class="submit" id="submit"><input type="submit" id="submitbutton" value="등록"></span>
				<span class="cancel" id="cancel"><a href="adminnewsview.jsp">취소</a></span>
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 