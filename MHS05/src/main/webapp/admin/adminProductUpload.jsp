<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<%
if( loginVO == null)
{	
	//로그인 하지 않은 경우 처리
	response.sendRedirect("../category/category.jsp");
	return;
}

String kind = request.getParameter("kind");
if(kind == null) kind = "V";

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
	<form name="upload" method="post" action="adminProductUploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>상품등록</b></h2><hr></td>
		</tr>
		<tr>
			<td rowspan="7" align="center" id="upload" width="260px" height="310px">
				<label for="image">
					<span class="btn-upload" id="btn-upload" style="padding: 0px 0px" >이미지 업로드</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
			</td>
		</tr>
		<tr>
			<td colspan="1">구분</td>
			<td colspan="1">
				<select name="ptype">
					<option value="">카테고리</option>
					<option value="V" <%= kind.equals("V") ? "selected" : "" %>>채소</option>
					<option value="F" <%= kind.equals("F") ? "selected" : "" %>>과일</option>
					<option value="H" <%= kind.equals("H") ? "selected" : "" %>>건강식품</option>
					<option value="S" <%= kind.equals("S") ? "selected" : "" %>>수산</option>
					<option value="M" <%= kind.equals("M") ? "selected" : "" %>>정육</option>
				</select>
			</td>
			<td>
				칼로리
			</td>
			<td>
				<input type="text" name="calorie" id="calorie" style="width:50px;">(100g당)
			</td>
		<tr>
			<td>상품명</td>
			<td>
				<input type="text" id="pname" name="pname" style="width:100px">
			</td>
			<td colspan="2">
				<input type="text" id="month_start" name="month_start" style="width:50px">월(시작) ~ 
				<input type="text" id="month_end" name="month_end" style="width:50px">월(끝)
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<select name="age">
					<option id="age" name="age" value="">나이</option>
					<option id="age" name="age" value="10">10대</option>
					<option id="age" name="age" value="20">20대</option>
					<option id="age" name="age" value="30">30대</option>
					<option id="age" name="age" value="40">40대</option>
					<option id="age" name="age" value="50">50대</option>
					<option id="age" name="age" value="60">60대</option>
				</select>
			</td>
			<td>태그(나이)</td>
			<td>
				<select name="tag_age" id="tag_age" style="width:100px; height:30px;" onchange="dosearch();">
	          		   <option value="">나이</option>
			           <option value="10대">10대</option>
			           <option value="20대">20대</option>
			           <option value="30대">30대</option>
			           <option value="40대">40대</option>
			           <option value="50대">50대</option>
			           <option value="60대">60대</option>
		         </select>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<select name="pgender">
					<option id="pgender" name="pgender" value="">성별</option>
					<option id="pgender" name="pgender" value="남자">남자</option>
					<option id="pgender" name="pgender" value="여자">여자</option>
					<option id="pgender" name="pgender" value="남녀불문">남녀불문</option>
				</select>
			</td>
			<td>태그(성별)</td>
			<td>
				<input id="tag_pgender" name="tag_pgender" type="text">
			</td>
		</tr>
		<tr>
			<td>체질</td>
			<td>
				<select name="pcon">
					<option id="pcon" name="pcon" value="">체질</option>
					<option id="pcon" name="pcon" value="태양인">태양인</option>
					<option id="pcon" name="pcon" value="태음인">태음인</option>
					<option id="pcon" name="pcon" value="소양인">소양인</option>
					<option id="pcon" name="pcon" value="소음인">소음인</option>
				</select>
			</td>
			<td>태그(체질)</td>
			<td>
				<input id="tag_pcon" name="tag_pcon" type="text">
			</td>
		</tr>
		<tr>
			<td>링크<hr></td>
			<td colspan="3">
				<input id="link" name="link" type="text" style="width:300px"><hr>
			</td>
		</tr>
		<tr>
			<td colspan="5">1. 기본정보 및 효능<hr></td>
		</tr>
		<tr>
			<td colspan="5">
				<textarea id="info" name="info" cols="120" rows="15"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="5">2. 섭취정보<hr></td>
		</tr>
		<tr>
			<td colspan="5">
				<textarea id="takeinfo" name="takeinfo" cols="120" rows="15"></textarea>
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