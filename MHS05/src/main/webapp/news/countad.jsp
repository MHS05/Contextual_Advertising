<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%
String nno   = request.getParameter("nno");
String adno  = request.getParameter("adno");
String title = request.getParameter("title");

ClickAdVO vo = new ClickAdVO();
vo.setNno(nno);
vo.setAdno(adno);
vo.setTitle(title);

ClickAdDTO dto = new ClickAdDTO();
dto.Insert(vo, true, adno);

out.println("광고노출 성공");

response.sendRedirect("newsview.jsp?nno=" + nno);
%>