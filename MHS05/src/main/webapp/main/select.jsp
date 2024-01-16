<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
Calendar now = Calendar.getInstance();
int nowmonth = now.get(Calendar.MONTH) + 1;     // 메인에 보여줄 현재 월 받기
int day      = now.get(Calendar.DAY_OF_MONTH);  // 메인에 보여줄 현재 일 받기
int curmonth = nowmonth;						// 현재 월 받아서 for 문에서 i 값하고 비교

String month = request.getParameter("month");   // 메인에서 월 선택 하면 넘어오는 값 받기

if( month == null || month.equals(""))          
{
	// 넘어오는 값이 null 이거나 빈값이면 메인으로으로 변경
	response.sendRedirect("select.jsp?month=" + nowmonth);
	return;
} else
{
	//값이 있는 경우 int로 변환해서 curmonth로 대입
	try
	{
		curmonth = Integer.parseInt(month);
		if(curmonth > 12)
		{
			//변환한 값이 12보다 큰경우 현재월 값으로 대입
			curmonth = nowmonth;
		}
	}catch(Exception e){}
}

String pno = request.getParameter("pno");
if(pno == null || pno.equals("")) pno = "all";

int page_no = 1;
//페이징 4단계 : 브라우저로부터 페이지 번호를 받는다. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//페이징 1단계: 전체 게시물 갯수를 얻는다.
int totalData = dto.GetMainTotal(month);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}
ArrayList<CategoryVO> list = dto.GetMainList(page_no,month,10);
int calNo = 0;

%>

		<table border="0" width="1400px" align="center">
			<tr height="50px">
				<td rowspan="5" width="200px">
				</td>				
				<td align="center">
					<p style="font-size: 200%;">
						<b>당신의 건강을 저희에게 맡겨 보시겠어요?</b>
					</p>
				</td>
			</tr>
				
			<tr>
				<td align="center">
					<h2>오늘은 <font color="#4dd5b0">
					<%= nowmonth %></font>월 <font color="#4dd5b0"><%= day %></font>일 입니다.
					&nbsp;&nbsp;몸에 좋은 제철 음식을 소개합니다</h2>
				</td>
			</tr>
			<tr height="50px">
				<td align="center" style="font-size: 20px; font-weight:bold;">
					<%
					for(int i = 1; i <= 12; i++)
					{
						%>
						<a class="month" href="index.jsp?month=<%= i %>&p=all"> 
							<%
							if(curmonth == i) //curmonth 값이 i 값과 같을 경우 굵게 표시  
							{
							%><font color="#4dd5b0"><b><%= i %>월</b></font><%
							} else
							{
							%><%= i %>월
							<%
							}
							%>
						</a>&nbsp;&nbsp;
							<%
					}
					%>
				</td>
			</tr>
				<tr height="50px">
					<td align="center" style="font-size: 20px;">
					<%
					int startBlock2 = ((page_no-1)/10)*10; //시작 블록 페이지
							startBlock2  += 1;
							int endBlock2 = startBlock2 + 10 - 1; //종료 블럭 페이지
							if(endBlock2 > totalPage)
							{
								//종료 블록 페이지가 전체 페이지보다 크면
								endBlock2 = totalPage;
							}
							
							
					if( page_no > 1)
							{
								%>
								&emsp;<a class="month" href="index.jsp?month=<%= month %>&p=all&page=<%= page_no - 1 %>">◀</a>&emsp;
								<%
								
							} else 
							{
								%>
								&emsp;<a class="month">◀</a>&emsp;
								<%	
							}
					%>
						<a class="month" href="index.jsp?month=<%= month %>&pno=all&page=<%= page_no %>">
							<% 
							if(pno == null || pno.equals("all"))
							{
								%><font color="#4dd5b0"><b>전체</b></font><%
							}else
							{
								%>전체<%
							}
							%>
							</a>&emsp;
					<%
					for(CategoryVO cvo2 : list)
					{
						%><a class="month" href="select.jsp?month=<%= month %>&pno=<%= cvo2.getPno() %>&page=<%= page_no %>">
							<%
							if(pno.equals(cvo2.getPno()))
							{
								%><font color="#4dd5b0"><strong><%= cvo2.getPname() %></strong></font><%
							} else
							{
								%><%= cvo2.getPname() %><%	
							}
							%>
							</a>&emsp;<%
					}
					%>
					<%
					if( page_no < totalPage)
							{
								%>
								<a href="index.jsp?month=<%= month %>&page=<%= page_no + 1 %>">▶</a>&emsp;
								<%
								
							} else
							{
								%>
								<a class="month">▶</a>&emsp;
								<%	
							}
					%>
					</td>
				</tr>
				<tr>
					<td colspan="5">
				<%
					CategoryVO cvo = new CategoryVO();
					CategoryDTO cdto = new CategoryDTO();
				if( !pno.equals("all"))
				{
					cvo = cdto.Read(pno);
				}
				%>
				<table border="0" width="700px" align="center" id="mianinfotable">
					<tr height="20px">
						<td colspan="2">
						</td>
					</tr>
					<tr>
						<td rowspan="5" align="center" valign="middle" width="200px">
							<img src="../category/categoryimagedown.jsp?pno=<%= cvo.getPno() %>" width="300px" height="350px" >
						</td>
						<td rowspan="5" width="40px">
						</td>
						<td style="font-weight: bold; font-size: 20px">
							<%= cvo.getPname() %>
						</td>
					</tr>
					<tr>
						<td>
							<span id="a" style="color:red; font-weight: bold;">
								<%= cvo.getMonth_start() %>월~<%= cvo.getMonth_end() %>월</span> 
							<span id="a">칼로리</span> 
							<span id="a"><%= cvo.getCalorie() %>Kcal</span>(100g)
						</td>
					</tr>
					<tr>
						<td>
							<%
								if(cvo.getInfo().length() > 200)
								{
									%>
										<%= cvo.getInfo().substring(0,199) %>... &nbsp; <a href="../category/info.jsp?pno=<%= cvo.getPno() %>" ><font color="blue"><ins>더보기</ins></font></a>
									<%
								} else
								{
								%><%= cvo.getInfo() %><%
								}
							%>
						</td>
					</tr>
				</table>
				</td>
				</tr>
		</table>
<%@ include file="../include/tail.jsp" %> 