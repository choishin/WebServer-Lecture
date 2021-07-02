<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>

<html> 
<head> 
<title>개표결과 C_02_H.jsp </title> 
<style>
	table{
			border-collapse: collapse;
			border-spacing: 0px;
			margin:0 50px 0 50px;
			padding:1px 0 0 0;
			border:1px solid #ddd;
			border-top:0;
			border-right:0;
			font-size:15px;
			font-family:Tahoma, Geneva, sans-serif;
			list-style:none
	}
	body {
			font-size:12px;
			font-family:Tahoma, Geneva, sans-serif;
	}
</style>
</head> 
<body LINK= "#767676" VLINK="#767676"> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</td> 
		<td width=100><a href="B_01_H.jsp">투표</td>
		<td width=100 bgcolor="#ddd"><a href="C_01_H.jsp">개표결과</td>
	</tr> 
</table> 
	<form method="get" action="C_02_H.jsp"> 
	기호: <input type="text" name="tupyo_kiho"><br> 
			<input type="submit" value="전송"> 
	</form> 

</body> 
</html>