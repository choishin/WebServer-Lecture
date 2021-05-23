<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%
		Class.forName("com.mysql.cj.jdbc.Driver"); 		 
														
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		  
	     ResultSet rset = stmt.executeQuery("select * from examtable"); 
		 
	     while (rset.next()) { 
		     rset.getInt(1),
	    	 rset.getString(2)
	      }
	     
	     rset.close();
	     stmt.close(); 
	     conn.close(); 
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
	<h1>김일동 후보 득표 성향</h1> 
<table cellspacing=3 width=600 border=1>
	<tr>
		<td width=75><p align=center>연령대</p></td> 
		<td width=500><p align=center>인기도</p></td>
	</tr> 
	<tr>
		<td width=75><p align=center>10대</p></td> 
		<td width=500><p align=left><img src='bar.jpg' width=100 height=20>100(25%)</p></td>
	</tr>
	<tr>
		<td width=75><p align=center>20대</p></td> 
		<td width=500><p align=left><img src='bar.jpg' width=300 height=20>300(75%)</p></td>
	</tr>
	<tr>
		<td width=75> <p align=center> 30대</p></td> 
		<td width=500> <p align=left><img src='bar.jpg' width=200 height=20>200(50%)</p></td>
	</tr>
	<tr>
		<td width=75><p align=center>40대</p></td> 
		<td width=500><p align=left><img src='bar.jpg' width=80 height=20>80(20%)</p></td>
	</tr>
	<tr>
		<td width=75> <p align=center> 50대 </p> </td> 
		<td width=500><p align=left><img src='bar.jpg' width=80 height=20>80(20%)</p></td>
	</tr>
	<tr>
		<td width=75><p align=center> 60대</p></td> 
		<td width=500><p align=left><img src='bar.jpg' width=80 height=20>80(20%)</p></td>
	<tr>
		<td width=75><p align=center> 70대</p></td> 
		<td width=500><p align=left><img src='bar.jpg' width=80 height=20>80(20%)</p></td>
	</tr>
	<tr>
		<td width=75><p align=center> 8O대 </p></td> 
		<td width=500><p align=left><img src='bar.jpg' width=80 height=20>80(20%)</p></td>
	</tr> 
	<tr>
		<td width=75> <p align=center> 90CH</p></td> 
		<td width=500><p align=left> <img src='bar.jpg' width=80 height=20>80(20%)</p></td>
	</tr>
	</table> 
</body> 
</html>