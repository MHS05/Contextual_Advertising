<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	        categories: ['1번째.', '2번째 문장입니다.', '3번째 문장입니다.', '4번째 문장입니다.', '5번째 문장입니다.',
	        			'6번째 문장입니다.', '7번째 문장입니다.', '8번째 문장입니다.', '9번째 문장입니다.', '10번째 문장입니다.',
	        			'6번째 문장입니다.', '7번째 문장입니다.', '8번째 문장입니다.', '9번째 문장입니다.', '10번째 문장입니다.',
	        			'6번째 문장입니다.', '7번째 문장입니다.', '8번째 문장입니다.', '9번째 문장입니다.', '10번째 문장입니다.']
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
	        data: [15, 10, "", 17, "",
	        	"", 23, "", 17, 12, 15,
	        	"", 23, "", 17, 12, 15,
	        	"", 14, "", 12, 15]
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