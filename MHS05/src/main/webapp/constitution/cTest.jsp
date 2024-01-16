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
		<title>체질검사</title>
		<script src="../js/jquery-3.7.1.js"></script>
	</head>
	<body>
	<script>
		function doit()
		{
			location.href="../constitution/test.jsp?uno=" + <%= uno %>;
		}
	</script>
	<style>
		td
		{
			font-size:30px;
		}
	</style>
		<table border="0" align="center" width="1200px">
			<tr>
				<td height="100px"></td>
			</tr>
			<tr>	
				<td height="100px"><b>체질검사</b></td>
			</tr>
			<tr>
				<td height="150px">검사문항은 총 22문제로 이루어져 있습니다.</td>
			</tr>
			<tr>
				<td height="150px">1~18번까지는 선택지 한 가지만 골라주세요.</td>
			</tr>
			<tr>
				<td height="150px">19~22번까지는 그렇다, 보통이다, 아니다에 중에서 한가지만 골라주세요.</td>
			</tr>
			<tr>
				<td align="center" height="150px">
				 	<input type="button" value="시작하기" onclick="doit();" style="width:150px; height:50px; font-size:17px; background-color:#4dd5b0"></a>&emsp;
				 	<a href="../main/index.jsp?uno=<%= uno %>" onclick="window.close()"><input type="button" value="다음에 하기" style="width:150px; height:50px; font-size:17px; background-color:#BEBEBE"></a>
				</td>
			</tr>
		</table>
	</body>
</html>