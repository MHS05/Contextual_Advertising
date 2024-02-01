<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%
String nno   = request.getParameter("nno");
String adno  = request.getParameter("adno");

ClickAdVO vo = new ClickAdVO();
vo.setNno(nno);
vo.setAdno(adno);

ClickAdDTO dto = new ClickAdDTO();
dto.Insert(vo);

out.println("광고노출 성공");

response.sendRedirect("newsview.jsp?nno=" + nno);
%>