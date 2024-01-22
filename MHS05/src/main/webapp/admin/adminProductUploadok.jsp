<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

String pno = multi.getParameter("pno");
String ptype  = multi.getParameter("ptype");
String pname = multi.getParameter("pname");
String age = multi.getParameter("age");
String pgender = multi.getParameter("pgender");
String pcon = multi.getParameter("pcon");
String link = multi.getParameter("link");
String tag_age = multi.getParameter("tag_age");
String tag_pgender = multi.getParameter("tag_pgender");
String tag_pcon = multi.getParameter("tag_pcon");
String month_start = multi.getParameter("month_start");
String month_end = multi.getParameter("month_end");
String info  = multi.getParameter("info");
String takeinfo  = multi.getParameter("takeinfo");
String pfimage = (String)multi.getFilesystemName("image"); //논리명
String ppimage = ""; //물리명


if (pfimage != null)
{
	//논리명을 물리명 이름으로 변경한다.
	ppimage = UUID.randomUUID().toString();
	
	//파일 이름 변경
	String orgPimage = uploadPath + "\\" + pfimage;
	String newPimage = uploadPath + "\\" + ppimage;
	
	File srcFile    = new File(orgPimage);
	File targetFile = new File(newPimage);
	srcFile.renameTo(targetFile);
	
	out.println("원래 파일명 : " + orgPimage + "<br>");
	out.println("바뀐 파일명 : " + newPimage + "<br>");
}

CategoryVO vo = new CategoryVO();

vo.setPname(pname);
vo.setPtype(ptype);
vo.setAge(age);
vo.setPgender(pgender);
vo.setPcon(pcon);
vo.setLink(link);
vo.setTag_age(tag_age);
vo.setTag_pgender(tag_pgender);
vo.setTag_pcon(tag_pcon);
vo.setMonth_start(month_start);
vo.setMonth_end(month_end);
vo.setInfo(info);
vo.setTakeinfo(takeinfo);
if(pfimage != null)
{	
	vo.setPpimage(ppimage);
	vo.setPfimage(pfimage);
}

CategoryDTO dto = new CategoryDTO();



dto.Insert(vo);



response.sendRedirect("admininfo.jsp?pno=" +vo.getPno());
%>


