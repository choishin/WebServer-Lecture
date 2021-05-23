<%@ page contentType="text/html; charset=utf-8" language="java" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.sql.*,javax.sql.*,java.net.*,java.io.*" %> 
<html> 
<head> 
</head> 
<body> 
<h1>Make table</h1>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sjcu", "root", "sjcu1234"); 
	Statement stmt = conn.create Statemento;
	Try { 
	// stmt.execute("drop table gongji");
	   out.println("drop table gongji OK<br>'); 
	}catch( Exception e) {
		out.println("drop table gongji NOT OK<br>"); 
		out.println( e.toString();
%> 
<% 
	stmt.execute("create table gongji"
		id int not null primary key auto-increment, 
		title varchar(70), 
		date date, 
		content text);"); 
%> 
<%
	String sal=""; 
	sql="insert into gongji(title, date, content) values(' $1.date(nowo), A8481')"; 
	stmt.execute(sal); 
	sql ="insert into gongji (title, date,content) values(' |182date (nowo), A8482 )"; 
	stmt.execute(sal); 
	sql ="insert into gongji (title, date,content) values(2|1813, date (nowo), A843)"; 
	stmt.execute(sql); 
	sql ="insert into gongji (title, date, content) values( | AF84',date (nowo), A 4 84')"
	stmt.execute(sal);
	sql ="insert into gongji (title, date,content) values( AF85' date(now). | 1784 85')"; 
	stmt.execute(sal); stmt.close(); conn.closeO;
%>
</body> 
</html>