<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/*ajax를 통한 게시판 리스트 조회 */
	$(function() {
		$("#bodysearch")
				.change(
						function() {
							$
									.ajax({
										url : "/semi/esearch",
										type : "post",
										data : {
											body : $(
													"#bodysearch > option:selected")
													.text(),
										},
										datatype : "json",
										success : function(data) {
											var jsonstr = JSON.stringify(data);
											var json = JSON.parse(jsonstr);
											var sport = "";

											for ( var i in json.list) {
												sport += "<tr><td>	"
														+ json.list[i].sportbody
														+ "</td><td><a href='/semi//edetail?ecode="
														+ json.list[i].sportcode
														+ "'>"
														+ json.list[i].sportname
														+ "</a></td>"
														+ "<td>"
														+ json.list[i].sportdate
														+ "</td>"
														+ json.list[i].sportlook
														+ "</td></tr>";
											}
											$("#sportlist").append(sport);

										},
										error : function(a, b, c) {
											console.log("error:" + a + b + c)
										}

									});
							$("#sportlist").empty();
						});
		/* 운동명으로 검색 ajax */
		$("#namesearch")
				.click(
						function() {

							var name = $("#sportname").val();

							$
									.ajax({
										url : "/semi/ensearch",
										type : "post",
										data : {
											name : name
										},
										success : function(data) {

											var jsonstr = JSON.stringify(data);
											var json = JSON.parse(jsonstr);
											var sport = "";

											for ( var i in json.list) {
												sport += "<tr><td>	"
														+ json.list[i].sportbody
														+ "</td><td><a href='/semi//edetail?ecode="
														+ json.list[i].sportcode
														+ "'>"
														+ json.list[i].sportname
														+ "</a></td>"
														+ "<td>"
														+ json.list[i].sportdate
														+ "</td>"
														+ json.list[i].sportlook
														+ "</td></tr>";
											}
											$("#sportlist").append(sport);

										},
										error : function(a, b, c) {
											console.log("error:" + a + b + c)
										}
									});
							$("#sportlist").empty();
						});
	});
</script>
<style type="text/css">
body {
	font-family: 'Nunito', sans-serif;
	color: #384047;
}

form {
	max-width: 300px;
	margin: 10px auto;
	padding: 10px 20px;
	background: #f4f7f8;
	border-radius: 8px;
}

h1 {
	margin: 0 0 20px 0;
	text-align: center;
	color: rgb(190, 190, 190);
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"],
	input[type="email"], input[type="number"], input[type="tel"], input[type="time"],
	input[type="url"], textarea, select {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	font-size: 16px;
	height: auto;
	margin: 0;
	outline: 0;
	padding: 10px;
	width: 100%;
	background-color: #e8eeef;
	color: #8a97a0;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 20px;
}

input[type="radio"], input[type="checkbox"] {
	margin: 0 4px 8px 0;
}

select {
	padding: 6px;
	height: 32px;
	border-radius: 2px;
}

button {
	padding: 9px 9px 9px 9px;
	color: #FFF;
	background-color: rgb(200, 200, 200);
	font-size: 14px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 50%;
	border: 1px solid rgb(180, 180, 180);
	border-width: 1px 1px 3px;
	box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
	margin-bottom: 10px;
}

fieldset {
	margin-bottom: 30px;
	border: none;
}

legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 8px;
}

label.light {
	font-weight: 300;
	display: inline;
}

.number {
	background-color: #5fcf80;
	color: #fff;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.2);
	border-radius: 100%;
}

@media screen and (min-width: 480px) {
	table {
		background: white;
		border-radius: 3px;
		border-collapse: collapse;
		height: 100px;
		margin: auto;
		max-width: 600px;
		padding: 5px;
		width: 100%;
		box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
		animation: float 5s infinite;
	}
	th {
		color: #D5DDE5;;
		background: #1b1e24;
		border-bottom: 4px solid #9ea7af;
		border-right: 1px solid #343a45;
		font-size: 23px;
		font-weight: 100;
		padding: 24px;
		text-align: left;
		text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		vertical-align: middle;
	}
	th:first-child {
		border-top-left-radius: 3px;
	}
	th:last-child {
		border-top-right-radius: 3px;
		border-right: none;
	}
	tr {
		border-top: 1px solid #C1C3D1;
		border-bottom-: 1px solid #C1C3D1;
		color: #666B85;
		font-size: 16px;
		font-weight: normal;
		text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
	}
	tr:hover td {
		background: #4E5066;
		color: #FFFFFF;
		border-top: 1px solid #22262e;
	}
	tr:first-child {
		border-top: none;
	}
	tr:last-child {
		border-bottom: none;
	}
	tr:nth-child(odd) td {
		background: #EBEBEB;
	}
	tr:nth-child(odd):hover td {
		background: #4E5066;
	}
	tr:last-child td:first-child {
		border-bottom-left-radius: 3px;
	}
	tr:last-child td:last-child {
		border-bottom-right-radius: 3px;
	}
	td {
		background: #FFFFFF;
		padding: 20px;
		text-align: left;
		vertical-align: middle;
		font-weight: 300;
		font-size: 18px;
		text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
		border-right: 1px solid #C1C3D1;
	}
	td:last-child {
		border-right: 0px;
	}
	th.text-left {
		text-align: left;
	}
	th.text-center {
		text-align: center;
	}
	th.text-right {
		text-align: right;
	}
	td.text-left {
		text-align: left;
	}
	td.text-center {
		text-align: center;
	}
	td.text-right {
		text-align: right;
	}
}
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
					<li><a href="/semi/html/ij/examples.html">운동정보</a></li>
					<li><a href="/semi/html/jh/page.html">식단정보</a></li>
					<li><a href="/semi/html/sh/contact.html">고객센터</a></li>
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
						<h3>메뉴</h3>
						<ul>
							<li><a href="#">몸상태설문조사</a></li>
							<li><a href="#">운동검색기</a></li>
							<li><a href="#">운동스케쥴</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar"></div>
			</div>
			<!--내용-->
			<div id="content">
				<h2 align="center">운동검색기</h2>
				<!--게시판 부위별 /  운동명 검색기능-->
				<select id="bodysearch">
					<option value="">부위선택</option>
					<option value="chest">가슴</option>
					<option value="shoulder">등</option>
					<option value="etc">어깨</option>
					<option value="abs">복근</option>
					<option value="lowerbody">하체</option>
					<option value="Thigh">허벅지</option>
					<option value="Bridge">다리</option>
					<option value="arm">팔</option>
				</select>
				<!--게시판 운동명 검색기능-->
				<input type="text" placeholder="검색어입력" id="sportname"> <input
					type="button" value="검색" id="namesearch">


				<!--게시판 리스트 출력-->
				<table id="sportlist" border="1">
				</table>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/page.html">식단정보</a> | <a
					href="/semi/html/sh/contact.html">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>