<%@page import="mhs.dto.ListDTO"%>
<%@page import="mhs.vo.CategoryVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String age = request.getParameter("age");
if(age == null) age = "";
String pgender = request.getParameter("pgender");
if(pgender == null) pgender = "";
String pcon = request.getParameter("pcon");
if(pcon == null) pcon = "";
String key = request.getParameter("key");
if(key == null) key = "";

String kind = request.getParameter("kind");
if(kind == null) kind = "V";



int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = dto.GetcTotal(kind,key,age,pgender,pcon);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 6;
if(totalData % 6 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}

ArrayList<CategoryVO> list = dto.GetcList(page_no,kind,key,age,pgender,pcon);
int colNo = 0;
%>
<%
for(CategoryVO vo : list)
{
	if(colNo % 3 == 0)
	{
		%>
		<tr>
		<%
	}
	%>		
		<td align="left">
			<div style="width: 240px; height: 345px; text-align: center;">
			<span id ="span1" style="display:inline-block; width:70px; padding: 0px 0px;"><%= vo.getTag_age() %></span>
			<span id ="span1" style="display:inline-block; width:70px; padding: 0px 0px;"><%= vo.getTag_pgender() %></span>
			<span id ="span1" style="display:inline-block; width:70px; padding: 0px 0px;"><%= vo.getTag_pcon() %></span>
			<a href="info.jsp?kind=<%= kind %>&pno=<%= vo.getPno() %>"><img src="categoryimagedown.jsp?pno=<%= vo.getPno() %>" width="250px" height="300px"><br>
			<b><%= vo.getPname() %></b></a><br>
			</div>
		</td>	
	<%
	if(colNo % 5 == 2)
	{
		%>
		</tr>
		<tr>
			<td colspan="3" align="left">
				<hr style="width:880px;  margin-left: 0px; ">
			</td>
		</tr>
		<%
		colNo = 0;
	}else
	{
		colNo++;
	}
}

if(list.size() == 0)
{
	%>NODATA<%
}
%>
