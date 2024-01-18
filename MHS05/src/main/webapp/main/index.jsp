<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %> 

<%
Calendar now = Calendar.getInstance();
int nowmonth = now.get(Calendar.MONTH) + 1;     // ���ο� ������ ���� �� �ޱ�
int day      = now.get(Calendar.DAY_OF_MONTH);  // ���ο� ������ ���� �� �ޱ�
int curmonth = nowmonth;						// ���� �� �޾Ƽ� for ������ i ���ϰ� ��

String month = request.getParameter("month");   // ���ο��� �� ���� �ϸ� �Ѿ���� �� �ޱ�

if( month == null || month.equals(""))          
{
	// �Ѿ���� ���� null �̰ų� ���̸� ������������ ����
	response.sendRedirect("index.jsp?month=" + nowmonth);
	return;
} else
{
	//���� �ִ� ��� int�� ��ȯ�ؼ� curmonth�� ����
	try
	{
		curmonth = Integer.parseInt(month);
		if(curmonth > 12)
		{
			//��ȯ�� ���� 12���� ū��� ����� ������ ����
			curmonth = nowmonth;
		}
	}catch(Exception e){}
}

String pno = request.getParameter("pno");
if(pno == null || pno.equals("")) pno = "all";

int page_no = 1;
//����¡ 4�ܰ� : �������κ��� ������ ��ȣ�� �޴´�. ex)index.jsp?page=3
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

ListDTO dto = new ListDTO();

//����¡ 1�ܰ�: ��ü �Խù� ������ ��´�.
int totalData = dto.GetMainTotal(month);

//����¡ 2�ܰ� : ��ü ������ ������ ����Ѵ�.
int totalPage = totalData / 10;
if(totalData % 10 != 0)
{
	//10���� ���� �������� 0�� �ƴϸ�
	//��ü ������ ���� ����
	totalPage++;
}



ArrayList<CategoryVO> list = dto.GetMainList(page_no,month,10);
int calNo = 0;

%>
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

<script>
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

// �Լ��� ����Ͽ� ��Ű �� ��������
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

// �˾��� ó�� ���������� Ȯ��

