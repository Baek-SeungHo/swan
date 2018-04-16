<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<style type="text/css">
</style>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
														+ "</td><td>"
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
		/*글쓰기 주소*/
		$("#wirte").click(function() {

			location.href = "/semi/html/ij/boardinsert.jsp";

		});
	});
</script>
<script type="text/javascript">
	//검색창 자동완성기능
	$(function() {
		var languages = [ "인클라인푸쉬업", '푸쉬업', '디클라인푸쉬업', '아처푸쉬업', '파이크푸쉬업',
				'흰두푸쉬업', '러시안푸쉬업', '한팔푸쉬업', '플라이푸쉬업', '할로우보디플랭크', '백인스텐션',
				'시티드로우', '인버티드로우', '마누스그립풀업', '턱걸이', '익스플로시브풀업', '크런치',
				'사이드크런치', '레그레이즈', '바이시클크런치', '드래곤플래그', '행잉레그레이즈', '스쿼드',
				'와이드스쿼드', '벤드데드리프트', '런지', '박스런지' ];

		$("#sportname").autocomplete({
			source : languages
		});
	});
</script>
<style type="text/css">
table {
	margin: 10px 0 30px 0;
	border-spacing: 0px;
	border-collapse: collapse;
}

table tr th, table tr td {
	background: #fff;
	color: #fff;
	padding: 7px 4px;
	text-align: center;
	font-size: 14px;
}

table tr td {
	background: #fff;
	color: #47433F;
	border: 1px solid #ddd;
}

@import url(https://fonts.googleapis.com/css?family=Oxygen:400,700);

@import url(https://fonts.googleapis.com/css?family=Knewave);

@import url(https://fonts.googleapis.com/css?family=Luckiest+Guy);

.shipping {
	float: left;
	text-align: center;
	width: 300px;
}

.billing {
	float: left;
	width: 100%;
}

h2 {
	color: #0082C5;
	padding: 0px;
	float: left;
}

input {
	background-color: #f2f2f2;
	border: 1px solid #c8c8c8;
	font-family: 'Oxygen', sans-serif;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0px 0px 10px 0px;
	padding: 8px;
}

select {
	background-color: #f2f2f2;
	border: 1px solid #c8c8c8;
	font-family: 'Oxygen', sans-serif;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0px 0px 10px 0px;
	padding: 8px;
	width: 90%;
}

.checkBox {
	clear: left;
	float: left;
	height: 13px;
	margin: 13px 0px 0px 15px;
	width: 13px;
}

.checkBoxText {
	float: left;
	margin: 10px 0px 10px 15px;
	padding: 0px;
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
					<li><a href="/semi/html/ij/exercise.jsp">운동정보</a></li>
					<li><a href="/semi/html/jh/sikdanInfo.jsp">식단정보</a></li>
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
						<h4><%=loginUser.getUserName()%>님 환영합니다
						</h4>
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>
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
							<li><a
								href="/semi/todayschedule?grade=<%=loginUser.getUsergrade()%>">운동스케쥴</a></li>
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
				<select id="bodysearch" class="box">
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
				<!--관리자만 업데이트가능-->
				<%
					if (loginUser != null && loginUser.getUserId().equals("ganjiplay")) {
				%>
				<!--게시글 등록-->
				<input type="button" value="운동검색기업데이트" id="wirte">
				<%
					}
				%>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>