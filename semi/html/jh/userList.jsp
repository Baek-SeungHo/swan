
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<%@ page
	import= "management.model.vo.UserManagement, java.util.ArrayList, java.sql.Date"
%>
<%
	ArrayList<UserManagement> list = (ArrayList<UserManagement>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
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
					<li><a href="/semi/html/jh/userManagement.jsp">회원관리</a></li>
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
							<li><a href="/semi/UserListManagementServlet?page=1">회원목록</a></li>
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
				 <table border="1" summary="회원 목록">

           <caption>회원 목록</caption>

           <colgroup>

               <col width="100" />

               <col width="100" />

               <col width="50" />

               <col width="50" />

               <col width="200" />
               
               <col width="200" />
               
               <col width="100" />

           </colgroup>  

           <thead>

               <tr>

                    <th>아이디</th>

                    <th>이름</th>

                    <th>성별</th>

                    <th>나이</th>

                    <th>이메일</th>
                    
                    <th>전화번호</th>
                    
                    <th>회원탈퇴</th>

               </tr>

           </thead>

           <tbody>


						<%
							for (UserManagement user : list) {
						%>
						<tr>
							<td align="center"><%=user.getUserId()%></td>
							<td align="center"><%=user.getUserName()%></td>
							<td align="center"><%=user.getUserGender()%></td>
							<td align="center"><%=user.getUserAge()%></td>
							<td align="center"><%=user.getUserEmail()%></td>
							<td align="center"><%=user.getUserPhone()%></td>
							
							<td align="center">
							<input type="hidden" name="user_id" value="<%=user.getUserId()%>">
							<input type="submit" value="탈퇴"/>
							</td>
							

						</tr>
						<%
							} //for closed
						%>
					</tbody>

           <tfoot>

				
			</tfoot>
				
       </table>

<!-- 페이징 처리 -->
					
						<div style="text-align: center;">
							<%
								if (currentPage <= 1) {
							%>
							<input type="button" value="처음" 
							style="width: 50px; height: 20px; background: url(/semi/style/buttonbgr_long.png); border: none;"
							>
							&nbsp;
							<%
								} else {
							%>
							<input type="button" value="처음" onclick="clickUrl('/semi/SikdanBoradListServlet?page=1');" 
							style=" width: 50px; height: 20px; background: url(/semi/style/buttonbgr_long.png);border: none;"
							/> 
							&nbsp;
							<%
								}
							%>
						<%-- 	<%
								if ((currentPage - 10) < startPage && (currentPage - 10) > 1) {
							%>
							<input type="button" value="prev" onclick="clickUrl('/semi/SikdanBoradListServlet?page=<%=startPage - 10%>');" />
							
							<%
								} else {
							%>
							 [prev]&nbsp;
							<%
								}
							%> --%>
							<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
							<%
								for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {
							%>
									<input type="button" value="<%=p%>"
										style="width: 20px; height: 20px; background: url(/semi/style/selected_buttonbgr.png); border: none;">
							&nbsp;
							<%
									} else {
							%>
									<input type="button" value="<%=p%>" onclick="clickUrl('/semi/SikdanBoradListServlet?page=<%=p%>');"
										style=" width: 20px; height: 20px; background: url(/semi/style/buttonbgr.png);border: none;"> 
							&nbsp;
							<%
								}
								}
							%>
							<%-- 
							<%
								if ((currentPage + 10) > endPage && (currentPage + 10) < maxPage) {
							%>
							
							<a href="/semi/SikdanBoradListServlet?page=<%=endPage + 10%>">[next]</a>
							<%
								} else {
							%>
							[next]&nbsp;
							<% } %> --%>

							
							<%
								if (currentPage >= maxPage) {
							%>
							<input type="button" value="맨끝" 
							style="width: 50px; height: 20px; background: url(/semi/style/buttonbgr_long.png); border: none;"
							>
							&nbsp;
							<%
								} else {
							%>
							<input type="button" value="맨끝" onclick="clickUrl('/semi/SikdanBoradListServlet?page=<%= maxPage %>');" 
							style=" width: 50px; height: 20px; background: url(/semi/style/buttonbgr_long.png);border: none;"
							/> 
							&nbsp;
							<%
								}
							%>
							
							
					 </div>
   

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
