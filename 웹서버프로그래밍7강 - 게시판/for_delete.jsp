<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<html> 
<head>
<SCRIPT LANGUAGE="JavaScript"> 
<!-- 
function submitForm(mode){ 
if(mode = "write"){
	fm.action = "gongji write.jsp";
	}else if(mode =	"delete"){
	fm.action = "gongji_delete.jsp";
	}
	fm.submit();
	}
-->
</SCRIPT> 
</head> 
<body> 

<form method="get" action="gongji_delete.jsp"> 
	글번호: <input type="text" name="get_id"><br> 
	<input type="submit" value="전송"> 
</form> 
 
<table width=650>
<tr>
<td width=600></td>
 <td><input type=button value="목록" OnClick="location.href='gongji_list.jsp"></td> 
 <td><input type=button value="수정" OnClick="location.href='gongji_update.jsp?key=1'"></td>
 </tr>
</table> 
</FORM> 
</body> 
</html>