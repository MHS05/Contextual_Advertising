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

String adno = request.getParameter("adno");

AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);
%>
<style>
	.btn-upload 
	{	
		width: 130px;
		height:100px;
		background: #fff;
		background-color:#4dd5b0;
		border: 1px solid #4dd5b0;
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
	.btn-upload2
	{	
		line-height      : 50px;
		position         : absolute;
		top              : 320px;
		left             : 1370px;
		width            : 150px;
		height           : 50px;
		background       : #fff;
		background-color : #4dd5b0;
		border           : 1px solid #4dd5b0;
		border-radius    : 10px;
		font-weight      : 200;
		cursor           : pointer;
		display          : flex;
		align-items      : center;
		justify-content  : center;
		display          : block;
		text-align       : center;
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
	$("#title").focus();
	target=document.getElementById('image'); // file 아이디 선언
	target.addEventListener('change',function(){ // change 함수
		
		if(target.value.length){ // 파일 첨부인 상태일경우 파일명 출력
			$('#originName').html("<ins>"+target.files[0].name+"</ins>");
		}else{ //버튼 클릭후 취소(파일 첨부 없을 경우)할때 파일명값 안보이게
			$('#originName').html("");
		}
		
	});
}

function setThumbnail(event) {
	
	$("#image_container").html("");
	
    var reader = new FileReader();

    reader.onload = function(event) 
    {
      var img = document.createElement("img");
      img.style.width = '650px';
      img.style.height = '100px';
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };
	
    reader.readAsDataURL(event.target.files[0]);
  }

function DoWrite()
{	
	if($("#name").val() == "")
	{
		alert("상품이름을 입력하세요.")
		$("#name").focus();
		return false;
	}
	
	if($("#keywords").val() == "")
	{
		alert("키워드를 입력하세요.")
		$("#keywords").focus();
		return false;
	}
	
	if(confirm("광고를 수정하시겠습니까?") == 0)
	{
		return false;
	}
	return true;
}

</script>
	<form name="upload" method="post" action="admodifyok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
	<input type="hidden" id="adno" name="adno" value="<%= adno %>"> 
		<tr>
			<td colspan="12"><h2><b>광고 수정</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="12" align="center" id="upload" height="110px">
				<label for="image">
					<span class="btn-upload2" id="btn-upload2" style="padding: 0px 0px" >광고 이미지 수정</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
				<div class="image_container" id="image_container"><img src="../admin/adimagedown.jsp?adno=<%= adno %>" width="800px" height="140px"></div>
			</td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="12" align="right">픽셀 : 800 * 140<hr></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>상품이름:</h4></td>
			<td>
				<input type="text" id="name" name="name" style="width:400px; height:30px" value="<%= vo.getAdname() %>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>키워드:</h4></td>
			<td>
				<input type="text" id="keywords" name="keywords" style="width:400px; height:30px" value="<%= vo.getAdkey() %>">
			</td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
				<input type="submit" id="submitbutton" value="완료">&emsp;
				<input type="button" id="cancelbutton" value="취소" onclick="window.history.back()">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 