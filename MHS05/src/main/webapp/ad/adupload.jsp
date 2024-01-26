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
%>
<style>
	.btn-upload 
	{	
		width: 130px;
		height: 100px;
		background: #fff;
		background-color:#4dd5b0;
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
window.onload = function()
{
	$("#title").focus();
}

function setThumbnail(event) {
	
	$("#btn-upload").css('display','none')
	
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.style.width = '650px';
      img.style.height = '100px';
      img.setAttribute("src", event.target.result);
      document.querySelector("td#upload").appendChild(img);
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
	if($("#image").val() == "")
	{
		alert("뉴스 이미지를 넣으세요.")
		$("#image").focus();
		return false;
	}
	
	if(confirm("광고를 등록하시겠습니까?") == false)
	{
		return; 
	}else
	{
		$.ajax({
			type : "post",
			url: "aduploadok.jsp",
			data :
			{	
				name     : name,
				keywords : keywords,
				image    : image,
			},		
			dataType : "html",	
			success : function(data) 
			{
				data = data.trim();
				alert("광고가 등록되었습니다.");
				document.location = "../admin/member.jsp";
			}				
		});
	}
}
</script>
	<form name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>광고 등록</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="12" align="center" id="upload">
				<label for="image">
					<span class="btn-upload" id="btn-upload" style="padding: 0px 0px" >광고 이미지<br>등록</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
			</td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="12" align="right">픽셀 : 650 * 100<hr></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>상품이름:</h4></td>
			<td>
				<input type="text" id="name" name="name" style="width:400px; height:30px" placeholder="상품이름을 입력해주세요.">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>키워드:</h4></td>
			<td>
				<input type="text" id="keywords" name="keywords" style="width:400px; height:30px" placeholder="키워드는 , 단위로 입력해주세요">
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