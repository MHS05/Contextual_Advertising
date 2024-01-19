<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>광고 선정 이유</title>
	</head>
	<style>
		.pnarea
		{
			top:90px;
			left:220px;
			position: absolute;
		}
		.pngraph
		{
			background-color:white;
			position: absolute;
			top:180px;
			left:50px;
		}
		.boardpngraph
		{
			top:600px;
			left:160px;
			position: absolute;
		}
		.pnratio
		{
			top:730px;
			left:160px;
			position: absolute;
		}
		.percent
		{
			top:720px;
			left:290px;
			position: absolute;
		}
		.correlationarea
		{
			top:75px;
			left:850px;
			position: absolute;		
		}
		.representkey
		{
			top:150px;
			left:700px;
			position: absolute;
		}
		.ktable
		{
			top:200px;
			left:700px;
			position: absolute;
		}
		.bkeyfrequency
		{
			top:365px;
			left:825px;
			position: absolute;
		}
		.bkfgraph
		{
			background-color:white;
			position: absolute;
			top:425px;
			left:660px;
		}
		.bkfgraphtext
		{
			top:850px;
			left:725px;
			position: absolute;
		}
		.choicead
		{
			top:70px;
			left:1500px;
			position: absolute;
		}
		.ad
		{
			top:150px;
			left:1250px;
			position: absolute;	
		}
		.bkeyword1
		{
			top:700px;
			left:1300px;
			position: absolute;	
		}
		.akeyword1
		{
			top:700px;
			left:1700px;
			position: absolute;	
		}
		.bkeyword2
		{
			top:730px;
			left:1350px;
			position: absolute;	
		}
		.akeyword2
		{
			top:730px;
			left:1725px;
			position: absolute;	
		}
		.similarity
		{
			top:820px;
			left:1500px;
			position: absolute;			
		}
	</style>
	<body bgcolor='#4dd5b0'>
		<div style="text-align:center"><h1>*광고 선정 이유*</h1></div>
		<span class="pnarea"><h2>긍부정 관련 영역</h2></span>
		<span class="pngraph"><img src="../image/graph.png"></span>
		<span class="boardpngraph"><h3>게시물 문장별 긍부정 그래프</h3></span>
		<span class="pnratio"><h3>긍부정 비율 : </h3></span>
		<span class="percent"><font color='red'><h1>긍정 53%</h1></font></span>
		<div style="border-left:thick solid black;height:820px;margin-left:600px;position: absolute;"></div>
		<span class="correlationarea"><h2>연관성 영역</h2></span>
		<span class="representkey"><h3>대표 키워드 5개</h3></span>
		<span class="ktable">
			<table width="450px" height="150px">
				<tr align="center">
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>아침(13회)</b></td>
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>유사도 : 1.0</b></td>
				</tr>
				<tr align="center">
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>도움(5회)</b></td>
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>유사도 : 1.0</b></td>
				</tr>
				<tr align="center">
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>달걀(5회)</b></td>
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>유사도 : 1.0</b></td>
				</tr>
				<tr align="center">
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>국민(4회)</b></td>
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>유사도 : 1.0</b></td>
				</tr>
				<tr align="center">
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>결식(4회)</b></td>
					<td style="border-radius:10px;border:1px solid black;color:red;"><b>유사도 : 1.0</b></td>
				</tr>
			</table>
		</span>
		<span class="bkeyfrequency"><h3>게시물 키워드 빈도수</h3></span>
		<span class="bkfgraph"><img src="../image/graph.png"></span>
		<span class="bkfgraphtext"><h3>게시물 키워드, 광고 키워드 간 유사도 그래프</h3></span>
		<div style="border-left:thick solid black;height:820px;margin-left:1200px;position: absolute;"></div>
		<span class="choicead"><h2>선정 광고</h2></span>
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