<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.vo.*" %> 
<%@ page import="mhs.dto.*" %> 
<%
String no   	= request.getParameter("no");
String rnote	= request.getParameter("rnote");
UserVO loginVO =(UserVO)session.getAttribute("login");

if(loginVO == null)
{
	out.println("로그인하지 않은 사용자입니다.");
	return;
}

//out.println("댓글내용:" + rnote);
ReplyVO vo = new ReplyVO();
vo.setNo(no);
vo.setId(loginVO.getId());
vo.setUno(loginVO.getUno());
vo.setRnote(rnote);

ReplyDTO dto = new ReplyDTO();
dto.Insert(vo);

out.println("댓글을 등록하였습니다.");
%>