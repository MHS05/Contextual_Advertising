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

String kind = request.getParameter("kind");
if(kind == null) kind = "D";
%>
<script>
window.onload = function()
{
	$("#title").focus();
}

function setThumbnail(event) {
	
	$("#btn-upload").css('display','none')
	
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.style.width = '250px';
      img.style.height = '300px';
      img.setAttribute("src", event.target.result);
      document.querySelector("td#upload").appendChild(img);
    };
	
    reader.readAsDataURL(event.target.files[0]);
  }

function DoWrite()
{	
	if($("#title").val() == "")
	{
		alert("제목을 입력하세요.")
		$("#title").focus();
		return false;
	}
	
	if($("#note").val() == "")
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
<style>
	.btn-upload 
	{	
		width: 130px;
		height: 50px;
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
		height:50px; 
		font-size:17px;
		cursor:pointer;
		background-color:#4dd5b0;
		border:0;
		border-radius: 5px;
	}
	
	#cancelbutton
	{	
		width:100px;
		height:50px; 
		font-size:17px;
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
</script>
	<form name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>광고등록</b></h2><hr></td>
		</tr>
		<tr>
			<td rowspan="8" align="center" id="upload" width="260px" height="310px">
				<label for="image">
					<span class="btn-upload" id="btn-upload" style="padding: 0px 0px" >광고 이미지<br>업로드</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
			</td>
		</tr>
		<tr>
			<td colspan="1" width="100px">타입</td>
			<td colspan="3">
				<select name="ptype">
					<option value="">타입</option>
					<option value="D" <%= kind.equals("D") ? "selected" : "" %>>다이어트</option>
					<option value="F" <%= kind.equals("F") ? "selected" : "" %>>음식</option>
					<option value="H" <%= kind.equals("H") ? "selected" : "" %>>운동</option>
					<option value="N" <%= kind.equals("N") ? "selected" : "" %>>영양제</option>
					<option value="M" <%= kind.equals("M") ? "selected" : "" %>>남성건강</option>
					<option value="W" <%= kind.equals("W") ? "selected" : "" %>>여성건강</option>
					<option value="W" <%= kind.equals("E") ? "selected" : "" %>>기타</option>
				</select>
			</td>
		<tr>
			<td>상품명</td>
			<td colspan="3">
				<input type="text" id="name" name="name" style="width:100px">
			</td>
		</tr>
		<tr>
			<td>키워드1</td>
			<td width="100px">
				<input type="text" id="keyword1" name="keyword1" style="width:100px">
			</td>
		</tr>
		<tr>
			<td>키워드2</td>
			<td>
				<input type="text" id="keyword2" name="keyword2" style="width:100px">
			</td>
		</tr>
		<tr>
			<td>감정</td>
			<td colspan="3">
				<select name="emotion">
					<option id="emotion" name="emotion" value="P">긍정</option>
					<option id="emotion" name="emotion" value="N">부정</option>
					<option id="emotion" name="emotion" value="M">중립</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>게시 기간</td>
			<td colspan="3">
				<input type="date" name="date_start"> ~ <input type="date" name="date_end">
			</td>
		</tr>
		<tr>
			<td>링크<hr></td>
			<td colspan="3">
				<input id="link" name="link" type="text" style="width:300px"><hr>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
				<input type="submit" id="submitbutton" value="완료">&emsp;
				<input type="button" id="cancelbutton" value="취소" onclick="window.history.back()">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 