<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 
<%
String uno = request.getParameter("uno");
if( loginVO == null || uno == null || uno.equals("") )
{
	response.sendRedirect("../main/index.jsp");
	return;
}
UserDTO dto = new UserDTO();
UserVO  vo  = dto.Read(uno);
if( vo == null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}
//진짜 소유자인지 검사한다.
if( !loginVO.getId().equals(vo.getId()))
{
	//소유자가 아님
	response.sendRedirect("../main/index.jsp");
	return;	
}
vo.setIsretire("Y");
dto.isretiremodify(uno,vo.getIsretire());
session.setAttribute("login", null); //쿠키값을 null로 바꿔서 로그아웃이 되게 한다
response.sendRedirect("../main/index.jsp");
%>