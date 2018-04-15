<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="sikdanboard.model.vo.SikdanBorad, java.util.ArrayList, java.sql.Date"%>
<%
	SikdanBorad sb = (SikdanBorad) request.getAttribute("board");
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - a page</title>

<!-- 자바스크립트 영역 -->

    <script type="text/javascript">

        function goUrl(url) {

           location.href=url;

        }

    	function boardModifyCheck() {
    		var form = document.boardModifyForm;
    		if (form.board_title.value == '') {
    			alert('제목을 입력하세요.');
    			form.board_title.focus();
    			return false;
    		}
    		if (form.board_content.value == '') {
    			alert('내용을 입력하세요');
    			form.board_content.focus();
    			return false;
    		}
    		return true;
    	}
    </script>

<!-- //자바스크립트 영역 -->

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
						<h3>Memu</h3>
						<ul>
							<li><a href="/semi/html/jh/sikdan.html">식단정보</a></li>
							<li><a href="/semi/html/jh/sikdan2.html">체형별 식단</a></li>
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
				<form name="boardModifyForm" action="/semi/SikdanBoardModifyServlet" method="post"
					onsubmit="return boardModifyCheck();">
					<input type="hidden" name="board_num" value=<%=sb.getBoard_num()%> />
					<table border="1" summary="게시판 수정 폼">
						<caption>게시판 수정 폼</caption>
						<colgroup>
							<col width="100" />
							<col width="500" />
						</colgroup>
						<tbody>
							<tr>
								<th align="center">제목</th>
								<td><input type="text" name="board_title" size="70" maxlength="100" value=<%=sb.getBoard_title()%> /></td>
							</tr>
							<tr>
								<th align="center">작성자</th>
								<td><input type="hidden" name="board_write" value=<%=sb.getBoard_write()%>/><%=sb.getBoard_write()%></td>
							</tr>
							<tr>
								<td colspan="2"><textarea name="board_content" cols="70" rows="10"><%=sb.getBoard_content()%></textarea></td>
							</tr>
						</tbody>
					</table>
					<p>
						<input type="button" value="목록" onclick="goUrl('/semi/SikdanBoradListServlet?page=1');" />
						<input type="submit" value="글수정" />
					</p>
				</form>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdan.html">식단정보</a> | <a href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
			</p>
		</div>
	</div>
</body>
</html>