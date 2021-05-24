<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<html> 
<head> 
</head> 
<body>
<%
	/*여기에서 파라미터를 받아옴*/
	String _name = request.getParameter("name");
	if(_name.length()>7 ||_name.contains("'")||_name.contains("<!")
	||_name.contains("drop")||_name.contains("delete")) {
	out.println("<script>alert('다시 입력해주세요.');</script>");
		}
	String _studentid = request.getParameter("studentid");
	String _kor = request.getParameter("kor");
	String _eng = request.getParameter("eng");
	String _mat = request.getParameter("mat");
%>
<h1>성적입력추가완료</h1>
<table cellspacing=1 width=600 border=1> 

<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc"); 
	Statement stmt = conn.createStatement(); 
	
	stmt.execute("insert into examtable values('"+_name+"',"+_studentid+","+_kor+","+_eng+","+_mat+");"); 
	ResultSet rset = stmt.executeQuery("select * from examtable where studentid = '"+_studentid+"';"); 
	
	while (rset.next()) {
		out.println("<tr>"); 
		out.println("<td width=20><p align=center>이름</p></td>"); 
		out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>"); 
		out.println("</tr>");
		out.println("<tr>"); 
		out.println("<td width=20><p align=center>학번</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2)) +"</p></td>"); 
		out.println("</tr>");
		out.println("<tr>"); 
		out.println("<td width=20><p align=center>국어</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3)) +"</p></td>"); 
		out.println("</tr>");
		out.println("<tr>"); 
		out.println("<td width=20><p align=center>영어</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4)) +"</p></td>"); 
		out.println("</tr>");
		out.println("<tr>"); 
		out.println("<td width=20><p align=center>수학</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5)) +"</p></td>"); 
		out.println("</tr>");
	}
	out.println("</table>");

	stmt.close(); 
	conn.close();
}

catch(SQLSyntaxErrorException e) {
	out.println("잘못입력하셨습니다.");
}

catch(SQLIntegrityConstraintViolationException e) {
	out.println("이미 존재하는 값입니다. 다른 값을 입력해주세요.");
}

catch (Exception e) {
	out.println("<script>alert('다시 입력해주세요.');</script>");
	out.println("History.go(-1)");
	}

%>
</body> 
</html>