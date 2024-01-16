<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.*" %>
<%
request.setCharacterEncoding("EUC-KR");
String id = request.getParameter("id"); //입력받은 id 값을 가져옴
String pw = request.getParameter("pw");


%>
	
<%
if( id == null || pw == null)
{
	response.sendRedirect("login.jsp"); //id가 null이거나 pw가 null이면 login.jsp로 이동시킴
	return;
}
if( id.equals("admin") )
{
	response.sendRedirect("../admin/member.jsp"); 
	return;
}else if( id.equals("ezen") )
{
	response.sendRedirect("../main/index2.jsp");
	return;
}

%>

