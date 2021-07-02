<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<% 
	request.setCharacterEncoding("UTF-8");
	String post_id = request.getParameter("post_id"); 
	String comment_name = request.getParameter("comment_name"); 	
	String comment_contents = request.getParameter("comment_contents"); 		
	
// 	out.println(post_id);
// 	out.println(comment_name);
// 	out.println(comment_contents);
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
		Connection conn = DriverManager.getConnection("jdbc:mysql://34.83.91.32:3306/kopoctc", "root", "2356");  
		Statement stmt = conn.createStatement(); 
		
		String QueryTxt;
		QueryTxt = "insert into comments(post_id,comment_name,comment_contents,comment_date) value ("+post_id+",'"+comment_name+"','"+comment_contents+"',date_format(now(),'%Y-%m-%d %I:%i:%s'));";
		stmt.execute(QueryTxt);	
							
%>
<%
		stmt.close(); 
		conn.close(); 

}
catch (Exception e) {
	out.print(e);
}
%>
<script>
window.location="gongji_view.jsp?get_id=<%=post_id%>";
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
