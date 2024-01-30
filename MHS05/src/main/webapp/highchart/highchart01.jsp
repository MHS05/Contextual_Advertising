<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "java.util.*" %>
<%
String senno = request.getParameter("senno");
String nno = request.getParameter("nno");

SemotionDTO dto = new SemotionDTO();

ArrayList<SemotionVO> list = dto.GetList(nno);

	
//카테고리 목록을 작성한다.
String category = "";
String pos_data = "";
String neg_data = "";
for(SemotionVO vo : list)
{
	if(!category.equals(""))
	{
		category += ",";
		pos_data += ",";
		neg_data += ",";
	}
	//category += "'" + vo.getSentance() + "'";
	String sentance = vo.getSentance();
	if(sentance.length() > 10)
	{
		sentance  = sentance.substring(0,10);
		sentance += "...";
	}
		
	category += "'" + sentance + "'";
	if(vo.getEmotion().equals("긍정"))
	{
		pos_data += vo.getScore();
		neg_data += "null";
	}else
	{		
		pos_data += "null";
		neg_data += "-" + vo.getScore();
	}
}
	
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
			<script src="https://code.highcharts.com/highcharts.js"></script>
			<script src="https://code.highcharts.com/modules/exporting.js"></script>
			<script src="https://code.highcharts.com/modules/export-data.js"></script>
			<script src="https://code.highcharts.com/modules/accessibility.js"></script>
			<script src="../js/jquery-3.7.1.js"></script>
			<link rel="stylesheet" type="text/css" href="../highchart/highchart.css">
		<title>광고 선정 이유</title>
	</head>
	<body>		
		<script>
		//JS 여기부터
		window.onload = function()
		{
			//키워드
	        categories = [ <%= category %> ];

			//긍정데이터 
	        pos_data = [ <%= pos_data %> ];
			
			//부정데이터 
	        neg_data = [ <%= neg_data %> ];
		
			DrawEmotionChart(categories,pos_data,neg_data);
		}
		
		function DrawEmotionChart(categories,pos_data,neg_data)
		{
			Highcharts.chart('emotion', {
			    chart: { type: 'column'},
			    title: { text: '게시물 문장별 긍부정 그래프'},
			    xAxis: { categories: categories },
			    credits: {  enabled: false },
			    plotOptions: {
			        column: {
			            borderRadius: '25%',
			            pointPadding: 0.1, // 열 간 간격을 조절합니다.
			            groupPadding: 0.1 // 그룹 간 간격을 조절합니다.
			        }
			    },
			    tooltip: 
			    {
			        style: { fontSize: '18px' }
			    },
			    series: 
			    [{
			        name: '긍정',
			        data: pos_data
			    }, 
			    {
			        name: '부정',
			        data: neg_data
			    }]
			});
		}
		//JS 여기까지	
		</script>
		<div class="title"><h1>[ 광고 선정 이유 ]</h1></div>
		<span class="subtitle1"><h2>&lt; 감성 분석 &gt;</h2></span>
		<!-- 1. 긍부정 차트 highchart_emotion.jsp -->
		<span id="emotion" style="display:inline-block; width:1000px; height:800px"></span>
 		<a href="../highchart/highchart02.jsp?nno=<%= nno %>">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>