<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���� ���� ����</title>
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
		.keyword1
		{
			top:185px;
			left:700px;
			position: absolute;
		}
		.keyword2
		{
			top:220px;
			left:700px;
			position: absolute;
		}
		.keyword3
		{
			top:255px;
			left:700px;
			position: absolute;
		}
		.keyword4
		{
			top:295px;
			left:700px;
			position: absolute;
		}
		.keyword5
		{
			top:330px;
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
		.stick1
		{
			border-left:thick solid black;
			height:820px;
			margin-left:600px;
			position:absolute;
		}
		.stick2
		{
			border-left:thick solid black;
			height:820px;
			margin-left:1200px;
			position:absolute;
		}
		.stick3
		{
			border-bottom:3px solid black;
			width:100px;
			margin-left:850px;
			margin-top:130px;
			position: absolute;
		}
		.stick4
		{
			border-bottom:3px solid black;
			width:100px;
			margin-left:850px;
			margin-top:165px;
			position: absolute;
		}
		.stick5
		{
			border-bottom:3px solid black;
			width:100px;
			margin-left:850px;
			margin-top:200px;
			position: absolute;
		}
		.stick6
		{
			border-bottom:3px solid black;
			width:100px;
			margin-left:850px;
			margin-top:240px;
			position: absolute;
		}
		.stick7
		{
			border-bottom:3px solid black;
			width:100px;
			margin-left:850px;
			margin-top:275px;
			position: absolute;
		}
		.arrow1
		{
			position: absolute;
			content: '';
		    width: 10px; /* ������ */
		    height: 10px; /* ������ */
		    border-top: 5px solid #121212; /* �� �β� */
		    border-right: 5px solid #121212; /* �� �β� */
		    display: inline-block;
		    transform: rotate(45deg); /* ���� */
		    position: absolute;
		    top: 210px; /* �⺻ 0px ������ ���ּ��� */
		    left: 945px; /* �⺻ 0px ������ ���ּ��� */
		}
		.arrow2
		{
			position: absolute;
			content: '';
		    width: 10px; /* ������ */
		    height: 10px; /* ������ */
		    border-top: 5px solid #121212; /* �� �β� */
		    border-right: 5px solid #121212; /* �� �β� */
		    display: inline-block;
		    transform: rotate(45deg); /* ���� */
		    position: absolute;
		    top: 245px; /* �⺻ 0px ������ ���ּ��� */
		    left: 945px; /* �⺻ 0px ������ ���ּ��� */
		}
		.arrow3
		{
			position: absolute;
			content: '';
		    width: 10px; /* ������ */
		    height: 10px; /* ������ */
		    border-top: 5px solid #121212; /* �� �β� */
		    border-right: 5px solid #121212; /* �� �β� */
		    display: inline-block;
		    transform: rotate(45deg); /* ���� */
		    position: absolute;
		    top: 280px; /* �⺻ 0px ������ ���ּ��� */
		    left: 945px; /* �⺻ 0px ������ ���ּ��� */
		}
		.arrow4
		{
			position: absolute;
			content: '';
		    width: 10px; /* ������ */
		    height: 10px; /* ������ */
		    border-top: 5px solid #121212; /* �� �β� */
		    border-right: 5px solid #121212; /* �� �β� */
		    display: inline-block;
		    transform: rotate(45deg); /* ���� */
		    position: absolute;
		    top: 320px; /* �⺻ 0px ������ ���ּ��� */
		    left: 945px; /* �⺻ 0px ������ ���ּ��� */
		}
		.arrow5
		{
			position: absolute;
			content: '';
		    width: 10px; /* ������ */
		    height: 10px; /* ������ */
		    border-top: 5px solid #121212; /* �� �β� */
		    border-right: 5px solid #121212; /* �� �β� */
		    display: inline-block;
		    transform: rotate(45deg); /* ���� */
		    position: absolute;
		    top: 355px; /* �⺻ 0px ������ ���ּ��� */
		    left: 945px; /* �⺻ 0px ������ ���ּ��� */
		}
		.Similarity1
		{
			top:185px;
			left:1000px;
			position: absolute;
		}
		.Similarity2
		{
			top:220px;
			left:1000px;
			position: absolute;
		}
		.Similarity3
		{
			top:255px;
			left:1000px;
			position: absolute;
		}
		.Similarity4
		{
			top:295px;
			left:1000px;
			position: absolute;
		}
		.Similarity5
		{
			top:330px;
			left:1000px;
			position: absolute;
		}
	</style>
	<body bgcolor='#4dd5b0'>
		<div style="text-align:center"><h1>*���� ���� ����*</h1></div>
		<span class="pnarea"><h2>����� ���� ����</h2></span>
		<span class="pngraph"><img src="../image/graph.png"></span>
		<span class="boardpngraph"><h3>�Խù� ���庰 ����� �׷���</h3></span>
		<span class="pnratio"><h3>����� ���� : </h3></span>
		<span class="percent"><font color='red'><h1>���� 53%</h1></font></span>
		<div class="stick1"></div>
		<span class="correlationarea"><h2>������ ����</h2></span>
		<span class="representkey"><h3>��ǥ Ű���� 5��</h3></span>
		<span class="keyword1"><font color='red'><h3>��ħ(13ȸ)</h3></font></span>
		<div class="stick3"></div>
		<div class="arrow1"></div>
		<span class="keyword2"><font color='red'><h3>����(5ȸ)</h3></font></span>
		<div class="stick4"></div>
		<div class="arrow2"></div>
		<span class="keyword3"><font color='red'><h3>�ް�(5ȸ)</h3></font></span>
		<div class="stick5"></div>
		<div class="arrow3"></div>
		<span class="keyword4"><font color='red'><h3>����(4ȸ)</h3></font></span>
		<div class="stick6"></div>
		<div class="arrow4"></div>
		<span class="keyword5"><font color='red'><h3>���(4ȸ)</h3></font></span>
		<div class="stick7"></div>
		<div class="arrow5"></div>
		<span class="Similarity1"><font color='red'><h3>���絵 1.0</h3></font></span>
		<span class="Similarity2"><font color='red'><h3>���絵 0.9</h3></font></span>
		<span class="Similarity3"><font color='red'><h3>���絵 0.8</h3></font></span>
		<span class="Similarity4"><font color='red'><h3>���絵 0.7</h3></font></span>
		<span class="Similarity5"><font color='red'><h3>���絵 0.6</h3></font></span>
		<span class="bkeyfrequency"><h3>�Խù� Ű���� �󵵼�</h3></span>
		<span class="bkfgraph"><img src="../image/graph.png"></span>
		<span class="bkfgraphtext"><h3>�Խù� Ű����, ���� Ű���� �� ���絵 �׷���</h3></span>
		<div class="stick2"></div>
		<span class="choicead"><h2>���� ����</h2></span>
		<span class="ad"><img src="../image/ad.jpg"></span>
		<span class="bkeyword1"><h3>�ִ� �Խù� Ű����</h3></span>
		<span class="akeyword1"><h3>���� Ű����</h3></span>
		<span class="bkeyword2"><font color='red'><h1>��ħ</h1></font></span>
		<span class="akeyword2"><font color='red'><h1>��ħ</h1></font></span>
		<div style="border-left:3px solid black;height:30px;margin-left:1380px;margin-top:703px;position: absolute;"></div>
		<div style="border-bottom:3px solid black;width:373px;margin-left:1380px;margin-top:730px;position: absolute;"></div>
		<div style="border-left:3px solid black;height:30px;margin-left:1750px;margin-top:703px;position: absolute;"></div>
		<div style="border-left:3px solid black;height:30px;margin-left:1570px;margin-top:730px;position: absolute;"></div>
		<span class="similarity"><font color='red'><h1>���絵 1.0</h1></font></span>
	</body>
</html>