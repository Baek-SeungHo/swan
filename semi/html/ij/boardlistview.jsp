<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<style type="text/css">
</style>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	/*ajax를 통한 게시판 리스트 조회 */
	$(function() {
		$("#bodysearch")
				.change(
						function() {
							$
									.ajax({
										url : "/semi/esearch",
										type : "post",
										data : {
											body : $(
													"#bodysearch > option:selected")
													.text(),
										},
										datatype : "json",
										success : function(data) {
											var jsonstr = JSON.stringify(data);
											var json = JSON.parse(jsonstr);
											var sport = "";

											for ( var i in json.list) {

												sport += "<tr><td>"
														+ json.list[i].sportbody
														+ "</td><td><a href='/semi//edetail?ecode="
														+ json.list[i].sportcode
														+ "'>"
														+ json.list[i].sportname
														+ "</a></td>"
														+ "<td>"
														+ json.list[i].sportdate
														+ "</td><td>"
														+ json.list[i].sportlook
														+ "</td></tr>";
											}
											$("#sportlist").append(sport);

										},
										error : function(a, b, c) {
											console.log("error:" + a + b + c)
										}

									});
							$("#sportlist").empty();
						});
		/* 운동명으로 검색 ajax */
		$("#namesearch")
				.click(
						function() {

							var name = $("#sportname").val();

							$
									.ajax({
										url : "/semi/ensearch",
										type : "post",
										data : {
											name : name
										},
										success : function(data) {

											var jsonstr = JSON.stringify(data);
											var json = JSON.parse(jsonstr);
											var sport = "";

											for ( var i in json.list) {
												sport += "<tr><td>	"
														+ json.list[i].sportbody
														+ "</td><td><a href='/semi//edetail?ecode="
														+ json.list[i].sportcode
														+ "'>"
														+ json.list[i].sportname
														+ "</a></td>"
														+ "<td>"
														+ json.list[i].sportdate
														+ "</td>"
														+ json.list[i].sportlook
														+ "</td></tr>";
											}
											$("#sportlist").append(sport);

										},
										error : function(a, b, c) {
											console.log("error:" + a + b + c)
										}
									});
							$("#sportlist").empty();
						});
		/*글쓰기 주소*/
		$("#wirte").click(function() {

			location.href = "/semi/html/ij/boardinsert.jsp";

		});

	});
</script>
<script type="text/javascript">
	//검색창 자동완성기능
	$(function() {
		var languages = [ "인클라인푸쉬업", '푸쉬업', '디클라인푸쉬업', '아처푸쉬업', '파이크푸쉬업',
				'흰두푸쉬업', '러시안푸쉬업', '한팔푸쉬업', '플라이푸쉬업', '할로우보디플랭크', '백인스텐션',
				'시티드로우', '인버티드로우', '마누스그립풀업', '턱걸이', '익스플로시브풀업', '크런치',
				'사이드크런치', '레그레이즈', '바이시클크런치', '드래곤플래그', '행잉레그레이즈', '스쿼드',
				'와이드스쿼드', '벤드데드리프트', '런지', '박스런지' ];

		$("#sportname").autocomplete({
			source : languages
		});
	});
