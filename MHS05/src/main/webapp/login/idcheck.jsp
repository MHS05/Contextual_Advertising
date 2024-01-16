<%@page import="mhs.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String id = request.getParameter("id");

UserDTO dto = new UserDTO();



if( id == null || id.equals("") )
{
	out.println("001"); //아이디가 입력되지 않았습니다.
	return;
}

if( id.length() < 8 )
{
	out.println("004"); //아이디 길이를 확인하세요.
	return;
}

//UserDTO dto = new UserDTO();

if( dto.CheckID(id) == true)
{
	//중복된 아이디
	out.println("003");
	
} else
{
	//사용가능한 아이디
	out.println("002");
}




%>