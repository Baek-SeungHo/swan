<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<%@ page
	import="sikdanboard.model.vo.SikdanBorad, java.util.ArrayList, java.sql.Date"%>
<%
	SikdanBorad sb = (SikdanBorad) request.getAttribute("board");
	/*  int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();  */
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
        
        function Modify(url) {
        	<%   
				if(loginUser == null) {   
			%>
			 	alert('로그인을 해주세요');
			 	location.href='/semi/html/yn/userLoginPage.jsp';
			
			<%
				}else if (loginUser.getAdministrator().equals("Y")) {
			%>
					location.href=url;
			 	
        	<%
				}else if(!loginUser.getUserId().equals(sb.getBoard_write())){
        	%>
        		alert('본인 게시물만 수정 할 수 있습니다.');
        	<%	
        		}else {
        	%>
        		location.href=url;
        	<%
        		}
        	%>
        	
        }
        
        
        function Delete(url) {
        	<%   
				if(loginUser == null) {   
			%>
			 	alert('로그인을 해주세요');
			 	location.href='/semi/html/yn/userLoginPage.jsp';
			<%
				}else if (loginUser.getAdministrator().equals("Y")) {
			%>
					location.href=url;
					alert('게시글 삭제가 완료되었습니다!');
			 	
        	<%
				}else if(!loginUser.getUserId().equals(sb.getBoard_write())){
        	%>
        		alert('본인 게시물만 삭제 할 수 있습니다.');
        	<%	
        		}else {
        	%>
        		location.href=url;
        		alert('게시글 삭제가 완료되었습니다!');
        	<%
        		}
        	%>
        	
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
				<table border="1" summary="게시판 상세조회">
					<caption>게시판 상세조회</caption>
					<colgroup>
						<col width="100" />
						<col width="500" />
					</colgroup>
					<tbody>
						<tr>
							<th align="center">제목</th>
							<td><%=sb.getBoard_title()%></td>
						</tr>
						<tr>
							<th align="center">작성자</th>
							<td><%=sb.getBoard_write()%></td>
						</tr>
						<tr>
							<th align="center">내용</th>
							<td colspan="2"><%=sb.getBoard_content()%></td>
						</tr>
					</tbody>
				</table>
				<p>
					<input type="button" value="목록" onclick="goUrl('/semi/SikdanBoradListServlet?page=1');" />
					<input type="button" value="수정" onclick="Modify('/semi/SikdanBoardModifyViewServlet?board_num=<%=sb.getBoard_num()%>');" /> 
					<input type="button" value="삭제" onclick="Delete('/semi/SikdanBoardDeleteServlet?board_num=<%=sb.getBoard_num()%>');"/>
				</p>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/boardlistview.jsp">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
			</p>
		</div>
	</div>
</body>
</html>