<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
if( loginVO == null)
{	
	//�α��� ���� ���� ��� ó��
	response.sendRedirect("../main/index.jsp");
	return;
}
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
String nno = request.getParameter("nno");
String page_no = request.getParameter("page");
if(page_no == null || page_no.equals("")) page_no = "";

NewsDTO dto = new NewsDTO();
NewsVO  vo  = dto.Read(nno);
if( vo == null )
{
	//�ش� �Խù� ��ȣ�� �����Ͱ� ����
	%>
	<script>
		alert("�ش� �Խù��� ��ȸ �� �� �����ϴ�.");
		document.location = "adminnewslist.jsp";
	</script>
	<%
	return;
}
%>
<style>
#newstitle
{
	margin-left: 15px;
}


#newsimage
{
	text-align: center;	
}

#adimage
{	
	margin-top : 20px;
	text-align:center;
}

#newsnote
{	
	width: 750px;
	font-size : large;
	margin: auto;
}

#listbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
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

#modbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
	position:absolute;
	right: 100px;
	top:0px;
}
.del
{
	border: 0;
	background-color:lightgray;
	font-size: 16px;
	cursor: pointer;
}
</style>
<script>
	function del()
	{
		if(confirm("������ �����Ͻðڽ��ϱ�?") == false)
		{
			return;	
		}else 
		{
			$.ajax({
				type : "post",
				url: "newsdelok.jsp",
				data :
				{	
					nno : <%= vo.getNno() %>,
				},		
				dataType : "html",	
				success : function(data) 
				{
					data = data.trim();
					alert("������ �����Ǿ����ϴ�.");
					document.location = "adminnewslist.jsp";
				}				
			});
		}
	}
</script>
<tr>
	<td valign="top">
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2>
			<div align="center" id="modbutton"><a href="../admin/modifynews.jsp">����</a></div>
			<div align="center" id="delbutton"><input type="button" class="del" id="del" value="����" onclick="del()"></div>
		</div>
		<div id="newstitle"><h2><%= vo.getTitle() %></h2>
			<span><font color="gray" size="2px">�Է�&nbsp;<time><%= vo.getWdate() %></time></font></span><br>
			<span><%= loginVO.getName() %></span>
		</div>
		<div style="height:50px"></div>
		<div id="newsimage">
			<img style="width:100%;height:100%;" src="newsimagedown.jsp?nno=<%= nno %>">
		</div>
		<%
		if(vo.getEmotion().equals("����"))
		{
		%>
		<div id="adimage">
		</div>
		<%
		}else
		{	
			String adno = vo.getAdno();
			AdDTO addto = new AdDTO();
			AdVO advo = addto.Read(adno);
		%>
		<div id="adimage">
			<a href="../highchart/highchart01.jsp" target="_blank"><img width="800px" height="140px" src="../image/ad.jpg"></a>
		</div>
		<%
		}
		%>
		<div style="height:50px"></div>
		<div id="newsmain" style="">
			<div id="newsnote">
				<%= vo.getNote() %>
			</div>
		</div>
		<div style="height: 20px"></div>
		<div style="text-align: center;">
			<a href="adminnewslist.jsp"><div id="listbutton">���</div></a>
		</div>
	</td>
</tr>
</table>	
				</td>
			</tr>
			<tr>
				<td height="80px">
					<div><a href="../admin/adminnews.jsp"><h1>�ǰ��ҽ�</h1></a></div> 
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
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b><u>���̾�Ʈ</u></b></a></td>
							<%
							}else
							{
							%>
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>���̾�Ʈ</b></a></td>
							<%
							}
							%>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>����</b></a></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>�</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>������</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>�����ǰ�</b></td>
							</tr>
							<tr height="50px">
								<td style="font-size: 20px;"><a href="../admin/adminnewslist.jsp"><b>�����ǰ�</b></td>
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