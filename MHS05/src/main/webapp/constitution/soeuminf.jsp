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
		<title>소음인음식정보</title>
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
				<td style="color:#E67E22"><h1>소음인</h1></td>
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
							<td><font size="4">현미, 찹쌀, 옥수수, 차조, 참깨</font></td>
							<td><font size="4">보리, 팥, 율무, 메밀, 들깨</font></td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>채소</h3></td>
							<td>
								<font size="4">
									시금치, 감자, 고구마, 부추, 마늘, 생강,
									<br>
								 	콩나물, 고추, 호박, 무, 쑥, 표고버섯, 파,
								 	<br>
								 	야콘, 기장, 파래
							 	</font>
						 	</td>
							<td>
								<font size="4">
									배추, 오이, 상추, 고사리, 숙주, 미나리,
									<br>
									도라지, 더덕, 마, 녹두, 아욱, 신선초, 어성초
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>과일</h3></td>
							<td>
								<font size="4">
									사과, 귤, 오렌지, 복숭아, 대추, 석류, 레몬,
									<br>
									은행
								</font>
							</td>
							<td>
								<font size="4">
									수박, 참외, 포도, 배, 바나나, 키위, 곶감
								</font>
							</td>
						</tr>
						<tr>
							<td id="type" align="center"><h3>어류, 육류</h3></td>
							<td>
								<font size="4">
									미꾸라지, 김, 조기, 명태, 다시마, 미역, 멸치,
									<br>
									메기, 꿩, 닭고기, 염소, 노루, 개, 뱀종류
								</font>
							</td>
							<td>
								<font size="4">
									고등어, 꽁치, 소라, 게. 청어, 낙지, 문어,
									<br>
									오징어, 새우, 갈치, 해삼, 멍게, 참치, 가오리,
									<br>
									돼지고기, 오리고기
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
				<td colspan="3" align="center"><a href="javascript:sendChildValue('소음인');"> <!-- 회원가입(부모창)으로 값 전달하는 함수실행  -->
					<input type="button" value="확인" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>