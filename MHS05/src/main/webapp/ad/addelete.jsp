<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 

<%
String adno = request.getParameter("adno");
if( loginVO == null || adno == null || adno.equals("") )
{
	response.sendRedirect("adlist.jsp");
	return;
}
AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);
if( vo == null)
{
	response.sendRedirect("adlist.jsp");
	return;
}

if(loginVO.getId().equals("admin"))
{   //包府磊老版快
	dto.Delete(adno);
} 

response.sendRedirect("admincategory.jsp");
%>

<%@ include file="../admininclude/tail.jsp" %> 