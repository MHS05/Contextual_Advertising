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

ListDTO listdto = new ListDTO();
String adno = "";

ArrayList<AdVO> adlist = listdto.getAdList(nno);
if( adlist.size() == 0)
{
	adno = "";
} else 
{
	
	Collections.shuffle(adlist);
	adno = adlist.get(0).getAdno();
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
	margin : 20px;
	padding : 20px;
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
#yes_btn
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	border-radius: 12px;
	cursor: pointer;
	font-size:18px;
	border: none;
}
#no_btn
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	border-radius: 12px;
	cursor: pointer;
	font-size:18px;
	border: none;
}
.del
{
	border: 0;
	background-color:lightgray;
	font-size: 16px;
	cursor: pointer;
}
.icon
{
	position:absolute;
	right:432px;
	margin-top:5px;
}

#ad {
    display: block; /* �ʱ⿡�� ���̰� ���� */
}

#confirm-btn {
    display: none; /* �ʱ⿡�� ���� */
    text-align:center;
    margin-left:50px;
    font-size:20px;
    position:relative;
    top:50px;
}

#ad2
{	
	left:660px;
    position:absolute;
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
	
	function openreason() 
	{
		//�α��� �˾�â ����� ����
		var _width = '1200';
		var _height = '1000';
			
		var _left = Math.ceil((window.screen.width - _width )/2);
		var _top = Math.ceil((window.screen.height - _height )/2);
		
		window.open('../highchart/highchart01.jsp?nno=<%= vo.getNno() %>&adno=<%= adno %>', '', 'width=1200, height=1000, left=' + _left +', top=' + (_top - 250)); return false;
		
	}
	
// X ��ư Ŭ�� �� �̺�Ʈ ó��
	function cancel() 
	{
		document.getElementById('ad').style.display = 'none';
		document.getElementById('ad2').style.display = '';
		document.getElementById('icon').style.display = 'none';
		document.getElementById('confirm-btn').style.display = 'block';
	};
	
	function adnone()
	{
		$("#adimage").css("display","none");
	}
	
	function adview()
	{	
		$("#ad2").css("display","none");
		$("#confirm-btn").css("display","none");
		$("#ad").css("display","");
		$("#icon").css("display","");
	}
</script>
<tr>
	<td valign="top">
		<div style="position:relative; border-bottom: 1px solid lightgray; "><h2><%= htitle %></h2>
			<div align="center" id="modbutton"><a href="modifynews.jsp?nno=<%= vo.getNno() %>">����</a></div>
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
			<div id="adimage">���� ��� �Դϴ�<img src="../image/devil.png" style="width:25px; height:25px;"></div>
		<%
		}else
		{	
			if(adno.equals(""))
			{
				%>
				<div id="adimage">Ű���� ���絵�� ���� ��簡 �����ϴ�</div>
				<%
				
			} else 
			{
				%>
				<div id="adimage" style="width:800px; height:150px">
					<a href="javascript:openreason();">
						<img id="ad" style="border:3px solid lightgray" width="800px" height="140px" src="adimagedown.jsp?adno=<%= adno %>">
					</a>
					<img id="ad2" style="display:none; border:3px solid lightgray" width="800px" height="140px" src="../image/gray.png">
					<span id="confirm-btn">���� �����ðڽ��ϱ�?<br>
						 <input id="yes_btn" type="button" value="��" onclick="adnone()">
					   	 <input id="no_btn" type="button" value="�ƴϿ�" onclick="adview()">
				    </span>
					<span id="icon" class="icon" style="margin-right:2px">
					<img src="../image/ad.png" width="40px" height="19px" valign="top" style="border-radius:5px">
					<img id="close-btn" src="../image/x.png" width="30px" height="20px" valign="top" style="cursor:pointer" onclick="cancel()">
					</span>
				</div>
				<%
			}
		}
		%>
		<div id="newsmain" style="">
			<div id="newsnote">
				<%= vo.getNote() %>
			</div>
		</div>
		<div style="height: 20px"></div>
		<div style="text-align: center;">
			<a href="adminnewslist.jsp"><div id="listbutton" style="background-color: #4dd5b0;">���</div></a>
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