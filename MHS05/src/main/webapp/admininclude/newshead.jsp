<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page errorPage = "../main/errorpage.jsp" %>
<% 
//�α����� ���̵� ��Ű ����
UserVO loginVO = (UserVO)session.getAttribute("login");
if(loginVO == null)
{
	response.sendRedirect("../main/index.jsp");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>������ �ǰ� ���θ�</title>
		 <link rel="stylesheet" href="../admin/admin.css"/>
		 <script src="../js/jquery-3.7.1.js"></script>
	</head>
	<style>
		.writead
		{
			position : absolute;
			top      : 30px;
			left     : 1350px;
		}
		.name
		{
			position : absolute;
			top      : 30px;
			left     : 1420px;
		}
		.logout
		{
			position : absolute;
			top      : 30px;
			left     : 1480px;
		}
	</style>
	<body>
		<form>
			<table border="0" width="1200px" align="center">
				<tr>
					<td rowspan="2" width="250px">
						<a href="member.jsp"><img style="width:250px; height: 200px;" src="../image/logo.png"></a>
					</td>
					<td colspan="4" height="50px" align="right" valign="bottom" style="font-size: 14px; font-weight: 700;">
						<span class="writead">
							<a href="../writead.jsp">
								<ins>������</ins>
							</a>
						</span>
						<span class="name">
							�����ڴ�
						</span>
						<span class="logout">
							<a href="../login/logout.jsp">
								<ins>�α׾ƿ�</ins>
							</a>
						</span>
					</td>
				</tr>
				<a name="top"></a>
				<tr>
					<td class="nav">
						<div>
							<a href="adminnewslist.jsp"><h1>�ǰ��ҽ�</h1></a>
						</div> 
						<div>
							<a href="admincategory.jsp"><h1>ī�װ�</h1></a>
						</div> 
						<div>
							<a href="adminclist.jsp?type=F""><h1>Ŀ�´�Ƽ</h1></a>
						</div> 
						<div>
							<a href="adminnlist.jsp"><h1>��������</h1></a>
						</div>
					</td>
				</tr>
			</table>
		</form>
