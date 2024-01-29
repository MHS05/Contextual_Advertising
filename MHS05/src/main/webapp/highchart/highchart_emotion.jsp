<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%
String senno = request.getParameter("senno");
String nno = request.getParameter("nno");

SemotionDTO dto = new SemotionDTO();
SemotionVO vo = dto.Read(nno);
if( vo == null )
{
	//해당 게시물 번호의 데이터가 없음
	%>
	<script>
		alert("해당 게시물을 조회 할 수 없습니다.");
		document.location = "adminnewslist.jsp";
	</script>
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>문장별 긍부정 차트</title>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		<script src="./js/jquery-3.7.1.js"></script>
   	    <link rel="stylesheet" type="text/css" href="../highchart/highchart_emotion.css">
	</head>
<script>
window.onload = function()
{
	//JS 여기부터
	Highcharts.chart('emotion', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '문장별 긍부정 차트'
	    },
	    xAxis: {
	        categories: [<%= vo.getSentance()%> ]
	    },
	    credits: {
	        enabled: false
	    },
	    plotOptions: {
	        column: {
	            borderRadius: '25%'
	        }
	    },
	    series: [{
	        name: '긍정',
	        data: [<%= vo.getScore() %>]
	    }, {
	        name: '부정',
	        data: ["", "", -14, "", -12,
	        	-15, "", -14, "", "",
	        	-15, "", -14, "", "",
	        	-15, "", 14, -17, "", ""]
	    }]
	});
	//JS 여기까지
}
</script>
	<body>
		<!-- HTML figure 여기부터 -->
		<figure class="emotion">
		    <div id="emotion"></div>
		</figure>
		<!-- HTML figure 여기까지 -->
	</body>
</html>
<%
db.DBClose();
%>