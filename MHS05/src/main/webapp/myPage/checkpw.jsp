<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<% 
String pw  = request.getParameter("pw");
if( pw == null || pw.equals("") )
{
	out.println("001"); //비밀번호가 입력되지 않음
	return;
}

UserDTO dto = new UserDTO();

if(dto.CheckPW(pw) == true)
{
	//비밀번호가 맞음
	out.println("003");
}else
{
	//없는 비밀번호
	out.println("002");
}

%>