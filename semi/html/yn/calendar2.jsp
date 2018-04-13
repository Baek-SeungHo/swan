<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<link href="calendar2/calendarorganizer.min.css" rel="stylesheet">
</head>
<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="/semi/index.html"><span class="logo_colour">Swan</span></a>
					</h1>
				</div>
				
			</div>
			<div id="menubar">
				<ul id="menu">
					<li><a href="/semi/html/ij/examples.html">운동정보</a></li>
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
						<h4>관리자님 환영합니다</h4>
						<a href="/semi/html/yn/another_page.html">마이페이지</a>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<ul>
							<li><a href="#">회원정보수정</a></li>
							<li><a href="#">운동기록</a></li>
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
				<h2>운동계획표</h2>

				<div id="calendarContainer" align="center"></div>
				<div id="organizerContainer" align="center"></div>

				<script src="calendar2/calendarorganizer.min.js"></script>
				<script>
					"use strict";

					// function that creates dummy data for demonstration
					function createDummyData() {
						var yy = 2018;
						var mm = 4;
						var dd = 11;

						var date = new Date();
						var data = {
							2018 : {
								4 : {
									11 : [ {
										startTime : "00:00",
										endTime : "24:00",
										text : "Christmas"
									} ]
								}
							}
						}
						return data;
					}

					// creating the dummy static data
					var data = createDummyData();

					// initializing a new calendar object, that will use an html container to create itself
					var calendar = new Calendar("calendarContainer", // id of html container for calendar
					"small", // size of calendar, can be small | medium | large
					[ "Sunday", // left most day of calendar labels
					7 // maximum length of the calendar labels
					], [ "rgb(210,210,210)", // primary color
					"rgb(195,195,195)", // primary dark color
					"#ffffff", // text color
					"#ffecb3" // text dark color
					]);

					// initializing a new organizer object, that will use an html container to create itself
					var organizer = new Organizer("organizerContainer", // id of html container for calendar
					calendar, // defining the calendar that the organizer is related to
					data // giving the organizer the static data that should be displayed
					);
				</script>

			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.html">메인</a> | <a
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