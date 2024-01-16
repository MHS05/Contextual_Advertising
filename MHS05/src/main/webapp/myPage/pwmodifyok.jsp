<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*"%>
<%@ page import = "mhs.dto.*"%>
<%
UserVO loginVO = (UserVO)session.getAttribute("login");

String pw = request.getParameter("pw");
String uno = request.getParameter("uno");

if( pw == null )
{
	response.sendRedirect("modify.jsp");
	return;
}

loginVO.setUno(uno);
loginVO.setPw(pw);

UserDTO dto = new UserDTO();
dto.pwmodify(loginVO);

session.setAttribute("login", loginVO);
%>
