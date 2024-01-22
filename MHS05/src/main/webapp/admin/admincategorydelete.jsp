<%@page import="mhs.dto.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
request.setCharacterEncoding("EUC-KR");
String pno  = request.getParameter("pno");
String kind = request.getParameter("kind");
String[] delNo = null;
if(delNo == null)
{
	String valList = request.getParameter("valList");
	if(valList != null)
	{
		delNo = valList.split(",");				
	}
}
CategoryDTO dto = new CategoryDTO();

for(String no : delNo)
{
	if( !no.equals("selectall"))
	{
		dto.Delete(no);
	}
}


if(pno == null || pno.equals(""))
{
	%>
	<script>
		alert("삭제되었습니다.")
		document.location.href = "admincategory.jsp?kind=<%= kind %>";
	</script>
	<%
} else
{	
	%>
	<script>
		alert("삭제되었습니다.")
		//document.location.href = "userclist.jsp?uno=<%= pno %>";
	</script>
	<%
}
%>