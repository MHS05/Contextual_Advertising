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
	out.print("ERR-01"); //���庰 ���� ������ �Է��ϼ���.
	return;
}

DBManager db = new DBManager();
db.DBOpen();

String sql = "";
//���� ���庰����������ȣ�� ��ϵǾ� �ִ��� �˻��Ѵ�.
sql += "select senno ";
sql += "from semotion ";
sql += "where senno = '" + senno + "' ";
db.RunSelect(sql);
if(db.GetNext() == true)
{
	out.print("ERR-02"); //������ ���庰����������ȣ�� ��ϵǾ� �ֽ��ϴ�.
	db.DBClose();
	return;	
}

//������ ����Ѵ�.
sql  = "insert into semotion (senno,nno) ";
sql += "values (";
sql += "'" + senno + "', ";
sql += "'" + nno + "' ";
sql += ") ";
db.RunCommand(sql);
out.print("OK"); //����Ͽ����ϴ�.

db.DBClose();
%>