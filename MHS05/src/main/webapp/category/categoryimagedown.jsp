<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../common/common.jsp" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %> 
<%@ page import="mhs.vo.*" %> 
<%@ page import="mhs.dto.*" %>   
<%
String pno = request.getParameter("pno");
if( pno == null || pno.equals("") )
{
	response.sendRedirect("category.jsp");
	return;
}

CategoryDTO dto = new CategoryDTO();
CategoryVO  vo  = dto.Read(pno);
if( vo == null )
{
	response.sendRedirect("category.jsp");
	return;	
}

String pfimage    = vo.getPfimage();
String ppimage    = vo.getPpimage();

//ÀÌ¹ÌÁö
String imageName = uploadPath + "\\" + ppimage;

pfimage = URLEncoder.encode(pfimage,"utf-8");	//
response.setContentType("application/octet-stream");   //
response.setHeader("Content-Disposition","attachment; filename=" + pfimage);	//

File file = new File(imageName);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}

fileIn.close();
ostream.flush();
ostream.close();
%>