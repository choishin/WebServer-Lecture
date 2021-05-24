<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" %>
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
<title>투표 B_01_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100 bgcolor="#00FFFF"><a href="B_01_H.jsp">투표</a></td>
		<td width=100><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
<h1>투표하기</h1> 
<table cellspacing=3 width=600 border=1>
	<tr> 
	<form method="post" action="B_02_H.jsp">
		<td width=200><p align=center> 
		<select name="tupyo_kiho">
<%
		int hubo_kiho=0;
		String hubo_name = "";
		while (rset.next()) { 
			hubo_kiho = rset.getInt(1);
			hubo_name = rset.getString(2);
			out.println("<option value='"+hubo_kiho+"'>"+hubo_kiho+" "+hubo_name+"</option>");	
		}
		 stmt.close(); 
	     conn.close();
	} catch (Exception e) {
			out.println(e);
	}
%>
		</select>
		</p></td> 
		<td width=200><p align=center> 
		<select name="tupyo_age">
			<option value='1'>10대</option>
			<option value='2'>20대</option>
			<option value='3'>30대</option>
			<option value='4'>40대</option>
			<option value='5'>50대</option>
			<option value='6'>60대</option>
			<option value='7'>70대</option>
			<option value='8'>80대</option>
			<option value='9'>90대</option>
		</select>
		</p></td> 
		<td> 
		<input type=submit value="투표하기"> 
		</td>
	</form>
	</tr>	
	</table> 
</body> 
</html>
