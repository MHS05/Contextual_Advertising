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
			<link rel="stylesheet" type="text/css" href="../highchart/highchart.css">
		<title>���� ���� ����</title>
	</head>
	<body>
		<div class="title"><h1>[ ���� ���� ���� ]</h1></div>
		<span class="subtitle1"><h2>&lt; ���� �м� &gt;</h2></span>
	<!-- 1. ����� ��Ʈ highchart_emotion.jsp -->
		<span id="emotion" style="display:inline-block; width:1000px; height:800px"></span>
<script>
//JS �������
Highcharts.chart('emotion', {
    chart: { type: 'column'},
    title: { text: '�Խù� ���庰 ����� �׷���'},
    xAxis: 
    {
        categories: [
        			'1��° ����', '2��° ����', '3��° ����', '4��° ����', '5��° ����',
        			'6��° ����', '7��° ����', '8��° ����', '9��° ����', '10��° ����',
        			'11��° ����', '12��° ����', '13��° ����', '14��° ����', '15��° ����',
        			'16��° ����', '17��° ����', '18��° ����', '19��° ����', '20��° ����',
        			'21��° ����', '22��° ����', '23��° ����', '24��° ����', '25��° ����'
        			]
    },
    credits: {  enabled: false },
    plotOptions: {
        column: {
            borderRadius: '25%',
            pointPadding: 0.1, // �� �� ������ �����մϴ�.
            groupPadding: 0.1 // �׷� �� ������ �����մϴ�.
        }
    },
    tooltip: {
        style: {
            fontSize: '60px' // ���� ���� ũ��
        }
    },
    series: 
    [{
        name: '����',
        data: 
        	[
        	15, null, null, 17, null,
        	null, 23, null, 17, 12, 
        	null, 23, null, 17, 12,
        	null, 23, null, 17, 12, 
        	null, 14, null, 12, 15
        	]
    }, 
    {
        name: '����',
        data: 
        	[
        	null, -10, -14, null, -12,
        	-15, null, -14, null, null,
        	-15, null, -14, null, null,
        	-15, null, -14, null, null,
        	-15, null, -14, -17, null
        	]
    }]
});
//JS �������
</script>
		<a href="../highchart/highchart02.jsp">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>
	