window.onload = function () 
{
	var popup1Shown = getCookie("hd_pops_1");
	var popup2Shown = getCookie("hd_pops_2");
	
	
	if(popup1Shown == null)
	{
		$("#hd_pops_1").css('display', '')
	}
	
	if(popup2Shown == null)
	{
		$("#hd_pops_2").css('display', '')
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
</script>

<div id="hd_pop">
    <div id="hd_pops_1" class="hd_pops" style="top:10px;left: 500px; display: none" >
        <div class="hd_pops_con" style="width:360px;height:550px">
            <a href="https://alv-777.com/" rel="nofollow">
            	<img src="https://image.yes24.com/goods/91120112/XL" title="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" alt="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" />
            </a><br style="clear:both;" />
        </div>
        <div class="hd_pops_footer">
            <button class="hd_pops_reject hd_pops_1 1">
            	<strong>�Ϸ�</strong> ���� �ٽ� �������� �ʽ��ϴ�.
            </button>
            <button class="hd_pops_close hd_pops_1">�ݱ�</button>
        </div>
    </div>
    <div id="hd_pops_2" class="hd_pops" style="top:10px;left: 100px; display: none">
        <div class="hd_pops_con" style="width:360px;height:550px">
            <a href="https://alv-777.com/" rel="nofollow">
            	<img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnaX/image/tiOITrG-dZ54d6L9shegKJBdN0Y.jpg" title="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" alt="84e5429b092ee0c270c5cf22c777ae43_1704525918_2587.png" />
            </a><br style="clear:both;" />
        </div>
        <div class="hd_pops_footer">
            <button class="hd_pops_reject hd_pops_2 1">
            	<strong>�Ϸ�</strong> ���� �ٽ� �������� �ʽ��ϴ�.
            </button>
            <button class="hd_pops_close hd_pops_2">�ݱ�</button>
        </div>
    </div>
</div>


<table border="0" width="1400px" align="center">
	<tr height="50px">
		<td rowspan="5" width="200px">
		</td>				
		<td align="center">
			<p style="font-size: 200%;">
				<b>����� �ǰ��� ���񿡰� �ð� ���ðھ��?</b>
			</p>
		</td>
	</tr>
		
	<tr>
		<td align="center">
			<h2>������ <font color="#4dd5b0">
			<%= nowmonth %></font>�� <font color="#4dd5b0"><%= day %></font>�� �Դϴ�.
			&nbsp;&nbsp;���� ���� ��ö ������ �Ұ��մϴ�</h2>
		</td>
	</tr>
	<tr height="50px">
		<td align="center" style="font-size: 20px; font-weight:bold">
			<%
			for(int i = 1; i <= 12; i++)
			{
				%>
				<a class="month" href="index.jsp?month=<%= i %>&p=all"> 
					<%
					if(curmonth == i) //curmonth ���� i ���� ���� ��� ���� ǥ��  
					{
					%><font color="#4dd5b0"><b><%= i %>��</b></font><%
					} else
					{
					%><%= i %>��
					<%
					}
					%>
				</a>&nbsp;&nbsp;
					<%
			}
			%>
		</td>
	</tr>
		<tr height="50px">
			<td align="center" style="font-size: 20px;">
			<%
			int startBlock2 = ((page_no-1)/10)*10; //���� ��� ������
					startBlock2  += 1;
					int endBlock2 = startBlock2 + 10 - 1; //���� �� ������
					if(endBlock2 > totalPage)
					{
						//���� ��� �������� ��ü ���������� ũ��
						endBlock2 = totalPage;
					}
					
					
			if( page_no > 1)
					{
						%>
						&emsp;<a class="month" href="index.jsp?month=<%= month %>&p=all&page=<%= page_no - 1 %>">��</a>&emsp;
						<%
						
					} else 
					{
						%>
						&emsp;<a class="month">��</a>&emsp;
						<%	
					}
			%>
				<a class="month" href="index.jsp?month=<%= month %>&pno=all&page=<%= page_no %>">
					<% 
					if(pno == null || pno.equals("all"))
					{
						%><font color="#4dd5b0"><b>��ü</b></font><%
					}else
					{
						%>��ü<%
					}
					%>
					</a>&emsp;
			<%
			for(CategoryVO cvo2 : list)
			{
				%><a class="month" href="select.jsp?month=<%= month %>&pno=<%= cvo2.getPno() %>&page=<%= page_no %>">
					<%
					if(pno.equals(cvo2.getPno()))
					{
						%><strong><%= cvo2.getPname() %></strong><%
					} else
					{
						%><%= cvo2.getPname() %><%	
					}
					%>
					</a>&emsp;<%
			}
			%>
			<%
			if( page_no < totalPage)
					{
						%>
						<a href="index.jsp?month=<%= month %>&page=<%= page_no + 1 %>">��</a>&emsp;
						<%
						
					} else
					{
						%>
						<a class="month">��</a>&emsp;
						<%	
					}
			%>
			</td>
		</tr>
		<tr>
			<td colspan="5">
		<table border="0" width="700px" align="center" id="maintable">
		<%
		for(CategoryVO vo : list)
		{
			if(calNo % 5 == 0)
			{
				%><tr><%
			}
			%>
				<td align="center" style="font-size:20px">
					<a href="select.jsp?month=<%= month %>&pno=<%= vo.getPno() %>&page=<%= page_no%>">
					<img style="border-radius:100px; box-shadow: 2px 2px 2px 2px gray;" width="200px" height="200px" 
					src="../category/categoryimagedown.jsp?pno=<%= vo.getPno() %>"><br>
					<%= vo.getPname() %></a><br>
					<%= vo.getMonth_start() %>��~<%= vo.getMonth_end() %>��
				</td>
			<%
			if(calNo % 5 == 4)
			{
				%></tr>
					<tr>
						<td colspan="5">
							<hr>
						</td>
					</tr>
				<%
				calNo = 0;
			}else
			{ 
				calNo++;
			}
		}
			%>
		</table>
		</td>
		</tr>
</table>
<%@ include file="../include/tail.jsp" %> 