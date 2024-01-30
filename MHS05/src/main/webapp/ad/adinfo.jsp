<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<% 
if( loginVO == null)
{	
	//�α��� ���� ���� ��� ó��
	response.sendRedirect("../main/index.jsp");
	return;
}
String adno = request.getParameter("adno");
String page_no = request.getParameter("page");
if(page_no == null || page_no.equals("")) page_no = "";

AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);
if( vo == null )
{
	//�ش� �Խù� ��ȣ�� �����Ͱ� ����
	%>
	<script>
		alert("�ش� ���� ��ȸ �� �� �����ϴ�.");
		document.location = "adlist.jsp";
	</script>
	<%
	return;
}
%>
	<tr>
		<td colspan="2"><h1><%= vo.getAdname() %></h1></td>
	</tr>
	<tr>
		<td height="50px" align="right">
			<a href="admodify.jsp?adno=<%= vo.getAdno() %>"><span id="span1" style="background-color: #4dd5b0;">����</span></a>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td align="center" width="650px" valign="top">
			<img src="../image/<%= vo.getImage() %>" width="650px" height="100px">
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; text-align: left;">
				<h4>1. Ű����</h4>
				<font style="font-size: 20px"><b><%= vo.getAdkey() %></b></font><br>
			</div>
		</td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td>
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; text-align: left;">
				<h4>2.��������</h4>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table border="1" width="800px" height="100px" align="center">
				<tr>
					<td></td>
					<td>��¥</td>
					<td>�Խù� ����</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2024-01-22</td>
					<td>�����Դϴ�.</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2024-01-22</td>
					<td>�����Դϴ�.</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td align="center" colspan="3" height="20px">
			<a href="adlist.jsp"><span id="span2">���</span></a>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 