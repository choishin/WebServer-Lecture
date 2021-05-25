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
<style>
table{
	    border-collapse: collapse;
        border-spacing: 0px;
		margin:0 50px 0 50px;
		padding:1px 0 0 0;
		border:1px solid #ddd;
		border-top:0;
		border-right:0;
		font-size:15px;
		font-family:Tahoma, Geneva, sans-serif;
		list-style:none
}
.title {
		margin-left: 50px;
}
.subtitle {
		margin-left: 60px;
}
</style>
</head> 
<body LINK= "#767676" VLINK="#767676"> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100 bgcolor="#ddd"><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
	<div class="title">
	<h1 style="font-weight:bold;color:#767676">후보등록 추가</h1> 
	</div>
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
		 
		 out.println("<div class='subtitle'>");
		 out.println("<h2 style='font-weight:bold;color:#767676'>후보등록 추가 완료</h2>"); 
		 out.println("</div>");
		} 
		catch (SQLSyntaxErrorException e) {
			out.println("잘못된 값이 입력되었습니다.");
	    }
		catch (SQLIntegrityConstraintViolationException e) {
			out.println("중복되는 값이 존재합니다.");
		}

%>
	
</body> 
</html>