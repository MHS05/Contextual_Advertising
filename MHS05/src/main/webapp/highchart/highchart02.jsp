<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "java.util.*" %>
<%
String nkeyno = request.getParameter("nkeyno");
String nno    = request.getParameter("nno");
String adno   = request.getParameter("adno");

NewsKeywordDTO dto = new NewsKeywordDTO();

String nkeyword = "";
String nkeynum  = "";
String data     = "";
ArrayList<NewsKeywordVO> list = dto.GetList(nno);


//Ű���� ������ ����� �ۼ��Ѵ�.
for(NewsKeywordVO vo : list)
{	
	if(!nkeyword.equals(""))
	{	
		nkeyword += ",";
		nkeynum += ",";
	}
	nkeyword += "'" + vo.getNkey() + "'";
	nkeynum  += vo.getNkeynum();
	data += "['"+vo.getNkey()+"',"+vo.getNkeynum()+"],";
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
			<script src="https://code.highcharts.com/highcharts.js"></script>
			<script src="https://code.highcharts.com/modules/exporting.js"></script>
			<script src="https://code.highcharts.com/modules/export-data.js"></script>
			<script src="https://code.highcharts.com/modules/accessibility.js"></script>
			<script src="../js/jquery-3.7.1.js"></script>
			<link rel="stylesheet" type="text/css" href="../highchart/highchart.css">
		<title>���� ���� ����</title>
	</head>
	<body>
		<script>
		//JS �������
		window.onload = function()
		{	
			//���� Ű����
			nkeyword =  <%= nkeyword %>
			
			//Ű���� �󵵼�
			nkeynum  =  <%= nkeynum %> 
			
			//����Ű����, Ű����󵵼�
			data =  [<%= data %>]
			
			DrawKeywordChart(data);
		}
		
		function DrawKeywordChart(data)
		{
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
			                fontSize: '18px',
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
			        formatter: function() {
			            var index = this.point.index; // ���� ������ ����Ʈ�� �ε��� ��������
			            var keyword = nkeyword[index]; // �ش� �ε����� �ش��ϴ� Ű���� ��������
			            return '<b>'+ this.key + '<br>' + this.y + ' ȸ</b>';
			        },
			        style: {
			            fontSize: '18px'
			        }
			    },
			    series: 
			    [{
			        name: '�󵵼�',
			        colors: 
			        [
			            '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
			            '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
			            '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
			            '#03c69b',  '#00f194'
			        ],
			        colorByPoint: true,
			        groupPadding: 0,
			        data: data
			        ,
			        credits: {  enabled: false },
			        dataLabels: 
			        {
			            enabled: true,
			            rotation: -90,
			            color: '#FFFFFF',
			            align: 'right',
			            format: '{point.y:.1f}', 
			            y: 10, 
			            style:
			            {
			                fontSize: '13px',
			                fontFamily: 'Verdana, sans-serif'
			            }
			        }
			    }]
			});
		}
		//JS �������
		</script>
		<div class="title"><h1>[ ���� ���� ���� ]&emsp;</h1>
			<a href="../highchart/highchart01.jsp?nno=<%= nno %>&adno=<%= adno %>">
			<span id="button_back"><img src="../image/back.png" style="width:50px; height:50px"></span></a>
			<a href="../highchart/highchart03.jsp?nno=<%= nno %>&adno=<%= adno %>">
			<span id="button_next"><img src="../image/next.png" style="width:50px; height:50px"></span></a>
		</div>
		<div class="subtitle1"><h2>&lt; Ű���� �� �м� &gt;</h2></div>
		<!-- 2. Ű���� �� ��Ʈ highchart_keywords.jsp -->
		<div id="keywords"></div>
	</body>
</html>