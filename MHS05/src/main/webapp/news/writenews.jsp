<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<style>
	#type
	{
		width            : 100px;
		text-align       : center;
		padding-top      : 30px;
		padding-bottom   : 30px;
		background-color : white;
		border-radius    : 15px;
		cursor           : pointer;
		float            : left;
		margin-right     : 15px;
		box-shadow       : 1px 3px 5px 3px lightgray;
	}
	.category
	{
		position : absolute;
		top      : 220px;
		left     : 600px;
	}
	.line
	{
		position      : absolute;
		top           : 310px;
		left          : 600px;
		border-bottom :3px solid lightgray;
		width         : 1000px;
	}
	.title
	{
		position : absolute;
		top      : 330px;
		left     : 600px;
	}
	.mainyn
	{
		position : absolute;
		top      : 390px;
		left     : 600px;
	}
	.image
	{
		position : absolute;
		top      : 450px;
		left     : 600px;
	}
	.btn-upload
	{
		position      : absolute;
		top           : 475px;
		left          : 780px;
		padding       : 0px 0px;
		border        : 1px solid black;
		border-radius : 10px;
	}
	.upload
	{
		position : absolute;
		top      : 480px;
		left     : 920px;
	}
	#image 
	{
		display : none;
	}
	.displayi
	{	
		position : absolute;
		top      : 500px;
		left     : 600px;
	}
	.image_container
	{
		position : absolute;
		top      : 550px;
		left     : 600px;
		height   : 300px;
		width    : 800px;
		border   : 1px solid black;
	}
	.note
	{
		position : absolute;
		top      : 840px;
		left     : 600px;
	}
	.noteinput
	{
		position : absolute;
		top      : 900px;
		left     : 600px;
		width    : 800px;
	}
	.submit
	{
		position         : absolute;
		top              : 1300px;
		left             : 900px;
		background-color : #4dd5b0;
		padding          : 10px 15px;
		border           : 1px solid #4dd5b0;
		border-radius    : 10px;
	}
	.cancel
	{
		position         : absolute;
		top              : 1300px;
		left             : 1000px;
		background-color : lightgrey;
		padding          : 10px 15px;
		border           : 1px solid lightgrey;
		border-radius    : 10px;
	}
</style>
<script>
	function check() 
	{	
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
		//스마트 에디터 값을 텍스트컨텐츠로 전달
		$("#").submit();
	}
	function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.style.width  = "800px";
          img.style.height = "300px";
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
	<table border="0" align="center" width="1200px" height="1300px">
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
				<div class="category"><h1>건강소식</h1></div>
				<div class="line"></div>
				<div class="title">
					<h2>제목 : 
						<input id=" title" type="text" style="width:500px;">
					</h2>
				</div>
				<div class="mainyn" id="mainyn">
					<h2>메인여부 : 
						<label><input type="radio" name="main" value="Y">Y</label>
						<label><input type="radio" name="main" value="N">N</label>
					</h2>
				</div>
				<div class="image"><h2>이미지 업로드 : </h2></div>
				<div class="uploadbutton" id="uploadbutton">
					<label for="image">
						<span class="btn-upload" id="btn-upload">이미지 업로드</span>
					</label>
				</div>
				<div class="upload" id="upload">
					<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
				</div>
				<div class="displayi"><h2>이미지 나오는 곳 : </h2></div>
				<div class="image_container" id="image_container"></div>
				<div class="note"><h2>내용 : </h2></div>
				<div class="noteinput" id="noteinput">
					<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
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
				<span class="submit" id="submit">등록</span>
				<span class="cancel" id="cancel">취소</span>
			</td>
		</tr>
	</table>
<%@ include file="../include/tail.jsp" %>