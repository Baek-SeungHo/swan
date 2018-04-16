<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#poll").click(function() {
			var yes = $('input:checkbox[name="yes"]:checked').length;
			var no = $('input:checkbox[name="no"]:checked').length;

			$.ajax({
				url : "/semi/poll",
				type : "post",
				data : {
					yes : yes,
					no : no
				},
				success : function(data) {
					alert("설문조사완료");
				}

			});

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
	text-align: left;
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
							<!-- <li><a href="/semi/html/ij/exercisequestionnaire.jsp">몸상태설문조사</a></li> -->
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
				<h2>운동설문조사</h2>
				<br>
				<br>
				<br>
				<table border="3" >
					<tr>
						<th>질문</th>
						<th>내용</th>
					</tr>
					<tr>
						<td>일주일에 3번이상 운동을 하시나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>야식을 자주 하시나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>슬로우푸드보단 패스트푸드를 좋아하시나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>근육량보단 체지방이 많나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>운동을 하실때 즐거움을 느끼시나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>운동스케쥴에 따라올 자신있나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>푸쉬업을 30개이상 쉬지 않고 할수 있나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>식사를 하시고 바로 누우시나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
					<tr>
						<td>마지막으로 뭍습니다 다이어트에 모든것을 걸 자신있나요?</td>
						<td><input type="checkbox" name="yes" value="예">예 <input
							type="checkbox" name="no" value="아니오">아니오</td>
					</tr>
				</table>
				<input type="button" value="작성완료" id="poll" style="width: 100%">
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