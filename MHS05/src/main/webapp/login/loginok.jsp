<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.*" %>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%
String id = request.getParameter("id"); //입력받은 id 값을 가져옴
String pw = request.getParameter("pw"); //입력받은 pw 값을 가져옴

if( id == null || pw == null) //id가 널이거나 pw가 널이면
{
	
	%>
	<script>
		window.close(); //팝업창 닫음
	</script>
	<%
}
%>
<%
UserDTO dto = new UserDTO(); //객체 생성
UserVO  vo  = dto.Login(id,pw); //UserVO에 아이디와 패스워드를 넣음
if( vo == null) //UserVO 값이 널이라면
{
	//아이디 비번 틀림
	%>
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		document.location = "login.jsp";
	</script>
	<%
}else
{
	session.setAttribute("login", vo);
	%>
	<script>
		//opener.document.location = "../main/index.jsp";
		opener.location.reload();
		window.close();
	</script>
	<%
}
%>

