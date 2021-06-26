<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<% 
	request.setCharacterEncoding("UTF-8");
	String get_id = request.getParameter("get_id"); 
%>
<html> 
<head>
<SCRIPT LANGUAGE="JavaScript"> 
</SCRIPT> 
</head> 
<body> 
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
		Statement stmt = conn.createStatement(); 
			
		String QueryTxt;
		QueryTxt = String.format("delete from gongji where id="+get_id+";");
		stmt.execute(QueryTxt); 
		QueryTxt = String.format("delete from comments where post_id="+get_id+";");
		stmt.execute(QueryTxt); 	
		out.println("<h1>게시글 삭제 완료</h1>");
		
		stmt.close(); 
		conn.close(); 

}
catch (Exception e) {
	out.print(e);
}
%>
<table width=650>
<tr>
<td width=600></td> 
<td><input type=button value="목록" OnClick="location.href='gongji_list.jsp'"></td> 
<td><input type=button value="신규" OnClick="location.href='gongji_insert.jsp'"></td>
</tr>
</table> 
</body> 
</html>