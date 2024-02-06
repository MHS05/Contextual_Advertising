<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<% 
String category = request.getParameter("category");
if(category == null) category = "D";
String ntitle = "���̾�Ʈ";
if(category.equals("F"))
{
	ntitle = "����";
}
if(category.equals("E"))
{
	ntitle = "�";
}
if(category.equals("N"))
{
	ntitle = "������";
}
if(category.equals("M"))
{
	ntitle = "�����ǰ�";
}
if(category.equals("F2"))
{
	ntitle = "�����ǰ�";
}

int page_no = 1;
//����¡ 4�ܰ� : �������κ��� ������ ��ȣ�� �޴´�. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//����¡ 1�ܰ�: ��ü �Խù� ������ ��´�.
int totalData = dto.getnewstotal(category,"");

//����¡ 2�ܰ� : ��ü ������ ������ ����Ѵ�.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10���� ���� �������� 0�� �ƴϸ�
	//��ü ������ ���� ����
	totalPage++;
}

ArrayList<NewsVO> list = dto.getnewslist(page_no, category, "");
%>
<style>
.submenu
{
	font-size: 20px;
}
#fixed 
{
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 100px;
	padding: 5px;
	color: white;
}
</style>
<div id="fixed" style="width:50px; height: 50px;">
	<a href="#top"><img style="width:50px; height: 50px;" src="../image/topbutton.png"></a>
</div>
<table border="0" align="center" width="1200px">
			<tr>
				<td width="200px" valign="top" >		
					<div><a href="news.jsp"><h1><u>�ǰ��ҽ�</u></h1></a></div> 	
					<div style="width:220px; height:360px; box-shadow: 3px 3px 3px 3px lightgray">
						<table border="0" align="left" width="200px" height="50px">
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/diet.png">
									<a href="../news/newslist.jsp?category=D">
									<%
									if(category.equals("D"))
									{
									%>
										<b><u>���̾�Ʈ</u></b></a></td>
									<%
									}else
									{
									%>
										<b>���̾�Ʈ</b></a></td>
									<%
									}
									%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/food.png">
									<a href="../news/newslist.jsp?category=F">
								<%
								if(category.equals("F"))
								{
								%>
									<b><u>����</u></b></a></td>
								<%
								}else
								{
								%>
									<b>����</b></a></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/excercise.png">
									<a href="../news/newslist.jsp?category=E">
								<%
								if(category.equals("E"))
								{
								%>
									<b><u>�</u></b></td>
								<%
								}else
								{
								%>
									<b>�</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/nutrition.png">
									<a href="../news/newslist.jsp?category=N">
								<%
								if(category.equals("N"))
								{
								%>
									<b><u>������</u></b></td>
								<%
								}else
								{
								%>
									<b>������</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/man.png">
									<a href="../news/newslist.jsp?category=M">
								<%
								if(category.equals("M"))
								{
								%>
									<b><u>�����ǰ�</u></b></td>
								<%
								}else
								{
								%>
									<b>�����ǰ�</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td class="submenu">
									<image width="30px" height="30px" src="../image/woman.png">
									<a href="../news/newslist.jsp?category=F2">
								<%
								if(category.equals("F2"))
								{
								%>
									<b><u>�����ǰ�</u></b></td>
								<%
								}else
								{
								%>
									<b>�����ǰ�</b></td>
								<%
								}
								%>
							</tr>
							<tr height="50px">
								<td></td>
							</tr>
						</table>
					</div>
				</td>
				<td width="20px">
				</td>	
				<td valign="top">
					<div style="border-bottom: 1px solid lightgray; "><h2><%= ntitle %></h2></div>
					<%
					for(NewsVO vo : list)
					{
					%>
					<div style="border-bottom: 1px solid lightgray; position: relative;">
						<div style="width: 650px;" >
							<div>
								<div style="width:650px;">
									<h2><a href="../news/newsview.jsp?nno=<%= vo.getNno() %>&category=<%=category %>"><%= vo.getTitle() %></a></h2>
									<div style="color: #999999; font-size: 16px;margin: 10px 0px 0px;padding: 0px 0px 10px;">
										<% 
											String content = vo.getNote(); 
											String hangulOnly = content.replaceAll("[^��-��\\s]", "");
											
											if(hangulOnly.length() > 100)
											{
												%>
													<a style="color: #999999;" href="../news/newsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly.substring(16,120) %>...</a>
												<%
											} else
											{
												%><a style="color: #999999;" href="../news/newsview.jsp?nno=<%= vo.getNno() %>"><%= hangulOnly %></a><%
											}
										%>
	                           		 </div>
		                            <div style="padding: 20px 0px 0px;font-size: 12px;color: #777777;">
		                           		 	<span><time><%= vo.getWdate() %></time></span>
		                           	</div>
		                       	</div>
	                       	</div>
	                    </div>
	                    <div style="background-color : white; position:absolute; bottom:15px; right:45px; width:210px; height:130px;" >
	                    	<a href="../news/newsview.jsp?nno=<%= vo.getNno() %>">
	                    		<img width="210px" height="130px" src="../admin/newsimagedown.jsp?nno=<%= vo.getNno() %>">
                    		</a>
	                    </div>
                    </div>
                    <%
					}
                   	%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				</td>
				<td align="center">
					<%
						//����¡ 5�ܰ� : ����, ���� �� ������ ���
						//���� ������ ��ȣ�� 16�϶� ���� �� ������ : 11, ���� �� ������ :20
						int startBlock = ((page_no-1)/10)*10; //���� ��� ������
						startBlock  += 1;
						int endBlock = startBlock + 10 - 1; //���� �� ������
						if(endBlock > totalPage)
						{
							//���� ��� �������� ��ü ���������� ũ��
							endBlock = totalPage;
						}
						
						//����¡ 6�ܰ� : ���� , ���� �� ǥ���Ѵ�.
						
						if( startBlock > 10)
						{
							%>
							<a href="newslist.jsp?category=<%= category %>&page=<%= startBlock - 1 %>">������</a>
							<%
							
						}
						
						for(int i = startBlock; i <= endBlock; i++)
						{	
							if( i == page_no )
							{
								%>
								<a style="color:red" "href="newslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
								<%
							}else
							{
								%>
								<a href="newslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
								<%
							}
						}
						
						//������ ǥ��
						
						if( endBlock < totalPage)
						{
							%>
							<a href="newslist.jsp?category=<%= category %>&page=<%= endBlock + 1 %>">������</a>
							<%
						}
					%>
				</td>
			</tr>
	</table>
<%@ include file="../include/tail.jsp" %>