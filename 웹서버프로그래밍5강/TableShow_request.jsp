<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="TableShow_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*,java.io.*" %> 
<html> 
<head> 
</head> 
<body> 
<h1>성적 조회후 정정/삭제</h1>

<%
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection ("jdbc:mysql://localhost/kopoctc", "root", "kopoctc"); 
		Statement stmt = conn.createStatement();
		String get_studentid = request.getParameter("get_studentid");
		ResultSet rset = stmt.executeQuery("select * from examtable where studentid ='"+get_studentid+"';");

		while (rset.next()) {
			String name = rset.getString(1);
			String studentid = Integer.toString(rset.getInt(2));
			String kor = Integer.toString(rset.getInt(3));
			String eng = Integer.toString(rset.getInt(4));
			String mat = Integer.toString(rset.getInt(5));

			out.println("<table cellspacing=1 width=600 border=1>");
			out.println("<form method='post' action='TableShow_request2.jsp'>"); 
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"이름"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type='text' onkeyup='characterCheck(this)' onkeydown='characterCheck(this)' value="+name+" name='nameSet'>");
			out.println(" <script>");
			out.println("function characterCheck(obj){");
			out.println("var regExp = <!--'drop table''delete");
			out.println(" </script>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"학번"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type='number' min='209900' value="+get_studentid+" name='get_studentid'>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"국어"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type='number' min='0' max='100' value="+kor+" name='korSet'>");
			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"영어"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type='number' min='0' max='100' value="+eng+" name='engSet'>");
			out.println("</p></td>"); 
			out.println("</tr>");
				out.println("<tr>"); 
			out.println("<td width=20><p align=center>"+"수학"+"</p></td>"); 
			out.println("<td width=50><p align=center>"
						+"<input type='number' min='0' max='100' value="+mat+" name='matSet'>");

			out.println("</p></td>"); 
			out.println("</tr>");
			out.println("</table>");

			}
			}
			catch(SQLSyntaxErrorException e) {
			out.println("다시 입력해주세요.");
			}			
			catch (Exception e) {
			out.println("<script>alert('다시 입력해주세요.');</script>");
			out.println("History.go(-1)");
	}

%>
<br>
<input type="submit" value="수정">
<input type="submit" value="다시하기">
</form>
</body> 
</html>