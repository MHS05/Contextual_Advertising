<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "F";
String no = request.getParameter("no");
if( no == null || no.equals("") )
{
	response.sendRedirect("communitylist.jsp");
	return;
}

String page_no = request.getParameter("page");
if(page_no == null || page_no.equals("")) page_no = "";

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
		document.location = "communitylist.jsp";
	</script>
	<%
	return;
}
%>
<script>

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
	document.location = "communitydelete.jsp?kind=<%=kind %>&no=<%= no %>";
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
		url: "addreply.jsp",
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
			document.location = "communityview.jsp?no=<%= no %>";
		}				
	});		
}
//댓글삭제
function DeleteReply(rno)
{
	if(confirm("해당 댓글을 삭제하시겠습니까?") == false)
	{
		return;	
	}	
	$.ajax({
		type : "get",
		url: "delreply.jsp?rno=" + rno,
		dataType : "html",	
		success : function(data) 
		{
			data = data.trim();
			alert(data);
			document.location = "communityview.jsp?no=<%= no %>";
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

function modifyCancel(rno)
{
		$("#"+rno).css('display', 'none');
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
		url: "modifyreply.jsp",
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
			document.location = "communityview.jsp?no=<%= no %>";
		}				
	});		
}


</script>
<style>
	.submenu
	{
	font-size: 20px;
	}
	
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
	#modifybutton
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
		<table border="0" align="center" width="1200px">
			<tr>
				<td rowspan="26" width="20%" valign="top">
					<div><a href="communitylist.jsp"><h1><u>커뮤니티</u></h1></a></div> 
					<div style="width: 220px; height: 300px; box-shadow: 3px 3px 3px 3px lightgray;">
						<table border="0" align="left" width="200px" height="50px">
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/free.png">
								<a href="communitylist.jsp?kind=F" >
								<%
								if(kind.equals("F")){
								%>
								<b><u>자유게시판</u></b></a></td><%
								}else{
								%>
								<b>자유게시판</b></a></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/ty.png">
								<a href="communitylist.jsp?kind=TY">
								<%
								if(kind.equals("TY")){
								%>
								<b><u>태양인게시판</u></b></a></td><%
								}else{
								%>
								<b>태양인게시판</b></a></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/te.png">
								<a href="communitylist.jsp?kind=TE">
								<%
								if(kind.equals("TE")){
								%>
								<b><u>태음인게시판</u></b></a></td><%
								}else{
								%>
								<b>태음인게시판</b></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/sy.png">
								<a href="communitylist.jsp?kind=SY">
								<%
								if(kind.equals("SY")){
								%>
								<b><u>소양인게시판</u></b></a></td><%
								}else{
								%>
								<b>소양인게시판</b></td><%
								}%>
							</tr>
							<tr height="50px">
								<td class="submenu">
								<image width="30px" height="30px" src="../image/se.png">
								<a href="communitylist.jsp?kind=SE">
								<%
								if(kind.equals("SE")){
								%>
								<b><u>소음인게시판</u></b></a></td><%
								}else{
								%>
								<b>소음인게시판</b></td><%
								}%>
							</tr>
						</table>
					</div>
				</td>
				<td colspan="5" height="50px"><a href="communitylist.jsp?kind=<%= kind %>"><h2><%= btitle %></h2></a></td>
			</tr>
			<tr>
				<td colspan="5" height="20px"><hr></td>
			<tr>
			<tr>
				<td colspan="5" height="50px"><h2><%= vo.getTitle() %></h2></td>
			</tr>
			<tr>
				<td colspan="3" align="left" height="20px">작성자 : <%= vo.getNickname() %></td>
				<td colspan="1" align="right" width="200px" height="20px">|&nbsp;조회수 : <%= vo.getHit() %>회&nbsp;&nbsp;|</td>
				<td colspan="1" align="center" width="220px"height="20px">작성일 : <%= vo.getWdate() %></td>
			</tr>
			<tr>
				<td colspan="5" height="20px"><hr></td>
			<tr>
			<tr>
				<td colspan="5"  valign="top">
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
				<%
				if(loginVO != null && loginVO.getId().equals(vo.getId()))
				{
					%>
					<a href="communitymodify.jsp?kind=<%=kind %>&no=<%= no %>&uno=<%= loginVO.getUno() %>"><input type="button" id="modifybutton" value="수정"></a>&nbsp;
					<a href="javascript:DoDelete();"><input type="button" id="deletebutton" value="삭제" style="background-color: #FD7064;"></a>
					<%
				}
				%>
				</td>
			<tr>
			<tr>
				<td colspan="5" height="20px"><hr></td>
			<tr>
			<tr>
				<td colspan="5" width="100px" height="20px" align="left">첨부파일 : 
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
		<table width="100%" border="0">
			<tr>
			<%
			if( loginVO != null)
			{
				%>
				<tr>
					<td align="center" style="width:200px; height:30px; background-color:lightgrey;">
					<%= loginVO.getNickname() %>
					</td>
					<br>
					<td colspan="3" width="400px"><input type="text" id="rnote" name="rnote" maxlength="50" style="width:99%; height: 25px" placeholder="댓글을 입력해주세요 (50자 제한)"></td>
					<td align="right">
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
			}
			ReplyDTO rdto = new ReplyDTO();
			ArrayList<ReplyVO> rlist = rdto.GetList(no);
			
			for(ReplyVO rvo : rlist)
			{
				String rno   	 = rvo.getRno();
				String rid   	 = rvo.getId();
				String rname 	 = rvo.getName();
				String rnote     = rvo.getRnote();
				String rdate     = rvo.getRdate();
				String rnickname = rvo.getNickname();
				%>
				<tr>
					<td align="center" width="200px"><%= rnickname %></td>
					<td id="<%= rno %>" colspan="3" style="display: none"><!-- 수정버튼 누르면 나옴 -->
						<input type="text" id="rnoteModify" name="rnoteModify" style="width:99%; height: 25px" value="<%= rvo.getRnote()%>">
					</td>
					<td id="<%= rno %>readd" align="left" style="display: none">
						<input type="button" id="readdbutton" onclick="ReAddReply('<%= rno %>');" value="수정">
						<input type="button" id="redeletebutton" onclick="modifyCancel('<%= rno %>');" value="취소">
					</td>
					<td id="<%= rno %>myrnote" colspan="3"><%= rnote %> <!-- 수정버튼 누르면 사라짐 -->
				    <%
					if(loginVO != null && loginVO.getId().equals(rid))
					{
						%> 			
							[ <a href="javascript:ModifyReply('<%= rno %>')"><ins>수정</ins></a> ]
							[ <a href="javascript:DeleteReply('<%= rno %>')"><ins>삭제</ins></a> ]
						<%
					}
					%>
					</td>
					<td id="<%= rno %>myrdate" width="110px" align="left"><%= rdate %></td>
				</tr>	
				<%
			}
			%>
			<tr>
				<td align="center" colspan="5" height="100px">
				<a href="communitylist.jsp?kind=<%= kind %>&page=<%= page_no %>"><input type="button" id="listbutton" value="목록" style="background-color:#4dd5b0;"></a>
				</td>
			</tr>
		</table>
		</td>
		</tr>
		</table>
	</body>
<%@ include file="../include/tail.jsp" %>