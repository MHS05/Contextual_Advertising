<%@page import="mhs.dto.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
request.setCharacterEncoding("EUC-KR");
String[] delNo = request.getParameterValues("delNo");

CommunityDTO dto = new CommunityDTO();

for(String no : delNo)
{
	if( !no.equals("selectall"))
	{
		dto.Delete(no);
	}
}



%>

<script>
	alert("삭제되었습니다.")
	document.location.href = "adminnlist.jsp";
</script>