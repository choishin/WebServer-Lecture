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
		QueryTxt = String.format("select * from gongji where id="+get_id+";");
		
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
		}
				
%>
<form method="post" action="gongji_set.jsp"> 
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
<td><b>번호</b></td> 
<td><input type=text name=get_id value=<%=get_id%> readonly></td>
</tr>
<tr>
<td><b>제목</b></td> 
<td><input type=text name=get_title size=70 maxlength=70 value=<%=title%> onkeyup='characterCheck(this);' onkeydown='characterCheck(this);' onchange='noSpaceForm(this);' autocomplete='off' required></td>
</tr>
<td><b>일자</b></td> 
<td><script>getDate()</script></td>
</tr>
<td><b>내용</b></td> 
<td><textarea style='width:500px; height:250px;' name=get_content cols=70 row=600 onkeyup='characterCheck(this);' onkeydown='characterCheck(this);' onchange='noSpaceForm(this);' autocomplete='off' required><%=content%></textarea></td>
</tr>
</table> 
<%
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
<td><input type=button value="취소" OnClick="location.href='gongji_list.jsp'"></td> 
<td><input type="submit" value="수정"></td>
<td><input type=button value="삭제" OnClick="location.href='gongji_delete.jsp?get_id=<%=get_id%>'"></td>
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
