<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Delete_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*" %> 
<html> 
<head>
</head> 
<body>
 <h1>테이블 지우기</h1>
 <%
		Class.forName("com.mysql.cj.jdbc.Driver");  													
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		
	     stmt.execute("drop table examtable;"); 		
	   
	     stmt.close(); 
	     conn.close(); 
%> 
</body> 
</html>