<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<html> 
<head> 
</head> 
<body> 
<h1>성적 조회후 정정/삭제</h1>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection ("jdbc:mysql://localhost/kopoctc", "root", "kopoctc"); 
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select * from examtable;");
	
	out.println("<table cellspacing=1 width=600 border=1>");
	out.println("<form method=&quot;get&quot; action=&quot;TableShow_request2.jsp&quot;>"); 
	
		while (rset.next()) {
			String name = rset.getString(1);
			String studentid = Integer.toString(rset.getInt(2));
			String kor = Integer.toString(rset.getInt(3));
			String eng = Integer.toString(rset.getInt(4));
			String mat = Integer.toString(rset.getInt(5));
		
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"이름"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type=&quot;text&quot; value="+name+" name=&quot;nameSet&quot;>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"학번"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type=&quot;text&quot; value="+studentid+">");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"국어"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type=&quot;text&quot; value="+kor+" name=&quot;korSet&quot;>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"영어"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type=&quot;text&quot; value="+eng+" name=&quot;engSet&quot;>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"수학"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type=&quot;text&quot; value="+mat+" name=&quot;matSet&quot;>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("</form> ");
			out.println("</table>");
		}

		rset.close();
		stmt.close();
		conn.close();
	

%>
</body> 
</html>