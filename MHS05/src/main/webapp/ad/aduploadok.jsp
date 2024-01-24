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

String keywords[] = keyword.split(",");



AdVO vo = new AdVO();
AdKeywordVO avo = new AdKeywordVO(); 

vo.setAdname(name);

if(fimage != null)
{	
	vo.setPhyimage(pimage);
	vo.setImage(fimage);
}

AdDTO dto = new AdDTO();
dto.Insert(vo);

String ano = vo.getAdno();
AdKeywordDTO adto = new AdKeywordDTO();

for(String key : keywords)
{
	avo.setAdkey(key);
	avo.setAdno(ano);
	adto.Insert(avo);
}

response.sendRedirect("adinfo.jsp?adno=" +vo.getAdno());

%>

