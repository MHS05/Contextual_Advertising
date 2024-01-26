<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.vo.*" %>   
<%
String senno = request.getParameter("senno");
if(senno == null)
{
	out.print("문장별감정관리 정보를 입력하세요.");
	return;
}

DBManager db = new DBManager();
db.DBOpen();
String sql = "";
//문장별감정을 삭제한다.
sql  = "delete from semotion ";
sql += "where senno = '" + senno + "' ";
db.RunCommand(sql);
out.print("문장별감정을 삭제하였습니다.");
db.DBClose();
%>