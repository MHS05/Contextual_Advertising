<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>문장별 감성 분석</title>
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
			
			//종목의 목록을 표시한다.
			function ShowList()
			{
				$.ajax({
					type : "get",
					url: "semotion.jsp",
					dataType: "html",
					success : function(data) 
					{	
						// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
						$("#itemList").html(data);
					}
				});				
			}			
			
			//조회 버튼 클릭
			function GetItemDetail(senno)
			{
				$.ajax({
					type : "get",
					url: "detail.jsp?senno=" + senno,
					dataType: "html",
					success : function(data) 
					{	
						// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
						$("#itemDetail").html(data);
					},
					complete : function(data) 
					{	
						// 통신이 성공하거나 실패했어도 이 함수를 타게된다.
					},
					error : function(xhr, sentance, error) 
					{
						// 통신 오류 발생시	
					}
				});			
			}	
			
			//문장을 추가한다.
			function AddStock()
			{
				//jquery를 이용하여 문장별감정관리번호/뉴스번호 유효성 검사
				if( $("#senno").val() == "")
				{
					alert("문장별감정관리번호를 입력하세요");
					$("#senno").focus();
					return;
				}
				if( $("#nno").val() == "")
				{
					alert("뉴스번호을 입력하세요");
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
							alert("문장별감정관리번호정보를 입력하세요.");	
						}
						if(data == "ERR-02")
						{
							alert("동일한 문장별감정관리번호가 등록되어 있습니다.");	
						}
						if(data == "OK")
						{
							alert("문장별감정관리번호을 등록하였습니다.");
							ShowList();
						}
					}
				});				
			}
			
			//문장별감정관리번호를 삭제한다.
			function DeleteItem(senno)
			{
				if(confirm("문장별감정관리번호을 삭제하시겠습니까?") == false)
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
						// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
						data = data.trim();
						alert(data);
						ShowList();
					}
				});					
			}
			
			//분석을 요청한다.
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
					<h2>문장별 감성분석</h2> 
				</td>
			</tr>
			<tr>
				<td width="500px" valign="top" id="itemList">
					이곳에 목록이 표시됩니다.			
				</td>
				<td valign="top" id="itemDetail">
					<table border="0" class="tb" style="width:100%" align="center">
						<tr>
							<td colspan="2" style="height:400px" valign="top">
								<ul>
									<li>- 왼쪽의 목록에서 종목을 선택하면 해당 종목에
										대한 주가지수 예측을 위한 정보가
										<br>&nbsp;&nbsp; 표시됩니다.
									</li>
									<li>- 등록 가능한 주식은 최대 10개까지 입니다.
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