</script>
<script type="text/javascript">
	var table = new Array(55);
	table[0] = new Array(1.5, 1.6, 1.7, 1.8, 1.8, 1.9, 2.0, 2.1, 2.2, 2.2, 2.3,
			2.4, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 2.9, 3.0, 3.1, 3.1, 3.2, 3.3,
			3.4);
	table[1] = new Array(3.3, 3.5, 3.7, 3.9, 4.0, 4.2, 4.4, 4.6, 4.7, 4.9, 5.1,
			5.3, 5.4, 5.6, 5.8, 6.0, 6.2, 6.3, 6.5, 6.7, 6.9, 6.9, 7.2, 7.4,
			7.6);
	table[2] = new Array(7.7, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0, 10.4, 10.8, 11.1,
			11.5, 11.9, 12.3, 12.7, 13.1, 13.5, 13.9, 14.3, 14.7, 15.0, 15.4,
			15.4, 16.2, 16.6, 17.0);
	table[3] = new Array(3.6, 3.8, 4.0, 4.2, 4.4, 4.6, 4.7, 4.9, 5.1, 5.3, 5.4,
			5.6, 5.8, 6.0, 6.2, 6.4, 6.6, 6.7, 6.9, 7.1, 7.3, 7.4, 7.6, 7.8,
			8.0);
	table[4] = new Array(2.7, 2.9, 3.0, 3.1, 3.3, 3.4, 3.5, 3.7, 3.8, 3.9, 4.1,
			4.2, 4.4, 4.5, 4.6, 4.8, 4.9, 5.0, 5.2, 5.3, 5.4, 5.6, 5.7, 5.9,
			6.0);
	table[5] = new Array(3.0, 3.1, 3.3, 3.5, 3.6, 3.8, 3.9, 4.1, 4.2, 4.4, 4.5,
			4.7, 4.8, 5.0, 5.1, 5.3, 5.4, 5.6, 5.7, 5.9, 6.0, 6.2, 6.4, 6.5,
			6.7);
	table[6] = new Array(6.5, 6.8, 7.2, 7.5, 7.8, 8.2, 8.5, 8.8, 9.2, 9.5, 9.9,
			10.2, 10.5, 10.9, 11.2, 11.5, 11.9, 12.2, 12.5, 12.9, 13.2, 13.5,
			13.8, 14.2, 14.5);
	table[7] = new Array(3.1, 3.3, 3.5, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.6, 4.8,
			4.9, 5.1, 5.3, 5.4, 5.6, 5.7, 5.9, 6.0, 6.2, 6.4, 6.5, 6.7, 6.9,
			7.0);
	table[8] = new Array(6.0, 6.3, 6.6, 7.0, 7.3, 7.6, 7.9, 8.2, 8.5, 8.8, 9.1,
			9.4, 9.7, 10.0, 10.3, 10.6, 10.9, 11.2, 11.6, 11.9, 12.2, 12.5,
			12.8, 13.1, 13.4);
	table[9] = new Array(9.7, 10.2, 10.7, 11.2, 11.6, 12.1, 12.6, 13.1, 13.6,
			14.1, 14.6, 15.1, 15.6, 16.1, 16.6, 17.1, 17.6, 18.1, 18.5, 19.0,
			18.5, 20.0, 20.5, 21.0, 21.5);
	table[10] = new Array(14.5, 15.2, 16.0, 16.7, 17.4, 18.2, 18.9, 19.7, 20.4,
			21.1, 21.9, 22.6, 23.3, 24.1, 24.8, 25.6, 26.3, 27.0, 27.8, 28.5,
			29.2, 30.0, 30.7, 31.5, 32.2);
	table[11] = new Array(1.5, 1.6, 1.6, 1.7, 1.8, 1.9, 1.9, 2.0, 2.1, 2.2,
			2.2, 2.3, 2.4, 2.5, 2.6, 2.6, 2.7, 2.8, 2.9, 2.9, 3.0, 3.1, 3.2,
			3.2, 3.3);
	table[12] = new Array(3.1, 3.3, 3.5, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.6,
			4.8, 4.9, 5.1, 5.3, 5.4, 5.6, 5.7, 5.9, 6.0, 6.2, 6.4, 6.5, 6.7,
			6.9, 7.0);
	table[13] = new Array(4.5, 4.7, 5.0, 5.2, 5.4, 5.6, 5.9, 6.1, 6.3, 6.6,
			6.8, 7.0, 7.3, 7.5, 7.7, 7.9, 8.2, 8.4, 8.6, 8.9, 9.1, 9.3, 9.5,
			9.8, 10.0);
	table[14] = new Array(6.0, 6.3, 6.7, 7.0, 7.3, 7.6, 7.9, 8.2, 8.5, 8.8,
			9.1, 9.4, 9.7, 10.0, 10.3, 10.6, 10.9, 11.2, 11.5, 11.8, 12.1,
			12.4, 12.7, 13.0, 13.3);
	table[15] = new Array(6.5, 6.8, 7.2, 7.5, 7.8, 8.2, 8.5, 8.8, 9.2, 9.5,
			9.8, 10.2, 10.5, 10.8, 11.2, 11.5, 11.8, 12.1, 12.5, 12.8, 13.1,
			13.5, 13.8, 14.1, 14.5);
	table[16] = new Array(6.5, 6.8, 7.1, 7.5, 7.8, 8.1, 8.4, 8.8, 9.1, 9.4,
			9.8, 10.1, 10.4, 10.7, 11.1, 11.4, 11.7, 12.0, 12.4, 12.7, 13.0,
			13.4, 13.7, 14.0, 14.4);
	table[17] = new Array(4.2, 4.4, 4.6, 4.8, 5.1, 5.3, 5.5, 5.7, 5.9, 6.1,
			6.4, 6.6, 6.8, 7.0, 7.2, 7.4, 7.6, 7.9, 8.1, 8.3, 8.5, 8.7, 8.9,
			9.1, 9.4);
	table[18] = new Array(3.4, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.7, 4.8, 5.0,
			5.2, 5.4, 5.5, 5.7, 5.9, 6.1, 6.3, 6.4, 6.6, 6.8, 7.0, 7.1, 7.3,
			7.5, 7.7);
	table[19] = new Array(2.9, 3.0, 3.2, 3.3, 3.5, 3.6, 3.8, 3.9, 4.1, 4.2,
			4.4, 4.5, 4.7, 4.8, 5.0, 5.1, 5.3, 5.4, 5.6, 5.7, 5.9, 5.9, 6.1,
			6.3, 6.4);
	table[20] = new Array(6.5, 6.8, 7.1, 7.5, 7.8, 8.1, 8.4, 8.8, 9.1, 9.4,
			9.8, 10.1, 10.4, 10.7, 11.1, 11.4, 11.7, 12.0, 12.4, 12.7, 13.0,
			13.0, 13.7, 14.0, 14.4);
	table[21] = new Array(3.6, 3.8, 4.0, 4.2, 4.4, 4.6, 4.7, 4.9, 5.1, 5.3,
			5.4, 5.6, 5.8, 6.0, 6.2, 6.4, 6.6, 6.7, 6.9, 7.1, 7.3, 7.4, 7.6,
			7.8, 8.0);
	table[22] = new Array(2.7, 2.9, 3.0, 3.1, 3.3, 3.4, 3.5, 3.7, 3.8, 3.9,
			4.1, 4.2, 4.4, 4.5, 4.6, 4.8, 4.9, 5.0, 5.2, 5.3, 5.4, 5.6, 5.7,
			5.9, 6.0);
	table[23] = new Array(2.7, 2.9, 3.0, 3.1, 3.3, 3.4, 3.5, 3.7, 3.8, 3.9,
			4.1, 4.2, 4.4, 4.5, 4.6, 4.8, 4.9, 5.0, 5.2, 5.3, 5.4, 5.6, 5.7,
			5.9, 6.0);
	table[24] = new Array(2.7, 2.8, 3.0, 3.1, 3.3, 3.4, 3.5, 3.7, 3.8, 3.9,
			4.1, 4.2, 4.4, 4.5, 4.6, 4.8, 4.9, 5.0, 5.2, 5.3, 5.5, 5.6, 5.7,
			5.9, 6.0);
	table[25] = new Array(2.5, 2.6, 2.8, 2.9, 3.0, 3.1, 3.3, 3.4, 3.5, 3.7,
			3.8, 3.9, 4.0, 4.2, 4.3, 4.4, 4.5, 4.7, 4.8, 4.9, 5.1, 5.2, 5.3,
			5.4, 5.9);
	table[26] = new Array(5.5, 5.8, 6.1, 6.4, 6.6, 6.9, 7.2, 7.5, 7.8, 8.0,
			8.3, 8.6, 8.9, 9.2, 9.4, 9.7, 10.0, 10.3, 10.6, 10.8, 11.1, 11.4,
			11.7, 12.0, 12.2);
	table[27] = new Array(3.1, 3.3, 3.5, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.6,
			4.8, 4.9, 5.1, 5.3, 5.4, 5.6, 5.7, 5.9, 6.0, 6.2, 6.4, 6.5, 6.7,
			6.9, 7.0);
	table[28] = new Array(6.3, 6.7, 7.0, 7.3, 7.6, 8.0, 8.3, 8.6, 8.9, 9.3,
			9.6, 9.9, 10.2, 10.5, 10.9, 11.2, 11.5, 11.9, 12.2, 12.5, 12.8,
			13.1, 13.5, 13.8, 14.1);
	table[29] = new Array(4.0, 4.2, 4.4, 4.6, 4.8, 5.0, 5.2, 5.4, 5.6, 5.8,
			6.0, 6.2, 6.4, 6.6, 6.8, 7.0, 7.2, 7.4, 7.6, 7.8, 8.0, 8.2, 8.4,
			8.6, 8.8);
	table[30] = new Array(7.0, 7.4, 7.7, 8.1, 8.5, 8.8, 9.2, 9.5, 9.9, 10.3,
			10.6, 11.0, 11.3, 11.7, 12.0, 12.4, 12.8, 13.1, 13.5, 13.8, 14.2,
			14.5, 14.9, 15.2, 15.6);
	table[31] = new Array(6.7, 7.0, 7.3, 7.7, 8.0, 8.4, 8.7, 9.1, 9.5, 9.8,
			10.1, 10.5, 10.8, 11.2, 11.5, 11.8, 12.2, 12.5, 12.9, 13.2, 13.5,
			13.9, 14.2, 14.6, 14.9);
	table[32] = new Array(7.7, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0, 10.4, 10.8, 11.1,
			11.5, 11.9, 12.3, 12.7, 13.1, 13.5, 13.9, 14.3, 14.7, 15.0, 15.4,
			15.8, 16.2, 16.6, 17.0);
	table[33] = new Array(6.5, 6.8, 7.2, 7.5, 7.8, 8.2, 8.5, 8.8, 9.2, 9.5,
			9.9, 10.2, 10.5, 10.9, 11.2, 11.5, 11.9, 12.2, 12.5, 12.9, 13.2,
			13.5, 13.8, 14.2, 14.5);
	table[34] = new Array(1.9, 2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8,
			2.9, 3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4.0, 4.1,
			4.2, 4.3);
	table[35] = new Array(4.2, 4.4, 4.6, 4.8, 5.1, 5.3, 5.5, 5.7, 5.9, 6.1,
			6.4, 6.6, 6.8, 7.0, 7.2, 7.4, 7.6, 7.9, 8.1, 8.3, 8.5, 8.7, 8.9,
			9.1, 9.4);
	table[36] = new Array(4.2, 4.4, 4.6, 4.8, 5.1, 5.2, 5.5, 5.7, 5.9, 6.1,
			6.4, 6.6, 6.8, 7.0, 7.2, 7.4, 7.6, 7.9, 8.1, 8.3, 8.5, 8.7, 8.9,
			9.1, 9.4);
	table[37] = new Array(6.6, 7.0, 7.3, 7.7, 8.0, 8.3, 8.7, 9.0, 9.4, 9.7,
			10.0, 10.4, 10.7, 11.0, 11.4, 11.7, 12.1, 12.4, 12.7, 13.1, 13.4,
			13.8, 14.1, 14.4, 14.8);
	table[38] = new Array(3.1, 3.3, 3.4, 3.6, 3.8, 4.0, 4.1, 4.3, 4.4, 4.5,
			4.7, 4.8, 5.0, 5.2, 5.3, 5.5, 5.6, 5.8, 5.9, 6.1, 6.3, 6.4, 6.6,
			6.8, 6.9);
	table[39] = new Array(3.9, 4.1, 4.3, 4.5, 4.7, 4.9, 5.1, 5.3, 5.5, 5.7,
			5.9, 6.0, 6.3, 6.5, 6.7, 6.9, 7.1, 7.3, 7.4, 7.7, 7.9, 8.0, 8.2,
			8.5, 8.6);
	table[40] = new Array(8.5, 8.9, 9.3, 9.8, 10.2, 10.6, 11.0, 11.5, 11.9,
			12.3, 12.8, 13.2, 13.6, 14.1, 14.5, 14.9, 15.4, 15.8, 16.2, 16.6,
			17.1, 17.5, 17.9, 18.4, 18.8);
	table[41] = new Array(1.9, 2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8,
			2.9, 3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4.0, 4.1,
			4.2, 4.3);
	table[42] = new Array(6.8, 7.1, 7.5, 7.8, 8.2, 8.5, 8.8, 9.2, 9.5, 9.9,
			10.2, 10.6, 10.9, 11.3, 11.6, 12.0, 12.3, 12.6, 13.0, 13.3, 13.7,
			14.0, 14.4, 14.7, 15.0);
	table[43] = new Array(3.3, 3.5, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.6, 4.8,
			5.0, 5.2, 5.3, 5.5, 5.7, 5.8, 6.0, 6.2, 6.3, 6.5, 6.7, 6.8, 7.0,
			7.1, 7.3);
	table[44] = new Array(5.5, 5.8, 6.1, 6.4, 6.6, 6.9, 7.2, 7.5, 7.8, 8.0,
			8.3, 8.6, 8.9, 9.2, 9.4, 9.7, 10.0, 10.3, 10.6, 10.8, 11.1, 11.4,
			11.7, 12.0, 12.2);
	table[45] = new Array(3.4, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.7, 4.8, 5.0,
			5.2, 5.4, 5.5, 5.7, 5.9, 6.1, 6.3, 6.4, 6.6, 6.8, 7.0, 7.1, 7.3,
			7.5, 7.7);
	table[46] = new Array(8.5, 8.9, 9.3, 9.8, 10.2, 10.6, 11.0, 11.5, 11.9,
			12.3, 12.8, 13.2, 13.6, 14.1, 14.5, 14.9, 15.4, 15.8, 16.2, 16.6,
			17.1, 17.5, 17.9, 18.4, 18.8);
	table[47] = new Array(3.3, 3.5, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.6, 4.8,
			5.0, 5.2, 5.3, 5.5, 5.7, 5.8, 6.0, 6.2, 6.3, 6.5, 6.7, 6.8, 7.0,
			7.1, 7.3);
	table[48] = new Array(6.6, 7.0, 7.3, 7.7, 8.0, 8.3, 8.7, 9.0, 9.4, 9.7,
			10.0, 10.4, 10.7, 11.0, 11.4, 11.7, 12.1, 12.4, 12.7, 13.1, 13.4,
			13.8, 14.1, 14.4, 14.8);
	table[49] = new Array(5.0, 5.2, 5.5, 5.7, 6.0, 6.2, 6.5, 6.7, 7.0, 7.2,
			7.5, 7.8, 8.0, 8.3, 8.5, 8.8, 9.0, 9.3, 9.5, 9.8, 10.0, 10.0, 10.6,
			10.8, 11.1);
	table[50] = new Array(3.4, 3.6, 3.8, 4.0, 4.1, 4.3, 4.5, 4.7, 4.8, 5.0,
			5.2, 5.4, 5.5, 5.7, 5.9, 6.1, 6.3, 6.4, 6.6, 6.8, 7.0, 7.1, 7.3,
			7.5, 7.7);
	table[51] = new Array(5.0, 6.3, 6.7, 7.0, 7.3, 7.6, 7.9, 8.2, 8.5, 8.8,
			9.1, 9.4, 9.7, 10.0, 10.3, 10.6, 10.9, 11.2, 11.5, 11.8, 12.1,
			12.4, 12.7, 13.0, 13.3);
	table[52] = new Array(4.5, 4.7, 5.0, 5.2, 5.4, 5.6, 5.9, 6.1, 6.3, 6.6,
			6.8, 7.0, 7.3, 7.5, 7.7, 7.9, 8.2, 8.4, 8.6, 8.9, 9.1, 9.3, 9.5,
			9.8, 10.0);
	table[53] = new Array(6.5, 6.8, 7.2, 7.5, 7.8, 8.2, 8.5, 8.8, 9.2, 9.5,
			9.9, 10.2, 10.5, 10.9, 11.2, 11.5, 11.9, 12.2, 12.5, 12.9, 13.2,
			13.5, 13.8, 14.2, 14.5);
	table[54] = new Array(7.7, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0, 10.4, 10.8, 11.1,
			11.5, 11.9, 12.3, 12.7, 13.1, 13.5, 13.9, 14.3, 14.7, 15.0, 15.4,
			15.8, 16.2, 16.6, 17.0);

	function isFieldBlank(theField) {
		if (theField.value.length == 0)
			return true;
		else
			return false;
	}

	function calculate(form, exercise, weight, time) {
		founderror = false;
		if (isFieldBlank(form.exercise)) {
			alert("운동종목 및 강도를 선택 하세요.");
			founderror = true;
		}
		if (!founderror && isFieldBlank(form.weight)) {
			alert("체중을 선택 하세요.");
			founderror = true;
		}
		if (!founderror && isFieldBlank(form.time)) {
			alert("운동 시간을 선택 하세요.");
			founderror = true;
		}

		if (!founderror) {
			form.result.value = Math.round(table[exercise][weight] * time);
		}
	}
