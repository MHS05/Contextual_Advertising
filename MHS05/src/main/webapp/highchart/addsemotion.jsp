<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mhs.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.vo.*" %>
<%
String senno = request.getParameter("senno");
String nno = request.getParameter("nno");
if(senno == null || nno == null)
{
	out.print("ERR-01"); //문장별 감정 정보를 입력하세요.
	return;
}

DBManager db = new DBManager();
db.DBOpen();

String sql = "";
//같은 문장별감정관리번호가 등록되어 있는지 검사한다.
sql += "select senno ";
sql += "from semotion ";
sql += "where senno = '" + senno + "' ";
db.RunSelect(sql);
if(db.GetNext() == true)
{
	out.print("ERR-02"); //동일한 문장별감정관리번호가 등록되어 있습니다.
	db.DBClose();
	return;	
}

//종목을 등록한다.
sql  = "insert into semotion (senno,nno) ";
sql += "values (";
sql += "'" + senno + "', ";
sql += "'" + nno + "' ";
sql += ") ";
db.RunCommand(sql);
out.print("OK"); //등록하였습니다.

db.DBClose();
%>