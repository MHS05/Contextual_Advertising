<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<%
if( loginVO == null)
{	
	//�α��� ���� ���� ��� ó��
	response.sendRedirect("../main/index.jsp");
	return;
}
%>
<script>
	function check() 
	{	
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
		//����Ʈ ������ ���� �ؽ�Ʈ�������� ����
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
	target=document.getElementById('image'); // file ���̵� ����
	target.addEventListener('change',function(){ // change �Լ�
		
		if(target.value.length){ // ���� ÷���� �����ϰ�� ���ϸ� ���
			$('#originName').html("<ins>"+target.files[0].name+"</ins>");
		}else{ //��ư Ŭ���� ���(���� ÷�� ���� ���)�Ҷ� ���ϸ� �Ⱥ��̰�
			$('#originName').html("");
		}
		
	});
	
}
function DoWrite()
{	
	if($("#title").val() == "")
	{
		alert("������ �Է��ϼ���.")
		$("#title").focus();
		return false;
	}
	
	if($("#note").val() == "���� : ")
	{
		alert("������ �Է��ϼ���.")
		$("#note").focus();
		return false;
	}
	
	if(confirm("�Խù��� ����Ͻðڽ��ϱ�?") == 0)
	{
		return false;
	}
	return true;
}
</script>
	<form name="wirtenewsok" method="post" action="wirtenewsok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>�ǰ�����</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td>
				<div class="title1">
					<h4>���� : 
						<input id="title" type="text" style="width:700px;height:20px;" placeholder="������ �Է����ּ���.">
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="type" class="type">
					<h4>ī�װ� : 
						<select style="width:100px;">
							<option value="����">����</option>
							<option value="���̾�Ʈ">���̾�Ʈ</option>
							<option value="����">����</option>
							<option value="�">�</option>
							<option value="������">������</option>
							<option value="�����ǰ�">�����ǰ�</option>
							<option value="�����ǰ�">�����ǰ�</option>
						</select>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="mainyn" id="mainyn">
					<h4>���ο��� : 
						<label><input type="radio" name="main" value="Y">Y</label>
						<label><input type="radio" name="main" value="N">N</label>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="image"><h4>�̹��� ���ε� : </h4></div>
				<div class="uploadbutton" id="uploadbutton">
					<label for="image">
						<span class="btn-upload" id="btn-upload">�̹��� ���ε�</span>
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
				<div class="displayi"><h4>�̹��� ������ �� : </h4></div>
				<div class="image_container" id="image_container">���̹��� ��¡�</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="note"><h2>���� : </h2></div>
				<div class="noteinput" id="noteinput">
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:900px;height:500px;">������ �Է����ּ���.</textarea>
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
				<span class="submit" id="submit"><input type="submit" id="submitbutton" value="���"></span>
				<span class="cancel" id="cancel"><a href="adminnewsview.jsp">���</a></span>
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 