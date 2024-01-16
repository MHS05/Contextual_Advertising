<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="mhs.dto.UserDTO"%>
<%@page import="mhs.vo.UserVO"%>
<%@ page import="mhs.dao.smtp" %> 

<%

String email = request.getParameter("email");

UserDTO dto = new UserDTO();


if( email == null || email.equals("") )
{
	out.println("001"); //이메일이 입력되지 않았습니다.
	return;
}

	//SMTP 메일 서버 오픈
	smtp mail = new smtp();
	
	//인증메일 발송후 인증번호값 받아옴
	String result = mail.Send(email);
	
	if(result == null){
		out.print("002");
		return;
	}
	else
	{
		//인증번호를 AJAX에 넘겨줌
		out.print(result);
		return;
	}
	
	
%>