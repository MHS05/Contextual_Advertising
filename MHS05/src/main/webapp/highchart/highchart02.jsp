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
		<span class="subtitle2"><h2>[ 키워드 빈도 분석 ]</h2></span>
<!-- 2. 키워드 빈도 차트 highchart_keywords.jsp -->
	<span id="keywords" style="display:inline-block; width:900px; height:700px"></span>
<script>
//JS 차트 넣는 곳 입니다.
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
        pointFormat: '키워드: <b>{point.y} 회</b>'
    },
    series: [{
        name: '빈도수',
        colors: [
            '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
            '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
            '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
            '#03c69b',  '#00f194'
        ],
        colorByPoint: true,
        groupPadding: 0,
        data: 
        [
            ['혈관', 37],
            ['가', 31],
            ['나', 27],
            ['다', 22],
            ['라', 21],
            ['마', 21],
            ['바', 21],
            ['사', 20],
            ['아', 20],
            ['자', 19],
            ['차', 16],
            ['카', 16],
            ['타', 15],
            ['파', 15],
            ['하', 14],
            ['가나', 14],
            ['다라', 14],
            ['마바', 14],
            ['사아', 13],
            ['자차', 13]
        ],
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
});
//JS 여기까지
</script>
		<a href="../highchart/highchart01.jsp">
			<span id="button_back"><input type="button" value="< Back "></span>
		</a>
		<a href="../highchart/highchart03.jsp">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>