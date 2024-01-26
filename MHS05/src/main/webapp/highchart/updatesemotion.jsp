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
//문장별감정에 대해서 분석을 요청한다.
sql  = "update semotion set state = 'A' ";
sql += "where senno = '" + senno + "' ";
db.RunCommand(sql);
out.print("문장별감정 분석을 요청하였습니다.");
db.DBClose();
%>