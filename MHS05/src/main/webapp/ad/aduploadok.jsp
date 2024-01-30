<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.vo.*" %>    
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

String name       = multi.getParameter("name");
String keyword    = multi.getParameter("keywords");
String image     = (String)multi.getFilesystemName("image");
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

AdVO vo = new AdVO();
vo.setId(loginVO.getId());
vo.setAdname(name);
vo.setAdkey(keyword);
if(image != null)
{	
	vo.setImage(image);
	vo.setPhyimage(phyimage);
}

AdDTO dto = new AdDTO();
dto.Insert(vo);

response.sendRedirect("adlist.jsp");

%>


