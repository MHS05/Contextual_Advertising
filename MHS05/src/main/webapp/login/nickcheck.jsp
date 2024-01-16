<%@page import="mhs.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//request.setCharacterEncoding("euc-kr");
String nick = request.getParameter("nick");

if( nick == null || nick.equals("") )
{
	out.println("001"); //닉네임이 입력되지 않았습니다.
	return;
}

UserDTO dto = new UserDTO();

if( dto.CheckNick(nick) == true)
{
	//중복된 닉네임
	out.println("003");
	
} else
{
	//사용가능한 닉네임
	out.println("002");
}

%>