<%@page import="mhs.dto.ReplyDTO"%>
<%@page import="mhs.dto.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
request.setCharacterEncoding("EUC-KR");
String uno = request.getParameter("uno");
String[] delNo = request.getParameterValues("delNo");

ReplyDTO dto = new ReplyDTO();

for(String no : delNo)
{
	if( !no.equals("selectall"))
	{
		dto.Delete(no);
	}
}


if(uno == null || uno.equals(""))
{
	%>
	<script>
		alert("삭제되었습니다.")
		document.location.href = "adminclist.jsp";
	</script>
	<%
} else
{	
	%>
	<script>
		alert("삭제되었습니다.")
		document.location.href = "userRlist.jsp?uno=<%= uno %>";
	</script>
	<%
}
%>