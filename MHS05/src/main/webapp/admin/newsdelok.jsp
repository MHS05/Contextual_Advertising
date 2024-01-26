<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String nno = request.getParameter("nno");
if( loginVO == null || nno == null || nno.equals("") )
{
	response.sendRedirect("adminnewslist.jsp");
	return;
}
NewsDTO dto = new NewsDTO();
NewsVO  vo  = dto.Read(nno);
if( vo == null)
{
	response.sendRedirect("newslist.jsp");
	return;
}
//진짜 소유자인지 검사한다.
if( !loginVO.getId().equals(vo.getId()))
{	
	if(loginVO.getId().equals("admin"))
	{   //관리자일경우
		dto.Delete(nno);
		response.sendRedirect("adminnewslist.jsp");
		return;
	} else
	{	//소유자가 아님
		response.sendRedirect("adminnewslist.jsp");
		return;
	}
}
dto.Delete(nno);
response.sendRedirect("adminnewslist.jsp");
%>
