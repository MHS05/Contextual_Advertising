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
		<div style="text-align:center"><h1>*ㅇㅇㅇㅇㅇㅇ 광고 선정 이유*</h1></div>
		<span class="pnarea"><h2>[ 긍부정 관련 영역 ]</h2></span>
	<!-- 1. 긍부정 차트 highchart_emotion.jsp -->
		<span id="emotion"></span>
<script>
//JS 여기부터
Highcharts.chart('emotion', {
    chart: { type: 'column'},
    title: { text: '게시물 문장별 긍부정 그래프'},
    xAxis: 
    {
        categories: ['1번째.', '2번째 문장입니다.', '3번째 문장입니다.', '4번째 문장입니다.', '5번째 문장입니다.',
        			'6번째 문장입니다.', '7번째 문장입니다.', '8번째 문장입니다.', '9번째 문장입니다.', '10번째 문장입니다.',
        			'6번째 문장입니다.', '7번째 문장입니다.', '8번째 문장입니다.', '9번째 문장입니다.', '10번째 문장입니다.',
        			'6번째 문장입니다.', '7번째 문장입니다.', '8번째 문장입니다.', '9번째 문장입니다.', '10번째 문장입니다.']
    },
    credits: {    enabled: false },
    plotOptions: 
    {
        column: { 	borderRadius: '25%'   }
    },
    series: 
    [{
        name: '긍정',
        data: [15, 10, "", 17, "",
        	"", 23, "", 17, 12, 15,
        	"", 23, "", 17, 12, 15,
        	"", 14, "", 12, 15]
    }, 
    {
        name: '부정',
        data: ["", "", -14, "", -12,
        	-15, "", -14, "", "",
        	-15, "", -14, "", "",
        	-15, "", 14, -17, "", ""]
    }]
});
//JS 여기까지
</script>
		<span class="pnratio"><h2>긍부정 비율 : </h2></span>
		<span class="percent"><font color='red'><h1>긍정 53%</h1></font></span>
		<div class="stick1"></div>
		<span class="correlationarea"><h2>[ 연관성 영역 ]</h2></span>
		<span class="representkey"><h3>대표 키워드 5개</h3></span>
		<span class="keyword1"><h3>아침 <font color='red'>(13회)</h3></font></span>
		<div class="stick3"></div>
		<div class="arrow1"></div>
		<span class="keyword2"><h3>도움 <font color='red'>(5회)</h3></font></span>
		<div class="stick4"></div>
		<div class="arrow2"></div>
		<span class="keyword3"><h3>달걀 <font color='red'>(5회)</h3></font></span>
		<div class="stick5"></div>
		<div class="arrow3"></div>
		<span class="keyword4"><h3>국민 <font color='red'>(4회)</h3></font></span>
		<div class="stick6"></div>
		<div class="arrow4"></div>
		<span class="keyword5"><h3>결식 <font color='red'>(4회)</h3></font></span>
		<div class="stick7"></div>
		<div class="arrow5"></div>
		<span class="Similarity1"><h3>유사도 <font color='red'>1.0</h3></font></span>
		<span class="Similarity2"><h3>유사도 <font color='red'>0.9</h3></font></span>
		<span class="Similarity3"><h3>유사도 <font color='red'>0.8</h3></font></span>
		<span class="Similarity4"><h3>유사도 <font color='red'>0.7</h3></font></span>
		<span class="Similarity5"><h3>유사도 <font color='red'>0.6</h3></font></span>	
<!-- 2. 키워드 빈도 차트 highchart_keywords.jsp -->
	<span id="keywords"></span>
<script>
//JS 차트 넣는 곳 입니다.
Highcharts.chart('keywords', {
    chart: { type: 'column'},
    title: { text: '심장병 기사 키워드 빈도수'  },
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
		<div class="stick2"></div>
		<span class="choicead"><h2>[ 선정 광고 ]</h2></span>
		<span class="ad"><img src="../image/ad.jpg"></span>
		<span class="bkeyword1"><h3>최다 게시물 키워드</h3></span>
		<span class="akeyword1"><h3>광고 키워드</h3></span>
		<span class="bkeyword2"><font color='red'><h1>아침</h1></font></span>
		<span class="akeyword2"><font color='red'><h1>아침</h1></font></span>
		<div style="border-left:3px solid black;height:30px;margin-left:1380px;margin-top:703px;position: absolute;"></div>
		<div style="border-bottom:3px solid black;width:373px;margin-left:1380px;margin-top:730px;position: absolute;"></div>
		<div style="border-left:3px solid black;height:30px;margin-left:1750px;margin-top:703px;position: absolute;"></div>
		<div style="border-left:3px solid black;height:30px;margin-left:1570px;margin-top:730px;position: absolute;"></div>
		<span class="similarity"><font color='red'><h1>유사도 1.0</h1></font></span>
	</body>
</html>