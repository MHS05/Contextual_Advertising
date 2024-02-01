<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String ltype = request.getParameter("ltype");
if(ltype == null ) ltype = "num";

int page_no = 1;
//����¡ 4�ܰ� : �������κ��� ������ ��ȣ�� �޴´�. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//����¡ 1�ܰ�: ��ü �Խù� ������ ��´�.
int totalData = dto.getadtotal("");

//����¡ 2�ܰ� : ��ü ������ ������ ����Ѵ�.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10���� ���� �������� 0�� �ƴϸ�
	//��ü ������ ���� ����
	totalPage++;
}

ArrayList<AdVO> list = dto.getadlist(page_no,"");

if( ltype.equals("num"))
{
	list = dto.getadlist(page_no, "");
}
%>
<script>
var selectedElementsCnt = 0; //üũ�� üũ�ڽ� ����

function getCheckedCnt()  
{
	// ���õ� ��� ��������
	const query = 'input[name="delNo"]:checked';
	const selectedElements = document.querySelectorAll(query);
	  
	  // ���õ� ����� ���� ����
	selectedElementsCnt = selectedElements.length;
}

//��ü����
function selectAll(selectAll)  
{
	getCheckedCnt();
	const checkboxes = document.getElementsByName("delNo");
	checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}

function Dodelete() 
{
	if(selectedElementsCnt == "0")
	{
		alert("������ �Խù��� ���� ���ּ���.")
	} else {
		
		$("#nlistForm").submit();
		
	}
}
</script>
<form id="nlistForm" method="get" action="addelete.jsp">
	<tr>
		<td colspan="7">
			<a href="javascript:Dodelete();"><div class="dbutton" style="background-color:#FD7064;">���û���</div></a>
			<a href="adupload.jsp">
				<div class="dbutton" style="background-color: #4dd5b0">����ϱ�</div>
			</a>
			<h2><b>���� �Խ���</b></h2>
			<hr>
		</td>
	</tr>
	<tr>
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo"  value="selectall" onclick='selectAll(this)'>
		</td>
		<td align="center" width="30px">�����ȣ</td>
		<td align="center" width="100px">��ǰ�̸�</td>
		<td align="center" width="50px">Ű����</td>
		<td align="center" width="50px">����Ƚ��</td>
	</tr>
	<tr>
		<td colspan="7"><hr></td>
	</tr>
	<%
	for(AdVO vo : list)
	{
		ClickAdDTO addto = new ClickAdDTO();
		ClickAdVO  advo = addto.Read(vo.getAdno());
		int clickCount = dto.getclickadtotal(vo.getAdno());
	%>
	<tr>
		<td align="center" width="10px">
			<input type="checkbox" name="delNo" id="delNo" value="<%= vo.getAdno() %>" onclick='getCheckedCnt()'>
		</td>
		<td align="center"><%= vo.getAdno() %></td>
		<td align="center"><a href="adinfo.jsp?adno=<%= vo.getAdno() %>"><%= vo.adname %></a></td>
		<td align="center"><%= vo.adkey %></td>
		<td align="center"><%= clickCount %></td>
	</tr>
	<tr>
		<td colspan="7"><hr></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="7" style="text-align:center;">
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
			<a href="adminnlist.jsp?page=<%= startBlock - 1 %>">����</a>
			<%					
		}		
		for(int i=startBlock; i <= endBlock; i++)
		{
			if( i == page_no )
			{
				//���� ��������
				%><a style="color:red;" href="adminnlist.jsp?page=<%= i %>"><%= i %></a>&nbsp;<%
			}else
			{
				%><a href="adminnlist.jsp?page=<%= i %>"><%= i %></a>&nbsp;<%
			}
		}
		//���� �� ǥ���ϱ�
		if(endBlock < totalPage)
		{
			%>
			<a href="adminnlist.jsp?page=<%= endBlock + 1 %>">����</a>
			<%					
		}		
		%>
		</td>
	</tr>
<%@ include file="../admininclude/tail.jsp" %> 