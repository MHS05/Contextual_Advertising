<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "N";
String btitle = "공지사항";

String no = request.getParameter("no");
if( loginVO == null || no == null || no.equals("") )
{
	response.sendRedirect("adminnlist.jsp");
	return;
}
CommunityDTO dto = new CommunityDTO();
CommunityVO  vo  = dto.Read(no, false);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "adminnlist.jsp";
	</script>
	<%
	return;
}

if( !loginVO.getId().equals(vo.getId()) )
{
	response.sendRedirect("adminnlist.jsp");
	return;	
}
%>
<script>
	window.onload = function()
	{
		$("#title").focus();
	}
	
	function DoModify()
	{
		if( $("#title").val() == "")
		{
			alert("제목을 입력하세요");
			$("#title").focus();	
			return false;
		}		
		if( $("#note").val() == "")
		{
			alert("내용을 입력하세요");
			$("#note").focus();	
			return false;
		}
		if(confirm("공지사항을 변경하시겠습니까?") == 0)
		{
			return false;	
		}
		return true;
	}	
	
function check() 
{	
	oEditors.getById["note"].exec("UPDATE_CONTENTS_FIELD", []);  
	//스마트 에디터 값을 텍스트컨텐츠로 전달
	$("#adminmodify").submit();
}

</script>
	<form id="adminmodify" name="adminmodify" method="post" action="adminnmodifyok.jsp" enctype="multipart/form-data" onsubmit="return DoModify();">
	<input type="hidden" id="no" name="no" value="<%= no %>">
						<tr>
							<td colspan="6">
								<a href="adminnlist.jsp"><h2><b>공지사항</b></h2></a>
								<hr>
							</td>
						</tr>
						<tr>
							<td class="td" colspan="3" height="30px">※수정하기</td>
						</tr>
						<tr>
							<td class="td" width="85px" height="30px" align="center">구분 :</td>
							<td>
								<input type="radio" id="type" name="type" value="N" <%= kind.equals("N") ? "checked" : "" %>>공지사항
							</td>
						</tr>
						<tr>
							<td class="td" width="85px" height="30px" align="center">제목 :</td>
							<td colspan="2"><input type="text" name="title" style="width:715px; height:20px;" value="<%= vo.getTitle().replace("\"", "&quot;") %>"></td>
						</tr>
						<tr>
							<td class="td" height="50px" align="center" valign="top">내용 :</td>
							<td width="720px">
								<textarea cols="100" rows="10" id="note" name="note"><%= vo.getNote() %></textarea>
								<script id="smart" type="text/javascript">
									var oEditors = [];
									nhn.husky.EZCreator.createInIFrame({
									 oAppRef: oEditors,
									 elPlaceHolder: "note",
									 sSkinURI: "../se2/SmartEditor2Skin.html",
									 fCreator: "createSEditor2"
									});
								</script>
							</td>
						</tr>
						<tr>
							<td class="td" height="50px">첨부파일 :</td>
							<td colspan="2"><input id="attach" name="attach" type="file"></td>
						</tr>
						<tr>
							<td colspan="2">
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
							<td colspan="3" align="center">
								<input type="button" onclick="check();" value="수정완료" style="width:100px; height:35px;">&nbsp;
								<a href="adminnview.jsp?no=<%= no %>"><input type="button" value="취소" style="width:100px; height:35px"></a>
							</td>
						</tr>
<%@ include file="../admininclude/tail.jsp" %> 