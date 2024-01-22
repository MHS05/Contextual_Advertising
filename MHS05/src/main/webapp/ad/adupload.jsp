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
		alert("������ �Է��ϼ���.")
		$("#title").focus();
		return false;
	}
	
	if($("#note").val() == "")
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
	target=document.getElementById('image'); // file ���̵� ����
	target.addEventListener('change',function(){ // change �Լ�
		
		if(target.value.length){ // ���� ÷���� �����ϰ�� ���ϸ� ���
			$('#originName').html("<ins>"+target.files[0].name+"</ins>");
		}else{ //��ư Ŭ���� ���(���� ÷�� ���� ���)�Ҷ� ���ϸ� �Ⱥ��̰�
			$('#originName').html("");
		}
		
	});
}
</script>
	<form name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>������</b></h2><hr></td>
		</tr>
		<tr>
			<td rowspan="8" align="center" id="upload" width="260px" height="310px">
				<label for="image">
					<span class="btn-upload" id="btn-upload" style="padding: 0px 0px" >���� �̹���<br>���ε�</span>
				</label>
				<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
			</td>
		</tr>
		<tr>
			<td colspan="1" width="100px">Ÿ��</td>
			<td colspan="3">
				<select name="ptype">
					<option value="">Ÿ��</option>
					<option value="D" <%= kind.equals("D") ? "selected" : "" %>>���̾�Ʈ</option>
					<option value="F" <%= kind.equals("F") ? "selected" : "" %>>����</option>
					<option value="H" <%= kind.equals("H") ? "selected" : "" %>>�</option>
					<option value="N" <%= kind.equals("N") ? "selected" : "" %>>������</option>
					<option value="M" <%= kind.equals("M") ? "selected" : "" %>>�����ǰ�</option>
					<option value="W" <%= kind.equals("W") ? "selected" : "" %>>�����ǰ�</option>
					<option value="W" <%= kind.equals("E") ? "selected" : "" %>>��Ÿ</option>
				</select>
			</td>
		<tr>
			<td>��ǰ��</td>
			<td colspan="3">
				<input type="text" id="name" name="name" style="width:100px">
			</td>
		</tr>
		<tr>
			<td>Ű����1</td>
			<td width="100px">
				<input type="text" id="keyword1" name="keyword1" style="width:100px">
			</td>
		</tr>
		<tr>
			<td>Ű����2</td>
			<td>
				<input type="text" id="keyword2" name="keyword2" style="width:100px">
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td colspan="3">
				<select name="emotion">
					<option id="emotion" name="emotion" value="P">����</option>
					<option id="emotion" name="emotion" value="N">����</option>
					<option id="emotion" name="emotion" value="M">�߸�</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>�Խ� �Ⱓ</td>
			<td colspan="3">
				<input type="date" name="date_start"> ~ <input type="date" name="date_end">
			</td>
		</tr>
		<tr>
			<td>��ũ<hr></td>
			<td colspan="3">
				<input id="link" name="link" type="text" style="width:300px"><hr>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
				<input type="submit" id="submitbutton" value="�Ϸ�">&emsp;
				<input type="button" id="cancelbutton" value="���" onclick="window.history.back()">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 