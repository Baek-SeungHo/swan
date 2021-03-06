
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.model.vo.User, exeinfo.model.vo.ExeInfo" %>
<%@ page import="java.util.Date"%>

<%
	ExeInfo exeinfo = (ExeInfo)request.getAttribute("exeinfo");
	User loginUser = (User)session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"></script>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/semi/html/yn/calendar2/jquery.number.min.js"></script>
<style type="text/css">

.graph {
  position: relative;
  width: 150px;
  height: 150px;
}

.graph svg {
  width: 100%;
  height: 100%;
}

.graph svg text {
  font-family: helvetica;
  font-weight: bold;
  font-size: 1.5em;
  fill: #AEB8B8;
}

.graph svg .background {
  fill: #264A60;
}

.graph svg .visual {
  fill: #EFC100;
}

table
{ margin: 10px 0 30px 0;
  border: 1px solid rgb(127,127,127);
  border-spacing:0px; padding:0; border:0; border-collapse:collapse;
  }

table tr th, table tr td
{ background: #FFF;
  color: rgb(127,127,127);
  border: 1px solid rgb(127,127,127);
  border-spacing:0px; padding:0; border:0; border-collapse:collapse;}
  
table tr td
{ background: #FFF;
  color: rgb(127,127,127);
  border: 1px solid rgb(127,127,127);
  border-spacing:0px; padding:0; border:0; border-collapse:collapse;}
  
#days {
  font-size: 23px;
}  

#days2 {
  font-size: 23px;
  color: rgb(29,182,235);
}

#days3 {
  font-size: 45px;
  color: rgb(29,182,235);
  padding-left: 13pt;
}
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

(function count(){
	
	var startdate= new Date("<%= exeinfo.getUserStartdate() %>");
	
	console.log("출력" + "<%= exeinfo.getUserStartdate() %>");
	
	var enddate = new Date("<%= exeinfo.getUserEnddate() %>");
	
	console.log("출력" + "<%= exeinfo.getUserEnddate() %>");
	
	var syear = startdate.getFullYear();
	var smonth = startdate.getMonth()+1;
	var sday = startdate.getDate();
	
	var eyear = enddate.getFullYear();
	var emonth = enddate.getMonth()+1;
	var eday = enddate.getDate();
	
	console.log(syear);
	console.log(smonth);
	console.log(sday);
	
	startdate.setMonth(smonth-1);
	startdate.setDate(sday);
	
	enddate.setMonth(emonth-1);
	enddate.setDate(eday);
	
	var ms = enddate.getTime() - startdate.getTime();
	
	var days = ms/(24*60*60*1000);
	
	days = Math.ceil(days)+1;
	
	$(document).ready(function(){ $("#days").append(days+"일") });
	
}('days'));

(function count2(){
	
	var enddate = new Date("<%= exeinfo.getUserEnddate() %>");
	
	console.log("출력" + "<%= exeinfo.getUserEnddate() %>");
	
	var now = new Date();
	
	var eyear = enddate.getFullYear();
	var emonth = enddate.getMonth()+1;
	var eday = enddate.getDate();
	
	var nyear = now.getFullYear();
	var nmonth = now.getMonth()+1;
	var nday = now.getDate();
	
	enddate.setMonth(emonth-1);
	enddate.setDate(eday);
	
	now.setMonth(nmonth-1);
	now.setDate(nday);
	
	var ms2 = enddate.getTime() - now.getTime();
	
	var days2 = ms2/(24*60*60*1000);
	
	days2 = Math.ceil(days2);
	
	$(document).ready(function(){ $("#days2").append(days2+"일") });
	
}('days2'));



