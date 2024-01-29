<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%
String senno = request.getParameter("senno");
String nno = request.getParameter("nno");

SemotionDTO dto = new SemotionDTO();
SemotionVO vo = dto.Read(nno);
if( vo == null )
{
	//�ش� �Խù� ��ȣ�� �����Ͱ� ����
	%>
	<script>
		alert("�ش� �Խù��� ��ȸ �� �� �����ϴ�.");
		document.location = "adminnewslist.jsp";
	</script>
	<%
	return;
}
%>
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
	        categories: [<%= vo.getSentance()%> ]
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
	        data: [<%= vo.getScore() %>]
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
<%
db.DBClose();
%>