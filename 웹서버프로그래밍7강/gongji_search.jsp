<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<% 
	request.setCharacterEncoding("UTF-8");
	String keyword = request.getParameter("keyword"); 	
%>
<html> 
<head>
<SCRIPT LANGUAGE="JavaScript"> 
function getDate(){
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
		QueryTxt = String.format("SELECT * FROM gongji WHERE title LIKE '%%"+keyword+"%%' or content like '%%"+keyword+"%%';");
		
		ResultSet rset = stmt.executeQuery(QueryTxt);
		String id = "";
		String title = "";
		String date = "";
		String content = "";
		while(rset.next()) {
			id = rset.getString(1);
			title = rset.getString(2);
			date = rset.getString(3);
			content = rset.getString(4);
			
			out.println("<table>");
			out.println("<tr>");
			out.println("<td>");
			out.println(id);
			out.println("</td>");
			out.println("<td>");
			out.println(title);
			out.println("</td>");
			out.println("<td>");
			out.println(date);
			out.println("</td>");
			out.println("<td>");
			out.println(content);
			out.println("</td>");
			out.println("</tr>");
			out.println("</table>");
			
			
		}
				

		rset.close();
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
<td><input type=button value="새글" OnClick="location.href='gongji_insert.jsp'"></td> 
</tr>
</table> 
</form> 
<script>
function characterCheck(obj){
	var regExp = /[\{\}\\?.,;(\)*~~\'!^-_+<>!\#$%&\'\"\(\=]/gi;
	if( regExp.test(obj.value) ) {
	alert('특수문자는 입력하실수 없습니다.');
	obj.value = obj.value.substring(0, obj.value.length - 1 );
	}
}
function noSpaceForm(obj) { 
	var str_space = /\s/;
	if(str_space.exec(obj.value)) { 
		alert("해당 항목에는 공백을 사용할수 없습니다.");
		obj.focus();
		obj.value = obj.value.replace(' ',''); 
	}
}
</script>
</body> 
</html>
