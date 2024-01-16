<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../admininclude/head.jsp" %>
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "V";
String btitle = "채소";
if(kind.equals("F"))
{
	btitle = "과일";
}
if(kind.equals("H"))
{
	btitle = "건강식품";
}
if(kind.equals("S"))
{
	btitle = "수산";
}
if(kind.equals("M"))
{
	btitle = "정육";
}

%>
<script>
var curPageNo = 1;
window.onload = function()
{
	GetImgPage(curPageNo);
	
	$(window).scroll(function(){
		if ($("body").height() <= ($(window).height() + $(window).scrollTop())) 
		{
			//스크롤바가 윈도우창 아래쪽에 닿았을때
			curPageNo++;
			GetImgPage(curPageNo);
		}			
	});
	
	$("#key").keyup(function (event)
	{
		if (event.keyCode == 13) 
		{
			doSearch();
		}
		
	});
}

function GetImgPage(pageNo)
{	
	age     = $("#tag_age").val();
	pgender = $("#tag_pgender").val();
	pcon    = $("#tag_pcon").val();
	key     = $("#key").val();
	
	param   = "age=" + age;
	param  += "&pgender=" + pgender;
	param  += "&pcon=" + pcon;
	param  += "&key=" + key;
	param  += "&kind=<%= kind %>&page=" + pageNo;
	
	$.ajax({
		type : "get",
		url: "impage.jsp?" + param,
		dataType : "html",	
		success : function(data) 
		{		
			data = data.trim();
			if(data != "NODATA")
			{
				$("#imgList").append(data);
			} else
			{
				$("#NoList").html("<td colspan='6' align='center' height='300px'>조회된 자료가 없습니다.</td>");
			}
		}
	});
}

function doSearch() 
{
	$("#imgList").html("");
	curPageNo = 1;
	GetImgPage(curPageNo);
}

var selectedElementsCnt = 0; //체크된 체크박스 갯수

function getCheckedCnt()  
{
	// 선택된 목록 가져오기
	const query = 'input[name="delNo"]:checked';
	const selectedElements = document.querySelectorAll(query);
	  
	 // 선택된 목록의 갯수 세기
	selectedElementsCnt = selectedElements.length;
}

//전체선택
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
		alert("삭제할 게시물을 선택 해주세요.")
	} else {
		var val_list = "";
		const checkboxes = document.getElementsByName("delNo");
		checkboxes.forEach((checkbox) => {
		    if( checkbox.checked == true )
		    {
		    	if(checkbox.value != "selectall")
		    	{
			    	if(val_list != "")
			    	{
			    		val_list += ",";	
			    	}
			    	val_list += checkbox.value;
		    	}		    	
		    }
		  })
		//alert(val_list);
		$("#valList").val(val_list);		  
		$("#categorylist").submit();
		
	}
}
</script>
<style>

#fixed 
{
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 100px;
	padding: 5px;
	color: white;
}

</style>
<div id="fixed" style="width:50px; height: 50px;">
	<a href="#top"><img style="width:50px; height: 50px;" src="../image/topbutton.png"></a>
</div>
<tr>
	<td colspan="7" height="50px">
		<a href="admincategory.jsp?kind=<%= kind %>"><h2>카테고리 (<%= btitle %>)</h2></a>
	</td>
</tr>
<tr>
	<td width="30px" align="right" valign="middle">
		<input type="checkbox" name="delNo" id="delNo" onclick='selectAll(this)' style="width: 20px; height: 20px" >
	</td>
	<td align="left" height="50px" width="260px">
		<select name="tag_age" id="tag_age" style="width:80px; height:30px;" onchange="doSearch();">
	           <option value="">나이</option>
	           <option value="10대">10대</option>
	           <option value="20대">20대</option>
	           <option value="30대">30대</option>
	           <option value="40대">40대</option>
	           <option value="50대">50대</option>
	           <option value="60대">60대</option>
        </select>
        <select name="tag_pgender" id="tag_pgender" style="width:80px; height:30px;" onchange="doSearch();">
          	   <option value="">성별</option>
	           <option value="남자">남자</option>
	           <option value="여자">여자</option>
	           <option value="남녀불문">남녀불문</option>
        </select>
        <select name="tag_pcon" id="tag_pcon" style="width:80px; height:30px;" onchange="doSearch();">
           	   <option value="">체질</option>
	           <option value="태양인">태양인</option>
	           <option value="태음인">태음인</option>
	           <option value="소양인">소양인</option>
	           <option value="소음인">소음인</option>
        </select>
   </td>
   <td align="left" valign="middle" colspan="2" >
	   	<a href="adminProductUpload.jsp?kind=<%= kind %>">
				<div class="abutton" style="background-color: #4dd5b0">등록하기</div></a>
	   	<a href="javascript:Dodelete();">
				<div class="abutton" style="background-color:#FD7064;">선택삭제</div></a>
   </td>
   <td colspan="2" align="right" >
   		<input type="hidden" id="kind" name="kind" value="<%= kind %>">
   		<input type="text" id="key" name="key" value="" placeholder="검색어 입력" style="width:150px; height:30px;">
		<input type="button" value="검색" style="width:50px; height:30px;" onclick="doSearch();">
	</td>
</tr>
<tr>
	<td colspan="6">
		<table style="width:100%;">
			<tr>
				<td>		 	
					<form id ="categorylist" method="get" action="admincategorydelete.jsp">
					<input type="hidden" id="valList" name="valList" value="">
					<input type="hidden" id="kind" name="kind" value="<%= kind %>">
					<table border="0" style="width:100%;" id="imgList"></table>							
				</td>
			</tr>	
		</table>
	</td>
</tr>
<tr id="NoList">
</tr>
</form>
<%@ include file="../admininclude/tail.jsp" %> 