</script>
<style type="text/css">
table {
	margin: 10px 0 30px 0;
	border-spacing: 0px;
	border-collapse: collapse;
}

table tr th, table tr td {
	background: #fff;
	color: #fff;
	padding: 7px 4px;
	text-align: center;
	font-size: 14px;
}

table tr td {
	background: #fff;
	color: #47433F;
	border: 1px solid #ddd;
}

@import url(https://fonts.googleapis.com/css?family=Oxygen:400,700);

@import url(https://fonts.googleapis.com/css?family=Knewave);

@import url(https://fonts.googleapis.com/css?family=Luckiest+Guy);

.shipping {
	float: left;
	text-align: center;
	width: 300px;
}

.billing {
	float: left;
	width: 100%;
}

h2 {
	color: #0082C5;
	padding: 0px;
	float: left;
}

input {
	background-color: #f2f2f2;
	border: 1px solid #c8c8c8;
	font-family: 'Oxygen', sans-serif;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0px 0px 10px 0px;
	padding: 8px;
}

select {
	background-color: #f2f2f2;
	border: 1px solid #c8c8c8;
	font-family: 'Oxygen', sans-serif;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0px 0px 10px 0px;
	padding: 8px;
	width: 30%;
}

.checkBox {
	clear: left;
	float: left;
	height: 13px;
	margin: 13px 0px 0px 15px;
	width: 13px;
}

.checkBoxText {
	float: left;
	margin: 10px 0px 10px 15px;
	padding: 0px;
}

}
/*바이오리듬*/
body, td {
	font-size: 12px;
	color: #000000;
	font-family: verdana
}

a {
	text-decoration: none
}

A:hover {
	color: #ff0000;
	text-decoration: none
}

input {
	font-family: verdana;
	border-style: ridge;
	background-color: #EEEEEE
}

.ud input {
	width: 60px;
}

td {
	font-size: 10px;
	color: #808080;
	text-align: center;
}

.txt {
	font-family: "굴림체";
	font-size: 10pt;
	line-height: 14pt;
	color: #000080
}

.title {
	font-family: "굴림체";
	font-size: 10pt;
	color: #FFFFFF;
	font-weight: bold
}

a {
	font-family: "굴림";
	font-size: 10pt;
	color: #000080;
	text-decoration: none;
	line-height: 14pt
}

a:hover {
	color: #ff0000
}

td {
	font-size: 10pt
}
</style>
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
						<h3>메뉴</h3>
						<ul>
							<!-- <li><a href="/semi/html/ij/exercisequestionnaire.jsp">몸상태설문조사</a></li> -->
							<li><a href="/semi/html/ij/boardlistview.jsp">운동검색기</a></li>
							<li><a href="/semi/todayschedule?grade=C">운동스케쥴</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar"></div>
			</div>
			<!--내용-->
			<div id="content">
				<h2 align="center">운동검색기</h2>
				<br> <br> <br> <br>
				<!--게시판 부위별 /  운동명 검색기능-->
				<select id="bodysearch" class="box" style="width: 35%">
					<option value="">부위선택</option>
					<option value="chest">가슴</option>
					<option value="shoulder">등</option>
					<option value="etc">어깨</option>
					<option value="abs">복근</option>
					<option value="lowerbody">하체</option>
					<option value="Thigh">허벅지</option>
					<option value="arm">팔</option>
				</select>
				<!--게시판 운동명 검색기능-->
				<input type="text" placeholder="검색어입력" id="sportname"
					style="width: 45%"> <input type="button" value="검색"
					id="namesearch">
				<!--게시판 리스트 출력-->
				<table id="sportlist" border="1" style="width: 100%">
				</table>
				<!--관리자만 업데이트가능-->
				<%
					if (loginUser != null) {
						if (loginUser.getAdministrator().equals("Y")) {
				%>
				<!--게시글 등록-->
				<input type="button" value="운동검색기업데이트" id="wirte">
				<%
					}
					}
				%>
				<h2>운동칼로리계산</h2>
				<br> <br> <br> <br>
				<form method="get">
					<select name="weight" style="width: 20%">
						<option selected>몸무게</option>
						<option value="0">45 ~ 47</option>
						<option value="1">48 ~ 49</option>
						<option value="2">50 ~ 51</option>
						<option value="3">52 ~ 54</option>
						<option value="4">55 ~ 56</option>
						<option value="5">57 ~ 58</option>
						<option value="6">59 ~ 60</option>
						<option value="7">61 ~ 63</option>
						<option value="8">64 ~ 65</option>
						<option value="9">66 ~ 67</option>
						<option value="10">68 ~ 69</option>
						<option value="11">70 ~ 72</option>
						<option value="12">73 ~ 74</option>
						<option value="13">75 ~ 76</option>
						<option value="14">77 ~ 79</option>
						<option value="15">80 ~ 81</option>
						<option value="16">82 ~ 83</option>
						<option value="17">84 ~ 85</option>
						<option value="18">86 ~ 88</option>
						<option value="19">89 ~ 90</option>
						<option value="20">91 ~ 92</option>
						<option value="21">93 ~ 94</option>
						<option value="22">95 ~ 97</option>
						<option value="23">98 ~ 99</option>
						<option value="24">100 ~</option>
					</select> <select name="exercise" style="width: 40%">
						<option selected>종목 및 강도 선택</option>
						<option value="8">달리기(천천히)</option>
						<option value="9">달리기(평균)</option>
						<option value="10">달리기(빠르게)</option>
						<option value="0">걷기(천천히)</option>
						<option value="1">걷기 (평균)</option>
						<option value="2">걷기 (빠르게)</option>
						<option value="3">골프 (2인조)</option>
						<option value="4">골프 (4인조)</option>
						<option value="5">농구 (하프코트)</option>
						<option value="6">농구 (풀코트)</option>
						<option value="7">궁도</option>
						<option value="11">당구</option>
						<option value="12">댄싱 (왈츠)</option>
						<option value="13">댄싱 (디스코)</option>
						<option value="14">댄싱 (에어로빅)</option>
						<option value="15">등산</option>
						<option value="16">라켓볼</option>
						<option value="17">롤러 스케이팅</option>
						<option value="18">미용체조</option>
						<option value="19">배구 (중정도)</option>
						<option value="20">배구 (심하게)</option>
						<option value="21">배드민턴 단식</option>
						<option value="22">배드민턴 복식</option>
						<option value="23">보트 타기</option>
						<option value="24">볼링</option>
						<option value="25">수영 (배영 25yard/min)</option>
						<option value="26">수영 (배영 40yard/min)</option>
						<option value="27">수영 (접영 20yard/min)</option>
						<option value="28">수영 (접영 40yard/min)</option>
						<option value="29">수영 (자유형 25yard/min)</option>
						<option value="30">수영 (자유형 50yard/min)</option>
						<option value="31">스쿼시 (레크리에이션)</option>
						<option value="32">스쿼시 (경기)</option>
						<option value="33">스키</option>
						<option value="34">승마 (걷기)</option>
						<option value="35">승마 (속보)</option>
						<option value="36">아이스 스케이팅</option>
						<option value="37">아이스하키</option>
						<option value="38">야구 (야수)</option>
						<option value="39">야구 (투수)</option>
						<option value="40">유도</option>
						<option value="41">자전거 타기 (평지를 천천히)</option>
						<option value="42">자전거 타기 (경사지를 질주)</option>
						<option value="43">축구 (중정도)</option>
						<option value="44">축구 (심하게)</option>
						<option value="45">탁구</option>
						<option value="46">태권도</option>
						<option value="47">팬싱 (중정도)</option>
						<option value="48">팬싱 (심하게)</option>
						<option value="49">테니스 (단식)</option>
						<option value="50">테니스 (복식)</option>
						<option value="51">필드하키</option>
						<option value="52">하이킹</option>
						<option value="53">핸드볼 (중정도)</option>
						<option value="54">핸드볼 (경기)</option>
					</select> <select name="time" style="width: 20%">
						<option selected>시간 선택</option>
						<option value="5">5분</option>
						<option value="10">10분</option>
						<option value="20">20분</option>
						<option value="30">30분</option>
						<option value="40">40분</option>
						<option value="50">50분</option>
						<option value="60">1시간</option>
						<option value="90">1시간 30분</option>
						<option value="120">2시간</option>
						<option value="150">2시간 30분</option>
						<option value="180">3시간</option>
						<option value="210">3시간 30분</option>
						<option value="240">4시간</option>
						<option value="270">4시간 30분</option>
						<option value="300">5시간</option>
						<option value="330">5시간 30분</option>
						<option value="360">6시간</option>
					</select> <input type="button" value="측정하기" style="width: 30%"
						onclick="calculate(this.form, this.form.exercise.options[exercise.selectedIndex].value,this.form.weight.options[weight.selectedIndex].value,this.form.time.options[time.selectedIndex].value)">
					<span><input type="text" name="result" maxlength="5"
						size="5" placeholder="kcal" readonly="readonly" style="width: 10%">
						kcal</span>
				</form>
				</form>


			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>