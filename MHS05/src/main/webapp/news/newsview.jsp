<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<style>
#newstitle
{
	margin-left: 15px;
}


#newsimage
{
	text-align: center;	
}

#adimage
{	
	margin-top : 20px;
	text-align:center;
}

#newsnote
{	
	width: 750px;
	font-size : large;
	margin: auto;
}

#listbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
}

#fixed 
{
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 100px;
	padding: 5px;
	color: white;
}
</style>
<div id="fixed" style="width:50px; height: 50px;">
	<a href="#top"><img style="width:50px; height: 50px;" src="../image/topbutton.png"></a>
</div>
<table border="0" align="center" width="1200px">
	<tr>
		<td width="200px" valign="top" >		
			<div><a href="news.jsp"><h1><u>건강소식</u></h1></a></div> 	
			<div style="width:220px; height:360px; box-shadow: 3px 3px 3px 3px lightgray">
				<table border="0" align="left" width="200px" height="50px">
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=D"><b>다이어트</b></a></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=F"><b><u>음식</u></b></a></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=E"><b>운동</b></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=N"><b>영양제</b></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=M"><b>남성건강</b></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=F"><b>여성건강</b></td>
					</tr>
					<tr height="50px">
						<td></td>
					</tr>
				</table>
			</div>
		</td>
		<td width="20px">
		</td>
		<td valign="top">
			<div style="border-bottom: 1px solid lightgray; "><h2>다이어트</h2></div>
			<div id="newstitle"><h2>“당장 일어나세요”… 심장 혈관 망가지는 최악의 습관은?</h2>
				<span><font color="gray" size="2px">입력&nbsp;<time>2024-01-19</time></font></span><br>
				<span>김용 기자</span>
			</div>
			<div style="height:50px"></div>
			<div id="newsimage">
				<img src="../image/diet.jpg">
			</div>
			<div id="adimage">
				<a href="../highchart/highchart01.jsp" target="_blanck"><img width="800px" height="140px" src="../image/dosu.jpg"></a>
			</div>
			<div style="height:50px"></div>
			<div id="newsmain" style="">
				<div id="newsnote">
					심장병이 있으면 일상생활에서 어려움이 참 많다. 특히 심장 혈관이 막히는 심근경색증은 돌연사 위험도 있다. 추위에 혈관이 수축하는 요즘엔 더욱 조심해야 한다. 심혈관 질환을 예방-관리하기 위해선 혈압-고지혈증 조절, 금연, 식사 관리 등이 필요하지만 몸도 자주 움직여야 한다. 꼭 운동을 하라는 얘기가 아니다. 일상에서 몸을 사용하라는 것이다.<br>
					<br>
					<b>오래 앉아 있는 습관 지속했더니… 심혈관 질환 사망 위험 34% 높다</b><br>
					<br>
					미국의사협회의 국제 학술지(JAMA Network Open)에 장시간 앉아서 일하는 사람은 모든 원인에 의한 사망 위험이 16% 높고, 심혈관 질환으로 인한 사망 위험은 34% 높다는 논문이 실렸다. 직장인 48만여 명을 13년 동안 추적 관찰해 신체 활동과 건강 위험의 상관성을 살핀 것이다.<br>
					<br>
					세계보건기구(WHO)에 따르면 건강에 좋은 신체 활동은 운동 외에도 일어서서 전화 통화, 물건 옮기기, 청소 등 몸을 움직이는 다양한 활동을 말한다. 집에서도 오래 앉아 있는 습관이 지속되면 혈관병, 대장암 등 여러 질병 위험이 높아진다. 일상에서 움직여야 건강을 지킬 수 있다.<br>
					<br>
					<b>“귀찮아서”… “지금 당장 일어나 거실이라도 걸으세요”</b><br>
					<br>
					정식 운동을 하려먼 복장, 기구, 이동 거리 등이 필요하다. 무척 번거롭고 날씨도 춥다. 이럴 때 집에서 몸을 움직여보자. 소파에 누워 있지 말고 일어서서 스마트폰이나 TV를 보는 것이다. 거실 끝과 끝을 왕복하거나 발뒤꿈치를 들어 올리는 종아리 근력 운동도 좋다. 무릎이 괜찮으면 스쿼트를 통해 허벅지 근력을 단련해보자. 집안 청소는 훌륭한 신체 활동이다. 비싼 헬스 클럽 운동만 할 게 아니다.<br>
					<br>
					<b>몸의 경고 신호… 혈압-혈당 관리, 금연, 싱겁게 먹기 등</b><br>
					<br>
					교통사고처럼 어느 날 갑자기 심혈관 질환이 생기는 것이 아니다. 높은 혈압-혈당, 고지혈증(이상지질혈증), 비만, 흡연, 짜게 먹는 식습관, 운동 부족 등이 출발점이다. 건강 검진에서 나쁜 성적표를 받았는데도 몸 관리를 하지 않으면 혈관병 위험이 높다. 심근경색증까지 가면 일상생활이 험난하다. 심장병 예방도 혈압-혈당, 고지혈증 관리가 기본이다. 당연히 담배를 끊고 덜 짜게 먹는 등 음식도 조심해야 한다.<br>
					<br>
					<b>자녀의 건강에도 영향… 나쁜 습관 공유하지 않도록 해야</b><br>
					<br>
					심장병도 가족력이 있다. 하지만 같은 식단을 공유하는 등 일상의 습관이 더 큰 영향을 미친다. 움직이기 싫어하고 짠 음식을 좋아하는 경우 어린 자녀들도 닮는다. 가족 중에 고혈압, 심장병 환자가 많이 나오는 이유다.<br>
					<br>
					지금 중년 이상의 나이라면 혈관병 예방-관리에 집중해야 한다. 병치레를 오래 하면 생업에 바쁜 자녀들에게 엄청난 부담을 준다. 내 건강을 지켜야 아들, 딸이 편하다. 간병비 때문에 고민하는 일이 없도록 해야 한다.<br>
					<br>
				</div>
			</div>
			<div style="height: 20px"></div>
			<div style="text-align: center;">
				<div id="listbutton">목록</div>
			</div>
		</td>
	</tr>
</table>
<%@ include file="../include/tail.jsp" %>