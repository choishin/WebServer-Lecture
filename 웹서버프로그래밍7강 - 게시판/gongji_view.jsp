<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%
String get_id = request.getParameter("get_id");
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
<script>
	function getDate() {
		var now = new Date();
		var year = now.getFullYear();
		//자바스크립트의 시스템 시간이 1달 늦음
		var month = now.getMonth()+1;
		var date = now.getDate();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		document.write(year + "년 " + month + "월 " + date + "일 " + hours + ":"+ minutes + ":" + seconds);
	}
</script>
<style>
.contaner {
	/*flex : 정렬을 위한 컨테이너*/
	display: flex;
	/*주측 방향 정렬 (가로에서만)*/
	justify-content: flex-start;
	/*교차측 방향 정렬 (가로세로모두에서)*/
	align-items: flex-start;
}

h1, h2, h3, h4 {
	color: #767676;
}

.writer {
width: 200px;
}
.contents {
width: 600px;
}
.date{
width: 300px;
}
.buttons {
width: 200px;
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
	<FORM METHOD=post name='fm'>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<%
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql://34.83.91.32:3306/kopoctc", "root", "2356");
						Statement stmt = conn.createStatement();

						String QueryTxt;
						QueryTxt = String.format("update gongji set viewcnt=viewcnt+1 where id=" + get_id + ";");
						stmt.execute(QueryTxt);
						QueryTxt = String.format("select * from gongji where id=" + get_id + ";");

						ResultSet rset = stmt.executeQuery(QueryTxt);
						int iCnt = 0;
						while (rset.next()) {
							String id = rset.getString(1);
							String title = rset.getString(2);
							String date = rset.getString(3);
							String content = rset.getString(4);
							String viewcnt = rset.getString(5);

							out.print("<tr> ");
							out.print("<th scope='col' width=200px><b>번호</b></th>");
							out.print("<td>" + id + "</th>");
							out.print("</tr>");
							out.print("<tr>");
							out.print("<th scope='col' width=200px><b>조회수</b></th>");
							out.print("<td>" + viewcnt + "</th>");
							out.print("</tr>");
							out.print("<th scope='col' width=200px><b>제목</b></th> ");
							out.print("<td>" + title + "</th> ");
							out.print("</tr> ");
							out.print("<tr> ");
							out.print("<th scope='col' width=200px><b>일자</b></th> ");
							out.print("<td>" + date + "</th> ");
							out.print("<tr>");
							out.print("<th scope='col'width=200px style='vertical-align: top; height:auto;'><b>내용</b></th>");
							out.print("<td height=200px style='vertical-align: top; height:auto;'>" + content + "</th>");
							out.print("</tr>");

						}

						rset.close();
						stmt.close();
						conn.close();

					} catch (Exception e) {
						out.print(e);
					}
					%>
				
				</tbody>
			</table>
		</div>
		<br>
		<div class="container">
			<h3>댓글보기</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" class="writer">작성자</th>
						<th scope="col" class="contents">내용</th>
						<th scope="col" class="date">일자</th>
						<th class="buttons"></th>
					</tr>
					<%
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql://34.83.91.32:3306/kopoctc", "root", "2356");
						Statement stmt = conn.createStatement();

						String QueryTxt;
						QueryTxt = String.format("select * from comments where post_id=" + get_id + ";");
						ResultSet rset = stmt.executeQuery(QueryTxt);

						while (rset.next()) {
							String comment_name = rset.getString(2);
							String comment_contents = rset.getString(3);
							String comment_date = rset.getString(4);

							out.print("<tr>");
							out.print("<td class='writer'>" + comment_name + "</th> ");
							out.print("<td class='contents'>" + comment_contents + "</th> ");
							out.print("<td class='date'>" + comment_date + "</th>");
							out.print("<td class='buttons'></th>");
							out.print("</tr>");

						}

						rset.close();
						stmt.close();
						conn.close();

					} catch (Exception e) {
						out.print(e);
					}
					%>
				</thead>
			</table>
			</div>
	</FORM>
	<!--댓글창-->
	<br>
<div class="container">
	<form method="post" action="comment_insert.jsp">
		<table class="table table-hover">
			<thead>
				<tr>
					<input type=hidden name="post_id" value="<%=get_id%>">
				</tr>
				<tr>
					<th scope="col" class="writer" style="vertical-align: top;">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="작성자"
								aria-label="Username" aria-describedby="basic-addon1"
								name='comment_name' placeholder='작성자' maxlength=70 minlength=1
								required>
						</div>
					</th>
					<th scope="col" class="contents">
						<div class="input-group">
							<textarea class="form-control" aria-label="With textarea"
								name='comment_contents' rows='2' cols='70'
								placeholder='댓글을 작성해주세요' maxlength=200 minlength=1 required></textarea>
						</div>
					</th>
					<th scope="col" class="date" style="vertical-align: top;"><script>
						getDate()
					</script></th>
					<th scope="col" style="vertical-align: top;"><input
						class="btn btn-outline-secondary" type="submit" value="등록">
					<input
						class="btn btn-outline-secondary" type="reset" value="취소">
					</th>
				</tr>
		</table>
	</form>
	<table width=1000>
		<tr>
			<th scope="col" width=450></th>
			<th scope="col"><input class="btn btn-outline-secondary"
				type="button" value="목록" OnClick="location.href='gongji_list.jsp'">
			</th>
			<th scope="col"><input class="btn btn-outline-secondary"
				type="button" value="수정"
				OnClick="location.href='gongji_update.jsp?get_id=<%=get_id%>'">
			</th>
			<th scope="col" width=450></th>
		</tr>
	</table>
<div>
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
</body>
</html>
