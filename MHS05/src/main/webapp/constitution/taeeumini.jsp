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
		<title>태음인</title>
	</head>
	<body>
		<table border="0" align="center" width="1200px">
			<tr>
				<td style="width:350px; height:150px; font-size:40px"><img src="../image/write.jpg"><b>체질검사 결과</b></td>
				<td style="color:red; font-size:50px"><b>태음인</b></td>
			</tr>
			<tr>
				<td colspan="3" style="font-size:32px">
					<ul>
						<li>태음인의 체질개선에는 고단백, 고칼로리 식품이 좋습니다.<br><br></li>
						<li>태음인은 호흡기와 심장 순환계가 약해 고혈압, 중풍에 걸리기 쉬우며 간과 소화기 질환에 빠지기도 쉽습니다.<br><br></li>
						<li>따라서 호흡기와 순환기 계통의 질병이 오지 않도록 식이요법을 하는것이 좋으며 허약한 폐의 기능을 보호해 줄 수 있는 식품이 좋습니다.<br><br></li>
						<li>또한 태음인은 폐로 발산하는 기운이 적고 간으로 모아들이는 기운이 많이 때문에 열이 쌓이기 쉬우므로 항상 소변과 대변이 잘 소통되게 하면서 체내에 노폐물이 축적되지 않도록 음식과 약재를 쓰는것이 좋습니다.<br><br></li>
						<li>따라서 동, 식물성 단백질이나 칼로리가 높고 맛이 중후한 식품이 좋습니다.</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="taeeuminf.jsp">
					<input type="button" value="나를 위한 음식 더 알아보기 >" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>