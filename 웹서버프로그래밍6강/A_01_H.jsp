<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="A_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%
		try{
		 Class.forName("com.mysql.cj.jdbc.Driver");  							
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		
	     ResultSet rset = stmt.executeQuery("select * from hubo_table ;");
		 
%>

<html>
<head> 
<title>후보등록 A _01_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1>
	<tr> 
		<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
<h1>후보등록</h1> 
<table cellspacing=3 width=600 border=1> 
<tr>
<td><p align=center>후보명 입력</p></td> 
</tr>
<%
		String hubo_kiho = "";
		String hubo_name = "";
		 while (rset.next()) { 
			hubo_kiho = rset.getString(1);
			hubo_name = rset.getString(2);
	
			out.println("<tr>");
			out.println("<td>"); 
			out.println("<form method='post' action='A_02_H.jsp'>");
			out.println("기호: <input type='text' name='hubo_kiho' value='"+hubo_kiho+"' readonly> 이름: <input type='text' name='hubo_name' value='"+hubo_name+"' readonly> <input type='submit' value='삭제'>");
			out.println("</form>");
			out.println("</td>");
			out.println("</tr>");
		 }
		 
		 rset = stmt.executeQuery("select max(hubo_kiho) from hubo_table;");
		 int hubo_number = 0;
		 while (rset.next()) {
				hubo_number = rset.getInt(1);
		 }
		 
%>
<tr>
<td> 
	<form method="post" action="A_03_H.jsp"> 
	기호: <input type="text" name="hubo_kiho" value="<%=hubo_number+1%>"> 이름: <input type="text" name="hubo_name" value=""> <input type="submit" value="추가"> 
	</form>
</td>
</tr>
</table>
<%
		 stmt.close(); 
	     conn.close();
		} catch (Exception e) {
				out.println(e);
		}
%>
</body> 
</html>