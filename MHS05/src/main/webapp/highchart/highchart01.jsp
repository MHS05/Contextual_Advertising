<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "java.util.*" %>
<%
String senno = request.getParameter("senno");
String nno = request.getParameter("nno");

SemotionDTO dto = new SemotionDTO();

ArrayList<SemotionVO> list = dto.GetList(nno);

	
//ī�װ� ����� �ۼ��Ѵ�.
String category = "";
String pos_data = "";
String neg_data = "";
for(SemotionVO vo : list)
{
	if(!category.equals(""))
	{
		category += ",";
		pos_data += ",";
		neg_data += ",";
	}
	//category += "'" + vo.getSentance() + "'";
	String sentance = vo.getSentance();
	if(sentance.length() > 10)
	{
		sentance  = sentance.substring(0,10);
		sentance += "...";
	}
		
	category += "'" + sentance + "'";
	if(vo.getEmotion().equals("����"))
	{
		pos_data += vo.getScore();
		neg_data += "null";
	}else
	{		
		pos_data += "null";
		neg_data += "-" + vo.getScore();
	}
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
			//Ű����
	        categories = [ <%= category %> ];

			//���������� 
	        pos_data = [ <%= pos_data %> ];
			
			//���������� 
	        neg_data = [ <%= neg_data %> ];
		
			DrawEmotionChart(categories,pos_data,neg_data);
		}
		
		function DrawEmotionChart(categories,pos_data,neg_data)
		{
			Highcharts.chart('emotion', {
			    chart: { type: 'column'},
			    title: { text: '�Խù� ���庰 ����� �׷���'},
			    xAxis: { categories: categories },
			    credits: {  enabled: false },
			    plotOptions: {
			        column: {
			            borderRadius: '25%',
			            pointPadding: 0.1, // �� �� ������ �����մϴ�.
			            groupPadding: 0.1 // �׷� �� ������ �����մϴ�.
			        }
			    },
			    tooltip: 
			    {
			        style: { fontSize: '18px' }
			    },
			    series: 
			    [{
			        name: '����',
			        data: pos_data
			    }, 
			    {
			        name: '����',
			        data: neg_data
			    }]
			});
		}
		//JS �������	
		</script>
		<div class="title"><h1>[ ���� ���� ���� ]</h1></div>
		<span class="subtitle1"><h2>&lt; ���� �м� &gt;</h2></span>
		<!-- 1. ����� ��Ʈ highchart_emotion.jsp -->
		<span id="emotion" style="display:inline-block; width:1000px; height:800px"></span>
 		<a href="../highchart/highchart02.jsp?nno=<%= nno %>">
			<span id="button_next"><input type="button" value="Next >"></span>
		</a>
	</body>
</html>