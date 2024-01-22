<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*"%>
<%@ page import = "mhs.dto.*"%>
<%

String pw = request.getParameter("pw");
String id = request.getParameter("id");

if( pw == null || id == null)
{
	out.println("001");
	return;
}

UserDTO dto = new UserDTO();
dto.loginpwmodify(id, pw);

%>
