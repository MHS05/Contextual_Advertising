<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String uno = request.getParameter("uno");
String con = request.getParameter("con");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>소양인음식정보</title>
	</head>
	<body>
		<style>
			#type
			{
				background-color: #EAEAEA;
			}
		</style>
		<script>
			function sendcon() 
			{	
				location.href="testok.jsp?uno=" + <%= uno %> + "&con=소양인";
				window.close();
			}
			
			function sendChildValue(con) 
			{	//회원가입창(부모창)으로 값 전달하고 창닫는 함수 
				opener.setChildValue(con);
				window.close();
			}
		</script>
		<table border="0" align="center" width="1200px">
			<tr>
				<td width="70px"><img src="../image/write.jpg" style="width:70px;"></td>
				<td width="200px"><h2>체질검사 결과</h2></td>
				<td style="color:#F1C40F"><h1>소양인</h1></td>
			</tr>
			<tr>
				<td colspan="3" align="center" height="500px">
					<table border="1" width="1000px" height="500px">
						<tr>
							<td id="type" align="center"><h3>구분</h3></td>
							<td><font size="4">유익한 식품</font></td>
							<td><font size="4">해로운 식품</font></td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>곡물</h3></td>
							<td><font size="4">보리, 팥, 검정콩, 들깨, 밀, 메밀, 녹두</font></td>
							<td><font size="4">현미, 율무, 옥수수, 찹쌀, 참깨, 차조, 수수</font></td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>채소</h3></td>
							<td>
								<font size="4">
									배추, 오이, 미나리, 숙주나물, 냉이,
									<br>
								 	영지버섯, 송이버섯, 상추, 고사리, 가지,
								 	<br>
								 	씀바귀, 알로에, 깻잎, 우엉, 신선초
							 	</font>
						 	</td>
							<td>
								<font size="4">
									콩나물, 부추, 파, 당근, 감자, 고구마, 더덕,
									<br>
									파슬리, 생강, 고추, 참마, 참기름
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>과일</h3></td>
							<td>
								<font size="4">
									수박, 딸기, 포도, 감, 키위, 파인애플, 참외,
									<br>
									바나나, 멜론, 무화과, 건포도
								</font>
							</td>
							<td>
								<font size="4">
									귤, 오렌지, 레몬, 대추, 석류, 복숭아, 호두,
									<br>
									땅콩, 밤, 자몽
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>어류, 육류</h3></td>
							<td>
								<font size="4">
									대구, 은어, 가오리, 게, 어패류, 오징어,
									<br>
									문어, 낙지, 광어, 도다리, 복어, 고등어,
									<br>
									청어, 돼지고기, 오리고기, 앤초비
								</font>
							</td>
							<td>
								<font size="4">
									장어, 미꾸라지, 김, 다시마, 파래, 미역
									<br>
									닭고기, 개고기, 염소고기, 꿩고기, 옻닭,
									<br>
									사슴소고기, 노루고기
								</font>
							</td>
						</tr>
					</table>				
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<a href="javascript:sendChildValue('소양인');"> <!-- 회원가입(부모창)으로 값 전달하는 함수실행  -->
					<input type="button" value="확인" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE">
					</a>
				</td>
			</tr>
		</table>
	</body>
</html>