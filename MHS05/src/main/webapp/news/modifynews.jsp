<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/newshead.jsp" %>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<style>
	#type
	{
		width            : 100px;
		text-align       : center;
		padding-top      : 30px;
		padding-bottom   : 30px;
		background-color : white;
		border-radius    : 15px;
		cursor           : pointer;
		float            : left;
		margin-right     : 15px;
		box-shadow       : 1px 3px 5px 3px lightgray;
	}
	.head
	{
		position : absolute;
		top      : 220px;
		left     : 600px;
	}
	.line
	{
		position      : absolute;
		top           : 310px;
		left          : 600px;
		border-bottom : 3px solid lightgray;
		width         : 950px;
	}
	.title
	{
		position : absolute;
		top      : 330px;
		left     : 600px;
	}
	.mainyn
	{
		position : absolute;
		top      : 390px;
		left     : 600px;
	}
	.image
	{
		position : absolute;
		top      : 450px;
		left     : 600px;
	}
	.btn-upload
	{
		position         : absolute;
		top              : 465px;
		left             : 780px;
		padding          : 10px 10px;
		border-radius    : 10px;
		background-color : #4dd5b0;
	}
	.upload
	{
		position : absolute;
		top      : 480px;
		left     : 920px;
	}
	#image 
	{
		display : none;
	}
	.displayi
	{	
		position : absolute;
		top      : 500px;
		left     : 600px;
	}
	.image_container
	{
		position : absolute;
		top      : 570px;
		left     : 600px;
		height   : 300px;
		width    : 950px;
		border   : 1px solid black;
	}
	.note
	{
		position : absolute;
		top      : 880px;
		left     : 600px;
	}
	.noteinput
	{
		position : absolute;
		top      : 950px;
		left     : 600px;
		width    : 960px;
	}
	.submit
	{
		position         : absolute;
		top              : 1630px;
		left             : 900px;
		background-color : #4dd5b0;
		padding          : 10px 50px;
		border           : 1px solid #4dd5b0;
		border-radius    : 10px;
	}
	.cancel
	{
		position         : absolute;
		top              : 1630px;
		left             : 1150px;
		background-color : lightgrey;
		padding          : 10px 50px;
		border           : 1px solid lightgrey;
		border-radius    : 10px;
	}
