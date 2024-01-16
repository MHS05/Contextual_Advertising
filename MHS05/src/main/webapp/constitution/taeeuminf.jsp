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
		<title>태음인음식정보</title>
	</head>
	<body>
		<style>
			#type
			{
				background-color: #EAEAEA;
			}
		</style>
		<script>
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
				<td style="color:#1ABC9C"><h1>태음인</h1></td>
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
							<td><font size="4">쌀, 현미, 찹쌀, 율무, 수수, 참깨, 메주콩</font></td>
							<td><font size="4">보리, 팥, 메밀, 들깨, 녹두, 검은콩</font></td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>채소</h3></td>
							<td>
								<font size="4">
									무, 파, 콩나물, 당근, 토란, 표고버섯,
									<br>
								 	호박, 고구마, 도라지, 마늘, 더덕, 고추
							 	</font>
						 	</td>
							<td>
								<font size="4">
									비름, 가지, 돌나물, 달래, 컴프리, 상추,
									<br>
									고사리, 배추, 씀바귀, 신선초, 미나리,
									<br>
									쑥갓, 비트, 양상추
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>과일</h3></td>
							<td>
								<font size="4">
									사과, 복숭아, 살구, 자두, 오렌지, 수박, 밤,
									<br>
									호두
								</font>
							</td>
							<td>
								<font size="4">
									포도, 참외, 앵두, 파인애플, 무화과, 모과
									<br>
									대추, 키위, 머루, 곶감, 바나나, 멜론
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>어류, 육류</h3></td>
							<td>
								<font size="4">
									갈치, 미역, 김, 멸치, 명태, 북어, 상어, 장어,
									<br>
									쏘가리, 굴비, 쇠고기, 사슴고기
								</font>
							</td>
							<td>
								<font size="4">
									붕어, 잉어, 고등어, 청어, 꽁치, 정어리,
									<br>
									참치, 방어, 오징어, 낙지, 문어, 조개류, 게,
									<br>
									홍합, 전복, 굴, 소라, 등 푸른 생선류
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
				<td colspan="3" align="center"><a href="javascript:sendChildValue('태음인');"> <!-- 회원가입(부모창)으로 값 전달하는 함수실행  -->
					<input type="button" value="확인" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>