<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<%
if( loginVO == null)
{	
	//�α��� ���� ���� ��� ó��
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
	target=document.getElementById('image'); // file ���̵� ����
	target.addEventListener('change',function(){ // change �Լ�
		
		if(target.value.length){ // ���� ÷���� �����ϰ�� ���ϸ� ���
			$('#originName').html("<ins>"+target.files[0].name+"</ins>");
		}else{ //��ư Ŭ���� ���(���� ÷�� ���� ���)�Ҷ� ���ϸ� �Ⱥ��̰�
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
		alert("��ǰ�̸��� �Է��ϼ���.")
		$("#name").focus();
		return false;
	}
	
	if($("#keywords").val() == "")
	{
		alert("Ű���带 �Է��ϼ���.")
		$("#keywords").focus();
		return false;
	}
	if($("#image").val() == "")
	{
		alert("���� �̹����� ��������.")
		$("#image").focus();
		return false;
	}
	
	if(confirm("���� ����Ͻðڽ��ϱ�?") == false)
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
				alert("���� ��ϵǾ����ϴ�.");
				document.location = "../admin/member.jsp";
			}				
		});
	}
}
</script>
	<form name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>���� ���</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="12" align="center" id="upload">
				<label for="image">
					<span class="btn-upload" id="btn-upload" style="padding: 0px 0px" >���� �̹���<br>���</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
			</td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="12" align="right">�ȼ� : 650 * 100<hr></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>��ǰ�̸�:</h4></td>
			<td>
				<input type="text" id="name" name="name" style="width:400px; height:30px" placeholder="��ǰ�̸��� �Է����ּ���.">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>Ű����:</h4></td>
			<td>
				<input type="text" id="keywords" name="keywords" style="width:400px; height:30px" placeholder="Ű����� , ������ �Է����ּ���">
			</td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
				<input type="submit" id="submitbutton" value="�Ϸ�">&emsp;
				<input type="button" id="cancelbutton" value="���" onclick="window.history.back()">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 