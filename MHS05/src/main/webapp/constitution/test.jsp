<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String uno = request.getParameter("uno");
String con = request.getParameter("con");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>체질검사 테스트</title>
<script src="jquery-3.7.1.js"></script>
</head>
<body>
<style>
	#result 
	{
		border: none;
		width: 150px;
		height: 50px;
		background-color: #4dd5b0;
		border-radius: 15px;
		font-size: 17px;
	}
	
	#reset 
	{
		border: none;
		width: 150px;
		height: 50px;
		background-color: #BEBEBE;
		border-radius: 15px;
		font-size: 17px;
	}
	
	td 
	{
		font-size: 30px;
	}
	
	section 
	{
		height: 80vh;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	input[type=radio]
	{
	
	width: 1.5em;
	height: 1.5em;
	
	}
	
</style>
<script>
	//18번~20번 문제 선택시 스크롤 내려가기
	function GoToScroll(name) 
	{
		if(name == "r")
		{
		    var location = document.querySelector("." + name).offsetTop;
		    window.scrollTo({top: location, behavior: 'smooth'});
		} else if(name == "s")
		{	
			if(        $("input:radio[name='q_19_1']:checked").length == 1
					&& $("input:radio[name='q_19_2']:checked").length == 1 
					&& $("input:radio[name='q_19_3']:checked").length == 1 
					&& $("input:radio[name='q_19_4']:checked").length == 1 
					&& $("input:radio[name='q_19_5']:checked").length == 1 
					&& $("input:radio[name='q_19_6']:checked").length == 1 
					&& $("input:radio[name='q_19_7']:checked").length == 1 
				)
			{
			    var location = document.querySelector("." + name).offsetTop;
			    window.scrollTo({top: location - 300, behavior: 'smooth'});
			}
		}else if(name == "t")
		{	
			if($("input:radio[name='q_20_1']:checked").length == 1
					&& $("input:radio[name='q_20_2']:checked").length == 1 
					&& $("input:radio[name='q_20_3']:checked").length == 1 
					&& $("input:radio[name='q_20_4']:checked").length == 1 
					&& $("input:radio[name='q_20_5']:checked").length == 1 
					&& $("input:radio[name='q_20_6']:checked").length == 1 
					&& $("input:radio[name='q_20_7']:checked").length == 1 
			)
			{
			    var location = document.querySelector("." + name).offsetTop;
			    window.scrollTo({top: location - 300, behavior: 'smooth'});
			}
		}else if(name == "u")
		{	
			if($("input:radio[name='q_21_1']:checked").length == 1
					&& $("input:radio[name='q_21_2']:checked").length == 1 
					&& $("input:radio[name='q_21_3']:checked").length == 1 
					&& $("input:radio[name='q_21_4']:checked").length == 1 
					&& $("input:radio[name='q_21_5']:checked").length == 1 
					&& $("input:radio[name='q_21_6']:checked").length == 1 
					&& $("input:radio[name='q_21_7']:checked").length == 1 
			)
			{
			    var location = document.querySelector("." + name).offsetTop;
			    window.scrollTo({top: location - 300, behavior: 'smooth'});
			}
		} 

	}
	
	//1~17번문제 선택시 스크롤 내려가기
	function goToScroll(name) 
	{
		var location = document.querySelector("." + name).offsetTop;
  		window.scrollTo({top: location - 400, behavior: 'smooth'});
	}
	
	
	//빼먹은 문제랑 결과 구하기
	function go_insert() {

		j = 0;
		for (var i = 0; i < form3.q_1.length; i++) {
			if (form3.q_1[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("1번 문제를 풀어주세요")
			var location = document.querySelector("." + "first").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_2.length; i++) {
			if (form3.q_2[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("2번 문제를 풀어주세요")
			var location = document.querySelector("." + "a").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_3.length; i++) {
			if (form3.q_3[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("3번 문제를 풀어주세요")
			var location = document.querySelector("." + "b").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_4.length; i++) {
			if (form3.q_4[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("4번 문제를 풀어주세요")
			var location = document.querySelector("." + "c").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_5.length; i++) {
			if (form3.q_5[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("5번 문제를 풀어주세요")
			var location = document.querySelector("." + "d").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_6.length; i++) {
			if (form3.q_6[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("6번 문제를 풀어주세요")
			var location = document.querySelector("." + "e").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_7.length; i++) {
			if (form3.q_7[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("7번 문제를 풀어주세요")
			var location = document.querySelector("." + "f").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_8.length; i++) {
			if (form3.q_8[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("8번 문제를 풀어주세요")
			var location = document.querySelector("." + "g").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_9.length; i++) {
			if (form3.q_9[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("9번 문제를 풀어주세요")
			var location = document.querySelector("." + "h").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_10.length; i++) {
			if (form3.q_10[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("10번 문제를 풀어주세요")
			var location = document.querySelector("." + "i").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_11.length; i++) {
			if (form3.q_11[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("11번 문제를 풀어주세요")
			var location = document.querySelector("." + "j").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_12.length; i++) {
			if (form3.q_12[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("12번 문제를 풀어주세요")
			var location = document.querySelector("." + "k").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_13.length; i++) {
			if (form3.q_13[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("13번 문제를 풀어주세요")
			var location = document.querySelector("." + "l").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_14.length; i++) {
			if (form3.q_14[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("14번 문제를 풀어주세요")
			var location = document.querySelector("." + "m").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_15.length; i++) {
			if (form3.q_15[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("15번 문제를 풀어주세요")
			var location = document.querySelector("." + "n").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_16.length; i++) {
			if (form3.q_16[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("16번 문제를 풀어주세요")
			var location = document.querySelector("." + "o").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_17.length; i++) {
			if (form3.q_17[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("17번 문제를 풀어주세요")
			var location = document.querySelector("." + "p").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_18.length; i++) {
			if (form3.q_18[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("18번 문제를 풀어주세요")
			var location = document.querySelector("." + "q").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_1.length; i++) {
			if (form3.q_19_1[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_2.length; i++) {
			if (form3.q_19_2[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_3.length; i++) {
			if (form3.q_19_3[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_4.length; i++) {
			if (form3.q_19_4[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_5.length; i++) {
			if (form3.q_19_5[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_6.length; i++) {
			if (form3.q_19_6[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_19_7.length; i++) {
			if (form3.q_19_7[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("19 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "r").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_1.length; i++) {
			if (form3.q_20_1[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_2.length; i++) {
			if (form3.q_20_2[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_3.length; i++) {
			if (form3.q_20_3[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_4.length; i++) {
			if (form3.q_20_4[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_5.length; i++) {
			if (form3.q_20_5[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_6.length; i++) {
			if (form3.q_20_6[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_20_7.length; i++) {
			if (form3.q_20_7[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("20 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "s").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_1.length; i++) {
			if (form3.q_21_1[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_2.length; i++) {
			if (form3.q_21_2[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_3.length; i++) {
			if (form3.q_21_3[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_4.length; i++) {
			if (form3.q_21_4[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_5.length; i++) {
			if (form3.q_21_5[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_6.length; i++) {
			if (form3.q_21_6[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_21_7.length; i++) {
			if (form3.q_21_7[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("21 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "t").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_1.length; i++) {
			if (form3.q_22_1[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_2.length; i++) {
			if (form3.q_22_2[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_3.length; i++) {
			if (form3.q_22_3[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_4.length; i++) {
			if (form3.q_22_4[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_5.length; i++) {
			if (form3.q_22_5[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_6.length; i++) {
			if (form3.q_22_6[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		j = 0;
		for (var i = 0; i < form3.q_22_7.length; i++) {
			if (form3.q_22_7[i].checked == true) {
				j = 1
			}
		}
		if (j == 0) {
			alert("22 문제를 모두 풀어주세요")
			var location = document.querySelector("." + "u").offsetTop;
  			window.scrollTo({top: location - 400, behavior: 'smooth'});
			return;
		}

		var q_ = new Array(18);
		var q_19 = new Array(7);
		var q_20 = new Array(7);
		var q_21 = new Array(7);
		var q_22 = new Array(7);

		var A = 0
		var B = 0
		var C = 0
		var D = 0
		//q_[0]=form3.q_1.value;

		for (var i = 1; i < form3.q_1.length; i++) {
			if (form3.q_1[i].checked == true) {
				q_[0] = i + 1
			}
		}
		for (var i = 1; i < form3.q_2.length; i++) {
			if (form3.q_2[i].checked == true) {
				q_[1] = i + 1
			}
		}
		for (var i = 1; i < form3.q_3.length; i++) {
			if (form3.q_3[i].checked == true) {
				q_[2] = i + 1
			}
		}
		for (var i = 1; i < form3.q_4.length; i++) {
			if (form3.q_4[i].checked == true) {
				q_[3] = i + 1
			}
		}
		for (var i = 1; i < form3.q_5.length; i++) {
			if (form3.q_5[i].checked == true) {
				q_[4] = i + 1
			}
		}
		for (var i = 1; i < form3.q_6.length; i++) {
			if (form3.q_6[i].checked == true) {
				q_[5] = i + 1
			}
		}
		for (var i = 1; i < form3.q_7.length; i++) {
			if (form3.q_7[i].checked == true) {
				q_[6] = i + 1
			}
		}
		for (var i = 1; i < form3.q_8.length; i++) {
			if (form3.q_8[i].checked == true) {
				q_[7] = i + 1
			}
		}
		for (var i = 1; i < form3.q_9.length; i++) {
			if (form3.q_9[i].checked == true) {
				q_[8] = i + 1
			}
		}
		for (var i = 1; i < form3.q_10.length; i++) {
			if (form3.q_10[i].checked == true) {
				q_[9] = i + 1
			}
		}
		for (var i = 1; i < form3.q_11.length; i++) {
			if (form3.q_11[i].checked == true) {
				q_[10] = i + 1
			}
		}
		for (var i = 1; i < form3.q_12.length; i++) {
			if (form3.q_12[i].checked == true) {
				q_[11] = i + 1
			}
		}
		for (var i = 1; i < form3.q_13.length; i++) {
			if (form3.q_13[i].checked == true) {
				q_[12] = i + 1
			}
		}
		for (var i = 1; i < form3.q_14.length; i++) {
			if (form3.q_14[i].checked == true) {
				q_[13] = i + 1
			}
		}
		for (var i = 1; i < form3.q_15.length; i++) {
			if (form3.q_15[i].checked == true) {
				q_[14] = i + 1
			}
		}
		for (var i = 1; i < form3.q_16.length; i++) {
			if (form3.q_16[i].checked == true) {
				q_[15] = i + 1
			}
		}
		for (var i = 1; i < form3.q_17.length; i++) {
			if (form3.q_17[i].checked == true) {
				q_[16] = i + 1
			}
		}
		for (var i = 1; i < form3.q_18.length; i++) {
			if (form3.q_18[i].checked == true) {
				q_[17] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_1.length; i++) {
			if (form3.q_19_1[i].checked == true) {
				q_19[0] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_2.length; i++) {
			if (form3.q_19_2[i].checked == true) {
				q_19[1] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_3.length; i++) {
			if (form3.q_19_3[i].checked == true) {
				q_19[2] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_4.length; i++) {
			if (form3.q_19_4[i].checked == true) {
				q_19[3] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_5.length; i++) {
			if (form3.q_19_5[i].checked == true) {
				q_19[4] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_6.length; i++) {
			if (form3.q_19_6[i].checked == true) {
				q_19[5] = i + 1
			}
		}
		for (var i = 1; i < form3.q_19_7.length; i++) {
			if (form3.q_19_7[i].checked == true) {
				q_19[6] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_1.length; i++) {
			if (form3.q_20_1[i].checked == true) {
				q_20[0] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_2.length; i++) {
			if (form3.q_20_2[i].checked == true) {
				q_20[1] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_3.length; i++) {
			if (form3.q_20_3[i].checked == true) {
				q_20[2] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_4.length; i++) {
			if (form3.q_20_4[i].checked == true) {
				q_20[3] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_5.length; i++) {
			if (form3.q_20_5[i].checked == true) {
				q_20[4] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_6.length; i++) {
			if (form3.q_20_6[i].checked == true) {
				q_20[5] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_7.length; i++) {
			if (form3.q_20_7[i].checked == true) {
				q_20[6] = i + 1
			}
		}
		for (var i = 1; i < form3.q_20_1.length; i++) {
			if (form3.q_20_1[i].checked == true) {
				q_20[0] = i + 1
			}
		}
		for (var i = 1; i < form3.q_21_2.length; i++) {
			if (form3.q_21_2[i].checked == true) {
				q_21[1] = i + 1
			}
		}
		for (var i = 1; i < form3.q_21_3.length; i++) {
			if (form3.q_21_3[i].checked == true) {
				q_21[2] = i + 1
			}
		}
		for (var i = 1; i < form3.q_21_4.length; i++) {
			if (form3.q_21_4[i].checked == true) {
				q_21[3] = i + 1
			}
		}
		for (var i = 1; i < form3.q_21_5.length; i++) {
			if (form3.q_21_5[i].checked == true) {
				q_21[4] = i + 1
			}
		}
		for (var i = 1; i < form3.q_21_6.length; i++) {
			if (form3.q_21_6[i].checked == true) {
				q_21[5] = i + 1
			}
		}
		for (var i = 1; i < form3.q_21_7.length; i++) {
			if (form3.q_21_7[i].checked == true) {
				q_21[6] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_1.length; i++) {
			if (form3.q_22_1[i].checked == true) {
				q_22[0] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_2.length; i++) {
			if (form3.q_22_2[i].checked == true) {
				q_22[1] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_3.length; i++) {
			if (form3.q_22_3[i].checked == true) {
				q_22[2] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_4.length; i++) {
			if (form3.q_22_4[i].checked == true) {
				q_22[3] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_5.length; i++) {
			if (form3.q_22_5[i].checked == true) {
				q_22[4] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_6.length; i++) {
			if (form3.q_22_6[i].checked == true) {
				q_22[5] = i + 1
			}
		}
		for (var i = 1; i < form3.q_22_7.length; i++) {
			if (form3.q_22_7[i].checked == true) {
				q_22[6] = i + 1
			}
		}

		for (i = 0; i < 18; i++) {
			if (q_[i] == "1") {
				A = A + 1;
			} else if (q_[i] == "2") {
				B = B + 1;
			} else if (q_[i] == "3") {
				C = C + 1;
			} else {
				D = D + 1;
			}
		}

		for (i = 0; i < 7; i++) {
			if (q_19[i] == "1") {
				A = A + 1;
			} else if (q_19[i] == "2") {
				A = A + 0.5;
			}
		}

		for (i = 0; i < 7; i++) {
			if (q_20[i] == "1") {
				B = B + 1;
			} else if (q_20[i] == "2") {
				B = B + 0.5;
			}
		}
		for (i = 0; i < 7; i++) {
			if (q_21[i] == "1") {
				C = C + 1;
			} else if (q_21[i] == "2") {
				C = C + 0.5;
			}
		}
		for (i = 0; i < 7; i++) {
			if (q_22[i] == "1") {
				D = D + 1;
			} else if (q_22[i] == "2") {
				D = D + 0.5;
			}
		}

		var A_1 = 0.6974999 * A;
		var B_1 = 0.8869992 * B;
		var C_1 = 1.290515 * C;
		var Q_1 = (A_1 + B_1 + C_1) - 12.01769;

		var A_2 = 1.1332329 * A;
		var B_2 = 0.846998 * B;
		var C_2 = 1.025936 * C;
		var Q_2 = (A_2 + B_2 + C_2) - 12.26834;

		var A_3 = 0.6957379 * A;
		var B_3 = 1.154492 * B;
		var C_3 = 1.025936 * C;
		var Q_3 = (A_3 + B_3 + C_3) - 12.77419;

		if (D > A && D > B && D > C && Q_3 > Q_2 && Q_3 > Q_1) {
			document.location.href = "taeyangini.jsp?uno=" + <%= uno %>;
		} else if (Q_2 > Q_1 && Q_2 > Q_3) {
			document.location.href = "taeeumini.jsp?uno=" + <%= uno %>;
		} else if (Q_3 > Q_1 && Q_3 > Q_2) {
			document.location.href = "soeumini.jsp?uno=" + <%= uno %>;
		} else if (Q_1 > Q_2 && Q_1 > Q_3) {
			document.location.href = "soyangini.jsp?uno=" + <%= uno %>;
		}

	}
</script>
	<table border="0" style="margin-left: 10px">
		<tr>
			<td width="150px"></td>
			<td valign="top"><h2>
					<img src="../image/../image/write.jpg" style="width: 50px;">체질검사
				</h2></td>
		</tr>
	</table>
	<form name="form3" id="form3" method="post" action="join_procces.asp">
		<section id="section1">
			<table width="1100" border="0" class="first">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">1. 당신의 체격은 다음 중 어디 해당합니까?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_1" type="radio" class="check" value="1" onclick="goToScroll('a')"> 허리와 배가 발달되고 상체가 약한 편이다.<br> 
						<input name="q_1" type="radio" class="check" value="2" onclick="goToScroll('a')"> 상체보다 골반, 다리 하체가 발달되었다.<br> 
						<input name="q_1" type="radio" class="check" value="3" onclick="goToScroll('a')"> 가슴이 발달되고 허리 아래부분이 빈약한 편이다.<br> 
						<input name="q_1" type="radio" class="check" value="4" onclick="goToScroll('a')"> 두부(머리)와 목덜미가 발달되고 허리부분이 약하다</td>
				</tr>
			</table>
		</section>
		<section id="section2">
			<table width="1100" border="0" class="a">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">2. 전체적인 외모와 골격은 다음 중 어디에 해당됩니까?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_2" type="radio" class="check" value="1" onclick="goToScroll('b')"> 골격이 굵고 살이 찐 편이다.<br>
						<input name="q_2" type="radio" class="check" value="2" onclick="goToScroll('b')"> 골격이 작고 균형이 잡혀있다.<br> 
						<input name="q_2" type="radio" class="check" value="3" onclick="goToScroll('b')"> 보통이며 다부진 체격이다.<br> 
						<input name="q_2" type="radio" class="check" value="4" onclick="goToScroll('b')"> 키가 크고 몸은 수척한 편이다.
					</td>
				</tr>
			</table>
		</section>
		<section id="section3">
			<table width="1100" border="0" class="b">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">3. 당신의 몸에서 외관상 가장 발달된 부분은?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
					<input name="q_3" type="radio" class="check" value="1" onclick="goToScroll('c')"> 허리와 옆구리<br> 
					<input name="q_3" type="radio" class="check" value="2" onclick="goToScroll('c')"> 엉덩이<br>
					<input name="q_3" type="radio" class="check" value="3" onclick="goToScroll('c')"> 가슴<br>
					<input name="q_3" type="radio" class="check" value="4" onclick="goToScroll('c')"> 머리</td>
				</tr>
			</table>
		</section>
		<section id="section4">
			<table width="1100" border="0" class="c">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">4. 당신의 걸음걸이는 다음중 어디에 해당됩니까?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_4" type="radio" class="check" value="1" onclick="goToScroll('d')"> 걸음이 느리고 무게 있게 걷는다.<br>
						<input name="q_4" type="radio" class="check" value="2" onclick="goToScroll('d')"> 걸음걸이가 자연스럽고 얌전하다.<br> 
						<input name="q_4" type="radio" class="check" value="3" onclick="goToScroll('d')"> 걸음이 빠르고 몸을 흔든다.<br> 
						<input name="q_4" type="radio" class="check" value="4" onclick="goToScroll('d')"> 걸음걸이가 꼿꼿하다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section5">
			<table width="1100" border="0" class="d">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">5. 당신은 다음 중 어디에 해당합니까?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_5" type="radio" class="check" value="1" onclick="goToScroll('e')"> 평소에 땀이 많고 땀을 흘리면 오히려 상쾌하다.<br> 
						<input name="q_5" type="radio" class="check" value="2" onclick="goToScroll('e')"> 평소에 땀이 많지 않고 조금만 땀을 내도 피곤하다.<br> 
						<input name="q_5" type="radio" class="check" value="3" onclick="goToScroll('e')"> 땀을 흘려도 그다지 피곤하지 않다.
					</td>
				</tr>
			</table>
		</section>
		<section id="section6">
			<table width="1100" border="0" class="e">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">6. 당신의 얼굴은 다음 중 어디에 가장 가깝습니까?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_6" type="radio" class="check" value="1" onclick="goToScroll('f')"> 얼굴의 윤곽이 뚜렷하고 의젓하다.<br>
						<input name="q_6" type="radio" class="check" value="2" onclick="goToScroll('f')"> 얼굴이 윤곽이 갸름하고 둥글다.<br> 
						<input name="q_6" type="radio" class="check" value="3" onclick="goToScroll('f')"> 얼굴이 다소 길고 머리가 앞뒤로 나왔다.<br> 
						<input name="q_6" type="radio" class="check" value="4" onclick="goToScroll('f')"> 머리가 크고 정수리가 솟아있다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section7">
			<table width="1100" border="0" class="f">
				<tr>
					<td height="30" colspan="2" class="common1"><font
						color="#FF9900">7. 당신 얼굴의 색깔은?</font></td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_7" type="radio" class="check" value="1" onclick="goToScroll('g')"> 갈색 혹은 검은빛이다.<br>
						<input name="q_7" type="radio" class="check" value="2" onclick="goToScroll('g')"> 황색이다.<br> 
						<input name="q_7" type="radio" class="check" value="3" onclick="goToScroll('g')"> 흰색 또는 붉은 빛이 돈다.<br> 
						<input name="q_7" type="radio" class="check" value="4" onclick="goToScroll('g')"> 흰편이다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section8">
			<table width="1100" border="0" class="g">
				<tr>
					<td height="30" colspan="2" class="common1"><font
						color="#FF9900">8. 당신의 얼굴은 다음 중 어디에 해당되는가?</font></td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_8" type="radio" class="check" value="1" onclick="goToScroll('h')"> 이목구비가 크고 입술이 두텁다.<br>
						<input name="q_8" type="radio" class="check" value="2" onclick="goToScroll('h')"> 눈, 코, 입이 작고 셈세한 편이다.<br> 
						<input name="q_8" type="radio" class="check" value="3" onclick="goToScroll('h')"> 입이 크지 않고 턱이 뾰족한 편이고 입술이 얇다.<br>
						<input name="q_8" type="radio" class="check" value="4" onclick="goToScroll('h')"> 이마가 넓고 광대뼈가 나와 있다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section9">
			<table width="1100" border="0" class="h">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">9. 당신의 눈빛은 다음 중 어디에 가장 가까운가?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_9" type="radio" class="check" value="1" onclick="goToScroll('i')"> 눈빛이 밝지 않고 침침하다.<br>
						<input name="q_9" type="radio" class="check" value="2" onclick="goToScroll('i')"> 눈빛이 순하고 눈웃음을 잘 짓는다.<br> 
						<input name="q_9" type="radio" class="check" value="3" onclick="goToScroll('i')"> 눈빛이 반사적이고 예리하다.<br> 
						<input name="q_9" type="radio" class="check" value="4" onclick="goToScroll('i')"> 눈에서 빛이 난다.<br></td>
				</tr>
			</table>
		</section>
		<section id="section10">
			<table width="1100" border="0" class="i">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">10. 당신의 가슴은?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_10" type="radio" class="check" value="1" onclick="goToScroll('j')"> 살이 찌고 넓고 잘 발달되었다.(비만형)<br> 
						<input name="q_10" type="radio" class="check" value="2" onclick="goToScroll('j')"> 빈약하고 구부정하다.(세장형)<br> 
						<input name="q_10" type="radio" class="check" value="3" onclick="goToScroll('j')"> 근육이 많고 넓고 튼튼한 편이다.(근육형)<br> 
						<input name="q_10" type="radio" class="check" value="4" onclick="goToScroll('j')"> 가슴이 벌어지고 견실하다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section11">
			<table width="1100" border="0" class="j">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">11. 당신의 손과 발은?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_11" type="radio" class="check" value="1" onclick="goToScroll('k')"> 손발이 따뜻하나 겨울에 잘 튼다.<br> 
						<input name="q_11" type="radio" class="check" value="2" onclick="goToScroll('k')"> 손발이 차고 겨울에 잘 트지 않는다.<br> 
						<input name="q_11" type="radio" class="check" value="3" onclick="goToScroll('k')"> 손발이 따뜻한 편이다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section12">
			<table width="1100" border="0" class="k">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">12. 당신의 피부는?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_12" type="radio" class="check" value="1" onclick="goToScroll('l')"> 두텁고 땀구멍이 크다.<br> 
						<input name="q_12" type="radio" class="check" value="2" onclick="goToScroll('l')"> 부드럽고 땀구멍이 적다.<br> 
						<input name="q_12" type="radio" class="check" value="3" onclick="goToScroll('l')"> 희고 마른 편이다.<br>
						<input name="q_12" type="radio" class="check" value="4" onclick="goToScroll('l')"> 부드럽고 마른편이다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section13">
			<table width="1100" border="0" class="l">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">13. 당신의 음성은 다음 중 어디에 해당됩니까?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_13" type="radio" class="check" value="1" onclick="goToScroll('m')"> 음성이 무겁고 부드럽다.<br> 
						<input name="q_13" type="radio" class="check" value="2" onclick="goToScroll('m')"> 조용한 편이다.<br> 
						<input name="q_13" type="radio" class="check" value="3" onclick="goToScroll('m')"> 카랑카랑하다. <br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section14">
			<table width="1100" border="0" class="m">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">14. 말할때 평소 습관은?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_14" type="radio" class="check" value="1" onclick="goToScroll('n')"> 말수가 적고 간혹 더듬기도 한다.<br> 
						<input name="q_14" type="radio" class="check" value="2" onclick="goToScroll('n')"> 말이 많지 않으나 가까운 사이와는 말을 많이 하는 편이다.<br> 
						<input name="q_14" type="radio" class="check" value="3" onclick="goToScroll('n')"> 말이 많고 말을 먼저 하는 편이다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section15">
			<table width="1100" border="0" class="n">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">15. 당신의 대변상태는 다음 중 어디에 해당되는가?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_15" type="radio" class="check" value="1" onclick="goToScroll('o')"> 변비가 자주 오는 편이다.<br> 
						<input name="q_15" type="radio" class="check" value="2" onclick="goToScroll('o')"> 대개는 대변이 무르고 간혹 변비가 있어도 그다지 불쾌감은 없다.<br> 
						<input name="q_15" type="radio" class="check" value="3" onclick="goToScroll('o')"> 약간의 변비만 있어도 고통스럽다.<br> 
						<input name="q_15" type="radio" class="check" value="4" onclick="goToScroll('o')"> 대변이 부드럽고 양이 많다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section16">
			<table width="1100" border="0" class="o">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">16. 평소 건강할 때 자주 느끼는 증상으로 어떠한 것이 있는가?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_16" type="radio" class="check" value="1" onclick="goToScroll('p')"> 가슴이 두근거리거나 눈이 쉽게 피로하거나 아프다.<br> 
						<input name="q_16" type="radio" class="check" value="2" onclick="goToScroll('p')"> 한숨을 잘 쉬거나 팔다리가 떨리거나 쥐가 잘 난다.<br>
						<input name="q_16" type="radio" class="check" value="3" onclick="goToScroll('p')"> 건망증이 있다.<br> 
						<input name="q_16" type="radio" class="check" value="4" onclick="goToScroll('p')"> 가슴이 답답하고 막힌 듯하거나 다리에 힘이 없어 오래 걷지 못한다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section17">
			<table width="1100" border="0" class="p">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">17. 평소에 잘 나타나는 병증으로 어떠한 증세가 있는가?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_17" type="radio" class="check" value="1" onclick="goToScroll('q')"> 가슴이 뛴다. 감기, 변비, 눈병, 설사, 갈증.<br> 
						<input name="q_17" type="radio" class="check" value="2" onclick="goToScroll('q')"> 소화이상, 신경예민, 설사, 요통, 팔다리에 힘이 없다.<br>
						<input name="q_17" type="radio" class="check" value="3" onclick="goToScroll('q')"> 변비, 건망증, 구역감, 코피<br> 
						<input name="q_17" type="radio" class="check" value="4" onclick="goToScroll('q')"> 요통, 하지무력, 목에 이상감각<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section18">
			<table width="1100" border="0" class="q">
				<tr>
					<td height="30" colspan="2" class="common1">
						<font color="#FF9900">18. 음식물에 대한 당신의 기호는?</font>
					</td>
				</tr>
				<tr>
					<td width="14">&nbsp;</td>
					<td width="586" valign="top" class="common1">
						<input name="q_18" type="radio" class="check" value="1" onclick="goToScroll('r')"> 따뜻한 음식을 좋아한다.<br> 
						<input name="q_18" type="radio" class="check" value="2" onclick="goToScroll('r')"> 뜨거운 음식을 좋아한다.<br> 
						<input name="q_18" type="radio" class="check" value="3" onclick="goToScroll('r')"> 찬음식을 좋아한다.<br>
						<input name="q_18" type="radio" class="check" value="4" onclick="goToScroll('r')"> 시원한 음식을 좋아한다.<br>
					</td>
				</tr>
			</table>
		</section>
		<section id="section19">
			<table width="1100" border="1" cellpadding="1" cellspacing="1" bordercolor="#DBDBDB" class="r">
				<tr>
					<td height="30" class="common1" colspan="4" align="center">
						<font color="#006600"><strong>19번~22번은 그렇다, 보통이다, 아니다에서 골라서 표기해 주십시오.</strong></font>
					</td>
				</tr>
				<tr bgcolor="#F3F3F3">
					<td width="410" height="30" class="common1"><font color="#FF9900">19번</font></td>
					<td width="60" align="center" class="common1">그렇다</td>
					<td width="60" align="center" class="common1">보통</td>
					<td width="60" align="center" class="common1">아니다</td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td width="410">① 과묵하고 신중한 편이다.</td>
					<td width="60" align="center"><input name="q_19_1" id="q_19_1" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_1" id="q_19_1" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_1" id="q_19_1" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td width="410">② 밖의 일보다 집안일이나 개인적인 일을 더 중요시한다.</td>
					<td width="60" align="center"><input name="q_19_2" id="q_19_2" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_2" id="q_19_2" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_2" id="q_19_2" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td width="410">③ 자기의 의견을 끝까지 관철시키는 편이며 고집이 세다.</td>
					<td width="60" align="center"><input name="q_19_3" id="q_19_3" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_3" id="q_19_3" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_3" id="q_19_3" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td width="410">④ 인내심이 많다.</td>
					<td width="60" align="center"><input name="q_19_4" id="q_19_4" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_4" id="q_19_4" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_4" id="q_19_4" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td width="410">⑤ 평소 점찮은 편이나 음흉한 면도 있다.</td>
					<td width="60" align="center"><input name="q_19_5" id="q_19_5" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_5" id="q_19_5" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_5" id="q_19_5" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td>⑥ 욕심이 많다.</td>
					<td width="60" align="center"><input name="q_19_6" id="q_19_6" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_6" id="q_19_6" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_6" id="q_19_6" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('s')">
					<td>⑦ 노력형이다.</td>
					<td width="60" align="center"><input name="q_19_7" id="q_19_7" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_19_7" id="q_19_7" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_19_7" id="q_19_7" type="radio" class="check" value="3"></td>
				</tr>
			</table>
		</section>
		<section id="section20">
			<table width="1100" border="1" cellpadding="1" cellspacing="1" bordercolor="#DBDBDB" class="s">
				<tr bgcolor="#F3F3F3" onclick="GoToScroll('t')">
					<td width="410" height="30" class="common1"><font color="#FF9900">20번</font></td>
					<td width="60" align="center" class="common1">그렇다</td>
					<td width="60" align="center" class="common1">보통</td>
					<td width="60" align="center" class="common1">아니다</td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td width="410">① 꼼꼼한 편이다.</td>
					<td width="60" align="center"><input name="q_20_1" id="q_20_1" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_1" id="q_20_1" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_1" id="q_20_1" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td width="410">② 개인주의 내지 이기주의가 강한 편이다.</td>
					<td width="60" align="center"><input name="q_20_2" id="q_20_2" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_2" id="q_20_2" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_2" id="q_20_2" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td width="410">③ 몸을 움직이는 일보다 앉아서 하는 일이 마음에 든다.</td>
					<td width="60" align="center"><input name="q_20_3" id="q_20_3" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_3" id="q_20_3" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_3" id="q_20_3" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td width="410">④ 남성적인 면에 비해 여성적인 면이 많은 것 같다.</td>
					<td width="60" align="center"><input name="q_20_4" id="q_20_4" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_4" id="q_20_4" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_4" id="q_20_4" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td width="410">⑤ 내성적이고 수줍음이 많아 많은 사람들 앞에 나서기 어렵다.</td>
					<td width="60" align="center"><input name="q_20_5" id="q_20_5" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_5" id="q_20_5" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_5" id="q_20_5" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td>⑥ 한번 감정이 상하면 좀처럼 잘 풀리지 않는다.</td>
					<td width="60" align="center"><input name="q_20_6" id="q_20_6" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_6" id="q_20_6" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_6" id="q_20_6" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('t')">
					<td>⑦ 남이 자기일에 간섭하는 것을 아주 싫어한다.</td>
					<td width="60" align="center"><input name="q_20_7" id="q_20_7" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_20_7" id="q_20_7" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_20_7" id="q_20_7" type="radio" class="check" value="3"></td>
				</tr>
			</table>
		</section>
		<section id="section21">
			<table width="1100" border="1" cellpadding="1" cellspacing="1" bordercolor="#DBDBDB" class="t">
				<tr bgcolor="#F3F3F3" onclick="GoToScroll('u')">
					<td width="410" height="30" class="common1"><font color="#FF9900">21번</font></td>
					<td width="60" align="center" class="common1">그렇다</td>
					<td width="60" align="center" class="common1">보통</td>
					<td width="60" align="center" class="common1">아니다</td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td width="410">① 솔직담백하다.</td>
					<td width="60" align="center"><input name="q_21_1" id="q_21_1" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_1" id="q_21_1" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_1" id="q_21_1" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td width="410">② 시작은 잘하나 마무리가 부족하다.</td>
					<td width="60" align="center"><input name="q_21_2" id="q_21_2" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_2" id="q_21_2" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_2" id="q_21_2" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td width="410">③ 외부일에 치중하여 나 자신과 가정에 대해서는 소홀한 편이다.</td>
					<td width="60" align="center"><input name="q_21_3" id="q_21_3" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_3" id="q_21_3" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_3" id="q_21_3" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td width="410">④ 봉사정신이 많다.</td>
					<td width="60" align="center"><input name="q_21_4" id="q_21_4" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_4" id="q_21_4" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_4" id="q_21_4" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td width="410">⑤ 사무에 밝고 일처리가 신속하다.</td>
					<td width="60" align="center"><input name="q_21_5" id="q_21_5" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_5" id="q_21_5" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_5" id="q_21_5" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td>⑥ 남의 잘못을 따지기 좋아한다.</td>
					<td width="60" align="center"><input name="q_21_6" id="q_21_6" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_6" id="q_21_6" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_6" id="q_21_6" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('u')">
					<td>⑦ 성격이 급하며 실증을 잘 느끼고 체념을 잘 한다.</td>
					<td width="60" align="center"><input name="q_21_7" id="q_21_7" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_21_7" id="q_21_7" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_21_7" id="q_21_7" type="radio" class="check" value="3"></td>
				</tr>
			</table>
		</section>
		<section id="section22">
			<table width="1100" border="1" cellpadding="1" cellspacing="1" bordercolor="#DBDBDB" class="u">
				<tr bgcolor="#F3F3F3">
					<td width="410" height="30" class="common1"><font color="#FF9900">22번</font></td>
					<td width="60" align="center" class="common1">그렇다</td>
					<td width="60" align="center" class="common1">보통</td>
					<td width="60" align="center" class="common1">아니다</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="410">① 적극적이고 모든 일에 거침없이 행동한다.</td>
					<td width="60" align="center"><input name="q_22_1" id="q_22_1" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_1" id="q_22_1" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_1" id="q_22_1" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="410">② 여성적이기보다 남성적인 면이 많다.</td>
					<td width="60" align="center"><input name="q_22_2" id="q_22_2" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_2" id="q_22_2" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_2" id="q_22_2" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="410">③ 창의력이 있다.</td>
					<td width="60" align="center"><input name="q_22_3" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_3" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_3" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="410">④ 과단성이 있다.</td>
					<td width="60" align="center"><input name="q_22_4" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_4" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_4" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width="410">⑤ 일이 뜻대로 되지 않으면 참기 힘들 정도로 화가 난다.</td>
					<td width="60" align="center"><input name="q_22_5" id="q_22_5" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_5" id="q_22_5" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_5" id="q_22_5" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td>⑥ 자신이 한 일에 대해 후회하는 일이 거의 없다.</td>
					<td width="60" align="center"><input name="q_22_6" id="q_22_6" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_6" id="q_22_6" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_6" id="q_22_6" type="radio" class="check" value="3"></td>
				</tr>
				<tr bgcolor="#FFFFFF" onclick="GoToScroll('v')">
					<td>⑦ 영웅심 및 자존심이 강하다.</td>
					<td width="60" align="center"><input name="q_22_7" id="q_22_7" type="radio" class="check" value="1"></td>
					<td width="60" align="center"><input name="q_22_7" id="q_22_7" type="radio" class="check" value="2"></td>
					<td width="60" align="center"><input name="q_22_7" id="q_22_7" type="radio" class="check" value="3"></td>
				</tr>
				<tr>
			</table>
			
		</section>
			<div align="center" class="v">
				<input type="button" onclick="go_insert();" value="결과보기" id="result">&emsp;
				<a href="test2.jsp"><input type="button" value="다시입력" id="reset"></a>
			</div>
	</form>
</body>
</html>