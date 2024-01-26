<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���庰 ���� �м�</title>
		<link rel="stylesheet" type="text/css" href="../highchart/highchart_emotion.css">
		<link rel="stylesheet" href="./highchart/jquery-ui.css">
		<script src="./js/jquery-3.7.1.js"></script>
		<script src="./js/jquery-ui.js"></script>		
	</head>
	<body>
		<script>
			window.onload = function()
			{
				ShowList();
			}
			
			//������ ����� ǥ���Ѵ�.
			function ShowList()
			{
				$.ajax({
					type : "get",
					url: "semotion.jsp",
					dataType: "html",
					success : function(data) 
					{	
						// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
						$("#itemList").html(data);
					}
				});				
			}			
			
			//��ȸ ��ư Ŭ��
			function GetItemDetail(senno)
			{
				$.ajax({
					type : "get",
					url: "detail.jsp?senno=" + senno,
					dataType: "html",
					success : function(data) 
					{	
						// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
						$("#itemDetail").html(data);
					},
					complete : function(data) 
					{	
						// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
					},
					error : function(xhr, sentance, error) 
					{
						// ��� ���� �߻���	
					}
				});			
			}	
			
			//������ �߰��Ѵ�.
			function AddStock()
			{
				//jquery�� �̿��Ͽ� ���庰����������ȣ/������ȣ ��ȿ�� �˻�
				if( $("#senno").val() == "")
				{
					alert("���庰����������ȣ�� �Է��ϼ���");
					$("#senno").focus();
					return;
				}
				if( $("#nno").val() == "")
				{
					alert("������ȣ�� �Է��ϼ���");
					$("#nno").focus();
					return;
				}
				
				$.ajax({
					type : "post",
					url: "addsemotion.jsp",
					data :
					{
						senno : $("#senno").val(),
						nno : $("#nno").val(),
					},
					dataType: "html",
					success : function(data) 
					{
						data = data.trim();
						if(data == "ERR-01")
						{
							alert("���庰����������ȣ������ �Է��ϼ���.");	
						}
						if(data == "ERR-02")
						{
							alert("������ ���庰����������ȣ�� ��ϵǾ� �ֽ��ϴ�.");	
						}
						if(data == "OK")
						{
							alert("���庰����������ȣ�� ����Ͽ����ϴ�.");
							ShowList();
						}
					}
				});				
			}
			
			//���庰����������ȣ�� �����Ѵ�.
			function DeleteItem(senno)
			{
				if(confirm("���庰����������ȣ�� �����Ͻðڽ��ϱ�?") == false)
				{
					return;	
				}
				$.ajax({
					type : "post",
					url: "delsemotion.jsp",
					data :
					{
						senno : senno
					},
					dataType: "html",
					success : function(data) 
					{	
						// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
						data = data.trim();
						alert(data);
						ShowList();
					}
				});					
			}
			
			//�м��� ��û�Ѵ�.
			function UpdateState(senno)
			{
				$.ajax({
					type : "get",
					url: "updatestock.jsp?senno=" + senno,
					dataType: "html",
					success : function(data) 
					{	
						data = data.trim();
						alert(data);
						ShowList();
						GetItemDetail(senno);
					}
				});				
			}			
		</script>		
		<table border="0" style="width:1000px" align="center">
			<tr>
				<td colspan="2"  style="height:80px" align="center">
					<h2>���庰 �����м�</h2> 
				</td>
			</tr>
			<tr>
				<td width="500px" valign="top" id="itemList">
					�̰��� ����� ǥ�õ˴ϴ�.			
				</td>
				<td valign="top" id="itemDetail">
					<table border="0" class="tb" style="width:100%" align="center">
						<tr>
							<td colspan="2" style="height:400px" valign="top">
								<ul>
									<li>- ������ ��Ͽ��� ������ �����ϸ� �ش� ����
										���� �ְ����� ������ ���� ������
										<br>&nbsp;&nbsp; ǥ�õ˴ϴ�.
									</li>
									<li>- ��� ������ �ֽ��� �ִ� 10������ �Դϴ�.
									</li>									
								</ul> 
							</td>
						</tr>
					</table>		
				</td>
			</tr>
		</table>
	</body>
</html>