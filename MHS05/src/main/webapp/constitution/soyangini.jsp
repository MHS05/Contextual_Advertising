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
		<title>소양인</title>
	</head>
	<script>
		function send() 
		{
			location.href="soyanginf.jsp?uno=" + <%= uno %>;
		}
	</script>
	<body>
		<table border="0" align="center" width="1200px">
			<tr>
				<td style="width:350px; height:150px; font-size:40px"><img src="../image/write.jpg"><b>체질검사 결과</b></td>
				<td style="color:#1ABC9C; font-size:50px"><b>소양인</b></td>
			</tr>
			<tr>
				<td colspan="3" style="font-size:32px">
					<ul>
						<li>소양인은 비뇨생식기 질환이나, 정력감퇴, 요통 등으로 곧잘 고생합니다.<br><br></li>
						<li>싱싱하고 찬음식이나 채소류, 결명자, 미나리즙, 녹두죽, 팥죽, 수박, 오이 등이 좋으며 특히 돼지고기나 해삼 등은 많이 섭취하면 좋습니다.<br><br></li>
						<li>자극성 음식이나 열이 많은 음식은 피한다.<br><br></li>
						<li>예로써 고추, 생강, 파, 마늘, 후추, 겨자, 카레 같은 자극성 음식과 닭고기, 노루고기, 개고기, 염소고기, 꿀, 인삼, 부자, 침향 등 열성음식과 약재는 좋지 않습니다.</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="나를 위한 음식 더 알아보기 >" onclick="send();" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE">
				</td>
			</tr>
		</table>
	</body>
</html>