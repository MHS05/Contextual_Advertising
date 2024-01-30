<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "java.util.*" %>
<%
String nkeyno = request.getParameter("nkeyno");
String nno = request.getParameter("nno");

NewsKeywordDTO dto = new NewsKeywordDTO();

String nkeyword = "";
String nkeynum  = "";
String data     = "";
ArrayList<NewsKeywordVO> list = dto.GetList(nno);


//키워드 데이터 목록을 작성한다.

for(NewsKeywordVO vo : list)
{	
	if(!nkeyword.equals(""))
	{	
		nkeyword += ",";
		nkeynum += ",";
		data += "['"+vo.getNkey()+"',"+vo.getNkeynum()+"],";
	}
	nkeyword += "'" + vo.getNkey() + "'";
	nkeynum  += vo.getNkeynum();
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
	${data}
		<script>
		//JS 여기부터
		window.onload = function()
		{	
			//뉴스 키워드
			nkeyword =  <%= nkeyword %>
			
			//키워드 빈도수
			nkeynum  =  <%= nkeynum %> 
			
			//뉴스키워드, 키워드빈도수
			data =  [<%= data %>]
			
			DrawKeywordChart(data);
		}
		
		function DrawKeywordChart(data)
		{
			Highcharts.chart('keywords', {
			    chart: { type: 'column'},
			    title: { text: '게시물 키워드 빈도수'  },
			    xAxis: 
			    {
			        type: 'category',
			        labels: 
			        {
			            autoRotation: [-45, -90],
			            style: 
			            {
			                fontSize: '13px',
			                fontFamily: 'Verdana, sans-serif'
			            }
			        }
			    },
			    yAxis: 
			    {
			        min: 0,
			        title: { text: '키워드 빈도수'}
			    },
			    legend: { enabled: false },
			    tooltip: {
			        formatter: function() {
			            return '키워드: <b>' + this.y + ' 회</b>';
			        },
			        style: {
			            fontSize: '18px'
			        }
			    },
			    series: 
			    [{
			        name: '빈도수',
			        colors: 
			        [
			            '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
			            '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
			            '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
			            '#03c69b',  '#00f194'
			        ],
			        colorByPoint: true,
			        groupPadding: 0,
			        data: data
			        ,
			        credits: {  enabled: false },
			        dataLabels: 
			        {
			            enabled: true,
			            rotation: -90,
			            color: '#FFFFFF',
			            align: 'right',
			            format: '{point.y:.1f}', 
			            y: 10, 
			            style:
			            {
			                fontSize: '13px',
			                fontFamily: 'Verdana, sans-serif'
			            }
			        }
			    }]
			});
		}
		//JS 여기까지
		</script>
		<div class="title"><h1>[ 광고 선정 이유 ]</h1></div>
		<span class="subtitle2"><h2>&lt; 키워드 빈도 분석 &gt;</h2></span>
<!-- 2. 키워드 빈도 차트 highchart_keywords.jsp -->
	<span id="keywords" style="display:inline-block; width:900px; height:700px"></span>
		<a href="../highchart/highchart01.jsp?nno=<%= nno %>">
			<span id="button_back"><input type="button" value="< Back "></span>
		</a>
		<a href="../highchart/highchart03.jsp?nno=<%= nno %>">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>