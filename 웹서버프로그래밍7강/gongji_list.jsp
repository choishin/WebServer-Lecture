<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<html> 
<head> 
</head> 
<body>
<table cellspacing=1 width=600 border=1> 
<tr>
<td width=50><p align=center>번호</p></td> 
<td width=500><p align=center>제목</p></td>
<td width=100><p align=center>등록일</p></td>
</tr>

<% 
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
		Statement stmt = conn.createStatement(); 
			
		String QueryTxt;
		QueryTxt = String.format("select * from gongji order by id desc;");
		
		ResultSet rset = stmt.executeQuery(QueryTxt);
		while(rset.next()) {
			int id = rset.getInt(1);
			String title = rset.getString(2);
			String date = rset.getString(3);
			String content = rset.getString(4);
			
			out.print("<tr>");
			out.print("<td width=50> <p align=center>"+id+"</p></td>");
			out.print("<td width=500><p align=center><a href='gongji_view.jsp?get_id="+id+"' onClick=>"+title+"</a></p></td>");
			out.print("<td width=100> <p align=center>"+date+"</p></td>");
			out.print("</tr>");
			
			}
%> 
<%
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
<td width=550></td>
<td><input type=button value="신규" OnClick="window.location='gongji_insert.jsp'"></td>
</tr>
</table> 
</body> 
</html>
