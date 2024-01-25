<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String category = request.getParameter("category");
if(category == null) category = "D";

ListDTO dto = new ListDTO();

ArrayList<NewsVO> list = dto.getnewslist(1,category, "");
%>
<style>
#headline
{
	color : #4dd5b0;
	font-family: 'Anton', sans-serif;
	font-size: 30px;
	font-style: oblique;
}

#type  
{
	width : 100px;
	text-align:center;
	padding-top:30px;
	padding-bottom:30px;
	background-color : white;
	border-radius: 15px;
	cursor: pointer;
	float: left;
	margin-right: 15px;
	box-shadow: 1px 3px 5px 3px lightgray;
}

#delbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
	position:absolute;
	right: 10px;
	top:0px;
	
	
}
</style>

<tr>
	<td valign="top">
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2>남성건강</h2>

			<div align="center" id="delbutton"><a href="writenews.jsp?category=D">등록</a></div>
		</div>
		<%
		for(NewsVO vo : list)
		{
		%>
		<div style="border-bottom: 1px solid lightgray; position: relative;">
			<div style="width: 650px;" >
				<div>
					<div style="width:650px;">
						<h2><a href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= vo.getTitle() %></a></h2>
						<div style="border:1px solid black;color: #999999; font-size: 16px;margin: 10px 10px 0px;padding: 20px 10px 10px"><%= vo.getNote() %></div>
                        <div style="padding: 20px 0px 0px;font-size: 12px;color: #777777;">
                      		 	<span><time><%= vo.getWdate() %></time></span>
                      	</div>
                    </div>
                </div>
            </div>
            <div style="background-color : yellow; position:absolute; bottom:15px; right:45px; width:210px; height:100px;" >
            	<a href="adminnewsview.jsp"><img width="210px" height="100px" src="../image/<%= vo.getImage() %>"></a>
            </div>
       	</div>
       	<%
		}
       	%>
	</td>
</tr>
<tr>
	<td align="center">
		<br>◀ 1 2 3 4 5 6 7 8 9 ▶
	</td>
</tr>
<%@ include file="../admininclude/newstail.jsp" %>