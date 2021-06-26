<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<% 
	request.setCharacterEncoding("UTF-8");
	String get_id = request.getParameter("get_id"); 	
	String get_title = request.getParameter("get_title"); 	
	String get_date = request.getParameter("get_date"); 	
	String get_content = request.getParameter("get_content"); 	
	String get_viewcnt = request.getParameter("get_viewcnt"); 	
%>
<html> 
<head> 
<SCRIPT LANGUAGE="JavaScript">
function submitForm(mode){
	fm.action = "gongji_write.jsp"; 
	fm.submit();
}
function getDate() {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();
	var date = now.getDate();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds();
	document.write(year+"년 "+month+"월 "+date+"일 "+hours+":"+minutes+":"+seconds);
}
</SCRIPT> 
</head> 
<body> 
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
		Statement stmt = conn.createStatement(); 
			
		String QueryTxt;
		QueryTxt = "insert into gongji(title,date,content,viewcnt) value('"+get_title+"',date_format(now(),'%Y-%m-%d %I:%i:%s'),'"+get_content+"',"+get_viewcnt+")";
		stmt.execute(QueryTxt);	
		out.print("<h1>게시물 등록 완료</h1>");		
%>
<%
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
<td><input type=button value="쓰기" OnClick="location.href='gongji_insert.jsp'"></td>
</tr>
</table> 
</FORM> 
</body> 
</html>