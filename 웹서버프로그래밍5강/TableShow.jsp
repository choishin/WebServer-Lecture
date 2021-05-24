<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %> 
<html> 
<head> 
</head> 
<body> 
<h1>성적 조회후 정정/삭제</h1>

<form method="get" action="TableShow_request.jsp"> 
	학번 : <input type="number" min="209900" name="get_studentid"><br> 
		 <input type="submit" value="입력"> 
</form> 

</body> 
</html>