<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>키워드 빈도수 차트</title>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		<script src="./js/jquery-3.7.1.js"></script>
   	    <link rel="stylesheet" type="text/css" href="../highchart/highchart_keywords.css">
	</head>
<script>
window.onload = function()
{
	//JS 차트 넣는 곳 입니다.
	Highcharts.chart('keywords', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '심장병 기사 키워드 빈도수'
	    },
	    subtitle: {
	        text: 'Source: <a href="https://https://kormedi.com/1656363/" target="_blank">코메디닷컴</a>'
	    },
	    xAxis: {
	        type: 'category',
	        labels: {
	            autoRotation: [-45, -90],
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: '키워드 빈도수'
	        }
	    },
	    legend: {
	        enabled: false
	    },
	    tooltip: {
	        pointFormat: '키워드: <b>{point.y:.1f} 회</b>'
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
	        data: [
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
}
</script>
	<body>
		<!-- HTML figure -->
		<figure class="keywords">
		    <div id="keywords"></div>
		</figure>
	</body>
</html>