<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 
	<script>
	function Dodelete()
	{
		if( $("#pw").val() == "" )
		{	
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		
		if( $("#pw").val() != $("#pwcheck").val() )
		{	
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwcheck").focus();
			return;
		}
		
		pw = $("#pw").val();
		
		$.ajax({
			type     : "post",
			url      : "checkpw.jsp?pw=" + pw,
			dataType : "html"       ,
			success : function(data)
			{
				// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
				data = data.trim();
				if( data == "003" )
				{
					//비밀번호가 일치한다면
					if(confirm("탈퇴를 진행하시겠습니까?") == 1)
					{
						//탈퇴를 진행한다.
						$("#checkpwform").submit();
					}
				}else
				{
					alert("없는 비밀번호 입니다.");
				}
			},
		});
		return;
	}
	</script>
	<form id="checkpwform" method="post" action="userdelete.jsp?uno=<%= loginVO.getUno() %>">
		<table border="0" align="center" width="1200px">
			<tr>
				<td rowspan="4" width="300px"></td>
			</tr>
			<tr>
				<td colspan="2"><h1>회원탈퇴</h1><hr></td>
			</tr>
			<tr>
				<td width="300px" align="center"><h4>비밀번호</h4></td>
				<td><input type="password" id="pw" style="height:25px"></td>
			</tr>
			<tr>
				<td width="300px" align="center"><h4>비밀번호 확인</h4></td>
				<td><input type="password" id="pwcheck" style="height:25px"></td>
			</tr>
			<tr> 
				<td colspan="3" align="center" height="100px">
						<input type="button" value="완료" onclick="Dodelete();" style="width:100px; height:50px; font-size:15px; background-color:#4dd5b0; border-radius: 15px; border:0;">&emsp;
					<a href="myPage.jsp">
						<input type="button" value="취소" style="width:100px; height:50px; font-size:15px; border-radius: 15px; border:0;"></a>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="../include/tail.jsp" %> 