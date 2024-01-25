<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Ű���� �󵵼� ��Ʈ</title>
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
	//JS ��Ʈ �ִ� �� �Դϴ�.
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
		        width: 900, // ���ϴ� ���� ũ��� ����
		        height: 800 // ���ϴ� ���� ũ��� ����

		    },
		
		
		    title: {
		        text: '�ڻ��� ���絵 �м�',
		        style: {
		            fontSize: '1em'
		        }
		    },
		
		    xAxis: {
		        categories: ['�Խù� Ű����1', '�Խù� Ű����2', '�Խù� Ű����3', '�Խù� Ű����4', '�Խù� Ű����5'],
		        labels: {
		            style: {
		                fontSize: '20px' // ���ϴ� ũ��� ����
		            }
		        }
		    },

		    yAxis: {
		        categories: ['���� Ű����1', '���� Ű����2', '���� Ű����3', '���� Ű����4', '���� Ű����5'],
		        title: null,
		        reversed: true,
		        labels: {
		            style: {
		                fontSize: '20px' // ���ϴ� ũ��� ����
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
		            return '<b>�Խù� Ű���� : ' + this.series.xAxis.categories[this.point.x] + '</b><br>' +
		                   '<b>���� Ű���� :' + this.series.yAxis.categories[this.point.y] + '</b><br>' +
		                   '<b>���絵 :' + this.point.value + '</b>';
		        },
		        style: {
		            fontSize: '20px'
		        }
		    },
		    series: [{
		        name: '���絵',
		        borderWidth: 1,		//data:[0��°��, ����������0��°��, �����Ͱ�(���絵)]
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
	//JS �������
}
</script>
	<body>
		<!-- HTML figure -->
		<figure class="similarity">
		    <div id="similarity"></div>
		</figure>
	</body>
</html>