<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="mhs.dto.UserDTO"%>
<%@page import="mhs.vo.UserVO"%>
<%
String name = request.getParameter("name");

UserDTO dto = new UserDTO();

if( name == null || name.equals("") )
{
	out.println("001"); //이름이 입력되지 않았습니다.
	return;
}

if( dto.CheckName(name) == true)
{
	//있는 이름
	UserVO vo = dto.readname(name);
	String result = vo.getId();
	out.print(result);
} 
else
{
	//없는 이름
	out.println("002");
}
%>
