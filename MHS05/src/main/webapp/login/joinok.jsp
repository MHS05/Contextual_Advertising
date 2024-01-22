<%@page import="mhs.dto.UserDTO"%>
<%@page import="mhs.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

request.setCharacterEncoding("EUC-KR");
String id       = request.getParameter("id");
String pw       = request.getParameter("pw");
String name     = request.getParameter("name");
String nickname = request.getParameter("nickName");
String gender   = request.getParameter("gender");
String birth    = request.getParameter("birth");
String email    = request.getParameter("email");
String con      = request.getParameter("constitution");

if(id == null || pw == null || name == null)
{
	response.sendRedirect("join.jsp");
	return;
}



UserVO vo = new UserVO();
UserDTO dto = new UserDTO();

vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setNickname(nickname);
vo.setGender(gender);
vo.setBirth(birth);
vo.setEmail(email);
vo.setCon(con);

if(dto.Join(vo) == true)
{
	%>
		<script>
			alert("회원가입이 완료되었습니다.")
			document.location = "../main/index.jsp";
		</script>
	<%
} else
{
	%>
	<script>
		alert("아이디 또는 닉네임을 확인 하세요.")
		document.location = "join.jsp";
	</script>
<%
	
}





%>