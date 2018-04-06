<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
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
						<h3>Memu</h3>
						<ul>
							<li><a href="/semi/elist?page=1">게시글</a></li>
							<li><a href="#">운동프로그램</a></li>
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
				<h2 align="center">운동게시글업데이트</h2>
				<form action="/first/binsert.ss" method="post"
					enctype="multipart/form-data">
					<table align="center">
						<tr>
							<td colspan="1">운동부위</td>
							<td><select>
									<option value="chest">가슴</option>
									<option value="shoulder">어깨</option>
									<option value="etc">등</option>
									<option value="abs">복근</option>
									<option value=lowerbody">하체</option>
									<option value="arm">팔</option>
							</select></td>
							<td>운동명</td>
							<td><input type="text" name="sport_name"></td>
							<td>운동코드</td>
							<td><input type="text" name="sport_code"></td>
						</tr>
						<tr>
							<td>동영상url</td>
							<td colspan="5">  <input type="text" name="sport_url" style="width: 99%"></td>
						</tr>
						<tr>
							<td colspan="6	" align="center" style="text-align: right"><input type="submit"
								value="업데이트"> &nbsp; <a href="/semi/blist?page=1">목록으로</a></td>
						</tr>
					</table>
				</form>
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
