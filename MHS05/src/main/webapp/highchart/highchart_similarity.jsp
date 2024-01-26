<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>키워드 빈도수 차트</title>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/heatmap.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		<script src="./js/jquery-3.7.1.js"></script>
   	    <link rel="stylesheet" type="text/css" href="../highchart/test.css">
	</head>
<script>
window.onload = function()
{
	//JS 차트 넣는 곳 입니다.
	// Substring template helper for the responsive labels
	Highcharts.Templating.helpers.substr = (s, from, length) =>
	    s.substr(from, length);
	
	// Create the chart
	Highcharts.chart('similarity', {
	
		    chart: {
		        type: 'heatmap',
		        marginTop: 40,
		        marginBottom: 80,
		        plotBorderWidth: 1,
		        width: 900, // 원하는 가로 크기로 조절
		        height: 800 // 원하는 세로 크기로 조절

		    },
		
		
		    title: {
		        text: '코사인 유사도 분석',
		        style: {
		            fontSize: '1em'
		        }
		    },
		
		    xAxis: {
		        categories: ['게시물 키워드1', '게시물 키워드2', '게시물 키워드3', '게시물 키워드4', '게시물 키워드5'],
		        labels: {
		            style: {
		                fontSize: '20px' // 원하는 크기로 조절
		            }
		        }
		    },

		    yAxis: {
		        categories: ['광고 키워드1', '광고 키워드2', '광고 키워드3', '광고 키워드4', '광고 키워드5'],
		        title: null,
		        reversed: true,
		        labels: {
		            style: {
		                fontSize: '20px' // 원하는 크기로 조절
		            }
		        }
		    },
		
		    accessibility: {
		        point: {
		            descriptionFormat: '{(add index 1)}. ' +
		                '{series.xAxis.categories.(x)} sales ' +
		                '{series.yAxis.categories.(y)}, {value}.'
		        }
		    },
		
		    colorAxis: {
		        min: 0,
		        minColor: '#FFFFFF',
		        maxColor: Highcharts.getOptions().colors[0]
		    },
		
		    legend: {
		        align: 'right',
		        layout: 'vertical',
		        margin: 0,
		        verticalAlign: 'top',
		        y: 25,
		        symbolHeight: 280,
		        width: 80
		        
		    },
		
		    tooltip: {
		        formatter: function() {
		            return '<b>게시물 키워드 : ' + this.series.xAxis.categories[this.point.x] + '</b><br>' +
		                   '<b>광고 키워드 :' + this.series.yAxis.categories[this.point.y] + '</b><br>' +
		                   '<b>유사도 :' + this.point.value + '</b>';
		        },
		        style: {
		            fontSize: '20px'
		        }
		    },
		    series: [{
		        name: '유사도',
		        borderWidth: 1,		//data:[0번째열, 위에서부터0번째행, 데이터값(유사도)]
		        data: [[0, 0, 1], [0, 1, 0.1], [0, 2, 0.8], [0, 3, 0.2], [0, 4, 0.6],
		            [1, 0, 0.9], [1, 1, 1], [1, 2, 0.7], [1, 3, 0.1], [1, 4, 0.4],
		            [2, 0, 0.3], [2, 1, 0.1], [2, 2, 1], [2, 3, 0.6], [2, 4, 0.5],
		            [3, 0, 0.7], [3, 1, 0.1], [3, 2, 0.1], [3, 3, 1], [3, 4, 0.1],
		            [4, 0, 0.3], [4, 1, 0.5], [4, 2, 0.8], [4, 3, 0.1], [4, 4, 1]
		            ],
		        dataLabels: {
		            enabled: true,
		            color: '#000000'
		        }
		    }],
		
		    responsive: {
		        rules: [{
		            condition: {
		                maxWidth: 500
		            },
		            chartOptions: {
		                yAxis: {
		                    labels: {
		                        format: '{substr value 0 1}'
		                    }
		                }
		            }
		        }]
		    }
		
		});
	//JS 여기까지
}
</script>
	<body>
		<!-- HTML figure -->
		<figure class="similarity">
		    <div id="similarity"></div>
		</figure>
	</body>
</html>