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
//��¥ ���������� �˻��Ѵ�.
if( !loginVO.getId().equals(vo.getId()))
{	
	if(loginVO.getId().equals("admin"))
	{   //�������ϰ��
		dto.Delete(nno);
		response.sendRedirect("adminnewslist.jsp");
		return;
	} else
	{	//�����ڰ� �ƴ�
		response.sendRedirect("adminnewslist.jsp");
		return;
	}
}
dto.Delete(nno);
response.sendRedirect("adminnewslist.jsp");
%>
