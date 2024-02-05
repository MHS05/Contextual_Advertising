<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String category = request.getParameter("category");
if(category == null) category = "D";
String htitle = "���̾�Ʈ";
if(category.equals("F"))
{
	htitle = "����";
}
if(category.equals("E"))
{
	htitle = "�";
}
if(category.equals("N"))
{
	htitle = "������";
}
if(category.equals("M"))
{
	htitle = "�����ǰ�";
}
if(category.equals("F2"))
{
	htitle = "�����ǰ�";
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
	background-color:#4dd5b0;
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

			<div align="center" id="delbutton"><a href="writenews.jsp?">���</a></div>
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
								String hangulOnly = content.replaceAll("[^��-��\\s]", "");
								
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
				<a href="adminnewslist.jsp?category=<%= category %>&page=<%= startBlock - 1 %>">������</a>
				<%
				
			}
			
			for(int i = startBlock; i <= endBlock; i++)
			{	
				if( i == page_no )
				{
					%>
					<a style="color:red" "href="adminnewslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
					<%
				}else
				{
					%>
					<a href="adminnewslist.jsp?category=<%= category %>&page=<%= i %>"><%= i %></a>&nbsp;
					<%
				}
			}
			
			//������ ǥ��
			
			if( endBlock < totalPage)
			{
				%>
				<a href="adminnewslist.jsp?category=<%= category %>&page=<%= endBlock + 1 %>">������</a>
				<%
				
			}
		%>
	</td>
</tr>
</table>	
			</td>
		</tr>
		<tr>
			<td height="80px">
				<div><a href="../admin/adminnewslist.jsp"><h1>�ǰ��ҽ�</h1></a></div> 
			</td>
		</tr>
		<tr height="310px">
			<td width="20%" valign="top">
				<div style="width: 220px; height: 310px; box-shadow: 3px 3px 3px 3px lightgray;">
					<table border="0" width="200px" height="50px">
						<tr height="50px">
						<%
						if(category.equals("D"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=D"><b><u>���̾�Ʈ</u></b></a></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=D"><b>���̾�Ʈ</b></a></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("F"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F"><b><u>����</u></b></a></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F"><b>����</b></a></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("E"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=E"><b><u>�</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=E"><b>�</b></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("N"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=N"><b><u>������</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=N"><b>������</b></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("M"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=M"><b><u>�����ǰ�</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=M"><b>�����ǰ�</b></td>
						<%
						}
						%>
						</tr>
						<tr height="50px">
						<%
						if(category.equals("F2"))
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F2"><b><u>�����ǰ�</u></b></td>
						<%
						}else
						{
						%>
							<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp?category=F2"><b>�����ǰ�</b></td>
						<%
						}
						%>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td height="80px">
				<a href="../admin/admincategory.jsp"><h1>ī�װ�</h1></a>
			</td>
		</tr>
		<tr>
			<td height="80px">
				<a href="../admin/adminclist.jsp"><h1>Ŀ�´�Ƽ</h1></a>
			</td>
		</tr>
		<tr>
			<td height="80px">
				<a href="../ad/adlist.jsp"><h1>�������</h1></a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			</td>
		</tr>
	</table>
	<br>
	<br>
	<table border="0" width="1200px" align="center" height="150px">
			<tr>
				<td rowspan="5" width="250px" align="center">
					<img style="width:100px; height: 100px;" src="../image/market.png">
				</td>
				<td rowspan="5" width="10px">
				</td>
				<td colspan="2" height="15px" align="right">
					<hr>
				</td>
			</tr>
			<tr>
				<td width="450px">
					��㰡�ɽð�
				</td>
				<td>
					ȸ������
				</td>
			</tr>
			<tr>
				<td>
					���� : ���� 09:00 ~ ���� 06:00
				</td>
				<td>
					ȸ���̸� : ezen  |  ��ȭ��ȣ : 010-0000-0000
				</td>
			</tr>
			<tr>
				<td>
					���ɽð� : ���� 12:00 ~ ���� 01:00
				</td>
				<td>
					�̸��� : asdf@naver.com  |  ���ѹα� ���ֽ�
				</td>
			</tr>
			<tr>
				<td>
					�ָ� �޹�
				</td>
				<td>
					�ѽ� : 00-000-0000
				</td>
			</tr>
		</table>
	</body>
</html>