<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
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
<style>
/*스크롤 없애기*/
body{
	overflow-y: scroll;
}
body::-webkit-scrollbar {
    display: none; 
}
.contaner {
	height: 1200px;
	/*flex: 정렬을 위한 컨테이너 */
	display: flex;
	/*주측 방향 정렬 (가로에서만)*/
	justify-content: flex-start;
	/*교차측 방향 정렬 (가로세로모두에서)*/
	align-items: flex-start;
}
h1, h4 {
	color: #767676;
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
						aria-label="Search" name="keyword"> 
					<input class="btn btn-outline-secondary" type="submit" value="Search">
				</form>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<center>
		<h1>Board2</h1>
		<h4>게시글을 누르면 페이지 이동없이 볼 수 있는 게시판</h4>
	</center>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="accordion" id="accordionExample">
			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://34.83.91.32:3306/kopoctc?autoReconnect=true", "root",
				"2356");
				Statement stmt = conn.createStatement();

				String QueryTxt;
				QueryTxt = String.format("select * from gongji order by id desc;");

				ResultSet rset = stmt.executeQuery(QueryTxt);
				while (rset.next()) {
					int id = rset.getInt(1);
					String title = rset.getString(2);
					String date = rset.getString(3);
					String content = rset.getString(4);
					String viewcnt = rset.getString(5);
					
					if(title.contains("삭제된 글 입니다.")) {
						continue;
					}

					out.print("<div class='accordion-item'>");
					out.print("<h2 class='accordion-header' id='heading" + id + "'>");
					out.print(
					"<button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#collapse"
							+ id + "' aria-expanded='false' aria-controls='collapse" + id + "'>");
					out.print(title);
					out.print("</button>");
					out.print("</h2>");
					out.print("<div id='collapse" + id + "' class='accordion-collapse collapse' aria-labelledby='heading" + id
					+ "' data-bs-parent='#accordionExample'>");
					out.print("<div class='accordion-body'>");
					out.print(content);
					out.print("</div></div></div>");

				}
			%>
			<%
			rset.close();
			stmt.close();
			conn.close();

			} catch (Exception e) {
			out.print(e);
			}
			%>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>
</html>
