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
		<th style="width:150px">뉴스번호</th>
		<td class="left"><%= sentance %> (<%= senno %>)
		<input type="hidden" id="item_senno" value="<%= senno %>"></td>
	</tr>
	<%
	if(sentance.equals("B"))
	{
		%>
		<tr>
			<th>긍부정여부</th>
			<td class="left"><span id="nowprice"><%= emotion %></span></td>
		</tr>
		<tr>
			<th>긍부정점수</th>
			<td class="left"><span id="nowprice"><%= score %></span> 점</td>
		</tr>	
		<%
	}else
	{
		%>
		<tr>
			<th>긍부정여부</th>
			<td class="left">-</td>
		</tr>
		<tr>
			<th>긍부정점수</th>
			<td class="left">-</td>
		</tr>	
		<%		
	}
	%>		
	<tr>
		<th>분석상태</th>
		<td class="left">
			<%
			switch(sentance)
			{
			case "A":
				%><span class="status_ableg">분&nbsp;&nbsp;석&nbsp;&nbsp;중</span><%
				break;
			case "B":
				%><span class="status_ableb">분석완료</span><%
				break;
			case "C":
				%><span class="status_re">분석오류</span><%
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
			<th>오류내용</th>
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
				<a class="btn sfn" href="javascript:UpdateState('<%= senno %>');">분석요청하기</a>
				<%
			}
			%>
			<a class="btn sfnr" href="https://finance.naver.com/item/sise.naver?code=<%= senno %>" target="_blank">문장별감정 조회</a>		
		</td>
	</tr>	
</table>

	    