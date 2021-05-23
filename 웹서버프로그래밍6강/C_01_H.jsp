<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%
		Class.forName("com.mysql.cj.jdbc.Driver"); 		 
														
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		  
	     ResultSet rset = stmt.executeQuery("select * from examtable"); 
		 
%>
<html> 
<head> 
<title>개표결과 C_02_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100 bgcolor="#00FFFF"><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
<h1>후보별 득표 결과</h1> 
<table cellspacing=3 width=600 border=1>
	<tr>
		<td width=75><p align=center>이름</p></td> 
		<td width=500><p align=center>인기도</p></td>
	</tr> 
<%
		while (rset.next()) { 
		String tupyo_name= rset.getInt(1);
	    String rset.getString(2)
	      
	out.println("<tr>");
	out.println("<td width=75><p align=center>"++"</p></td>"); 
		<td width=500><p align=left><img src='bar.jpg' width=100 height=20>100(25%)</p></td>
	</tr>
</table> 
	     rset.close();
	     stmt.close(); 
	     conn.close(); 
%>
</body> 
</html>