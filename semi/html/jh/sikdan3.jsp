<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="sikdanboard.model.vo.SikdanBorad, java.util.ArrayList, java.sql.Date"%>
<%
	ArrayList<SikdanBorad> list = (ArrayList<SikdanBorad>) request.getAttribute("list");
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

<!-- 자바스크립트 영역 -->

    <script type="text/javascript">

        function goUrl(url) {

           location.href=url;

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
			<!-- Banner -->
				<section>
					<p>
						<b><font size="5" color="red">잠시만!</font> 읽고가세요~</b>
					</p>
					건강한 다이어트 식단이란 5대 영양소 섭취를 하면서 지방이 연소할 수있는 몸의 환경을 만들어주는 것이 필요한데요.<br>
					지방이 연소하기 위한 환경으로 1) 영양소, 2) 열, 3) 산소 이 3가지가 반드시 필요하다는 사실!<br>
					이 3가지 중에 어느 하나라도 빠지게 되면 지방연소가 아니라, 지방발효가 될 수 있습니다.<br> 단순히 굶거나
					식사량을 줄이거나 원푸드, 대체식 다이어트를 하게 된다면 체중감량은 될지 모르지만<br> 언제들어올지 모르는
					영양소에 대비해서 저장하려는 성질의 검약유전자가 발달될 수 있습니다.<br> 그래서, 5대 영양소 섭취를 할 수
					있는 건강한 다이어트 식단은 바로 한식기반의 형태로 아침, 점심, 저녁 규칙적으로 드시는 것입니다.
				</section>
				<!-- Section -->
				<br>
				<h4>Swan 건강 노하우</h4>
<!-- 				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>먹고싶은 음식을 먹으면서 다이어트 한다!</td>
								<td>운영자</td>
							</tr>
							<tr>
								<td>2</td>
								<td>고기만 먹고 살이 빠진다고? 황제 다이어트!</td>
								<td>운영자</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Morbi faucibus arcu accumsan lorem.</td>
								<td>운영자</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Vitae integer tempus condimentum.</td>
								<td>운영자</td>
							</tr>
							<tr>
								<td>5</td>
								<td>Ante turpis integer aliquet porttitor.</td>
								<td>운영자</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td><a href="#" class="button special samll">글쓰기</a></td>
							</tr>
						</tfoot>
					</table>
				</div> -->
	   <!-- 검색 폼 영역 -->

       <form name="searchForm" action="" method="get">

       <p>

           <select name="searchType">

               <option value="ALL">전체검색</option>

               <option value="SUBJECT">제목</option>

               <option value="WRITER">작성자</option>

               <option value="CONTENTS">내용</option>

           </select>

           <input type="text" name="searchText" value="" />

           <input type="submit" value="검색" />

       </p>

       </form>

       <!-- //검색 폼 영역 -->

       <!-- 게시판 목록 영역 -->

       <table border="1" summary="게시판 목록">

           <caption>게시판 목록</caption>

           <colgroup>

               <col width="50" />

               <col width="300" />

               <col width="80" />

               <col width="100" />

               <col width="70" />

           </colgroup>  

           <thead>

               <tr>

                    <th>번호</th>

                    <th>제목</th>

                    <th>작성자</th>

                    <th>등록 일시</th>

                    <th>조회수</th>

               </tr>

           </thead>

           <tbody>

						<!--     <tr>

                    <td align="center" colspan="5">등록된 게시물이 없습니다.</td>

               </tr> -->
						<%
							for (SikdanBorad sb : list) {
						%>
						<tr>

							<!-- <td align="center">1</td>

                    <td><a href="boardView.jsp">고기만 먹고 살이 빠진다고? 황제 다이어트!</a></td>

                    <td align="center">Admin</td>

                    <td align="center">2018.04.05</td>

                    <td align="center">10</td> -->



							<td align="center"><%=sb.getBoard_num()%></td>
							<td align="center"><a
								href="/semi/SikdanBoardDetailViewServlet?board_num=<%=sb.getBoard_num()%>&page=<%=currentPage%>">
									<%=sb.getBoard_title()%></a></td>
							<td align="center"><%=sb.getBoard_write()%></td>
							<td align="center"><%=sb.getBoard_date()%></td>
							<td align="center"><%=sb.getBoard_look()%></td>


						</tr>
						<%
							} //for closed
						%>
					</tbody>

           <tfoot>

          <!--      <tr>

                    <td align="center" colspan="5">1</td>

               </tr> -->

           </tfoot>

       </table>

       <!-- //게시판 목록 영역 -->

       <!-- 버튼 영역 -->

       <p>

          <!--  <input type="button" value="목록" onclick="goUrl('/semi/SikdanBoradListServlet?page=1');" /> -->

           <input type="button" value="글쓰기" onclick="goUrl('/semi/html/jh/sikdanboardWriteForm.jsp');" /> 

       </p>

       <!-- //버튼 영역 -->
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
