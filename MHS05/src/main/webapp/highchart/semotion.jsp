<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="mhs.vo.*, mhs.dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>���� ���� ����</title>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <link rel="stylesheet" type="text/css" href="../highchart/highchart.css">
    <link rel="stylesheet" href="./css/jquery-ui.css">
    <script src="./js/jquery-3.7.1.js"></script>
    <script src="./js/jquery-ui.js"></script>  
</head>
<body id="semotionlist">
    <div class="title"><h1>[ ���� ���� ���� ]</h1></div>
    <span class="subtitle1"><h2>&lt; ���� �м� &gt;</h2></span>
    <!-- 1. ����� ��Ʈ highchart_emotion.jsp -->
    <span id="emotion" style="display:inline-block; width:1000px; height:800px"></span>
    <%
    DBManager db = new DBManager();
    db.DBOpen();
    String sql = "select senno, nno, sentance, emotion, score from semotion order by senno";
    db.RunSelect(sql);      
    while(db.GetNext() == true)
    {
        String senno = db.GetValue("senno");
        String nno = db.GetValue("nno");
        String sentence = db.GetValue("sentance");
        String emotion = db.GetValue("emotion");
        String score = db.GetValue("score");
        String emotionScore = emotion.equals("����") ? score : "0"; // ������ �����̸� ������, �ƴϸ� 0�� ����
        String negationScore = emotion.equals("����") ? score : "0"; // ������ �����̸� ������, �ƴϸ� 0�� ����
    %>
    <script>
    //JS �������
window.onload = function()
{
    Highcharts.chart('emotion', {
        chart: { type: 'column'},
        title: { text: '�Խù� ���庰 ����� �׷���'},
        xAxis: {
            categories: ['<%= sentence %>']
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
        series: [
       	{
       	    name: '����',
       	    data: [ <%= emotionScore.replace("%", "") %> ] // �ۼ�Ʈ �κ��� ������ �� ���
       	},
       	{
       	    name: '����',
       	    data: [ <%= negationScore.replace("%", "") %> ] // �ۼ�Ʈ �κ��� ������ �� ���
       	}]
    });
}
    //JS �������
    </script>
    <%
    }
    db.DBClose();
    %>
    <a href="../highchart/highchart02.jsp">
        <span id="button_next"><input type="button" value="Next >"></span>
    </a>
</body>
</html>