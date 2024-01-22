<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "N";
String no = request.getParameter("no");
if( loginVO == null || no == null || no.equals("") )
{
	response.sendRedirect("adminnlist.jsp");
	return;
}
CommunityDTO dto = new CommunityDTO();
CommunityVO  vo  = dto.Read(no, false);
if( vo == null)
{
	response.sendRedirect("adminnlist.jsp");
	return;
}
//진짜 소유자인지 검사한다.
if( !loginVO.getId().equals(vo.getId()))
{
	//소유자가 아님
	response.sendRedirect("adminnlist.jsp");
	return;	
}
dto.Delete(no);
response.sendRedirect("adminnlist.jsp?kind=" + kind);
%>


<%@ include file="../admininclude/tail.jsp" %>