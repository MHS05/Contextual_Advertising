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
	out.print("���庰�������� ������ �Է��ϼ���.");
	return;
}

DBManager db = new DBManager();
db.DBOpen();
String sql = "";
//���庰������ �����Ѵ�.
sql  = "delete from semotion ";
sql += "where senno = '" + senno + "' ";
db.RunCommand(sql);
out.print("���庰������ �����Ͽ����ϴ�.");
db.DBClose();
%>