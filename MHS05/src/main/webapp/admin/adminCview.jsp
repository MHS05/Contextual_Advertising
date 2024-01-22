<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %> 

<%
String kind = request.getParameter("kind");
if(kind == null) kind = "F";
String no = request.getParameter("no");
if( no == null || no.equals("") )
{
	response.sendRedirect("adminclist.jsp?kind=" + kind);
	return;
}

String btitle = "자유게시판";
if(kind.equals("TY"))
{
	btitle = "태양인게시판";
}
if(kind.equals("TE"))
{
	btitle = "태음인게시판";
}
if(kind.equals("SY"))
{
	btitle = "소양인게시판";
}
if(kind.equals("SE"))
{
	btitle = "소음인게시판";
}

CommunityDTO dto = new CommunityDTO();
CommunityVO  vo  = dto.Read(no, true);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "adminclist.jsp?kind=<%= kind %>";
	</script>
	<%
	return;
}
%>
<style>

	#listbutton
	{	
		width:100px;
		height:30px; 
		font-size:15px;
		cursor:pointer;
		background-color:#4dd5b0;
		border:0;
		border-radius: 5px;
	}
	#deletebutton
	{	
		width:60px;
		height:30px; 
		font-size:15px;
		cursor:pointer;
		background-color:lightgray;
		border:0;
		border-radius: 5px;
	}
	
	#readdbutton
	{	
		width:50px;
		height:25px; 
		cursor:pointer;
		background-color:#4dd5b0;
		border:0;
		border-radius: 5px;
	}
	
	#remodifybutton
	{	
		width:50px;
		height:25px; 
		cursor:pointer;
		background-color:lightgray;
		border:0;
		border-radius: 5px;
	}

	#redeletebutton
	{	
		width:50px;
		height:25px; 
		cursor:pointer;
		background-color:lightgray;
		border:0;
		border-radius: 5px;
	}
	
	td {word-break:break-all; word-wrap:break-word;}
</style>
<script>

//게시물 삭제

window.onload = function() 
{
	$("#rnote").keyup(function (e){
	   var content = $(this).val()
	   length = content.length;
	   $("#rcount").html(length);
	});
}

function DoDelete()
{
	if( confirm("해당 게시물을 삭제 하시겠습니까?") == 0)
	{
		return;	
	}
	document.location = "../community/communitydelete.jsp?kind=<%=kind %>&no=<%= no %>";
}

//댓글 등록
function AddReply()
{
	if( $("#rnote").val() == "" )
	{
		alert("댓글을 입력하세요.");
		$("#rnote").focus();
		return;
	}
	
	$.ajax({
		type : "post",
		url: "../community/addreply.jsp",
		data :
		{
			no : "<%= no %>",
			rnote : $("#rnote").val()
		},		
		dataType : "html",	
		success : function(data) 
		{
			data = data.trim();
			alert(data);
			document.location = "adminCview.jsp?no=<%= no %>";
		}
	});		
}


//댓글 삭제
function DeleteReply(rno)
{
	if(confirm("해당 댓글을 삭제하시겠습니까?") == false)
	{
		return;	
	}	
	$.ajax({
		type : "get",
		url: "../community/delreply.jsp?rno=" + rno,
		dataType : "html",	
		success : function(data) 
		{
			data = data.trim();
			alert(data);
			document.location = "adminCview.jsp?no=<%= no %>";
		}
	});	
}

//댓글 수정
function ModifyReply(rno)
{
	if(confirm("해당 댓글을 수정하시겠습니까?") == false)
	{
		return;	
	} else 
	{
		$("#"+rno+"myrnote").css('display', 'none');
		$("#"+rno+"myrdate").css('display', 'none');
		$("#"+rno).css('display', '');
		$("#"+rno+"readd").css('display', '');
		$("#rnoteModify").focus();
	}
}

//댓글 수정 취소버튼
function modifyCancel()
{
		$('#'+rno ).css('display', 'none');
		$("#"+rno+"readd").css('display', 'none');
		$("#"+rno+"myrnote").css('display', '');
		$("#"+rno+"myrdate").css('display', '');
}

function ReAddReply(rno)
{
	if( $("#rnoteModify").val() == "" )
	{
		alert("댓글을 입력하세요.");
		$("#rnoteModify").focus();
		return;
	}
	
	$.ajax({
		type : "post",
		url: "../community/modifyreply.jsp",
		data :
		{	
			no : "<%= no %>",
			rno : rno,
			rnote : $("#rnoteModify").val()
		},		
		dataType : "html",	
		success : function(data) 
		{
			data = data.trim();
			alert(data);
			document.location = "adminCview.jsp?no=<%= no %>";
		}				
	});		
}

function GoBack()
{
	 history.back();
}


</script>

<tr>
	<td colspan="5" height="50px"><a href="adminclist.jsp?kind=<%= kind %>"><h2><%= btitle %></h2></a></td>
