<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<html> 
<head> 
</head> 
<body>
<form method="get" action="requestTable.jsp"> 
	이름 : <input type="text" name="key"><br>
		 <input type="submit" value="입력"> 
</form> 
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection ("jdbc:mysql://localhost/kopoctc", "root", "kopoctc"); 
	Statement stmt = conn.createStatement();
	String ckey = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from examtable where name = '"+ckey+"';");
	
%>
<h1>[<%=ckey%>]조회</h1>
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
		String studentid = Integer.toString(rset.getInt(2));
		String kor = Integer.toString(rset.getInt(3));
		String eng = Integer.toString(rset.getInt(4));
		String mat = Integer.toString(rset.getInt(5));
	
		out.println("<tr>"); 
		out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>"); 
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
