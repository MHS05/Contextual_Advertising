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

//채팅 메시지를 표시할 DOM
const chatMessages = document.querySelector('#chat-messages');
// 사용자 입력 필드
const userInput = document.querySelector('#user-input input');
// 발급받은 OpenAI API 키를 변수로 저장
const apiKey = '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';
// OpenAI API 엔드포인트 주소를 변수로 저장
const apiEndpoint = 'https://api.openai.com/v1/chat/completions'

function addMessage(sender, message) 
{
   $("#chat-messages").html(message)
}

async function fetchAIResponse(prompt) {
    // API 키를 적절한 위치에서 가져오세요.

    // API 요청에 사용할 옵션을 정의
    const requestOptions = {
        method: 'POST',
        // API 요청의 헤더를 설정
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer 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`
        },
        body: JSON.stringify({
            model: "gpt-3.5-turbo",  // 사용할 AI 모델
            messages: [{
                role: "user", // 메시지 역할을 user로 설정
                content: prompt // 사용자가 입력한 메시지
            }],
            temperature: 0.8, // 모델의 출력 다양성
            max_tokens: 1024, // 응답받을 메시지 최대 토큰(단어) 수 설정
            top_p: 1, // 토큰 샘플링 확률을 설정
            frequency_penalty: 0.5, // 일반적으로 나오지 않는 단어를 억제하는 정도
            presence_penalty: 0.5, // 동일한 단어나 구문이 반복되는 것을 억제하는 정도
            stop: ["Human"] // 생성된 텍스트에서 종료 구문을 설정
        }),
    };

    const apiEndpoint = 'https://api.openai.com/v1/chat/completions';

    // API 요청후 응답 처리
    try {
        const response = await fetch(apiEndpoint, requestOptions);
        const data = await response.json();
        const aiResponse = data.choices[0].message.content;
        return aiResponse;
    } catch (error) {
        console.error('OpenAI API 호출 중 오류 발생:', error);
        return 'OpenAI API 호출 중 오류 발생';
    }
}

async function click(){
	// 사용자가 입력한 메시지
    const keyword = $("#keywords").val().trim();
    const message = "숫자 없이 쉼표로 구분해서 " + keyword + " 관련 키워드 10개 추천해줘"
    alert(message)
    // 메시지가 비어있으면 리턴
    if (message.length === 0) return;
    // 사용자 메시지 화면에 추가
    //ChatGPT API 요청후 답변을 화면에 추가
    const aiResponse = await fetchAIResponse(message);
    addMessage('챗봇', aiResponse);
}



</script>
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
		$("#upload").submit();
	}
}
</script>
	<form id="upload" name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data">
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
			<td colspan="12" align="right">픽셀 : 800 * 150<hr></td>
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
				<a href = "javascript:click()">키워드 추천받기</a>
			</td>
		</tr>
		<tr>
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
				<input type="button" id="submitbutton" value="완료" onclick="DoWrite()">&emsp;
				<input type="button" id="cancelbutton" value="취소" onclick="window.history.back()">
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 