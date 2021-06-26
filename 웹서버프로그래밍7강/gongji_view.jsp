<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<% 
	String get_id = request.getParameter("get_id"); 	
%>
<html> 
<head>
<script>
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
</script>
</head> 
<body> 
<FORM METHOD=post name='fm'> 
<table width=1000 border=1 cellspacing=0 cellpadding=5>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
		Statement stmt = conn.createStatement(); 
		
		String QueryTxt;
		QueryTxt = String.format("update gongji set viewcnt=viewcnt+1 where id="+get_id+";");	
		stmt.execute(QueryTxt); 
		QueryTxt = String.format("select * from gongji where id="+get_id+";");
		
		ResultSet rset = stmt.executeQuery(QueryTxt);
		int iCnt=0;
		while(rset.next()) {		
			String id = rset.getString(1);
			String title = rset.getString(2);
			String date = rset.getString(3);
			String content = rset.getString(4);
			String viewcnt = rset.getString(5);
			
			out.print("<tr> ");
			out.print("<td><b>번호</b></td>");
			out.print("<td>"+id+"</td>");
			out.print("</tr> ");
			out.print("<tr> ");
			out.print("<td><b>조회수</b></td>");
			out.print("<td>"+viewcnt+"</td>");
			out.print("</tr> ");
			out.print("<td><b>제목</b></td> ");
			out.print("<td>"+title+"</td> ");
			out.print("</tr> ");
			out.print("<tr> ");
			out.print("<td><b>일자</b></td> ");
			out.print("<td><b>"+date+"</b></td> ");
			out.print("<tr>");
			out.print("<td><b>내용</b></td>");
			out.print("<td>"+content+"</td>");	
			out.print("</tr>");

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
<br>
<h3>댓글보기</h3>
<table width=1000 border=1 cellspacing=0 cellpadding=5>
<tr>
<td>작성자</td>
<td>내용</td>
<td>일자</td>
</tr>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");  													
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
		Statement stmt = conn.createStatement(); 
			
		String QueryTxt;
		QueryTxt = String.format("select * from comments where post_id="+get_id+";");
		ResultSet rset = stmt.executeQuery(QueryTxt);
			
				
		while(rset.next()) {		
			String comment_name = rset.getString(2);
			String comment_contents = rset.getString(3);
			String comment_date = rset.getString(4);
			
			out.print("<tr>");
			out.print("<td>"+comment_name+"</td> ");
			out.print("<td><b>"+comment_contents+"</b></td> ");
			out.print("<td>"+comment_date+"</td>");		
			out.print("</tr>");		
			
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
</FORM> 	
<!--댓글창-->
<br>
<form method="post" action="comment_insert.jsp"> 
<table width=1000 cellspacing=0 cellpadding=5>
<tr><input type=hidden name="post_id" value="<%=get_id%>"></tr> 
	<tr>
		<td>작성자</td>
		<td>내용</td>
		<td>일자</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><input type=text name='comment_name' placeholder='작성자' maxlength=70 minlength=1 required></td>
		<td><textarea name='comment_contents' rows='3' cols='65' placeholder='댓글을 작성해주세요' maxlength=200 minlength=1 required></textarea></td>
		<td><script>getDate()</script></td>
		<td><input type='submit' value='등록'></td>
		<td><input type='reset' value='취소'></td>
	</tr>
</table>
</form>
<table width=1000>
<tr>
<td width=450></td>
 <td><input type=button value="목록" OnClick="location.href='gongji_list.jsp'"></td> 
 <td><input type=button value="수정" OnClick="location.href='gongji_update.jsp?get_id=<%=get_id%>'"></td>
 <td width=450></td>
 </tr>
</table> 
</FORM> 
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
