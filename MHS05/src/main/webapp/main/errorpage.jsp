<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>에러 발생</title>
</head>
<style>
	@font-face {
		font-family: 'NanumGothic';
		font-style: normal;
		font-weight: 400;
	}

	@font-face {
		font-family: 'NanumGothic';
		font-style: normal;
		font-weight: 700;
	}
	html { height: 100%; }
	.error_h1 {font-size: 24px; line-height: 32px; font-weight: 700; color: #000; }
	.error_p { margin: 8px 0 0; font-size: 15px; line-height: 21px; color: #000; }
	.area_btn{margin-top:44px;font-size:0;line-height:0;}
	.area_btn .link{display:inline-block;width:280px;height:48px;border-radius:6px;background-color:#4dd5b0;font-size:15px;line-height:48px;color:#fff;font-weight:700;text-align:center;text-decoration:none}
</style>
<body>
<div style="text-align: center;">
<a href="index.jsp"><img src="../image/nunmullogo.png"></a>
</div>
<div style="text-align: center; margin-top: 0px;">
<h1 class="error_h1">죄송합니다. 유효하지 않은 요청입니다.</h1>
<p class="error_p">방문하시려는 페이지의 주소가 잘못 입력되었거나,</p><p class="error_p">페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
            <p class="error_p">입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
	<div class="area_btn">
		<a href="javascript:history.back(-1)" class="link">이전 화면으로</a></div>
<br>
에러 타입: <%= exception.getClass().getName() %> <br>
에러 메시지: <b><%= exception.getMessage() %></b>
</div>
</body>
</html>
<!--
에러페이지 용량 채우기용 주석입니다.에러페이지 용량 채우기용 주석입니다.
에러페이지 용량 채우기용 주석입니다.에러페이지 용량 채우기용 주석입니다.
에러페이지 용량 채우기용 주석입니다.에러페이지 용량 채우기용 주석입니다.
에러페이지 용량 채우기용 주석입니다.에러페이지 용량 채우기용 주석입니다.
에러페이지 용량 채우기용 주석입니다.에러페이지 용량 채우기용 주석입니다.
에러페이지 용량 채우기용 주석입니다.에러페이지 용량 채우기용 주석입니다.
-->