google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'day');
      data.addColumn('number', 'kg');

      data.addRows([
        [0, 75],  [1, 75],  [2, 74],  [3, 73],  [4, 72],  [5, 73],
        [6, 73],  [7, 75],  [8, 74],  [9, 73],  [10, 74], [11, 72],
        [12, 70], [13, 70], [14, 72], [15, 70], [16, 72], [17, 70],
        [18, 72], [19, 70], [20, 72], [21, 71], [22, 70], [23, 70],
        [24, 69], [25, 68], [26, 69], [27, 70], [28, 70], [29, 71],
        [30, 70], [31, 68], [32, 69], [33, 68], [34, 67], [35, 65],
        [36, 67], [37, 68], [38, 65], [39, 66], [40, 65], [41, 65],
        [42, 65], [43, 66], [44, 67], [45, 69], [46, 69], [47, 70],
        [48, 69], [49, 68], [50, 68], [51, 67], [52, 67], [53, 68],
        [54, 69], [55, 68], [56, 67], [57, 66], [58, 67], [59, 66],
        [60, 64], [61, 66], [62, 65], [63, 64], [64, 64], [65, 63],
        [66, 63], [67, 64], [68, 63], [69, 63]
      ]);

      var options = {
        hAxis: {
          title: '일수'
        },
        vAxis: {
          title: '몸무게'
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    
    
</script>
</head>
<body>
<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="/semi/index.jsp"><span class="logo_colour">Swan</span></a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<li><a href="/semi/html/ij/boardlistview.jsp">운동정보</a></li>
					<li><a href="/semi/html/jh/sikdanInfo.jsp">식단정보</a></li>
					<li><a href="/semi/html/sh/contact.jsp">고객센터</a></li>
					<%
						if (loginUser != null) {
							if (loginUser.getAdministrator().equals("Y")) {
					%>
					<li><a href="/semi/html/jh/userManagement.jsp">회원관리</a></li>
					<%
						}
						}
					%>
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<!-- insert your sidebar items here -->
						<h4><%=loginUser.getUserName()%>님 환영합니다
						</h4>
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>&nbsp;&nbsp;&nbsp;
						<a href="/semi/ulogout"><input type="button" value="로그아웃"></a>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Memu</h3>
						<ul>
							<li><a href="/semi/udetail?userid=<%= loginUser.getUserId() %>">회원정보수정</a></li>
							<li><a href="/semi/html/yn/input.jsp">운동기록</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<!-- <div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>검색</h3>
						<form method="post" action="#" id="search_form">
							<p>
								<input class="search" type="text" name="search_field"
									value="Enter keywords....." /> <input name="search"
									type="image" style="border: 0; margin: 0 0 -9px 5px;"
									src="style/search.png" alt="Search" title="Search" />
							</p>
						</form>
					</div>
					<div class="sidebar_base"></div> -->
				</div>
			</div>
			<!--내용-->			
			<div id="content">
			<div id="myinfo2" class="4u" style="border: 4px solid rgb(242,242,242); width: 250px; height: 350px; padding: 8pt; margin: 4pt; float: left;">
			<h2 style="text-align:center; font-weight:bold;">시작세부 정보 및 목표</h2>	
			<hr>
			<table style="margin-left:15pt;">
			<tr><th width="150">시작 날짜</th><th width="80">시작체중</th></tr>
			<tr><td><font size="5"><%= exeinfo.getUserStartdate() %></font></td><td align="right"><font size="5"><%= exeinfo.getUserWeight() %>kg</font></td></tr>
			</table>
			
			<table style="border: 1px solid #FFF; margin-left:15pt;">
			<tr><th width="150">신장</th><th width="80">BMI</th></tr>
			<tr><td><font size="5" style="color: rgb(29,182,235);"><%= exeinfo.getUserHeight() %>cm</font></td><td><font size="5" style="color: rgb(29,182,235);"><%= exeinfo.getUserBmi() %></font></td></tr>
			</table>
			
			<table style="margin-left:15pt;">
			<tr><th width="150">목표체중</th><th width="70">총일수</th></tr>
			<tr><td><font size="5"><%= exeinfo.getUserGoal() %>kg</font></td><td id="days"></td></tr>
			</table>
			
			<table style="border: 1px solid #FFF; margin-left:15pt;">
			<tr><th width="150">목표날짜</th><th width="80">남은일수</th></tr>
			<tr><td><font size="5" style="color: rgb(29,182,235);"><%= exeinfo.getUserEnddate() %></font></td><td id="days2"><font size="5" style="color: rgb(29,182,235);"></font></td></tr>
			</table>
			</div>
			
			
			<div id="myinfo2" class="4u" style="border: 4px solid rgb(242,242,242); width: 200px; height: 350px; padding: 8pt; margin: 4pt; float: left; style:center;">
			<h2 style="text-align:center; font-weight:bold;">목표달성 진행상황</h2>
			<hr>
			<table style="align:center; margin-left: 18pt;"><tr style="center;"><td style="align:center; padding-bottom:20pt; padding-top:10pt;"><div class="graph" style="align:center;"></div></td></tr><tr><td id="days3"></td></tr>
<tr><td style="padding-left: 40pt;">진행율</td></tr></table>
				
			<script type="text/javascript">
function donutGraph(selector, percentage){

    'use strict';

    var height, width, radius, data, color, svg, g, bgArc, visArc, pie, path, vis;

    height = 150;
    width = 150;
    radius = Math.min(width, height) / 2;

    svg = d3.select(selector)
        .append('svg')
        .attr('viewBox', '0 0 ' + width + ' ' + height)
        .attr('preserveAspectRatio', 'none');

    g = svg.append('g')
        .attr('transform', 'translate(' + (width / 2) + ',' + (height / 2) + ')');
  
    g.append('text')
        .text(percentage + '%')
        .attr('alignment-baseline', 'middle')
        .attr('text-anchor', 'middle');
  
    bgArc = d3.svg.arc()
        .innerRadius(radius / 1.25)
        .outerRadius(radius)
        .startAngle(0) //converting from degs to radians
        .endAngle(degTOrad(perTOdeg(100))); //just radians

    visArc = d3.svg.arc()
        .innerRadius(radius / 1.18)
        .outerRadius(radius)
        .cornerRadius(20)
        .startAngle(0) //converting from degs to radians
        .endAngle(degTOrad(perTOdeg(percentage))); //just radians

    g.append("path")
        .attr("d", bgArc)
        .attr('class', 'background');

    g.append("path")
        .attr("d", visArc)
        .attr('class', 'visual');

    function perTOdeg(per) {
        'use strict';
        return 360 * per / 100;
    }

    function degTOrad(deg) {
        'use strict';
        return deg * (Math.PI / 180);
    }

}

(function count3(){

var startdate= new Date("<%= exeinfo.getUserStartdate() %>");

var enddate = new Date("<%= exeinfo.getUserEnddate() %>");

var syear = startdate.getFullYear();
var smonth = startdate.getMonth()+1;
var sday = startdate.getDate();

var eyear = enddate.getFullYear();
var emonth = enddate.getMonth()+1;
var eday = enddate.getDate();

startdate.setMonth(smonth-1);
startdate.setDate(sday);

enddate.setMonth(emonth-1);
enddate.setDate(eday);

var ms = enddate.getTime() - startdate.getTime();

var days = ms/(24*60*60*1000);

days = Math.ceil(days);





var enddate = new Date("<%= exeinfo.getUserEnddate() %>");

var now = new Date();

var eyear = enddate.getFullYear();
var emonth = enddate.getMonth()+1;
var eday = enddate.getDate();

var nyear = now.getFullYear();
var nmonth = now.getMonth()+1;
var nday = now.getDate();

enddate.setMonth(emonth-1);
enddate.setDate(eday);

now.setMonth(nmonth-1);
now.setDate(nday);

var ms2 = enddate.getTime() - now.getTime();

var days2 = ms2/(24*60*60*1000);

days2 = Math.ceil(days2);





var per = (100-(days2/days)*100).toFixed(1);

donutGraph('.graph', per);

$(document).ready(function(){ $("#days3").append(per+"%")});



}('per'));

console.log("days 출력되야함: "+days);

</script>

</div>

<div id="myinfo2" class="4u" style="border: 4px solid rgb(242,242,242); width: 490px; height: 250px; padding: 8pt; margin: 4pt; float: left;">
<h2 style="font-weight:bold; padding-left:15pt;">몸무게 변화</h2>
<hr>
			<div id="chart_div"></div>
</div>			
				</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/examples.html">운동정보</a> |
				<a href="/semi/html/jh/page.jsp">식단정보</a> | <a href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>