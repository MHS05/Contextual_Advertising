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

String pno = request.getParameter("pno");
if( loginVO == null || pno == null || pno.equals("") )
{
	response.sendRedirect("admincategory.jsp");
	return;
}
CategoryDTO dto = new CategoryDTO();
CategoryVO  vo  = dto.Read(pno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "admincategory.jsp";
	</script>
	<%
	return;
}

%> 
<script>
window.onload = function()
{
	$("#title").focus();
}

function setThumbnail(event) {
	
	$("#btn-upload").css('display','none');
	$("#imgbefore").css('display','none');
	
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
	
	if(confirm("게시물을 변경하시겠습니까?") == 0)
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
	<form name="upload" method="post" action="adminProudctModifyok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
	<input type="hidden" id="pno" name="pno" value="<%= pno %>">
		<tr>
			<td colspan="12"><h2><b>상품수정</b></h2><hr></td>
		</tr>
		<tr>
			<td rowspan="7" align="center" id="upload" width="260px" height="310px">
				<div id="imgbefore"><img src="categoryimagedown.jsp?pno=<%= vo.getPno() %>" width="260px" height="310px"></div>
				<label for="image">
					<span class="btn-upload" id="btn-upload" style="padding: 0px 0px" >이미지 수정</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
			</td>
		</tr>
		<tr>
			<td colspan="1">구분</td>
			<td colspan="1">
				<select name="ptype">
					<option value="">카테고리</option>
					<option value="V"<%= vo.getPtype().equals("V") ? "selected" : "" %>>채소</option>
					<option value="F"<%= vo.getPtype().equals("F") ? "selected" : "" %>>과일</option>
					<option value="H"<%= vo.getPtype().equals("H") ? "selected" : "" %>>건강식품</option>
					<option value="S"<%= vo.getPtype().equals("S") ? "selected" : "" %>>수산</option>
					<option value="M"<%= vo.getPtype().equals("M") ? "selected" : "" %>>정육</option>
				</select>
			</td>
			<td>
				칼로리
			</td>
			<td>
				<input type="text" name="calorie" id="calorie" style="width:50px;" value="<%= vo.getCalorie() %>">(100g당)
			</td>
		<tr>
			<td>상품명</td>
			<td>
				<input type="text" id="pname" name="pname" value="<%=vo.getPname()%>" style="width:100px">
			</td>
			<td colspan="2">
				<input type="text" id="month_start" name="month_start" style="width:50px" value="<%=vo.getMonth_start() %>">월(시작) ~ 
				<input type="text" id="month_end" name="month_end" style="width:50px" value="<%=vo.getMonth_end() %>">월(끝)
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<select name="age">
					<option value="">나이</option>
					<option value="10"<%= vo.getAge().equals("20") ? "selected" : "" %>>10대</option>
					<option value="20"<%= vo.getAge().equals("20") ? "selected" : "" %>>20대</option>
					<option value="30"<%= vo.getAge().equals("30") ? "selected" : "" %>>30대</option>
					<option value="40"<%= vo.getAge().equals("40") ? "selected" : "" %>>40대</option>
					<option value="50"<%= vo.getAge().equals("50") ? "selected" : "" %>>50대</option>
					<option value="60"<%= vo.getAge().equals("60") ? "selected" : "" %>>60대</option>
				</select>
			</td>
			<td>태그(나이)</td>
			<td>
				<select name="tag_age" id="tag_age" style="width:100px; height:30px;" onchange="dosearch();">
	          		   <option value="">나이</option>
			           <option value="10대"<%= vo.getTag_age().equals("10대") ? "selected" : "" %>>10대</option>
			           <option value="20대"<%= vo.getTag_age().equals("20대") ? "selected" : "" %>>20대</option>
			           <option value="30대"<%= vo.getTag_age().equals("30대") ? "selected" : "" %>>30대</option>
			           <option value="40대"<%= vo.getTag_age().equals("40대") ? "selected" : "" %>>40대</option>
			           <option value="50대"<%= vo.getTag_age().equals("50대") ? "selected" : "" %>>50대</option>
			           <option value="60대"<%= vo.getTag_age().equals("60대") ? "selected" : "" %>>60대</option>
		         </select>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<select name="pgender" id="pgender">
					<option value="">성별</option>
					<option value="남자"<%= vo.getPgender().equals("남자") ? "selected" : "" %>>남자</option>
					<option value="여자"<%= vo.getPgender().equals("여자") ? "selected" : "" %>>여자</option>
					<option value="남녀불문"<%= vo.getPgender().equals("남녀불문") ? "selected" : "" %>>남녀불문</option>
				</select>
			</td>
			<td>태그(성별)</td>
			<td>
				<input id="tag_pgender" name="tag_pgender" type="text" value="<%=vo.getTag_pgender()%>">
			</td>
		</tr>
		<tr>
			<td>체질</td>
			<td>
				<select name="pcon">
					<option value="">체질</option>
					<option value="태양인"<%= vo.getPcon().equals("태양인") ? "selected" : "" %>>태양인</option>
					<option value="태음인"<%= vo.getPcon().equals("태음인") ? "selected" : "" %>>태음인</option>
					<option value="소양인"<%= vo.getPcon().equals("소양인") ? "selected" : "" %>>소양인</option>
					<option value="소음인"<%= vo.getPcon().equals("소음인") ? "selected" : "" %>>소음인</option>
				</select>
			</td>
			<td>태그(체질)</td>
			<td>
				<input id="tag_pcon" name="tag_pcon" type="text" value="<%=vo.getTag_pcon()%>">
			</td>
		</tr>
		<tr>
			<td>링크<hr></td>
			<td colspan="3">
				<input id="link" name="link" type="text" style="width:300px" value="<%=vo.getLink()%>"><hr>
			</td>
		</tr>
		<tr>
			<td colspan="5">1. 기본정보 및 효능<hr></td>
		</tr>
		<tr>
			<td colspan="5">
				<textarea id="info" name="info" cols="120" rows="15"><%=vo.getInfo() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="5">2. 섭취정보<hr></td>
		</tr>
		<tr>
			<td colspan="5">
				<textarea id="takeinfo" name="takeinfo" cols="120" rows="15"><%=vo.getTakeinfo() %></textarea>
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