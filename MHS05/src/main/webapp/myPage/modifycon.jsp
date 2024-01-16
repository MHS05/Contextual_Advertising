<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*"%>
<%@ page import = "mhs.dto.*"%>
<%
UserVO loginVO = (UserVO)session.getAttribute("login");

String con  = request.getParameter("con");
String uno  = request.getParameter("uno");
String nick = request.getParameter("nick");

if( con == null || nick == null )
{
	response.sendRedirect("modify.jsp?uno=" + uno);
	return;
}

loginVO.setUno(uno);
loginVO.setCon(con);
loginVO.setNickname(nick);

UserDTO dto = new UserDTO();
dto.conmodify(loginVO);

session.setAttribute("login", loginVO);

%>