</tr>
<tr>
	<td colspan="5" height="20px"><hr></td>
<tr>
<tr>
	<td colspan="5" height="50px"><h2><%= vo.getTitle() %></h2></td>
</tr>
<tr>
	<td colspan="3" align="left" height="20px">작성자 : <%= vo.getNickname() %></td>
	<td align="right" width="150px" height="20px">|&nbsp;&nbsp;조회수 : <%= vo.getHit() %>회&nbsp;&nbsp;|</td>
	<td align="center" width="230px"height="20px">작성일 : <%= vo.getWdate() %></td>
</tr>
<tr>
	<td colspan="5" height="20px"><hr></td>
<tr>
<tr>
	<td colspan="5" heigth="500px" valign="top">
	<%
		if( vo.getImage() != null && !vo.getImage().equals("") )
		{
			%>
				<img style="width:40%;height:40%;" src="imagedown.jsp?no=<%= no %>"><br>
				<%= vo.getNote().replace("\n","<br>\n") %>	
			<%
		}else
		{
			%>
				<%= vo.getNote().replace("\n","<br>\n") %>
			<%
		}
	%>
	</td>
</tr>
<tr>
	<td colspan="5" align="right" height="20px">
	<a href="javascript:DoDelete();"><input type="button" id="deletebutton" value="삭제" style="background-color:#FD7064;"></a>
<tr>
<tr>
	<td colspan="5" height="20px"><hr></td>
<tr>
<tr>
	<td colspan="5" height="20px" align="left">첨부파일 : 
	<%
	if( vo.getFname() != null && !vo.getFname().equals("") )
	{
		%><a href="down.jsp?no=<%= no %>"><%= vo.getFname() %></a><%
	}else
	{
		%>등록된 첨부파일이 없습니다.<%
	}
	%>
	</td>
</tr>
<tr>
	<td colspan="5" height="5px"><hr></td>
</tr>
<tr>
<td colspan="5" valign="top">
<table width="100%" border="0" >
<tr>
	<td align="center" width="180px" style="height:30px; background-color:lightgrey;">
	<%= loginVO.getNickname() %>
	</td>
	<br>
	<td colspan="3" width="500px"><input type="text" id="rnote" name="rnote" maxlength="50" style="width:99%; height: 25px" placeholder="댓글을 입력해주세요 (50자 제한)"></td>
	<td colspan="2" align="right">
		<font style="color:gray; font-size: 12px">
			<div style="float:left ; width:25px; background-color: white;">
				<span id="rcount" style="cursor:default;padding: 0px 0px;  margin-right:7px; background-color: white;">0</span><br>
				<span style="cursor:default; padding: 0px 0px; margin-right:0px; background-color: white;">/ 50</span>
			</div>
		</font>
		<input type="button" id="readdbutton" onclick="AddReply();" value="등록">&emsp;&nbsp;
	</td>
</tr>
<%
ReplyDTO rdto = new ReplyDTO();
ArrayList<ReplyVO> rlist = rdto.GetList(no);

for(ReplyVO rvo : rlist)
{
	String rno   = rvo.getRno();
	String rid   = rvo.getId();
	String rname = rvo.getName();
	String rnote = rvo.getRnote();
	String rdate = rvo.getRdate();
	String rnickname = rvo.getNickname();
	%>
	<tr>
		<td align="center" width="180px"><%= rnickname %></td>
		<td id="<%= rno %>" colspan="3" style="display: none"><!-- 수정버튼 누르면 나옴 -->
			<input type="text" id="rnoteModify" name="rnoteModify" style="width:99%; height: 25px" value="<%= rvo.getRnote()%>">
		</td>
		<td id="<%= rno %>readd" align="left" style="display: none">
			<input type="button" id="readdbutton" onclick="ReAddReply('<%= rno %>');" value="수정">
			<input type="button" id="redeletebutton" onclick="modifyCancel();" value="취소">
		</td>
		<td id="<%= rno %>myrnote" colspan="3"><%= rnote %>
				<% 
				if( rvo.getId().equals(loginVO.getId()) )
				{
					%>
						[ <a href="javascript:ModifyReply('<%= rno %>')"><ins>수정</ins></a> ]
					<%
				}
				%>
				[ <a href="javascript:DeleteReply('<%= rno %>')"><ins>삭제</ins></a> ]
		</td>
		<td id="<%= rno %>myrdate" width="110px" align="left"><%= rdate %></td>
	</tr>	
	<%
	}
	%>
	<tr>
		<td align="center" colspan="5" height="100px">
			<a href="adminclist.jsp?kind=<%= kind %>"><input type="button" id="listbutton" value="목록" style="background-color:#4dd5b0;"></a>
		</td>
	</tr>
</table>
<%@ include file="../admininclude/tail.jsp" %> 