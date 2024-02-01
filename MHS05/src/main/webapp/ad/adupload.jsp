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
	#loading
	{
		align:left;
	}
</style>
<script>
//ä�� �޽����� ǥ���� DOM
const chatMessages = document.querySelector('#chat-messages');
// ����� �Է� �ʵ�
const userInput = document.querySelector('#user-input input');
// �߱޹��� OpenAI API Ű�� ������ ����
const apiKey = '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';
// OpenAI API ��������Ʈ �ּҸ� ������ ����
const apiEndpoint = 'https://api.openai.com/v1/chat/completions'

function addMessage(sender, message) 
{
   $("#chat-messages").html(message)
}

async function fetchAIResponse(prompt) {
    // API Ű�� ������ ��ġ���� ����������.

    // API ��û�� ����� �ɼ��� ����
    const requestOptions = {
        method: 'POST',
        // API ��û�� ����� ����
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer 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`
        },
        body: JSON.stringify({
            model: "gpt-3.5-turbo",  // ����� AI ��
            messages: [{
                role: "user", // �޽��� ������ user�� ����
                content: prompt // ����ڰ� �Է��� �޽���
            }],
            temperature: 0.8, // ���� ��� �پ缺
            max_tokens: 1024, // ������� �޽��� �ִ� ��ū(�ܾ�) �� ����
            top_p: 1, // ��ū ���ø� Ȯ���� ����
            frequency_penalty: 0.5, // �Ϲ������� ������ �ʴ� �ܾ �����ϴ� ����
            presence_penalty: 0.5, // ������ �ܾ ������ �ݺ��Ǵ� ���� �����ϴ� ����
            stop: ["Human"] // ������ �ؽ�Ʈ���� ���� ������ ����
        }),
    };

    const apiEndpoint = 'https://api.openai.com/v1/chat/completions';

    // API ��û�� ���� ó��
    try {
        const response = await fetch(apiEndpoint, requestOptions);
        const data = await response.json();
        const aiResponse = data.choices[0].message.content;
        return aiResponse;
    } catch (error) {
        console.error('OpenAI API ȣ�� �� ���� �߻�:', error);
        return 'OpenAI API ȣ�� �� ���� �߻�';
    }
}

async function click(){
	if($("#keywords").val() == "")
	{
		alert("Ű���带 �Է��ϼ���.")
		$("#keywords").focus();
		return false;
	}
	$("#chat-messages").html('<span id="loading"><img src="../image/LoadingImg.gif" style="width:50px; height:50px"></span>');
	// ����ڰ� �Է��� �޽���
    const keyword = $("#keywords").val().trim();
    const message = "���� ���� ��ǥ�� �����ؼ� " + keyword + " ���� Ű���� 10�� ��õ����"
    alert(message)
    // �޽����� ��������� ����
    if (message.length === 0) return;
    // ����� �޽��� ȭ�鿡 �߰�
    //ChatGPT API ��û�� �亯�� ȭ�鿡 �߰�
    const aiResponse = await fetchAIResponse(message);
    addMessage('ê��', aiResponse);
}
</script>
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
      img.style.width = '800px';
      img.style.height = '150px';
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
		$("#upload").submit();
	}
}
</script>
<script>
function LoadingWithMask() {
		//ȭ���� ���̿� �ʺ� ���մϴ�.
var maskHeight = $(document).height();
		var maskWidth = window.document.body.clientWidth;
		//ȭ�鿡 ����� ����ũ�� �������ݴϴ�.
		var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
		var loadingImg = '';
		loadingImg += "<div id='loadingImg'>";
		loadingImg += " <img src='LoadingImg.gif' 
		style='position: relative; display: block; margin: 0px auto;'/>";
		loadingImg += "</div>";
		//ȭ�鿡 ���̾� �߰�
		$('body')
		.append(mask)
		.append(loadingImg)
		//����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä��ϴ�.
		$('#mask').css({
			'width' : maskWidth,
			'height': maskHeight, 
			'opacity' : '0.3'}); 
		//����ũ ǥ��
		$('#mask').show();
		//�ε��� �̹��� ǥ��
		$('#loadingImg').show();}
</script>
	<form id="upload" name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data">
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
			<td colspan="12" align="right">�ȼ� : 800 * 150<hr></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>��ǰ�̸�:</h4></td>
			<td colspan="3" width="100px">
				<input type="text" id="name" name="name" style="width:400px; height:30px" placeholder="��ǰ�̸��� �Է����ּ���.">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><h4>Ű����:</h4></td>
			<td>
				<input type="text" id="keywords" name="keywords" style="width:400px; height:30px" placeholder="Ű����� , ������ �Է����ּ���">
				<a href = "javascript:click()"><input type="button" id="submitbutton" value="Ű���� ��õ"></a>
			</td>
		</tr>
		<tr height="60px">
			<td colspan="5" align="center">
				<div id="chat-container">
			       <div id="chat-messages"></div>
			   </div>
			</td>
		</tr>
		<tr>
			<td height="50px" colspan="5"></td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
				<input type="button" id="submitbutton" value="�Ϸ�" onclick="DoWrite()">&emsp;
				<input type="button" id="cancelbutton" value="���" onclick="window.history.back()">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 