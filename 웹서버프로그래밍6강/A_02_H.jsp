<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- page errorPage="A_error.jsp" contentType = "text/html; charset=utf-8" -->
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String hubo_kiho = request.getParameter("hubo_kiho");
	String hubo_name = request.getParameter("hubo_name");
%>
<html> 
<head> 
<title>후보등록 A_02_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
	<h1>후보등록 삭제</h1> 
	<br>
	
<%
		try{
		 Class.forName("com.mysql.cj.jdbc.Driver");  							
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		
	     
	     stmt.execute("DELETE FROM hubo_table WHERE hubo_kiho="+hubo_kiho+" and hubo_name='"+hubo_name+"';"); 		
	   
	     stmt.close(); 
	     conn.close();
		 out.println("<h1>후보등록 삭제 완료</h1>");
		} catch (Exception e) {
			out.println(e);
		}
%>
</body> 
</html>