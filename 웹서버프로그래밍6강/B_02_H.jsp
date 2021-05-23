<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" -->
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>

<%
request.setCharacterEncoding("UTF-8");
String[] tupyo_kiho = request.getParameterValues("tupyo_kiho");
String[] tupyo_age = request.getParameterValues("tupyo_age");
%>

<%
	String kiho = "";
	if (tupyo_kiho != null) { 
		for(int i=0; i<tupyo_kiho.length; i++){
			kiho= kiho+tupyo_kiho[i];
		}
		//out.println(kiho);
	}
	String age = "";
	if (tupyo_age != null) {
		for(int i=0; i<tupyo_age.length; i++){
			age = age +tupyo_age[i];
		}
		//out.println(age);
	}
%>

<html> 
<head> 
<title>투표 B_02_H.jsp </title> 
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
	<br>
<%
		try{
		 Class.forName("com.mysql.cj.jdbc.Driver"); 							
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.147.18:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		
	     
	     stmt.execute("insert into tupyo_table values("+kiho+",'"+age+"');");
	   
	     stmt.close();
	     conn.close();
		 
		 out.println("<h1>투표를 완료하였습니다.</h1> "); 
		} 
		  catch (Exception e) {
			  out.println(e);
		}
%>

</body> 
</html>