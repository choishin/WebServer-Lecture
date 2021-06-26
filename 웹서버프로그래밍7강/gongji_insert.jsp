<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
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
		QueryTxt = String.format("select max(id) from gongji;");
		
		ResultSet rset = stmt.executeQuery(QueryTxt);
		int get_id=0;
		while(rset.next()) {
			String id = rset.getString(1);
			get_id =Integer.parseInt(id);
		}
				
%>
<FORM METHOD=POST action="gongji_write.jsp"> 
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
<td><b>번호</b></td> 
<td><input type=text name=get_id value=<%=get_id+1%> readonly></td>
</tr>
<tr>
<td>조회수</td>
<td><input type=text name=get_viewcnt value=0 readonly></td>
</tr>
<tr>
<td><b>제목</b></td> 
<td><input type=text name=get_title size="20" maxlength="70" minlength="1" required></td>
</tr>
<td><b>일자</b></td> 
<td><script>getDate()</script></td>
<!--<input type=text name=get_date readonly></td>-->
</tr>
<td><b>내용</b></td> 
<td><textarea style='width:500px; height:250px;' name=get_content cols=70 row=600 required></textarea></td>
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
<td><input type='submit' value="쓰기"></td>
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
