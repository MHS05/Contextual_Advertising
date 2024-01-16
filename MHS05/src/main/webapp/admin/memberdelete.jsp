<%@page import="mhs.dto.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String uno      = request.getParameter("uno");

if(uno == null || uno.equals(""))
{
	response.sendRedirect("member.jsp");
	return;
}

UserDTO dto = new UserDTO();
dto.Delete(uno);
%>

<script>

alert("삭제 되었습니다.");
document.location.href = "member.jsp";

</script>
