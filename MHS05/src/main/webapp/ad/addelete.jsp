<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 

<%
String uno     = request.getParameter("uno");
String[] delNo = request.getParameterValues("delNo");

AdDTO dto = new AdDTO();

for(String adno : delNo)
{
	if( !adno.equals("selectall"))
	{
		dto.Delete(adno);
	}
}
if( loginVO == null )
{
	response.sendRedirect("adlist.jsp");
	return;
}
%>
alert("삭제되었습니다.");
<% 
response.sendRedirect("adlist.jsp");
%>

<%@ include file="../admininclude/tail.jsp" %> 