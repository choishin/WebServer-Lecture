<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
// out.println(keyword);
%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<SCRIPT LANGUAGE="JavaScript">
	function getDate() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth();
		var date = now.getDate();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		document.write(year + "년 " + month + "월 " + date + "일 " + hours + ":"
				+ minutes + ":" + seconds);
	}
</SCRIPT>
<style>
.contaner {
	/*flex : 정렬을 위한 컨테이너*/
	display: flex;
	/*주측 방향 정렬 (가로에서만)*/
	justify-content: flex-start;
	/*교차측 방향 정렬 (가로세로모두에서)*/
	align-items: flex-start;
}

#table {
	width: 900px;
	margin-top: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

tr, th {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Board-Project</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="BoardList.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href='gongji_list.jsp'>board1</a></li>
					<li class="nav-item"><a class="nav-link"
						href='gongji_list2.jsp'>board2</a></li>
				</ul>
				<form class="d-flex" method='get' action='gongji_search.jsp'>
					<input class="form-control me-2" type="text" placeholder="Search"
						aria-label="Search" name="keyword" required> 
					<input class="btn btn-outline-secondary" type="submit" value="Search">
				</form>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<h2><%=keyword%>의 검색결과 입니다.</h2>
	<br>
	<br>
			<table class="table table-hover">
			<thead>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://34.83.91.32:3306/kopoctc", "root", "2356");
		Statement stmt = conn.createStatement();

		String QueryTxt;
		QueryTxt = String.format(
		"SELECT * FROM gongji WHERE title LIKE '%%" + keyword + "%%' or content like '%%" + keyword + "%%';");

		ResultSet rset = stmt.executeQuery(QueryTxt);
		String id = "";
		String title = "";
		String date = "";
		String content = "";
		String viewcnt = "";
		String noResult ="";
		while (rset.next()) {
			id = rset.getString(1);
			title = rset.getString(2);
			date = rset.getString(3);
			content = rset.getString(4);
			viewcnt = rset.getString(5);

			if (id == "" || id == null) {
			noResult ="<h3> 검색 결과가 없습니다</h3>";
			out.println("<td colspan='2'>"+noResult+"</td>");
			}
			else {
			noResult ="";
			}

			out.println("<tr>");
			out.print("<td width=50px><p align=center>" + id + "</p></td>");
			out.println("<td width=300px>");
			out.println(title);
			out.println("</td>");
			out.println("<td width=200px>");
			out.println(date);
			out.println("</td>");
			out.println("<td width=700px>");
			out.println(content);
			out.println("</td>");
			out.println("</tr>");
		}
	%>
			</tbody>
		</table>
		<br>
		<br>
	<div class="container">
		<div id="textbox">
			<table>
				<tr>
					<td width="100"></td>
					<td width="900"><input class="btn btn-outline-secondary"
						type=button value="목록" OnClick="location.href='gongji_list.jsp'">
						<input class="btn btn-outline-secondary" type=button value="신규"
						OnClick="location.href='gongji_insert.jsp'"></td>
				</tr>
			</table>
		</div>
	</div>
	</form>
	<script>
		function characterCheck(obj) {
			var regExp = /[\{\}\\?.,;(\)*~~\'!^-_+<>!\#$%&\'\"\(\=]/gi;
			if (regExp.test(obj.value)) {
				alert('특수문자는 입력하실수 없습니다.');
				obj.value = obj.value.substring(0, obj.value.length - 1);
			}
		}
		function noSpaceForm(obj) {
			var str_space = /\s/;
			if (str_space.exec(obj.value)) {
				alert("해당 항목에는 공백을 사용할수 없습니다.");
				obj.focus();
				obj.value = obj.value.replace(' ', '');
			}
		}
	</script>
	<%
	rset.close();
	stmt.close();
	conn.close();

	} catch (Exception e) {
	out.print(e);
	}
	%>
</body>
</html>
