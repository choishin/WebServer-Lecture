<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- page errorPage="A_error.jsp" contentType = "text/html; charset=utf-8"-->
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String hubo_kiho = request.getParameter("hubo_kiho");
	String hubo_name = request.getParameter("hubo_name");
%>
<html> 
<head> 
<title>후보등록 A_03_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
	<h1>후보등록 추가</h1> 
	<br>
<%
		try{
		 Class.forName("com.mysql.cj.jdbc.Driver"); 							
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		
	     
	     stmt.execute("insert into hubo_table (hubo_kiho,hubo_name) "
					+ "values("+hubo_kiho+",'"+hubo_name+"');");
	   
	     stmt.close();
	     conn.close();
		 
		 out.println("<h1>후보등록 추가 완료</h1>"); 
		} 
		  catch (SQLSyntaxErrorException e) {
			out.println("테이블이 존재하지 않습니다.");
		} catch (SQLIntegrityConstraintViolationException e) {
			out.println("중복되는 값이 존재합니다.");
		}

%>
	
</body> 
</html>