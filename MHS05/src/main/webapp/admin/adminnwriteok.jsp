<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../include/head.jsp"%>
<%@ include file="../common/common.jsp" %> 
<%
//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String title = multi.getParameter("title");
String type  = multi.getParameter("type");
String note  = multi.getParameter("note");
String image = (String)multi.getFilesystemName("image"); //논리명
String phyimage = ""; //물리명
String fname = (String)multi.getFilesystemName("attach"); //논리명
String phyname = ""; //물리명


if (image != null)
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

if(fname != null)
{
	//논리명을 물리명 이름으로 변경한다.
	phyname = UUID.randomUUID().toString();
	
	//파일 이름 변경
	String orgName = uploadPath + "\\" + fname;
	String newName = uploadPath + "\\" + phyname;
	
	File srcFile    = new File(orgName);
	File targetFile = new File(newName);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgName + "<br>");
	out.println("바뀐 파일명 : " + newName + "<br>");
}

CommunityVO vo = new CommunityVO();
vo.setId(loginVO.getId());
vo.setTitle(title);
vo.setUno(loginVO.getUno());
vo.setType(type);
vo.setNote(note);
if(image != null)
{
	vo.setImage(image);
	vo.setPhyimage(phyimage);
}
if(fname != null)
{
	vo.setFname(fname);
	vo.setPhyname(phyname);
}

CommunityDTO dto = new CommunityDTO();
dto.Insert(vo);

response.sendRedirect("adminnview.jsp?no=" +vo.getNo());
%>


