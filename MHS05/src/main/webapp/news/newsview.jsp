<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<style>
#newstitle
{
	margin-left: 15px;
}


#newsimage
{
	text-align: center;	
}

#adimage
{	
	margin-top : 20px;
	text-align:center;
}

#newsnote
{	
	width: 750px;
	font-size : large;
	margin: auto;
}

#listbutton
{	
	width: 80px;
	height:30px;
	background-color:lightgray;
	padding-top:6px;
	margin: auto;
	border-radius: 12px;
	cursor: pointer;
}

#fixed 
{
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 100px;
	padding: 5px;
	color: white;
}
</style>
<div id="fixed" style="width:50px; height: 50px;">
	<a href="#top"><img style="width:50px; height: 50px;" src="../image/topbutton.png"></a>
</div>
<table border="0" align="center" width="1200px">
	<tr>
		<td width="200px" valign="top" >		
			<div><a href="news.jsp"><h1><u>�ǰ��ҽ�</u></h1></a></div> 	
			<div style="width:220px; height:360px; box-shadow: 3px 3px 3px 3px lightgray">
				<table border="0" align="left" width="200px" height="50px">
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=D"><b>���̾�Ʈ</b></a></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=F"><b><u>����</u></b></a></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=E"><b>�</b></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=N"><b>������</b></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=M"><b>�����ǰ�</b></td>
					</tr>
					<tr height="50px">
						<td style="font-size: 20px;"><a href="newslist.jsp?category=F"><b>�����ǰ�</b></td>
					</tr>
					<tr height="50px">
						<td></td>
					</tr>
				</table>
			</div>
		</td>
		<td width="20px">
		</td>
		<td valign="top">
			<div style="border-bottom: 1px solid lightgray; "><h2>���̾�Ʈ</h2></div>
			<div id="newstitle"><h2>������ �Ͼ���䡱�� ���� ���� �������� �־��� ������?</h2>
				<span><font color="gray" size="2px">�Է�&nbsp;<time>2024-01-19</time></font></span><br>
				<span>��� ����</span>
			</div>
			<div style="height:50px"></div>
			<div id="newsimage">
				<img src="../image/diet.jpg">
			</div>
			<div id="adimage">
				<a href="../highchart/highchart01.jsp" target="_blanck"><img width="800px" height="140px" src="../image/dosu.jpg"></a>
			</div>
			<div style="height:50px"></div>
			<div id="newsmain" style="">
				<div id="newsnote">
					���庴�� ������ �ϻ��Ȱ���� ������� �� ����. Ư�� ���� ������ ������ �ɱٰ������ ������ ���赵 �ִ�. ������ ������ �����ϴ� ���� ���� �����ؾ� �Ѵ�. ������ ��ȯ�� ����-�����ϱ� ���ؼ� ����-�������� ����, �ݿ�, �Ļ� ���� ���� �ʿ������� ���� ���� �������� �Ѵ�. �� ��� �϶�� ��Ⱑ �ƴϴ�. �ϻ󿡼� ���� ����϶�� ���̴�.<br>
					<br>
					<b>���� �ɾ� �ִ� ���� �����ߴ��ϡ� ������ ��ȯ ��� ���� 34% ����</b><br>
					<br>
					�̱��ǻ���ȸ�� ���� �м���(JAMA Network Open)�� ��ð� �ɾƼ� ���ϴ� ����� ��� ���ο� ���� ��� ������ 16% ����, ������ ��ȯ���� ���� ��� ������ 34% ���ٴ� ���� �Ƿȴ�. ������ 48���� ���� 13�� ���� ���� ������ ��ü Ȱ���� �ǰ� ������ ������� ���� ���̴�.<br>
					<br>
					���躸�Ǳⱸ(WHO)�� ������ �ǰ��� ���� ��ü Ȱ���� � �ܿ��� �Ͼ�� ��ȭ ��ȭ, ���� �ű��, û�� �� ���� �����̴� �پ��� Ȱ���� ���Ѵ�. �������� ���� �ɾ� �ִ� ������ ���ӵǸ� ������, ����� �� ���� ���� ������ ��������. �ϻ󿡼� �������� �ǰ��� ��ų �� �ִ�.<br>
					<br>
					<b>�������Ƽ����� ������ ���� �Ͼ �Ž��̶� �������䡱</b><br>
					<br>
					���� ��� �Ϸ��� ����, �ⱸ, �̵� �Ÿ� ���� �ʿ��ϴ�. ��ô ���ŷӰ� ������ ���. �̷� �� ������ ���� ����������. ���Ŀ� ���� ���� ���� �Ͼ�� ����Ʈ���̳� TV�� ���� ���̴�. �Ž� ���� ���� �պ��ϰų� �ߵڲ�ġ�� ��� �ø��� ���Ƹ� �ٷ� ��� ����. ������ �������� ����Ʈ�� ���� ����� �ٷ��� �ܷ��غ���. ���� û�Ҵ� �Ǹ��� ��ü Ȱ���̴�. ��� �ｺ Ŭ�� ��� �� �� �ƴϴ�.<br>
					<br>
					<b>���� ��� ��ȣ�� ����-���� ����, �ݿ�, �̰̰� �Ա� ��</b><br>
					<br>
					������ó�� ��� �� ���ڱ� ������ ��ȯ�� ����� ���� �ƴϴ�. ���� ����-����, ��������(�̻���������), ��, ��, ¥�� �Դ� �Ľ���, � ���� ���� ������̴�. �ǰ� �������� ���� ����ǥ�� �޾Ҵµ��� �� ������ ���� ������ ������ ������ ����. �ɱٰ�������� ���� �ϻ��Ȱ�� �賭�ϴ�. ���庴 ���浵 ����-����, �������� ������ �⺻�̴�. �翬�� ��踦 ���� �� ¥�� �Դ� �� ���ĵ� �����ؾ� �Ѵ�.<br>
					<br>
					<b>�ڳ��� �ǰ����� ���⡦ ���� ���� �������� �ʵ��� �ؾ�</b><br>
					<br>
					���庴�� �������� �ִ�. ������ ���� �Ĵ��� �����ϴ� �� �ϻ��� ������ �� ū ������ ��ģ��. �����̱� �Ⱦ��ϰ� § ������ �����ϴ� ��� � �ڳ�鵵 ��´�. ���� �߿� ������, ���庴 ȯ�ڰ� ���� ������ ������.<br>
					<br>
					���� �߳� �̻��� ���̶�� ������ ����-������ �����ؾ� �Ѵ�. ��ġ���� ���� �ϸ� ������ �ٻ� �ڳ�鿡�� ��û�� �δ��� �ش�. �� �ǰ��� ���Ѿ� �Ƶ�, ���� ���ϴ�. ������ ������ ����ϴ� ���� ������ �ؾ� �Ѵ�.<br>
					<br>
				</div>
			</div>
			<div style="height: 20px"></div>
			<div style="text-align: center;">
				<div id="listbutton">���</div>
			</div>
		</td>
	</tr>
</table>
<%@ include file="../include/tail.jsp" %>