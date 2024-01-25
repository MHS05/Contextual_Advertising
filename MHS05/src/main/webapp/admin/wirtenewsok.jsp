<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../admininclude/head.jsp" %>
<%@ include file="../common/common.jsp" %>
<%
//���ε尡 ������ �ִ� ���� ũ�⸦ �����Ѵ�.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String category   = multi.getParameter("category");
String title      = multi.getParameter("title");
String note       = multi.getParameter("ir1");
String mainyn     = multi.getParameter("main");
String image      = (String)multi.getFilesystemName("image");
String phyimage     = "";


if (image != null)
{
	//������ ������ �̸����� �����Ѵ�.
	phyimage = UUID.randomUUID().toString();
	
	//���� �̸� ����
	String orgPimage = uploadPath + "\\" + image;
	String newPimage = uploadPath + "\\" + phyimage;
	
	File srcFile    = new File(orgPimage);
	File targetFile = new File(newPimage);
	srcFile.renameTo(targetFile);
	
	out.println("���� ���ϸ� : " + orgPimage + "<br>");
	out.println("�ٲ� ���ϸ� : " + newPimage + "<br>");
}

NewsVO vo = new NewsVO();
vo.setId(loginVO.getId());
vo.setCategory(category);
vo.setTitle(title);
vo.setNote(note);
vo.setMainyn(mainyn);
if(image != null)
{
	vo.setImage(image);
	vo.setPhyimage(phyimage);
}

NewsDTO dto = new NewsDTO();
dto.Insert(vo);

response.sendRedirect("adminnewsview.jsp?nno=" +vo.getNno() + "&category=" + vo.getCategory());

%>