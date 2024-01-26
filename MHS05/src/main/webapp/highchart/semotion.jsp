<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="mhs.vo.*, mhs.dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>광고 선정 이유</title>
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
    <div class="title"><h1>[ 광고 선정 이유 ]</h1></div>
    <span class="subtitle1"><h2>&lt; 감성 분석 &gt;</h2></span>
    <!-- 1. 긍부정 차트 highchart_emotion.jsp -->
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
        String emotionScore = emotion.equals("긍정") ? score : "0"; // 감정이 긍정이면 점수를, 아니면 0을 선택
        String negationScore = emotion.equals("부정") ? score : "0"; // 감정이 부정이면 점수를, 아니면 0을 선택
    %>
    <script>
    //JS 여기부터
window.onload = function()
{
    Highcharts.chart('emotion', {
        chart: { type: 'column'},
        title: { text: '게시물 문장별 긍부정 그래프'},
        xAxis: {
            categories: ['<%= sentence %>']
        },
        credits: {  enabled: false },
        plotOptions: {
            column: {
                borderRadius: '25%',
                pointPadding: 0.1, // 열 간 간격을 조절합니다.
                groupPadding: 0.1 // 그룹 간 간격을 조절합니다.
            }
        },
        tooltip: {
            style: {
                fontSize: '60px' // 툴팁 글자 크기
            }
        },
        series: [
       	{
       	    name: '긍정',
       	    data: [ <%= emotionScore.replace("%", "") %> ] // 퍼센트 부분을 제거한 후 출력
       	},
       	{
       	    name: '부정',
       	    data: [ <%= negationScore.replace("%", "") %> ] // 퍼센트 부분을 제거한 후 출력
       	}]
    });
}
    //JS 여기까지
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