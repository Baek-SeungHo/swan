<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="exeboard.model.vo.ExeBoard, java.util.ArrayList, java.sql.Date"%>
<%
	ArrayList<ExeBoard> list = (ArrayList<ExeBoard>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<script type="text/javascript">
	function showWriteForm() {
		location.href = "/semi/html/ij/exeboardWriteForm.jsp";
	}
</script>
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
							<li><a href="/semi/blist?page=1">게시글</a></li>
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

				<h2 align="center">운동목록</h2>
				<h4 align="center">
					총 게시글 갯수 :
					<%=listCount%></h4>
					
					<select>
					<option>가슴</option>
					<option>등</option>
					<option>어깨</option>
					<option>복근</option>
					<option>하체</option>
					<option>팔</option>				
					</select>

				
				<br>

				<table align="center" border="1" cellspacing="0" width="700">
					<tr>
						<th>운동부위</th>
						<th>운동제목</th>
						<th>조회수</th>
						<th>날짜</th>
					</tr>
					<%
						for (ExeBoard b : list) {
					%>
					<tr>
						<td align="center"><%=b.getSportbody()%></td>
						<td align="center"><a href="/semi/bdetail?ecode=<%=b.getSportcode()%>&page=<%=currentPage%>">
									<%=b.getSportname() %></a></td>
						<td align="center"><%=b.getSportlook()%></td>
						<td align="center"><%=b.getSportdate()%></td>
					</tr>
					<%
						} //for closed
					%>
				</table>
				<br> --
				<!-- 페이징 처리 -->
				<div style="text-align: center;">
					<%
						if (currentPage <= 1) {
					%>
					[맨처음]&nbsp;
					<%
						} else {
					%>
					<a href="/semi/elist?page=1">[맨처음]</a>
					<%
						}
					%>
					<%
						if ((currentPage - 10) < startPage && (currentPage - 10) > 1) {
					%>
					<a href="/semi/elist?page=<%=startPage - 10%>">[prev]</a>
					<%
						} else {
					%>
					[prev]&nbsp;
					<%
						}
					%>
					<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
					<%
						for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
					%>
					<font color="red" size="4"><b>[<%=p%>]
					</b></font>
					<%
						} else {
					%>
					<a href="/semi/elist?page=<%=p%>"><%=p%></a>
					<%
						}
						}
					%>

					<%
						if ((currentPage + 10) > endPage && (currentPage + 10) < maxPage) {
					%>
					<a href="/semi/elist?page=<%=endPage + 10%>">[next]</a>
					<%
						} else {
					%>
					[next]&nbsp;
					<%
						}
					%>

					<%
						if (currentPage >= maxPage) {
					%>
					[맨끝]&nbsp;
					<%
						} else {
					%>
					<a href="/semi/elist?page=<%=maxPage%>">[맨끝]</a>
					<%
						}
					%>
				</div>	
				<br>	
				<div style="align: center; text-align: center;">
					<button onclick="showWriteForm();">글쓰기</button>
				</div>	
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