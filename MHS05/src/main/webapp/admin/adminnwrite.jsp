<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "N";
String btitle = "공지사항";

if( loginVO == null)
{	
	//로그인 하지 않은 경우 처리
	response.sendRedirect("communitylist.jsp");
	return;
}
%>
<script>
	window.onload = function()
	{
		$("#title").focus();
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
	
$(document).ready(function()
{
  var fileTarget = $('.filebox .upload-hidden');

  fileTarget.on('change', function(){  // 값이 변경되면
    if(window.FileReader){  // modern browser
      var filename = $(this)[0].files[0].name;
    } 
    else {  // old IE
      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
    }
    
    // 추출한 파일명 삽입
    $(this).siblings('.upload-name').val(filename);
  });
}); 
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
	oEditors.getById["note"].exec("UPDATE_CONTENTS_FIELD", []);  
	//스마트 에디터 값을 텍스트컨텐츠로 전달
	$("#adminnwrite").submit();
}

</script>
	<form id="adminnwrite" name="adminnwrite" method="post" action="adminnwriteok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="6">
				<a href="adminnlist.jsp"><h2><b>공지사항</b></h2></a>
				<hr>
			</td>
		</tr>
		<tr>
			<td class="td" colspan="4" height="30px">※글쓰기</td>
		</tr>
		<tr>
			<td class="td" width="50px" height="30px" align="center">구분 :</td>
			<td width="100px">
				<input type="radio" id="type" name="type" value="N" <%= kind.equals("N") ? "checked" : "" %>>공지사항
			</td>
			<td width="135px">
				<label for="image">
				  <span class="btn-upload" style="padding: 0px 0px">이미지 업로드</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*">
			</td>
			<td>
				<p id="originName" style="display : inline-block"></p>
			</td>
		</tr>
		<tr>
			<td class="td" width="85px" height="30px" align="center">제목 :</td>
			<td colspan="3"><input type="text" id="title" name="title" style="width:715px;height:20px;"></td>
		</tr>
		<tr>
			<td class="td" height="50px" align="center" valign="top">내용 :</td>
			<td colspan="3" width="720px">
				<textarea id="note" name="note" rows="10" cols="100"></textarea>
				<script id="smart" type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "note",
						 sSkinURI: "../se2/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
						});
				</script>
			</td>
		</tr>
		<tr>
			<td class="td" height="50px">첨부파일 :</td>
			<td colspan="3">
			<input id="attach" name="attach" type="file"></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" id="submitbutton" onclick="check();" value="작성완료" style="width:100px; height:35px;">&nbsp;
				<input type="button" id="cancelbutton" value="취소" onclick="window.history.back()" style="width:100px; height:35px">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 