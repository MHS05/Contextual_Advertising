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

String adno       = multi.getParameter("adno");
String keyword1   = multi.getParameter("keyword1");
String keyword2   = multi.getParameter("keyword2");
String similar1   = multi.getParameter("similar1");
String similar2   = multi.getParameter("similar2");
String link       = multi.getParameter("link");
String type       = multi.getParameter("type");
String name       = multi.getParameter("name");
String emotion    = multi.getParameter("emotion");
String date_start = multi.getParameter("date_start");
String date_end   = multi.getParameter("date_end");
String fimage     = (String)multi.getFilesystemName("image");
String pimage     = "";


if (fimage != null)
{
	//������ ������ �̸����� �����Ѵ�.
	pimage = UUID.randomUUID().toString();
	
	//���� �̸� ����
	String orgPimage = uploadPath + "\\" + fimage;
	String newPimage = uploadPath + "\\" + pimage;
	
	File srcFile    = new File(orgPimage);
	File targetFile = new File(newPimage);
	srcFile.renameTo(targetFile);
	
	out.println("���� ���ϸ� : " + orgPimage + "<br>");
	out.println("�ٲ� ���ϸ� : " + newPimage + "<br>");
}

AdVO vo = new AdVO();

vo.setAdno(adno);
vo.setKeyword1(keyword1);
vo.setKeyword2(keyword2);
vo.setSimilar1(similar1);
vo.setSimilar2(similar2);
vo.setLink(link);
vo.setType(type);
vo.setName(name);
vo.setEmotion(emotion);
vo.setDate_start(date_start);
vo.setDate_end(date_end);

if(fimage != null)
{	
	vo.setPimage(pimage);
	vo.setFimage(fimage);
}

AdDTO dto = new AdDTO();


dto.Insert(vo);


response.sendRedirect("adinfo.jsp?adno=" +vo.getAdno());
%>


