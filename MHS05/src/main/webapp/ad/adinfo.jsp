<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<% 
String adno = request.getParameter("adno");

int page_no = 1;
//����¡ 4�ܰ� : �������κ��� ������ ��ȣ�� �޴´�. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO listdto = new ListDTO();

//����¡ 1�ܰ�: ��ü �Խù� ������ ��´�.
int totalData = listdto.getclickadtotal(adno);

//����¡ 2�ܰ� : ��ü ������ ������ ����Ѵ�.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10���� ���� �������� 0�� �ƴϸ�
	//��ü ������ ���� ����
	totalPage++;
}

NewsDTO newdto = new NewsDTO();
AdDTO dto = new AdDTO();
AdVO  vo  = dto.Read(adno);
if( vo == null )
{
	//�ش� �Խù� ��ȣ�� �����Ͱ� ����
	%>
	<script>
		alert("�ش� ���� ��ȸ �� �� �����ϴ�.");
		document.location = "adlist.jsp";
	</script>
	<%
	return;
}

ArrayList<ClickAdVO> list = listdto.getclickadlist(adno,page_no);

%>
	<tr>
		<td colspan="2">
			<font style="font-size: xx-large; font-weight: 800;"><%= vo.getAdname() %></font>
			<a href="admodify.jsp?adno=<%= vo.getAdno() %>">
				<span id="modspan" style="background-color: #4dd5b0;">����</span>
			</a>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td align="center" width="650px" valign="top">
			<img src="../admin/adimagedown.jsp?adno=<%= adno %>" width="800px" height="140px">
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; text-align: left;">
				<h4>1. Ű����</h4>
				<font style="font-size: 20px"><b><%= vo.getAdkey() %></b></font><br>
			</div>
		</td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td>
			<div style="margin-top: 30px; margin-left:50px; font-size: x-large; text-align: left;">
				<h4>2.��������</h4>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table border="1" width="800px" align="center" style="border-collapse: collapse; ">
				<tr height="40px">
					<td width="50px" align="center">Ƚ��</td>
					<td width="200px" align="center">��¥</td>
					<td align="center">�Խù� ����</td>
				</tr>
				<%
				
				int SeqNo = listdto.getclickadtotal(adno) - (page_no - 1) * 10;
				
				for(ClickAdVO clickadvo : list)
				{
					NewsVO newsvo = newdto.Read(clickadvo.getNno());
				%>
				<tr height="30px">
					<td align="center"><%= SeqNo-- %></td>
					<td><%= clickadvo.getCdate() %></td>
					<td><a href="../admin/adminnewsview.jsp?nno=<%= clickadvo.getNno() %>"><%= newsvo.getTitle() %></a></td>
				</tr>
				<%
				}
				%>
			</table>
			<table border="0" width="800px" align="center">
				<tr>
					<td align="center">
						<%
							//����¡ 5�ܰ� : ���� �� �������� ���� �� ������ ���
							//���� ������ ��ȣ�� 16�϶� ���� �� ������ : 11 , ���� �� ������ : 20 ���� ���
							int startBlock = ((page_no-1)/10)*10; //���� ��� ������
							startBlock += 1;
							int endBlock = startBlock  + 10 - 1;  //���� ��� ������
							if( endBlock > totalPage)
							{
								//���� ��� �������� ��ü ���������� ũ��....
							    endBlock = totalPage;
							}		
							
							//����¡ 6�ܰ� : ����  [ ������ ��ȣ ��� ] ����  �� ǥ���Ѵ�.
							//���� �� ǥ���ϱ�
							if(startBlock > 10)
							{
								%>
								<a href="adinfo.jsp?adno=<%= adno %>&page=<%= startBlock - 1 %>">����</a>
								<%					
							}		
							for(int i=startBlock; i <= endBlock; i++)
							{
								if( i == page_no )
								{
									//���� ��������
									%><a style="color:red;" href="adinfo.jsp?adno=<%= adno %>&page=<%= i %>"><%= i %></a>&nbsp;<%
								}else
								{
									%><a href="adinfo.jsp?adno=<%= adno %>&page=<%= i %>"><%= i %></a>&nbsp;<%
								}
							}
							
							//���� �� ǥ���ϱ�
							if(endBlock < totalPage)
							{
								%>
								<a href="adinfo.jsp?adno=<%= adno %>&page=<%= endBlock + 1 %>">����</a>
								<%					
							}		
						%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="50px"></td>
	</tr>
	<tr>
		<td align="center" colspan="3" height="20px">
			<a href="adlist.jsp"><span id="span2">���</span></a>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 