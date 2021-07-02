<%@ page errorPage="TableShow_error.jsp" contentType = "text/html; charset=utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<html> 
<head> 
</head> 
<body> 
<h1>성적입력추가</h1>
<form method="get" action="TableUpdate_request.jsp"> 
	이름 : <input type="text" name="name"><br>
	<!--학번은 자동으로 가져오게 해야함-->
	학번 : <input type='number' min='209900' name="studentid"><br> 
	국어 : <input type='number' min='0' max='100' name="kor"><br> 
	영어 : <input type='number' min='0' max='100' name="eng"><br> 
	수학 : <input type='number' min='0' max='100' name="mat"><br> 
		 <input type="submit" value="입력"> 
</form> 

</body> 
</html>
