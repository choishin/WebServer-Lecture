<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*"%>
<%@ page import="kr.ac.kopo.kopo40.domain.Board"%>
<%@ page import="kr.ac.kopo.kopo40.dao.BoardDaoImpl"%>
<%@ page import="kr.ac.kopo.kopo40.service.BoardServiceImpl"%>
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
.contaner {
	/*flex : 정렬을 위한 컨테이너*/
	display: flex;
	/*주측 방향 정렬 (가로에서만)*/
	justify-content: flex-start;
	/*교차측 방향 정렬 (가로세로모두에서)*/
	align-items: flex-start;
}

table {
	text-align: center;
}
#buttons {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 1050px;
}
#paging {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 100px;
}

h1, h4 {
	color: #767676;
}
</style>
</head>
<%
try {
	BoardDaoImpl bd = new BoardDaoImpl();
	BoardServiceImpl bs = new BoardServiceImpl();
	int totalCnt = bs.totalCount();

	//총 게시글 수 -> totalcnt
	// default = 0, Contents가 출력되기 시작하는 위치
	String fromPT = "1";
	if (request.getParameter("from") == null) {
		fromPT = "1";
	} else if (Integer.parseInt(request.getParameter("from")) < 0) {
		fromPT = "1";
	} else {
		fromPT = request.getParameter("from");
	}
	// default = 0, 한 페이지에 출력될 게시글 수
	String cntPT = "10";
	if (request.getParameter("cnt") == null) {
		cntPT = "10";
	} else if (request.getParameter("cnt").equals("0")) {
		cntPT = "10";
	} else {
		cntPT = request.getParameter("cnt");
	}

	for (int i = 0; i < fromPT.length(); i++) {
		char ch = fromPT.charAt(i);
		if (ch < '0' || ch > '9') {
	throw new Exception();
		}
	}

	for (int i = 0; i < cntPT.length(); i++) {
		char ch = cntPT.charAt(i);
		if (ch < '0' || ch > '9') {
	throw new Exception();
		}
	}
	//예를들어 총 글이 10개가 있는데, 11번째 글을 보겠다.
	//->그럼 fromPT는 10개가 되야함.
	if (Integer.parseInt(fromPT) > totalCnt) {
		fromPT = Integer.toString(totalCnt - (totalCnt % Integer.parseInt(cntPT)));
	}
%>
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
						aria-label="Search" name="keyword"> <input
						class="btn btn-outline-secondary" type="submit" value="Search">
				</form>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<center>
		<h1>Board List</h1>
		<h4>게시판 목록</h4>
	</center>
	<br>
	<br>
	<br>
	<div class="container">
		<table class="table table-hover">
			<thead>
			<tbody>
				<tr>
					<th scope='row'>
						<p align=center>게시판 번호</p>
					</th>
					<th scope='row'>
						<p align=center>게시판 이름</p>
					</th>
				</tr>
				<%
				//보드 전체를 가지고 온다
				List<Board> boardAll = bs.selectAll();
				
				request.setAttribute("boardAll", boardAll);
				
				int BoardCnt = 1;
				int removeCnt = 0;
				for (int i = 0; i < boardAll.size(); i++) {
					int board_index = boardAll.get(i).getBoard_index();
					String board_title = boardAll.get(i).getBoard_title();
					out.print("<tr>");
					out.print("<td><p align=center>" + board_index + "</p></td>");
					out.print("<td><a href='BoardItem"+BoardCnt+".jsp'>" + board_title + "</a></td>");
					out.print("</tr>");
					BoardCnt++;

				}
				BoardCnt = BoardCnt - removeCnt;
				totalCnt = totalCnt - removeCnt;

				// default = 1, 현재 페이지 수
				int pageNum = ((BoardCnt - 1) / Integer.parseInt(cntPT)) + 1;
				// 한 화면에 출력될 페이지의 갯수
				int printPage = 10;
				// 한 화면에 출력될 페이지 중 '시작' 페이지 수
				int startPage = ((pageNum - 1) / 10) * 10 + 1;
				// 한 화면에 출력될 페이지 중 '마지막' 페이지 수
				int endPage = startPage + printPage - 1;
				// 총 페이지 수
				int totalPage = totalCnt / Integer.parseInt(cntPT);
				// 남은 게시글 수가 한 화면에 출력해야 할 게시글 수보다 작더라도 페이지 수는 1만큼 늘어나야 함
				if (totalCnt > Integer.parseInt(cntPT) * totalPage) {
					totalPage++;
				}
				// 현재 페이지 수가 총 페이지 수보다 큰 경우 현재 페이지를 총 페이지 번호로 치환
				if (pageNum > totalPage) {
					pageNum = totalPage;
				}
				%>
			</tbody>
		</table>
	</div>
<!-- 			<div class="container"> -->
<!-- 			<table class="buttons"> -->
<!-- 				<tr> -->
<!-- 					<td width=1100></td> -->
<!-- 					<td> -->
<!-- 						<div class="btn-group btn-group" role="group" -->
<!-- 							aria-label="Basic outlined example"> -->
<!-- 							<input type="button" class="btn btn-outline-secondary" value="목록" -->
<!-- 								OnClick="location.href='gongji_list.jsp'"> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<div class="btn-group btn-group" role="group" -->
<!-- 							aria-label="Basic outlined example"> -->
<!-- 							<input type="button" class="btn btn-outline-secondary" value="신규" -->
<!-- 								OnClick="window.location='gongji_insert.jsp'"> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
	<div class="container">
		<table class="buttons">
			<tr>
				<td width=1100></td>
				<td>
					<div class="btn-group btn-group" role="group"
						aria-label="Basic outlined example">
						<input type="button" class="btn btn-outline-secondary" value="게시판 목록"
							OnClick="location.href='BoardList.jsp'">
					</div>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<div id="paging">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<%
					/***************************
					 * ◀◀: 첫 페이지로 이동
					 * ◀  : 이전 페이지로 이동
					 **************************/
					out.println("<li class='page-item'><a class='page-link' href='gongji_list.jsp?from="
							+ (((pageNum - 2) * Integer.parseInt(cntPT)) + 1 - removeCnt) + "&cnt=" + cntPT + "'>Previous</a></li>");
					if (Integer.parseInt(cntPT) == 1) {
						for (int i = startPage; i <= endPage; i++) {
							if (endPage > totalPage) {
						endPage = totalPage;
						endPage++;
							}
							out.println("<li class='page-item'><a class='page-link' href='gongji_list.jsp?from="
							+ ((i - 1) * Integer.parseInt(cntPT) + 1) + "&cnt=" + cntPT + "'>" + i + "</a></li>");
						}
					} else {
						for (int i = startPage; i <= endPage; i++) {
							if (endPage > totalPage) {
						endPage = totalPage;
							} //마지막 페이지는 항상 10만을 출력하진 않도록 합니다.
							out.println("<li class='page-item'><a class='page-link' href='gongji_list.jsp?from="
							+ ((i - 1) * Integer.parseInt(cntPT) + 1) + "&cnt=" + cntPT + "'>" + i + "</a></li>");
						}
					}
					/***************************
					 * ▶  : 다음 페이지로 이동
					 * ▶▶: 끝 페이지로 이동
					 **************************/
					out.println("<li class='page-item'><a class='page-link' href='gongji_list.jsp?from="
							+ ((pageNum - 1) * Integer.parseInt(cntPT) + 1) + "&cnt=" + cntPT + "'>Next</a></li>");

					// for debuging
					// 						out.println("pageNum : " + pageNum);
					// 						out.println("fromPT : " + Integer.parseInt(fromPT));
					// 						out.println("나머지 : " + BoardCnt % (Integer.parseInt(cntPT)));

					} catch (Exception e) {
					//out.print("<script>window.location='http://192.168.56.1:8080/wifi.jsp?from=0&cnt=10'</script>");
					out.print(e);
					}
					%>
				</ul>
			</nav>
		</div>
	</div>
	<%-- <c:set var="board" value="<%=boards%>"/> --%>
	<c:forEach var="board" items="${boardAll}">
		<p>
			<c:out value="${board.board_title}" />
		</p>
		<br>
	</c:forEach>

</body>
</html>
