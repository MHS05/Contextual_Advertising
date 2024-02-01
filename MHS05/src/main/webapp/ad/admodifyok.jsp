<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../admininclude/head.jsp" %>
<%@ include file="../common/common.jsp" %>
<%
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String adno         = multi.getParameter("adno");
String adname       = multi.getParameter("name");
String adkey        = multi.getParameter("keywords");
String image        = (String)multi.getFilesystemName("image");
String phyimage     = "";


if (image != null)
{
	phyimage = UUID.randomUUID().toString();
	
	String orgPimage = uploadPath + "\\" + image;
	String newPimage = uploadPath + "\\" + phyimage;
	
	File srcFile    = new File(orgPimage);
	File targetFile = new File(newPimage);
	srcFile.renameTo(targetFile);
}

AdVO vo = new AdVO();
vo.setId(loginVO.getId());
vo.setAdno(adno);

vo.setAdname(adname);
vo.setAdkey(adkey);
if(image != null)
{	
	vo.setImage(image);
	vo.setPhyimage(phyimage);
}

AdDTO dto = new AdDTO();
dto.Update(vo);

response.sendRedirect("adlist.jsp?adno=" + adno);
%>


