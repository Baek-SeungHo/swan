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
							if (loginUser == null) {
						%>
						<a href="/semi/html/yn/userLoginPage.jsp">로그인</a>&nbsp; <a
							href="/semi/html/yn/userEnroll.jsp">회원가입</a>
						<%
							} else {
						%>
						<h4><%=loginUser.getUserName()%>님 환영합니다
						</h4>
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>&nbsp;&nbsp;&nbsp;
						<a href="/semi/ulogout"><input type="button" value="로그아웃"></a>
						<%
							}
						%>
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
				<section> <b>Swan 추천음식!</b> </section>

				<!-- Section -->
				<section> <img src="/semi/source/image/chiken.png"
					width="200" height="200"> <br>
				다이어트의 대표음식 <b>닭가슴살!</b> <br>
				<br>
				<p>
					<b>첫번째,</b> 다이어트 포만감에 비해서 상당히 낮은 칼로리를 가지고 있는 닭가슴살은 다이어트 하는 분들에게
					각광받고 있고 드레싱없이 샐로드로 먹거나 훈제를 해먹는 방법을 통해서 많은 사람들이 섭취를 하고 있습니다. <br>
					<br> <b>두번째,</b> 두뇌발달에 좋음 닭가슴살은 필수 아미노산이 풍부해서 뇌신경 전달물질의 활동을
					촉진시켜주는 효능을 가지고 있습니다. 그래서 아이들이나 수험생들한테 특히 좋은 두뇌발달 성분을 가지고 있습니다. <br>
					<br> <b>세번째,</b> 체력회복 닭가슴살에는 섬유질도 가늘고 연해서 다른 육류보다도 소화흡수가 잘 되어
					있습니다. 그렇기 때문에 어린이들이나 노약자들이 기력회복에도 좋고 체력이 많이 떨어진 분들이 먹으면 큰 도움을 받을 수
					있습니다. <br> <br> <b>네번째,</b> 성인병 예방 닭가슴살 속에는 불포화지방산 필수지방산이
					풍부해서 고혈압이나 심장병 등과 같은 성인질병에 대해 예방 할 수 있는 음식 중 하나라고 하는데요, 부담없는 칼로리에
					즐겨드시게 되더라도 성인병을 예방하고 살도 안찌니 참 고마운 음식이지요!!!
				</p>
				</section>

				<!-- Section -->
				<section> <img src="/semi/source/image/onions.jpg"
					width="200" height="200"> <br>
				너무나도 건강한 음식 <b>양파!</b> <br>
				<br>
				<p>
					<b>첫번째,</b> 성인병 예방에 좋아요. 양파에 들어있는 펙틴이 콜레스테롤을 분해해주는 역할을 합니다. <br>
					<br> <b>두번째,</b> 항암 작용을 합니다. 양파의 퀘르세틴이라는 성분이 항암작용을 하는 성분으로 암을
					예방하는데 좋은 음식입니다. 양파의 알리신 성분이 몸속의 나쁜 세포들을 제거하는 효과가 있습니다. <br> <br>
					<b>세번째,</b> 노화 예방 및 피부 미용 양파의 항산화 물질인 퀴르세틴 성분과 플로보노이드 성분이 풍부하여 노화를
					예방하고 혈액을 깨끗하게 유지시켜줍니다.
				</p>
				</section>

				<section> <img src="/semi/source/image/dotori1.jpg"
					width="200" height="200"> <img
					src="/semi/source/image/dotori2.jpg" width="200" height="200">
				<br>
				영양가 만점! 매력적인 그 맛 <b>도토리!</b> <br>
				<br>
				<b>첫번째,</b> 아콘산(Acomicacid)이란​ 성분이 풍부하여 중금속과 여러 유해물질을 체외로 배출하는 효과가
				있습니다. <br>
				<br>
				<b>두번째,</b> 떫은 맛을 내는 타닌 성분은 지방의 흡수를 막아주고, 100그램당 45kcal의 저열량이므로
				다이어트음식으로 좋답니다. <br>
				<br>
				<b>세번째,</b> 설사와 이질을 치료하고 장과 위를 튼튼하게 하며 들깨와 같이 먹으면 좋은 궁합을 이루어 콜레스테롤
				수치를 낮추어 고혈압, 동맥경화, 당뇨병 등 성인​병을 예방하는 효능을 발휘합니다. <br>
				<br>
				<b>네번째,</b> ​동의보감에 의하면 늘 배가 부르고 끓는 사람, 변이 불규칙적인 사람, ​몸이 붓거나 소변을 자주
				보는 사람에게 좋다고 합니다. <br>
				<br>
				<b>다섯번째,</b> 피로회복, 숙취해소에 탁월한​ 효능이 있으며 입안이 헐고 잇몸에서 피가 ​날때에도 좋습니다. <br>
				<br>
				<b>여섯번째,</b> 타닌 성분은 모세혈관을 튼튼하게 하는 효능이 있으나 과다 섭취를 하면 변비가 되므로 유의해야
				한답니다. </section>
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
