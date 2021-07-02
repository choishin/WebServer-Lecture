<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<% 
	String get_id = request.getParameter("get_id"); 	
	String get_title = request.getParameter("get_title"); 	
	String get_date = request.getParameter("get_date"); 	
	String get_content = request.getParameter("get_content"); 	
%>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
	function submitForm(mode) {
		fm.action = "gongji_write.jsp?key=INSERT";
		fm.submit();
	}
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
</head>
<body>
	<form method="get" action="gongji_write.jsp">
		번호: <input type=text name=get_id value=<%=get_id+1%> readonly>
		제목: <input type=text name=get_title size=70 maxlength=70
			onkeyup='characterCheck(this); noSpaceForm(this);'
			onkeydown='characterCheck(this); noSpaceForm(this);'
			onchange='noSpaceForm(this);' autocomplete='off'
			onpaste='return false;' required> 일자: <input type=text
			name=get_date readonly> <input type="submit" value="전송">
	</form>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.171.18:3306/kopoctc", "root", "kopoctc");  
		Statement stmt = conn.createStatement(); 
			
		String QueryTxt;
		QueryTxt = "insert into gongji(title,date,content) value('"+get_title+"',date(now()),'"+get_content+"')";
		stmt.execute(QueryTxt);
%>
<h1>게시물 등록 완료</h1>
<%
		stmt.close(); 
		conn.close(); 
}
catch (Exception e) {
	out.print(e);
}
%>
	<table width=650>
		<tr>
			<td width=600></td>
			<td><input type=button value="취소"
				OnClick="location.href='gongji_list.jsp'"></td>
			<td><input type=button value="쓰기" OnClick="submitForm('write')"></td>
		</tr>
	</table>
</body>
</html>