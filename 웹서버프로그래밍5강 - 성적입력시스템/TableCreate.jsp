<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Create_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*" %> 
<html> 
<head>
</head> 
<body>
 <h1>테이블 만들기 OK</h1>
 <%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	Statement stmt = conn.createStatement(); 
	stmt.execute("create table examtable("
				+ "name varchar (20),"
				+ "studentid int not null primary key, " 
				+ "kor int,"
				+ "eng int," 
				+ "mat int);"); 
	stmt.close(); 
	stmt.close();
	conn.close(); 
%> 
</body> 
</html>