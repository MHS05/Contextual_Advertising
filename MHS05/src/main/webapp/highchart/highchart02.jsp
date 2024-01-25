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
		<title>���� ���� ����</title>
	</head>
	<body>
		<div class="title"><h1>*���� ���� ����*</h1></div>
		<span class="subtitle2"><h2>[ Ű���� �� �м� ]</h2></span>
<!-- 2. Ű���� �� ��Ʈ highchart_keywords.jsp -->
	<span id="keywords" style="display:inline-block; width:900px; height:700px"></span>
<script>
//JS ��Ʈ �ִ� �� �Դϴ�.
Highcharts.chart('keywords', {
    chart: { type: 'column'},
    title: { text: '�Խù� Ű���� �󵵼�'  },
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
        title: { text: 'Ű���� �󵵼�'}
    },
    legend: { enabled: false },
    tooltip: {
        pointFormat: 'Ű����: <b>{point.y} ȸ</b>'
    },
    series: [{
        name: '�󵵼�',
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
            ['����', 37],
            ['��', 31],
            ['��', 27],
            ['��', 22],
            ['��', 21],
            ['��', 21],
            ['��', 21],
            ['��', 20],
            ['��', 20],
            ['��', 19],
            ['��', 16],
            ['ī', 16],
            ['Ÿ', 15],
            ['��', 15],
            ['��', 14],
            ['����', 14],
            ['�ٶ�', 14],
            ['����', 14],
            ['���', 13],
            ['����', 13]
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
//JS �������
</script>
		<a href="../highchart/highchart01.jsp">
			<span id="button_back"><input type="button" value="< Back "></span>
		</a>
		<a href="../highchart/highchart03.jsp">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>