<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 

<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*,java.io.*" %> 
<html> 
<head>
</head> 
<body>
 <h1>테이블 만들기</h1>
 <%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	Statement stmt = conn.createStatement(); 
%>
<%
try{
	stmt.execute("drop table gongji");
	out.println("drop table gongji OK<br>");
}
catch (Exception e) {
	out.println("drop table gongji Not OK<br>");
	out.println(e.toString());
}
%>
<%
	stmt.execute("create table gongji("
				+ "id int not null primary key auto_increment,"
				+ "title varchar (70),"
				+ "date date,"
				+ "content text);"); 
	out.println("create table OK<br>");
%>
<%
	String sql = "";
	int amount =5;
	
	for(int i =1; i<=amount; i++) {
	sql = "insert into gongji(title,date,content) value('공지"+i+"',date(now()),'공지내용"+i+"')";
	stmt.execute(sql);	
	}
	out.println("inser data OK<br>");
	
	stmt.close();
	conn.close(); 
%> 
</body> 
</html>