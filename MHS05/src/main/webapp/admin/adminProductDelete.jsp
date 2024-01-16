<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 

<%
String pno = request.getParameter("pno");
if( loginVO == null || pno == null || pno.equals("") )
{
	response.sendRedirect("admincategory.jsp");
	return;
}
CategoryDTO dto = new CategoryDTO();
CategoryVO  vo  = dto.Read(pno);
if( vo == null)
{
	response.sendRedirect("admincategory.jsp");
	return;
}

if(loginVO.getId().equals("admin"))
{   //包府磊老版快
	dto.Delete(pno);
} 

response.sendRedirect("admincategory.jsp");
%>

<%@ include file="../admininclude/tail.jsp" %> 