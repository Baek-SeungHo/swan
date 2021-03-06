<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - a page</title>
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
						<%   
   							if(loginUser == null) {   
   						 %>
						<a href="/semi/html/yn/userLoginPage.jsp">로그인</a>&nbsp;
						<a href="/semi/html/yn/userEnroll.jsp">회원가입</a>
						<% } else {%>
						<h4><%=loginUser.getUserName()%>님 환영합니다
						</h4>
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>&nbsp;&nbsp;&nbsp;
						<a href="/semi/ulogout"><input type="button" value="로그아웃"></a>
						<% } %>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Memu</h3>
						<ul>
							<li><a href="/semi/html/jh/sikdanInfo.jsp">식단정보</a></li>
							<li><a href="/semi/html/jh/sikdanBodyType.jsp">체형별 식단</a></li>
							<li><a href="/semi/SikdanBoradListServlet?page=1">건강 노하우</a></li>
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
				<!-- Banner -->
				<section>
					<b>3. 마른형</b>
				</section>

				<!-- Section -->
				<section>
					이 체형은 탄력과 볼륨이 부족합니다. 겉보기엔 날씬해보이고<br> 살이 안 찌는 체질이라 생각하실 수도 있겠지만
					아닙니다!!<br> 언제 살이 갑자기 찔 지 모르는 위험한 체형입니다.<br> 꾸준한 운동과 양질의
					식사로 근육량을 늘려야지 날씬하면서도 에너지 넘치는 체형이 될 수 있습니다!
				</section>

				<section>
					추천 식단1<br> 아침, 점심 : 주먹밥 100g, 달걀 2개로 만든 스크램블 에그<br> 간식 :
					사과 1개 or 바나나 1개<br> 저녁 : 고구마 100g + 저지방 부위 고기 100g or 흰살생선
					150g + 구운 채소 1접시
				</section>

				<section>
					추천 식단2<br> 아침, 점심 : 주먹밥 100g, 흰살생선 100g, 채소 1접시, 오일 비니거 드레싱<br>
					간식 : 저지방 우유 1잔 or 두유 1잔<br> 저녁 : 고구마 100g or 주먹밥 100g, 흰살생선
					150~200g, 채소구이 1접시
				</section>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/boardlistview.jsp">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
			</p>
		</div>
	</div>
</body>
</html>
