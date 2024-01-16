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
		<title>태양인</title>
	</head>
	<body>
		<table border="0" align="center" width="1200px">
			<tr>
				<td style="width:350px; height:150px; font-size:40px"><img src="../image/write.jpg"><b>체질검사 결과</b></td>
				<td style="color:red; font-size:50px"><b>태양인</b></td>
			</tr>
			<tr>
				<td colspan="3" style="font-size:32px">
					<ul>
						<li>태양인의 체질개선에는 차고 담백한 음식을 드세요.<br><br></li>
						<li>태양인은 하체가 약한 체질로서 하체를 보강하고 자궁을 튼튼하게 하며 소변을 원활하게 해주는 음식과 약재로 체질개선을 해주는 것이 좋습니다.<br><br></li>
						<li>식품의 성질이 더운것보다는 차가운 식품이 좋고 맵고 짠 음식이나 성질이 뜨거운 음식 및 지방질이 많은 음식은 피합니다.<br><br></li>
						<li>특히 좋은 음식과 약재는 오가피, 모과, 조개, 붕어, 생굴, 메밀, 다래, 솔잎 등이 있으며 이런것들을 상복하면 체질개선에 좋습니다.</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="taeyanginf.jsp">
					<input type="button" value="나를 위한 음식 더 알아보기 >" style="width:250px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>