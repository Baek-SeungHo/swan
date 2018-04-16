<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="schedule.model.vo.Schedule, java.util.*"%>
<%
	ArrayList<Schedule> list = (ArrayList<Schedule>) request.getAttribute("list");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#sportdate").on(
				"change",
				function() {
					$("#schedule").empty();
					var date = (this.value);
					var grade = $("#grade").val();
					alert(grade);
					alert(date);
					$.ajax({
						url : "/semi/dateserach",
						type : "post",
						data : {
							date : date,
							grade : grade
						},
						datatype : "JSON",
						success : function(data) {
							var jsonstr = JSON.stringify(data);
							var json = JSON.parse(jsonstr);
							var sport = "";

							for ( var i in json.list) {
								sport += "<tr><td>	"
										+ json.list[i].schedulename
										+ "</td><td>"
										+ json.list[i].schedulenurl
										+ "</td><td>"
										+ json.list[i].schedulenum
										+ "개</td></tr>"
							}
							$("#schedule").append(sport);

						}
					});

				});

	});
</script>
<style type="text/css">
</style>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
</head>

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
					<li><a href="/semi/html/jh/sikdan.html">식단정보</a></li>
					<li><a href="/semi/html/sh/contact.jsp">고객센터</a></li>
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
						<%-- <h4><%= loginUser.getUserName() %>님 환영합니다</h4>
						<a href="/semi/exedetail?userid=<%= loginUser.getUserId() %>">마이페이지</a> --%>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>메뉴</h3>
						<ul>
							<li><a href="/semi/html/ij/exercisequestionnaire.jsp">몸상태설문조사</a></li>
							<li><a href="/semi/html/ij/boardlistview.jsp">운동검색기</a></li>
							<li><a href="/semi/html/ij/exerciseschedule.jsp">운동스케쥴</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar"></div>
			</div>
			<!--내용-->
			<div id="content">
				<h2 align="center">오늘의운동스케쥴</h2>
				<input type="date" id="sportdate"> <input type="hidden"
					value="<%=list.get(0).getGrade()%>" id="grade">
				<table border="1" id="schedule">
					<%
						for (Schedule s : list) {
					%>
					<tr>
						<td><%=s.getSchedulename()%></td>
						<td><%=s.getScheduleurl()%></td>
						<td><%=s.getSchedulenum()%>개</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdan.html">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>