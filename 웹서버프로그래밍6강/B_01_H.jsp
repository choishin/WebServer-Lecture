<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<html> 
<head> 
<title>후보등록 A_03_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_1.jsp">투표</a></td>
		<td width=100 bgcolor="#00FFFF">개표결과<a href="C_01_H.jsp"> 
	</tr> 
</table> 
<h1>투표하기</h1> 
<table cellspacing=3 width=600 border=1>
	<tr> 
	<form method="post" action="B_02_H.jsp">
		<td width=200><p align=center> 
		<select name=choice>
			<option value=1>1 김일돌
			<option value=2>2 김이돌
			<option value=3>3 김삼돌
			<option value=4>4 김사돌
			<option value=4>5 김오돌
		</select>
		</p>
		</td> 
		<td> 
		<input type=submit value="투표하기"> 
		</td>
	</form>
	</tr>
	</table> 
</body> 
</html>
