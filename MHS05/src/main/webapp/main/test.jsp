<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정입니다.</title>
</head>
<body>
<style>
#hd_pop {z-index:1000;position:relative;height:0}
.hd_pops {position:absolute;border:1px solid #e9e9e9;background:#fff;}
.hd_pops img{max-width:100%}
.hd_pops_footer {padding: 0;background:#000;color:#fff;text-align:left;position:relative;}
.hd_pops_footer:after {display:block;visibility:hidden;clear:both;content:""}
.hd_pops_footer button {padding: 10px;border:0;color:#fff}
.hd_pops_footer .hd_pops_reject{background:#000;text-align:left}
.hd_pops_footer .hd_pops_close{background:#393939;position:absolute;top:0;right:0}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
// 함수를 사용하여 쿠키 설정
function setCookie(name, value, days) 
{
    var expires = "";
    if (days) 
    {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

// 함수를 사용하여 쿠키 값 가져오기
function getCookie(name) 
{
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) 
    {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

// 팝업이 처음 보여졌는지 확인

window.onload = function () 
{
	var popup1Shown = getCookie("hd_pops_1");
	var popup2Shown = getCookie("hd_pops_2");
	

	// 팝업을 처음 보여줄 때
	if (popup1Shown != null) 
	{
	    $("#hd_pops_1").css('display','none');
	}
	
	if (popup2Shown != null) 
	{
	    $("#hd_pops_2").css('display','none');
	}
}

$(function() {
	$(".hd_pops_reject").click(function() {
        var id = $(this).attr('class').split(' ');
        var ck_name = id[1];
        var exp_time = parseInt(id[2]);
        $("#"+id[1]).css("display", "none");
        setCookie(ck_name, 1, exp_time);
    });
	$('.hd_pops_close').click(function() {
        var idb = $(this).attr('class').split(' ');
        $('#'+idb[1]).css('display','none');
    });
    $("#hd").css("z-index", 1000);
});

/*
$(function() {
    $(".hd_pops_reject").click(function() {
        var id = $(this).attr('class').split(' ');
        var ck_name = id[1];
        var exp_time = parseInt(id[2]);
        $("#"+id[1]).css("display", "none");
        set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
    });
    $('.hd_pops_close').click(function() {
        var idb = $(this).attr('class').split(' ');
        $('#'+idb[1]).css('display','none');
    });
    $("#hd").css("z-index", 1000);
});


*/
</script>
<div id="hd_pop">
    <div id="hd_pops_1" class="hd_pops" style="top:10px;left: 500px;">
        <div class="hd_pops_con" style="width:360px;height:550px">
            <a href="https://alv-777.com/" rel="nofollow">
            	<img src="https://image.yes24.com/goods/91120112/XL" title="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" alt="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" />
            </a><br style="clear:both;" />
        </div>
        <div class="hd_pops_footer">
            <button class="hd_pops_reject hd_pops_1 1">
            	<strong>하루</strong> 동안 다시 열람하지 않습니다.
            </button>
            <button class="hd_pops_close hd_pops_1">닫기</button>
        </div>
    </div>
    <div id="hd_pops_2" class="hd_pops" style="top:10px;left: 100px;">
        <div class="hd_pops_con" style="width:360px;height:550px">
            <a href="https://alv-777.com/" rel="nofollow">
            	<img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnaX/image/tiOITrG-dZ54d6L9shegKJBdN0Y.jpg" title="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" alt="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" />
            </a><br style="clear:both;" />
        </div>
        <div class="hd_pops_footer">
            <button class="hd_pops_reject hd_pops_2 1">
            	<strong>하루</strong> 동안 다시 열람하지 않습니다.
            </button>
            <button class="hd_pops_close hd_pops_2">닫기</button>
        </div>
    </div>
</div>
</body>
</html>