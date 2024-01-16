<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "F";
String no = request.getParameter("no");
if( loginVO == null || no == null || no.equals("") )
{
	response.sendRedirect("communitylist.jsp");
	return;
}
CommunityDTO dto = new CommunityDTO();
CommunityVO  vo  = dto.Read(no, false);
if( vo == null)
{
	response.sendRedirect("communitylist.jsp");
	return;
}
//진짜 소유자인지 검사한다.
if( !loginVO.getId().equals(vo.getId()))
{	
	if(loginVO.getId().equals("admin"))
	{   //관리자일경우
		dto.Delete(no);
		response.sendRedirect("../admin/adminclist.jsp?kind=" + kind);
		return;
	} else
	{	//소유자가 아님
		response.sendRedirect("communitylist.jsp");
		return;
	}
}
dto.Delete(no);
response.sendRedirect("communitylist.jsp?kind=" + kind);
%>
<%@ include file="../include/tail.jsp" %>