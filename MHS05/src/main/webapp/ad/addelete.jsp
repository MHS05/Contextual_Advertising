<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 

<%
String pno = request.getParameter("adno");
if( loginVO == null || adno == null || adno.equals("") )
{
	response.sendRedirect("admincategory.jsp");
	return;
}
CategoryDTO dto = new CategoryDTO();
AdVO  vo  = dto.Read(adno);
if( vo == null)
{
	response.sendRedirect("admincategory.jsp");
	return;
}

if(loginVO.getId().equals("admin"))
{   //�������ϰ��
	dto.Delete(pno);
} 

response.sendRedirect("admincategory.jsp");
%>

<%@ include file="../admininclude/tail.jsp" %> 