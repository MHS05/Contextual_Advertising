<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../admininclude/head.jsp"%>
<%@ include file="../common/common.jsp" %>
<%
//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String nno       = multi.getParameter("nno");
String title     = multi.getParameter("title");
String category  = multi.getParameter("category");
String note      = multi.getParameter("ir1");
String mainyn    = multi.getParameter("main");
String image     = (String)multi.getFilesystemName("image"); //논리명
String phyimage  = ""; //물리명


if (phyimage != null)
{
	//논리명을 물리명 이름으로 변경한다.
	phyimage = UUID.randomUUID().toString();
	
	//파일 이름 변경
	String orgImage = uploadPath + "\\" + image;
	String newImage = uploadPath + "\\" + phyimage;
	
	File srcFile    = new File(orgImage);
	File targetFile = new File(newImage);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgImage + "<br>");
	out.println("바뀐 파일명 : " + newImage + "<br>");
}

NewsVO vo = new NewsVO();
vo.setNno(nno);
vo.setTitle(title);
vo.setCategory(category);
vo.setNote(note);
vo.setMainyn(mainyn);
if(image != null)
{
	vo.setImage(image);
	vo.setPhyimage(phyimage);
}
try
{
NewsDTO dto = new NewsDTO();
dto.Update(vo);
}catch(Exception e) 
{
	e.printStackTrace();
	e.getMessage();
}

response.sendRedirect("adminnewslist.jsp");
%>