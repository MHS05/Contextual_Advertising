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
		<title>소음인</title>
	</head>
	<body>
		<table border="0" align="center" width="1200px">
			<tr>
				<td style="width:350px; height:150px; font-size:40px"><img src="../image/write.jpg"><b>체질검사 결과</b></td>
				<td style="color:#E47D22; font-size:50px"><b>소음인</b></td>
			</tr>
			<tr>
				<td colspan="3" style="font-size:32px">
					<ul>
						<li>소음인은 소화장애를 잘 일으키고 냉한 체질이기 때문에 수족이 차고 설사를 자주하는 체질이며 우측귀와 눈이 약한 편이고 손발이 저리고 떨리며 힘이 잘 빠지는 타입이다.<br><br></li>
						<li>따라서 소화기능을 강화하고 열 에너지를 보강하는 음식이나 약재가 좋다.<br><br></li>
						<li>소화하기 쉽고 따뜻한 성질의 식품으로써 대표적인 약재는 인삼이며 삼계탕이나 개고기, 부추, 쑥 등을 맣이 먹으면 좋다.<br><br></li>
						<li>그러나 소화하기 힘든 지방질 음식이나 찬성질의 음식과 날음식 등은 피한다.<br><br></li>
						<li>냉면, 참외, 수박, 냉우유, 빙과류, 생맥주, 보리밥, 돼지고기, 오징어, 밀가루음식, 라면 등은 피하는 것이 좋다.</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="soeuminf.jsp">
					<input type="button" value="나를 위한 음식 더 알아보기 >" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>