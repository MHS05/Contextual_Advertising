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
		<title>태양인음식정보</title>
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
				<td style="color:red"><h1>태양인</h1></td>
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
							<td><font size="4">쌀, 보리, 들깨, 메밀, 완두콩</font></td>
							<td><font size="4">현미, 찹쌀, 율무, 참깨, 메주콩, 수수</font></td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>채소</h3></td>
							<td>
								<font size="4">
									배추, 상추, 달래쑥갓, 가지, 비름, 깻잎,
									<br>
								 	돌나물, 송이버섯
							 	</font>
						 	</td>
							<td>
								<font size="4">
									무, 토란, 당근, 더덕, 열무, 도라지, 두릅,
									<br>
									고추, 마늘, 생강, 콩나물, 감자, 고구마,
									<br>
									표고버섯, 영지버섯, 미나리
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>과일</h3></td>
							<td>
								<font size="4">
									포도, 감, 파인애플, 무화과, 바나나, 앵두,
									<br>
									키위, 모과
								</font>
							</td>
							<td>
								<font size="4">
									사과, 배, 대추, 수박, 살구, 자두, 복숭아,
									<br>
									호두, 은행, 밤, 땅콩
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>어류, 육류</h3></td>
							<td>
								<font size="4">
									붕어, 잉어, 고등어, 연어, 해삼, 멍게,
									<br> 
									오징어, 낙지, 문어, 모든 조개류
								</font>
							</td>
							<td>
								<font size="4">
									미꾸라지, 민물장어, 상어, 쏘가리, 북어,
									<br>
									다시마, 미역, 김, 파래, 모든 육류
								</font>
							</td>
						</tr>
					</table>				
				</td>
			<tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><a href="javascript:sendChildValue('태양인');"> <!-- 회원가입(부모창)으로 값 전달하는 함수실행  -->
					<input type="button" value="확인" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>