<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@	page import="qna.model.vo.QNA, user.model.vo.User, java.util.*"%>
<%
	ArrayList<QNA> listAll = (ArrayList<QNA>) request.getAttribute("listAll");
	ArrayList<QNA> list = (ArrayList<QNA>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();

	User loginUser = (User) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA Page</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".b_slide").click(function() {

			var currentId = $(this).attr('id');
				/* alert(currentId); */
			if ($("#ul" + currentId).is(":visible")) {

				$("#ul" + currentId).slideUp();
			} else {
				$("#ul" + currentId).slideDown();
			}
		});
		
		
		/* $(".a_update").click(function() {
			//var currentId = $(this).attr('id');
			//alert(currentId);
			var currentId = $(this).next('id');
			alert(currentId);
			
			//모달창 띄우자
		}); */
		
		 // Get the modal
        var modal = document.getElementById('myModal');
		var modal1 = document.getElementById('myModal1');
		
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
        var btn1 = document.getElementById("myBtn1");
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];   
        var span1 = document.getElementsByClassName("close1")[0];   
 
        // When the user clicks on the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }
        
        btn1.onclick = function() {
            modal1.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
        	modal.style.display = "none";
        	          
        }
        span1.onclick = function() {
        	
        	modal1.style.display = "none";            
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }else if (event.target == modal1) {
                modal1.style.display = "none";
            }
        }
      
		
		
	});
</script>
<style type="text/css">
.b_slide {
	cursor: pointer;
}

.ul_slide {
	display: none;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button */ 
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.close1 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
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
						<a href="/semi/html/yn/userLoginPage.jsp">로그인</a>
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
							<li><a href="/semi/html/sh/contact.jsp">Contact to Us</a></li>
							<li><a href="/semi/qnalist?page=1">자주묻는질문</a></li>
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
				<h1>Q & A</h1>
				<table style="width: 100%">
					<tbody>
						<%-- <% for(QNA q: list) { %>
						<tr>
							<td><b class="b_slide"><%=q.getQna_question()%></b>
								<ul class="ul_slide" style="list-style: none;">
									<%=q.getQna_answer()%>
								</ul></td>
						</tr>
						<% } %> --%>
						<% int i=1; %>
						<% for(QNA q: list) { %>
						<tr>
							<td><b class="b_slide" id="id<%=i%>"><%=q.getQna_question()%></b>
								<%-- <a class="a_delete" id="deleteid<%=i%>" style="float: right; text-decoration: none;" href="">제거</a>
								<a class="a_update" id="updateid<%=i%>" style="float: right; text-decoration: none;" href="">수정&nbsp;</a> --%>
								<ul class="ul_slide" id="ulid<%=i%>" style="list-style: none;">
									<%=q.getQna_answer()%>
								</ul></td>
						</tr>
						<% i++; %>
						<% } %>
					</tbody>
				</table>

				<div style="text-align: center;">
					<%
						if (currentPage <= 1) {
					%>
					[맨처음]&nbsp;
					<% } else { %>
					<a href="/semi/qnalist?page=1">[맨처음]</a>
					<% } %>
					&nbsp;
					
					<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
					<% for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) { %>
					<%-- <font color="red" size="2"><b><%=p%></b>
					</font> --%>
					
					<input type="button" value="<%=p%>" 
					style="width: 22px; height: 22px; 
					background: url(/semi/style/selected_buttonbgr.png);					
					border: none;
					">
					<% } else { %>
					<input type="button" value="<%= p %>" onclick="location.href='/semi/qnalist?page=<%=p%>';"
					
					style=" width: 22px; height: 22px; background: url(/semi/style/buttonbgr.png);border: none;"> 
					<% } } %>

					&nbsp;

					<% if (currentPage >= maxPage) { %>
					[맨끝]&nbsp;
					<% } else { %>
					<a href="/semi/qnalist?page=<%=maxPage%>">[맨끝]</a>
					<% } %>
					<!-- <a style="float: right; text-decoration: none;" href="">추가</a> -->
					<!-- Trigger/Open The Modal -->
					
					<% if(loginUser !=null ) {%>
					<% if (loginUser.getAdministrator().equals("Y")) { %>
					<button id="myBtn1" style="float: right;">제거하기</button>
					<button id="myBtn" style="float: right; margin-right: 5px;">추가하기</button>
					
					<% } %>
					<% } %>
				</div>

				<!-- The Modal -->
				<div id="myModal" class="modal">

					<!-- Modal content -->

					<div class="modal-content">
						<form action="/semi/qnainsert" method="post">
							<span class="close">&times;</span>

							<div id="modal-header">

								<b>추가하기애오.</b>
								<p></p>

							</div>

							<div id="modal-center">
								&nbsp;질문 제목을 입력하새오.<br> <input name="qnaquestion"
									style="width: 85%;" type="text">
								<p></p>
								&nbsp;답변 내용을 입력해요.<br> <input name="qnaanswer"
									style="width: 85%;" type="text">
								<p></p>
							</div>

							<div id="modal-footer">
								<input type="submit" value="입력하기">

								<!-- <button style="float: right;">입력하기</button> -->
								<p></p>

							</div>

						</form>
						<!-- <p>Some text in the Modal-Content..</p> -->
					</div>

				</div>

				<!-- The Modal -->
				<div id="myModal1" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
						<form action="/semi/qnadelete" method="post">
							<span class="close1">&times;</span>
							<div id="modal-header">
								<p>제거하기에염!!ㅎㅎㅎㅎ.</p>
							</div>
							<div id="modal-center">
								&nbsp;질문 제목을 선택하새오.<br> <select name="selectqnanum"
									style="width: 85%;">
									<%
										for (QNA q : listAll) {
									%>
									<option value="<%=q.getQna_num()%>"><%=q.getQna_question()%></option>
									<%
										}
									%>
								</select>
								<p></p>
							</div>

							<div id="modal-footer">
								<input type="submit" value="제거하기">

								<!-- <button style="float: right;">입력하기</button> -->
								<p></p>

							</div>

							<!-- <p>Some text in the Modal-Content..</p> -->
						</form>
					</div>

				</div>

				<!-- insert the page content here -->
				<!-- 				<h1>Q & A</h1>
				<p>자주 묻는 사항들을 게시한 페이지 입니다.</p>
					<table>
						<tbody>
								<tr>
									<td>
										item1
									</td>
								</tr>
								<tr>
									<td>Item2</td>
								</tr>
								<tr>
									<td>Q.만들기 너무 기차나여</td>
								</tr>
								<tr>
									<td>
										<b class="b_slide">Q . 111</b>
										<ul class="ul_slide" style="list-style: none;">
											<a>222<a>
										</ul>
									</td>
								</tr>

							</tbody>
					
					</table> -->

				<p>
					<br />
				</p>
			</div>
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
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
			</p>
		</div>
	</div>
</body>
</html>