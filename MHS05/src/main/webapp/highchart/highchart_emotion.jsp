<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���庰 ����� ��Ʈ</title>
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
	//JS �������
	Highcharts.chart('emotion', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '���庰 ����� ��Ʈ'
	    },
	    xAxis: {
	        categories: ['1��°.', '2��° �����Դϴ�.', '3��° �����Դϴ�.', '4��° �����Դϴ�.', '5��° �����Դϴ�.',
	        			'6��° �����Դϴ�.', '7��° �����Դϴ�.', '8��° �����Դϴ�.', '9��° �����Դϴ�.', '10��° �����Դϴ�.',
	        			'6��° �����Դϴ�.', '7��° �����Դϴ�.', '8��° �����Դϴ�.', '9��° �����Դϴ�.', '10��° �����Դϴ�.',
	        			'6��° �����Դϴ�.', '7��° �����Դϴ�.', '8��° �����Դϴ�.', '9��° �����Դϴ�.', '10��° �����Դϴ�.']
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
	        name: '����',
	        data: [15, 10, "", 17, "",
	        	"", 23, "", 17, 12, 15,
	        	"", 23, "", 17, 12, 15,
	        	"", 14, "", 12, 15]
	    }, {
	        name: '����',
	        data: ["", "", -14, "", -12,
	        	-15, "", -14, "", "",
	        	-15, "", -14, "", "",
	        	-15, "", 14, -17, "", ""]
	    }]
	});
	//JS �������
}
</script>
	<body>
		<!-- HTML figure ������� -->
		<figure class="emotion">
		    <div id="emotion"></div>
		</figure>
		<!-- HTML figure ������� -->
	</body>
</html>