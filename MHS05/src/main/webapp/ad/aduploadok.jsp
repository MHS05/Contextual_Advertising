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
//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String name       = multi.getParameter("name");
String keyword    = multi.getParameter("keywords");
String fimage     = (String)multi.getFilesystemName("image");
String pimage     = "";


if (fimage != null)
{
	//논리명을 물리명 이름으로 변경한다.
	pimage = UUID.randomUUID().toString();
	
	//파일 이름 변경
	String orgPimage = uploadPath + "\\" + pimage;
	String newPimage = uploadPath + "\\" + pimage;
	
	File srcFile    = new File(orgPimage);
	File targetFile = new File(newPimage);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgPimage + "<br>");
	out.println("바뀐 파일명 : " + newPimage + "<br>");
}

AdVO vo = new AdVO();
vo.setId(loginVO.getId());
vo.setAdname(name);
vo.setAdkey(keyword);
if(fimage != null)
{	
	vo.setImage(fimage);
	vo.setPhyimage(pimage);
}

AdDTO dto = new AdDTO();
dto.Insert(vo);

response.sendRedirect("adinfo.jsp");
%>

