<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String category = request.getParameter("category");
if(category == null) category = "D";
String htitle = "다이어트";
if(category.equals("F"))
{
	htitle = "음식";
}
if(category.equals("E"))
{
	htitle = "운동";
}
if(category.equals("N"))
{
	htitle = "영양제";
}
if(category.equals("M"))
{
	htitle = "남성건강";
}
if(category.equals("F2"))
{
	htitle = "여성건강";
}

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
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2>

			<div align="center" id="delbutton"><a href="writenews.jsp?category=D">등록</a></div>
		</div>
		<%
		for(NewsVO vo : list)
		{
		%>
		<div style="border-bottom: 1px solid lightgray; position: relative; height: 145px;">
			<div style="width: 650px;" >
				<div>
					<div style="width:650px;">
						<h3><a href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= vo.getTitle() %></a></h3>
						<div id=note style="height:30px; color: #999999; font-size: 16px;margin: 0px 10px 5px;padding: 10px 10px 10px">
							<% 
								String content = vo.getNote(); 
								String hangulOnly = content.replaceAll("[^가-힝\\s]", "");
								
								if(hangulOnly.length() > 100)
								{
									%>
										<a style="color: #999999;" href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly.substring(16,120) %>...</a>
									<%
								} else
								{
									%><a style="color: #999999;" href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly %></a><%
								}
							%>
						</div>
                        <div style="padding: 20px 0px 0px;font-size: 12px;color: #777777;">
                      		 	<span><time><%= vo.getWdate() %></time></span>
                      	</div>
                    </div>
                </div>
            </div>
            <div style="position:absolute; bottom:15px; right:45px; width:210px; height:130px;" >
            	<a href="../admin/adminnewsview.jsp?nno=<%= vo.getNno() %>"><img width="210px" height="130px" src="newsimagedown.jsp?nno=<%= vo.getNno() %>"></a>
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