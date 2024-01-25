<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
			<script src="https://code.highcharts.com/highcharts.js"></script>
			<script src="https://code.highcharts.com/modules/exporting.js"></script>
			<script src="https://code.highcharts.com/modules/export-data.js"></script>
			<script src="https://code.highcharts.com/modules/accessibility.js"></script>
			<script src="./js/jquery-3.7.1.js"></script>
			<link rel="stylesheet" type="text/css" href="../highchart/highchart_main.css">
		<title>광고 선정 이유</title>
	</head>
	<body>
		<div class="title"><h1>*광고 선정 이유*</h1></div>
		<span class="subtitle1"><h2>[ 감성 분석 ]</h2></span>
	<!-- 1. 긍부정 차트 highchart_emotion.jsp -->
		<span id="emotion" style="display:inline-block; width:1000px; height:800px"></span>
<script>
//JS 여기부터
Highcharts.chart('emotion', {
    chart: { type: 'column'},
    title: { text: '게시물 문장별 긍부정 그래프'},
    xAxis: 
    {
        categories: [
        			'1번째 문장', '2번째 문장', '3번째 문장', '4번째 문장', '5번째 문장',
        			'6번째 문장', '7번째 문장', '8번째 문장', '9번째 문장', '10번째 문장',
        			'11번째 문장', '12번째 문장', '13번째 문장', '14번째 문장', '15번째 문장',
        			'16번째 문장', '17번째 문장', '18번째 문장', '19번째 문장', '20번째 문장',
        			'21번째 문장', '22번째 문장', '23번째 문장', '24번째 문장', '25번째 문장'
        			]
    },
    credits: {    enabled: false },
    plotOptions: 
    {
        column: { 	borderRadius: '25%'   }
    },
    series: 
    [{
        name: '긍정',
        data: 
        	[
        	15, "", "", 17, "",
        	"", 23, "", 17, 12, 
        	"", 23, "", 17, 12,
        	"", 23, "", 17, 12, 
        	"", 14, "", 12, 15
        	]
    }, 
    {
        name: '부정',
        data: 
        	[
        	"", -10, -14, "", -12,
        	-15, "", -14, "", "",
        	-15, "", -14, "", "",
        	-15, "", -14, "", "",
        	-15, "", -14, -17, ""
        	]
    }]
});
//JS 여기까지
</script>
		<span class="pnratio"><h2>긍부정 비율 : </h2></span>
		<span class="percent"><font color='red'><h1>긍정 53%</h1></font></span>
</script>
		<a href="../highchart/highchart02.jsp">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>
	