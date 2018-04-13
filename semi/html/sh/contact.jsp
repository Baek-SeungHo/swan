<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact us</title>
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
							<li><a href="/semi/html/sh/contact.html">1:1상담</a></li>
							<li><a href="/semi/qnalist?page=1">자주묻는질문</a></li>

							<!-- /semi/html/sh/contact2.html -->
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<!-- <div class="sidebar_top"></div> -->
					<!-- <div class="sidebar_item">
						<h3>검색</h3>
						<form method="post" action="#" id="search_form">
							<p>
								<input class="search" type="text" name="search_field"
									value="Enter keywords....." /> <input name="search"
									type="image" style="border: 0; margin: 0 0 -9px 5px;"
									src="style/search.png" alt="Search" title="Search" />
							</p>
						</form>
					</div> -->
					<!-- <div class="sidebar_base"></div> -->
				</div>
			</div>
			<div id="content">
				<!-- insert the page content here -->
				<h1>1:1 문의</h1>
				<p>관리자에게 질문사항에 대하여 문의합니다.</p>
				<div class="form_settings">
					<p>
						<span>Name</span><input class="contact" type="text"
							name="your_name" value="" />
					</p>
					<p>
						<span>Email Address</span><input class="contact" type="text"
							name="your_email" value="" />
					</p>
					<p>
						<span>Message</span>
						<textarea class="contact textarea" rows="8" cols="50"
							name="your_enquiry"></textarea>
					</p>
					<p style="padding-top: 15px">
						<span>&nbsp;</span><input class="submit" type="submit"
							name="contact_submitted" value="submit" />
					</p>
				</div>
				<p>
					<br />
				</p>
			</div>
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
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
			</p>
		</div>
	</div>
</body>
</html>