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
		<div style="text-align:center"><h1>*������������ ���� ���� ����*</h1></div>
		<span class="pnarea"><h2>[ ����� ���� ���� ]</h2></span>
	<!-- 1. ����� ��Ʈ highchart_emotion.jsp -->
		<span id="emotion"></span>
<script>
//JS �������
Highcharts.chart('emotion', {
    chart: { type: 'column'},
    title: { text: '�Խù� ���庰 ����� �׷���'},
    xAxis: 
    {
        categories: ['1��°.', '2��° �����Դϴ�.', '3��° �����Դϴ�.', '4��° �����Դϴ�.', '5��° �����Դϴ�.',
        			'6��° �����Դϴ�.', '7��° �����Դϴ�.', '8��° �����Դϴ�.', '9��° �����Դϴ�.', '10��° �����Դϴ�.',
        			'6��° �����Դϴ�.', '7��° �����Դϴ�.', '8��° �����Դϴ�.', '9��° �����Դϴ�.', '10��° �����Դϴ�.',
        			'6��° �����Դϴ�.', '7��° �����Դϴ�.', '8��° �����Դϴ�.', '9��° �����Դϴ�.', '10��° �����Դϴ�.']
    },
    credits: {    enabled: false },
    plotOptions: 
    {
        column: { 	borderRadius: '25%'   }
    },
    series: 
    [{
        name: '����',
        data: [15, 10, "", 17, "",
        	"", 23, "", 17, 12, 15,
        	"", 23, "", 17, 12, 15,
        	"", 14, "", 12, 15]
    }, 
    {
        name: '����',
        data: ["", "", -14, "", -12,
        	-15, "", -14, "", "",
        	-15, "", -14, "", "",
        	-15, "", 14, -17, "", ""]
    }]
});
//JS �������
</script>
		<span class="pnratio"><h2>����� ���� : </h2></span>
		<span class="percent"><font color='red'><h1>���� 53%</h1></font></span>
		<div class="stick1"></div>
		<span class="correlationarea"><h2>[ ������ ���� ]</h2></span>
		<span class="representkey"><h3>��ǥ Ű���� 5��</h3></span>
		<span class="keyword1"><h3>��ħ <font color='red'>(13ȸ)</h3></font></span>
		<div class="stick3"></div>
		<div class="arrow1"></div>
		<span class="keyword2"><h3>���� <font color='red'>(5ȸ)</h3></font></span>
		<div class="stick4"></div>
		<div class="arrow2"></div>
		<span class="keyword3"><h3>�ް� <font color='red'>(5ȸ)</h3></font></span>
		<div class="stick5"></div>
		<div class="arrow3"></div>
		<span class="keyword4"><h3>���� <font color='red'>(4ȸ)</h3></font></span>
		<div class="stick6"></div>
		<div class="arrow4"></div>
		<span class="keyword5"><h3>��� <font color='red'>(4ȸ)</h3></font></span>
		<div class="stick7"></div>
		<div class="arrow5"></div>
		<span class="Similarity1"><h3>���絵 <font color='red'>1.0</h3></font></span>
		<span class="Similarity2"><h3>���絵 <font color='red'>0.9</h3></font></span>
		<span class="Similarity3"><h3>���絵 <font color='red'>0.8</h3></font></span>
		<span class="Similarity4"><h3>���絵 <font color='red'>0.7</h3></font></span>
		<span class="Similarity5"><h3>���絵 <font color='red'>0.6</h3></font></span>	
<!-- 2. Ű���� �� ��Ʈ highchart_keywords.jsp -->
	<span id="keywords"></span>
<script>
//JS ��Ʈ �ִ� �� �Դϴ�.
Highcharts.chart('keywords', {
    chart: { type: 'column'},
    title: { text: '���庴 ��� Ű���� �󵵼�'  },
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
		<div class="stick2"></div>
		<span class="choicead"><h2>[ ���� ���� ]</h2></span>
		<span class="ad"><img src="../image/ad.jpg"></span>
		<span class="bkeyword1"><h3>�ִ� �Խù� Ű����</h3></span>
		<span class="akeyword1"><h3>���� Ű����</h3></span>
		<span class="bkeyword2"><font color='red'><h1>��ħ</h1></font></span>
		<span class="akeyword2"><font color='red'><h1>��ħ</h1></font></span>
		<div style="border-left:3px solid black;height:30px;margin-left:1380px;margin-top:703px;position: absolute;"></div>
		<div style="border-bottom:3px solid black;width:373px;margin-left:1380px;margin-top:730px;position: absolute;"></div>
		<div style="border-left:3px solid black;height:30px;margin-left:1750px;margin-top:703px;position: absolute;"></div>
		<div style="border-left:3px solid black;height:30px;margin-left:1570px;margin-top:730px;position: absolute;"></div>
		<span class="similarity"><font color='red'><h1>���絵 1.0</h1></font></span>
	</body>
</html>