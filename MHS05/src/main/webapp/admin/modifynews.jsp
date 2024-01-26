<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<%
if( loginVO == null)
{	
	//로그인 하지 않은 경우 처리
	response.sendRedirect("../main/index.jsp");
	return;
}
%>
<script>
	function check() 
	{	
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
		//스마트 에디터 값을 텍스트컨텐츠로 전달
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
	.title
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
	<form name="upload" method="post" action="aduploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
		<tr>
			<td colspan="12"><h2><b>건강뉴스</b></h2><hr></td>
		</tr>
		<tr>
			<td height="50px"></td>
		</tr>
		<tr>
			<td>
				<div class="title">
					<h4>제목 : 
						<input id=" title" type="text" style="width:700px;height:20px;" placeholder="“당장 일어나세요”… 심장 혈관 망가지는 최악의 습관은?">
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="type">
					<h4>카테고리 : 
						<select style="width:100px;">
							<option value="선택">선택</option>
							<option value="다이어트" selected>다이어트</option>
							<option value="음식">음식</option>
							<option value="운동">운동</option>
							<option value="영양제">영양제</option>
							<option value="남성건강">남성건강</option>
							<option value="여성건강">여성건강</option>
						</select>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="mainyn" id="mainyn">
					<h4>메인여부 : 
						<label><input type="radio" name="main" value="Y">Y</label>
						<label><input type="radio" name="main" value="N" checked>N</label>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="image"><h4>이미지 업로드 : </h4></div>
				<div class="uploadbutton" id="uploadbutton">
					<label for="image">
						<span class="btn-upload" id="btn-upload">이미지 업로드</span>
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
				<div class="displayi"><h4>이미지 나오는 곳 : </h4></div>
				<div class="image_container" id="image_container"><img src="../image/diet.jpg" width="900px" height="300px"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="note"><h2>내용 : </h2></div>
				<div class="noteinput" id="noteinput">
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:900px;height:500px;">
						심장병이 있으면 일상생활에서 어려움이 참 많다. 특히 심장 혈관이 막히는 심근경색증은 돌연사 위험도 있다. 추위에 혈관이 수축하는 요즘엔 더욱 조심해야 한다. 심혈관 질환을 예방-관리하기 위해선 혈압-고지혈증 조절, 금연, 식사 관리 등이 필요하지만 몸도 자주 움직여야 한다. 꼭 운동을 하라는 얘기가 아니다. 일상에서 몸을 사용하라는 것이다.

						오래 앉아 있는 습관 지속했더니… 심혈관 질환 사망 위험 34% 높다
						
						미국의사협회의 국제 학술지(JAMA Network Open)에 장시간 앉아서 일하는 사람은 모든 원인에 의한 사망 위험이 16% 높고, 심혈관 질환으로 인한 사망 위험은 34% 높다는 논문이 실렸다. 직장인 48만여 명을 13년 동안 추적 관찰해 신체 활동과 건강 위험의 상관성을 살핀 것이다.
						
						세계보건기구(WHO)에 따르면 건강에 좋은 신체 활동은 운동 외에도 일어서서 전화 통화, 물건 옮기기, 청소 등 몸을 움직이는 다양한 활동을 말한다. 집에서도 오래 앉아 있는 습관이 지속되면 혈관병, 대장암 등 여러 질병 위험이 높아진다. 일상에서 움직여야 건강을 지킬 수 있다.
						
						“귀찮아서”… “지금 당장 일어나 거실이라도 걸으세요”
						
						정식 운동을 하려먼 복장, 기구, 이동 거리 등이 필요하다. 무척 번거롭고 날씨도 춥다. 이럴 때 집에서 몸을 움직여보자. 소파에 누워 있지 말고 일어서서 스마트폰이나 TV를 보는 것이다. 거실 끝과 끝을 왕복하거나 발뒤꿈치를 들어 올리는 종아리 근력 운동도 좋다. 무릎이 괜찮으면 스쿼트를 통해 허벅지 근력을 단련해보자. 집안 청소는 훌륭한 신체 활동이다. 비싼 헬스 클럽 운동만 할 게 아니다.
						
						몸의 경고 신호… 혈압-혈당 관리, 금연, 싱겁게 먹기 등
						
						교통사고처럼 어느 날 갑자기 심혈관 질환이 생기는 것이 아니다. 높은 혈압-혈당, 고지혈증(이상지질혈증), 비만, 흡연, 짜게 먹는 식습관, 운동 부족 등이 출발점이다. 건강 검진에서 나쁜 성적표를 받았는데도 몸 관리를 하지 않으면 혈관병 위험이 높다. 심근경색증까지 가면 일상생활이 험난하다. 심장병 예방도 혈압-혈당, 고지혈증 관리가 기본이다. 당연히 담배를 끊고 덜 짜게 먹는 등 음식도 조심해야 한다.
						
						자녀의 건강에도 영향… 나쁜 습관 공유하지 않도록 해야
						
						심장병도 가족력이 있다. 하지만 같은 식단을 공유하는 등 일상의 습관이 더 큰 영향을 미친다. 움직이기 싫어하고 짠 음식을 좋아하는 경우 어린 자녀들도 닮는다. 가족 중에 고혈압, 심장병 환자가 많이 나오는 이유다.
						
						지금 중년 이상의 나이라면 혈관병 예방-관리에 집중해야 한다. 병치레를 오래 하면 생업에 바쁜 자녀들에게 엄청난 부담을 준다. 내 건강을 지켜야 아들, 딸이 편하다. 간병비 때문에 고민하는 일이 없도록 해야 한다.
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
			</td>
		</tr>
		<tr>
			<td>
				<span class="submit" id="submit"><a href="adminnewsview.jsp">등록</a></span>
				<span class="cancel" id="cancel"><a href="adminnewsview.jsp">취소</a></span>
			</td>
		</tr>
	</form>
<%@ include file="../admininclude/tail.jsp" %> 