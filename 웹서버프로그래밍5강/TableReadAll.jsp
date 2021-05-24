<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<html> 
<head> 
</head> 
<body>


<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection ("jdbc:mysql://localhost/kopoctc", "root", "kopoctc"); 
	Statement stmt = conn.createStatement();
	String ckey = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from examtable;");
	
%>
<h1>전체 조회</h1>
<table cellspacing=1 width=600 border=1> 
	<tr>
		<td width=50><p align=center>이름</p></td> 
		<td width=50><p align=center>학번</p></td> 
		<td width=50><p align=center>국어</p></td> 
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td> 
</tr>

<%
		
	while (rset.next()) {
		String name = rset.getString(1);
		out.println("<tr>"); 
		out.println("<td width=50><p align=center><a href=requestTable.jsp?key="+name+">"+rset.getString(1)+"</a></p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2)) +"</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3)) +"</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4)) +"</p></td>"); 
		out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5)) +"</p></td>"); 
		out.println("<tr>");
	}
	out.println("</table>");
	rset.close(); 
	stmt.close(); 
	conn.close();


%>
</body> 
</html>