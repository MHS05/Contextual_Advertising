<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*"%>
<%@ page import = "mhs.dto.*"%>
<%
UserVO loginVO = (UserVO)session.getAttribute("login");

String nick = request.getParameter("nick");
String uno  = request.getParameter("uno");

UserDTO dto = new UserDTO();

loginVO.setUno(uno);
loginVO.setNickname(nick);

dto.nickmodify(loginVO);

session.setAttribute("login", loginVO);

	




%>
