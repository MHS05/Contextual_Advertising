<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
session.setAttribute("login", null); //쿠키값을 null로 바꿔서 로그아웃이 되게 한다


response.sendRedirect("../main/index.jsp");
%>
