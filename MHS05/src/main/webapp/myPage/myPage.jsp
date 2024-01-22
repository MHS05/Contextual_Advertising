<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 
<%
String uno = request.getParameter("uno");
if(uno == null || uno.equals(""))
{
	response.sendRedirect("myPage.jsp?uno=" + uno);
	return;
}

UserDTO dto = new UserDTO();
UserVO vo = dto.memberInfo(uno);
%>
		<table border="0" align="center" width="1100px">
				<tr>
					<td rowspan="10" style="width:280px"></td>
				</tr>
				<tr style="height:80px">
					<td colspan="2"><h2>마이페이지</h2></td>
				</tr>
				<tr>
					<td colspan="2"><hr style="width : 100%;"><td>
				</tr>
				<tr style="height:100px">
					<td style="width:400px";><h3>내가 쓴 게시물</h3><hr></td>
					<td><h3>회원정보</h3><hr></td>
				</tr>
				<tr style="height:50px">
					<td><a href="userclist.jsp?uno=<%= uno %>"><u>게시물 목록보기</u></a></td>
					<!-- 회원 번호를 회원정보 수정 페이지로 보냄 -->
					<td><a href="modify.jsp?uno=<%= loginVO.getUno() %>"><u>회원정보 수정</u></a></td>
				</tr>
				<tr>
					<td colspan="2" style="height:100px"></td>
				</tr>
				<tr style="height:100px"> 
					<td><h3>내가 쓴 댓글</h3><hr></td>
					<td><h3>회원탈퇴</h3><hr></td>
				</tr>
				<tr style="height:50px">
					<td>
						<a href="userRlist.jsp?uno=<%= loginVO.getUno() %>"><u>댓글 쓴 게시물 보기</u></a>
					</td>
					<td>
						<a href="deletecheck.jsp?uno=<%= loginVO.getUno() %>"><u>회원탈퇴</u></a>
					</td>
				</tr>
			</table>
		<br>
		<br>
		<br>
		<br>
		<table border="0" width="1200px" align="center" height="150px">
				<tr>
					<td rowspan="5" width="250px" align="center">
						<img style="width:100px; height: 100px;" src="../image/market.png">
					</td>
					<td rowspan="5" width="10px">
					</td>
					<td colspan="2" height="15px" align="right">
						<hr>
					</td>
				</tr>
				<tr>
					<td width="450px">
						상담가능시간
					</td>
					<td>
						회사정보
					</td>
				</tr>
				<tr>
					<td>
						평일 : 오전 09:00 ~ 오후 06:00
					</td>
					<td>
						회사이름 : ezen  |  전화번호 : 010-0000-0000
					</td>
				</tr>
				<tr>
					<td>
						점심시간 : 오후 12:00 ~ 오후 01:00
					</td>
					<td>
						이메일 : asdf@naver.com  |  대한민국 전주시
					</td>
				</tr>
				<tr>
					<td>
						주말 휴무
					</td>
					<td>
						팩스 : 00-000-0000
					</td>
				</tr>
		</table>