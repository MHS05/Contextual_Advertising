<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "java.util.*" %>
<%
String nno = request.getParameter("nno");

NewsDTO dto = new NewsDTO();
NewsVO vo = dto.Read(nno);

SimilarityDTO sdto = new SimilarityDTO();
SimilarityVO svo = sdto.Read(nno, vo.getAdno());

double similary = Double.parseDouble(svo.getSimilary());
similary = similary * 100;

String nkey[] = svo.getNkeylist().split(",");
String adkey[] = svo.getAdkey().split(",");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
			<script src="https://code.highcharts.com/highcharts.js"></script>
			<script src="https://code.highcharts.com/highcharts-more.js"></script>
			<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
			<script src="https://code.highcharts.com/modules/exporting.js"></script>
			<script src="https://code.highcharts.com/modules/export-data.js"></script>
			<script src="https://code.highcharts.com/modules/accessibility.js"></script>
			<script src="../js/jquery-3.7.1.js"></script>
			<link rel="stylesheet" type="text/css" href="../highchart/highchart.css">
		<title>광고 선정 이유</title>
	</head>
	<body>		
		<script>
		//JS 여기부터
		window.onload = function()
		{
			function renderIcons() {

			    this.series.forEach(series => {
			        if (!series.icon) {
			            series.icon = this.renderer
			                .text(
			                    `<i class="fa fa-${series.options.custom.icon}"></i>`,
			                    0,
			                    0,
			                    true
			                )
			                .attr({
			                    zIndex: 10
			                })
			                .css({
			                    color: series.options.custom.iconColor,
			                    fontSize: '1.5em'
			                })
			                .add(this.series[2].group);
			        }
			        series.icon.attr({
			            x: this.chartWidth / 2 - 15,
			            y: this.plotHeight / 2 -
			                series.points[0].shapeArgs.innerR -
			                (
			                    series.points[0].shapeArgs.r -
			                    series.points[0].shapeArgs.innerR
			                ) / 2 +
			                8
			        });
			    });
			}

			const trackColors = Highcharts.getOptions().colors.map(color =>
			    new Highcharts.Color(color).setOpacity(0.3).get()
			);

			Highcharts.chart('container', {

			    chart: {
			        type: 'solidgauge',
			        height: '110%',
			        events: {
			            render: renderIcons
			        }
			    },
			    
			    title: {
			        text: ' ',
			        style: {
			            fontSize: '24px'
			        }
			    },

			    tooltip: {
			        borderWidth: 0,
			        backgroundColor: 'none',
			        shadow: false,
			        style: {
			            fontSize: '20px'
			        },
			        valueSuffix: '%',
			        pointFormat: 
			            '<span style="font-size: 2em; color: {point.color}; ' +
			            'font-weight: bold">{series.name}<br>{point.y}</span>',
			        positioner: function (labelWidth) {
			            return {
			                x: (this.chart.chartWidth - labelWidth) / 2,
			                y: (this.chart.plotHeight / 2) + -25
			            };
			        }
			    },

			    pane: {
			        startAngle: 0,
			        endAngle: 360,
			        background: 
			        [{ // Track for Conversion
			            outerRadius: '100%',
			            innerRadius: '80%',
			            backgroundColor: trackColors[0],
			            borderWidth: 0
			        }, 
			        { // Track for Engagement
			            outerRadius: '80%',
			            innerRadius: '60%',
			            backgroundColor: trackColors[1],
			            borderWidth: 0
			        }]
			    },

			    yAxis: {
			        min: 0,
			        max: 100,
			        lineWidth: 0,
			        tickPositions: []
			    },

			    plotOptions: {
			        solidgauge: {
			            dataLabels: {
			                enabled: false
			            },
			            linecap: 'round',
			            stickyTracking: false,
			            rounded: true
			        }
			    },

			    series: [{
			        name: '긍정',
			        data: [{
			            color: Highcharts.getOptions().colors[0],
			            radius: '100%',
			            innerRadius: '80%',
			            y: <%= vo.getScore().substring(0,2) %>
			        }],
			        custom: {
			            icon: 'filter',
			            iconColor: '#303030'
			        }
			    }, {
			        name: '유사도',
			        data: [{
			            color: Highcharts.getOptions().colors[1],
			            radius: '80%',
			            innerRadius: '60%',
			            y: <%= similary %>
			        }],
			        custom: {
			            icon: 'comments-o',
			            iconColor: '#ffffff'
			        }
			    }]
			});
		}
		//JS 여기까지	
		</script>
		<div class="title"><h1>[ 광고 선정 이유 ]&emsp;</h1>
			<a href="../highchart/highchart02.jsp?nno=<%= nno %>">
			<span id="button_back"><img src="../image/back.png" style="width:50px; height:50px"></span></a>
			<span class="ad"><img src="../admin/adimagedown.jsp?adno=<%= vo.getAdno() %>" style="width:850px; height:200px"></span>
			<a href="../highchart/highchart03.jsp?nno=<%= nno %>">
			<span id="button_next"><img src="../image/next.png" style="width:50px; height:50px"></span></a>
		</div>
<!-- 3. 유사도 차트 highchart_similarity.jsp -->
	    <span class="board_keywords"><h2>[ 뉴스 키워드 리스트 ]</h2></span>
	    <span class="board_keywords1" style="border:50px;"><h1>
		    <%
		    	for(String key : nkey )
			    {
			    	out.println(key);%><br><%
			    }
	    		%></h1></span>
	    <span class="ad_keywords"><h2>[ 광고 키워드 리스트 ] </h2></span>
	    <span class="ad_keywords1"><h1>
	   		 <%
			    for(String key : adkey )
			    {
			    	out.println(key);%><br><%
			    }
			    %></h1></span>
    	<div id="container"></div>
	</body>
</html>