<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<% 
	String get_id = request.getParameter("get_id"); 	
%>
<html> 
<head>
</head> 
<body> 
<FORM METHOD=post name='fm'> 
<table width=650 border=1 cellspacing=0 cellpadding=5>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
		Statement stmt = conn.createStatement(); 
			
		String QueryTxt;
		QueryTxt = String.format("select * from gongji where id="+get_id+";");
		
		ResultSet rset = stmt.executeQuery(QueryTxt);
		int iCnt=0;
		while(rset.next()) {
			
			String id = rset.getString(1);
			String title = rset.getString(2);
			String date = rset.getString(3);
			String content = rset.getString(4);
			
			out.print("<tr> ");
			out.print("<td><b>번호</b></td>");
			out.print("<td>"+id+"</td>");
			out.print("<tr> ");
			out.print("<td><b>제목</b></td> ");
			out.print("<td>"+title+"</td> ");
			out.print("</tr> ");
			out.print("<tr> ");
			out.print("<td><b>일자</b></td> ");
			out.print("<td><b>"+date+"</b></td> ");
			out.print("<tr> ");
			out.print("<td><b>내용</b></td>");
			out.print("<td>"+content+"</td>");
		}
			
		rset.close();
		stmt.close(); 
		conn.close(); 

	}
catch (Exception e) {
	out.print(e);
}
				
%>

</table> 
<table width=650>
<tr>
<td width=600></td>
 <td><input type=button value="목록" OnClick="location.href='gongji_list.jsp'"></td> 
 <td><input type=button value="수정" OnClick="location.href='gongji_update.jsp?get_id=<%=get_id%>'"></td>
 </tr>
</table> 
</FORM> 
</body> 
</html>
