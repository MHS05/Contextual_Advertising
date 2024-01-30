<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "mhs.vo.*" %>
<%@ page import = "mhs.dto.*" %>
<%@ page import = "mhs.dao.*" %>
<%@ page import = "java.util.*" %>
<%
String senno = request.getParameter("senno");
String nno = request.getParameter("nno");

NewsDTO dto = new NewsDTO();
NewsVO vo = dto.Read(nno);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="../highchart/highchart.css">
		<title>광고 선정 이유</title>
	</head>
	<body>
		<div class="title"><h1>[ 광고 선정 이유 ]</h1></div>
		<span class="select_ad"><h2>** 선정된 광고 **</h2></span>
		<span class="ad"><img src="../image/ad.jpg" style="width:850px; height:150px"></span>
		<span class="analyze_emotion"><h2>** 감성 분석 **</h2></span>
		<span class="emotion_ratio"><h2>긍부정 비율 : </h2></span>
		<span class="emotion_percent"><font color='red'><h1>긍정 <%= vo.getScore() %>%</h1></font></span>
		<span class="analyze_keywords"><h2>** 키워드 분석 **</h2></span>
		<span class="board_keywords"><h2>게시물 키워드 리스트: </h2></span>
		<span class="board_keywords1"><font color='red'><h1>[ 아침, 점심, 저녁, 새벽, 심야 ]</h1></font></span>
		<span class="ad_keywords"><h2>광고 키워드 리스트: </h2></span>
		<span class="ad_keywords1"><font color='red'><h1>[ 아침, 점심, 저녁, 식사, 야식 ]</h1></font></span>
		<span class="analyze_similarity"><h2>** 유사도 분석 **</h2></span>
		<span class="analyze_similarity1"><h2>리스트<br>유사도 : </h2></span>
		<span class="analyze_similarity2"><font color='red'><h1>0.7 </h1></font></span>
		<div class="line1"></div>
		<div class="line2"></div>
		<a href="../highchart/highchart02.jsp"><span id="button_back">
			<input type="button" value="< Back "></span>
		</a>
	</body>
</html>