<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.vo.*" %>
<%
String senno = request.getParameter("senno");

DBManager db = new DBManager();
db.DBOpen();
String sql = "";

sql  = "select senno,nno,sentance,emotion,score ";
sql += "from semotion ";
sql += "where senno = '" + senno + "' ";
sql += "order by senno ";
db.RunSelect(sql);
if(db.GetNext() == false)
{
	db.DBClose();
	return;
}
String nno  = db.GetValue("nno");
String sentance  = db.GetValue("sentance");
String emotion = db.GetValue("emotion");
String score = db.GetValue("score");
db.DBClose();
%>      
<table border="0" class="tb" style="width:100%" align="center">
	<tr>
		<th colspan="2"><strong><%= nno %></strong></td>
	</tr>				
	<tr>
		<th style="width:150px">������ȣ</th>
		<td class="left"><%= sentance %> (<%= senno %>)
		<input type="hidden" id="item_senno" value="<%= senno %>"></td>
	</tr>
	<%
	if(sentance.equals("B"))
	{
		%>
		<tr>
			<th>���������</th>
			<td class="left"><span id="nowprice"><%= emotion %></span></td>
		</tr>
		<tr>
			<th>���������</th>
			<td class="left"><span id="nowprice"><%= score %></span> ��</td>
		</tr>	
		<%
	}else
	{
		%>
		<tr>
			<th>���������</th>
			<td class="left">-</td>
		</tr>
		<tr>
			<th>���������</th>
			<td class="left">-</td>
		</tr>	
		<%		
	}
	%>		
	<tr>
		<th>�м�����</th>
		<td class="left">
			<%
			switch(sentance)
			{
			case "A":
				%><span class="status_ableg">��&nbsp;&nbsp;��&nbsp;&nbsp;��</span><%
				break;
			case "B":
				%><span class="status_ableb">�м��Ϸ�</span><%
				break;
			case "C":
				%><span class="status_re">�м�����</span><%
				break;
			}
			%>			
		</td>
	</tr>
	<%
	if(sentance.equals("C"))
	{
		%>
		<tr>
			<th>��������</th>
			<td class="left">
				<%= emotion %>	
			</td>
		</tr>		
		<%
	}
	%>
	<tr>
		<td colspan="2">
			<%
			if(sentance.equals("B"))
			{
				%>
				<a class="btn sfn" href="javascript:UpdateState('<%= senno %>');">�м���û�ϱ�</a>
				<%
			}
			%>
			<a class="btn sfnr" href="https://finance.naver.com/item/sise.naver?code=<%= senno %>" target="_blank">���庰���� ��ȸ</a>		
		</td>
	</tr>	
</table>

	    