</style>
<script>
	function check() 
	{	
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
		//스마트 에디터 값을 텍스트컨텐츠로 전달
		$("#").submit();
	}
	function setThumbnail(event) {
		$("#viewimage").css("display","none");
		$("#image_container").html("");
		
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.style.width  = "950px";
          img.style.height = "300px";
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
	<table border="0" align="center" width="1200px" height="1600px">
		<tr>
			<td rowspan="3" width="200px" valign="top" >		
				<div><a href="news.jsp"><h1><u>건강소식</u></h1></a></div> 	
				<div style="width:220px; height:360px; box-shadow: 3px 3px 3px 3px lightgray">
					<table border="0" align="left" width="200px" height="50px">
						<tr height="50px">
							<td style="font-size: 20px;"><a href="category.jsp"><b>다이어트</b></a></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="category.jsp"><b><u>음식</u></b></a></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="category.jsp"><b>운동</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="category.jsp"><b>영양제</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="category.jsp"><b>남성건강</b></td>
						</tr>
						<tr height="50px">
							<td style="font-size: 20px;"><a href="category.jsp"><b>여성건강</b></td>
						</tr>
						<tr height="50px">
							<td></td>
						</tr>
					</table>
				</div>
			</td>	
		</tr>
		<tr>
			<td valign="top" colspan="2">
				<div class="head"><h1>건강소식</h1></div>
				<div class="line"></div>
				<div class="title">
					<h2>제목 : 
						<input id=" title" type="text" style="width:870px;height:30px;" value="임신하면 원래 어질어질?...이럴 땐 위험 신호">
					</h2>
				</div>
				<div class="mainyn" id="mainyn">
					<h2>메인여부 : 
						<label><input type="radio" name="main" value="Y" checked>Y</label>
						<label><input type="radio" name="main" value="N">N</label>
					</h2>
				</div>
				<div class="image"><h2>이미지 업로드 : </h2></div>
				<div class="uploadbutton" id="uploadbutton">
					<label for="image">
						<span class="btn-upload" id="btn-upload">이미지 업로드</span>
					</label>
				</div>
				<div class="upload" id="upload">
					<input type="file" name="image" id="image" accept="image/*" onchange="setThumbnail(event);">
				</div>
				<div class="displayi"><h2>이미지 나오는 곳 : </h2></div>
				<div class="image_container" id="image_container">
					<img src="../image/ad.jpg" id="viewimage" style="width:950px; height:300px;">
				</div>
				<div class="note"><h2>내용 : </h2></div>
				<div class="noteinput" id="noteinput">
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:950px;height:500px;">
						흔히 임신을 하면 입덧, 요통, 다리나 발 부종, 그리고 어지럼증 등의 증상을 겪는다. 하지만 임신이 이유라고 생각한 어지럼증은 사실은 더 큰 질환을 알리는 신호일 수 있어 주의가 필요하다.
						‘미국 심장협회(AHA)’는 임신을 하면, 특히 임신 초기 어지럼증은 호르몬 변화에 따른 혈압 감소, 낮은 혈당 수치 등으로 인한 자연스러운 증상이지만 그렇다고 당연하게 여기면 안 된다고 강조했다. 어지럼증이 갑자기 나타나거나 평소와 상태가 많이 다르다고 느껴지면 증상을 잘 관찰하고 수시로 의료진을 찾아 진료를 받아야 한다. 여기다 임신 단계별 어지럼증의 원인에 무엇이 있는지 알아두면 산모와 태아 모두를 지키는 데 큰 도움이 될 수 있다.
						
						임신 초기: 임신 초기는 ‘입덧’이라고 부르는 메스꺼움, 구토 등으로 탈수가 생길 수 있고 이에 따른 어지럼증이 있을 수 있다. 일단은 수분을 충분히 섭취하고 일어날 때는 되도록 천천히 일어나보자. 식사를 잘 하지 못하고 계속 구토를 할 경우 전해질 보충을 위해 가끔은 스포츠 음료를 마시고 혈액 순환을 위해 압박 양말을 신는 것도 도움이 된다.
						
						충분한 수분을 섭취하고 푹 쉬었는데도 여전히 어지럽거나 숨이 가쁜 증상이 있다면 이상 신호로 여기고 병원을 찾아야 한다. 잠이 들었는데 숨이 차서 깼거나 숨이 가빠 몸을 침대에 완전히 뉘일 수 없는 경우도 심혈관 질환의 신호일 수 있다. 갑자기 정신을 잃었다면 무조건 병원행이다. 2019년 《미국 심장학회지(Journal of the American Heart Association)》에 실린 연구에 따르면 임신 초기 실신은 조산이나 난산을 겪을 위험을 높이고 심장 관련 기저질환이 원인일 가능성이 있다.
						
						임신 2기(14~27주): 보통 안정기인 2기에 접어들면 입덧이 사라지면서 식욕이 늘고 기운도 나기 시작한다. 이에 따라 어지럼증도 자연스럽게 사라지므로 여전히 어지럽다면 병원을 찾는 것이 좋다. 보통은 신경학적인 이유로 현기증이 생기거나 자궁이 커짐에 따라 산모의 혈관이 눌려 혈액순환이 잘 되지 않는 것이 원인일 수 있다.
						
						임신 3기(28~40주): 임신 후반부인 3기에 생기는 어지럼증은 흔히 임신중독증으로 알고 있는 자간전증이나 고혈압 관련 장애가 원인일 수 있어 세심한 주의가 필요하다. 자간전증은 임신에 영향을 미칠 수 있는 위험한 질환으로 보통 임신 20주 이후에 생길 수 있다.
						
						산모 혈압이 높아지면 태아에게로 흘러가는 혈액량이 줄어 부정적인 영향을 줄 수 있다. AHA 2021년 보고서에 따르면 자간전증으로 인해 조산을 하거나 아이가 임신 주수에 비해 작게 태어날 가능성이 있다. 산모의 경우 출산 후 심혈관 질환 등의 발병 위험이 커지고 심하면 사망에 이르기도 한다.
						
						따라서 이 시기 어지럼증이 있다면 수시로 혈압을 체크하고 소변에 이상은 없는지, 혹은 다른 증상은 없는지 유심히 살펴야 한다. 보통 고혈압이 지속돼 소변 단백질 수치가 늘거나 혈소판이 감소하고 간이나 신장 문제, 폐에 물이 차거나 신경학적 문제가 생기면 자간전증으로 진단한다.
						
						
						출산 후: 출산을 했다고 해도 끝이 아니다. 매우 드문 경우이기는 하지만 출산 후 심근병증으로 산모가 심부전을 일으키는 경우도 있다. 심근병증은 심장 근육이 손상되고 약해져 제대로 일을 하지 못하는 상태를 말한다. 대표적인 증상이 현기증과 호흡 곤란으로 출산을 했다고 해도 어지럼증이 지속되고 숨이 가쁘다면 바로 의료진을 찾아 원인이 무엇인지 확인해야 한다.
					</textarea>
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
				<span class="submit" id="submit"><a href="viewnews.jsp">수정완료</a></span>
				<span class="cancel" id="cancel"><a href="viewnews.jsp">취소</a></span>
			</td>
		</tr>
	</table>
<%@ include file="../admininclude/newstail.jsp" %>