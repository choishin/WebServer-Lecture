<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.io.*, java.net.*" %> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<html> 
<head>
</head> 
<body> 
<h1><center> JSP Database 실습 1</center></h1>
<%

	String data; 
	int cnt=0;

	FileReader f1 = new FileReader("/home/cnt.txt"); 
	StringBuffer sb = new StringBuffer(); 
	int ch = 0; 
	while((ch = f1.read()) != -1){
		sb.append((char) ch);
	}
	data=sb.toString().trim().replace("\n",""); 
	f1.close();
	
	cnt=Integer.parseInt(data); 
	cnt++; 
	data=Integer.toString(cnt); 
	out.println("<br><br> 현재 홈페이지 방문조회수는["+data+"]입니다</br>");
	
	FileWriter f12 = new FileWriter("/home/cnt.txt",false); 
	f12.write (data); 
	f12.close();
	
%>
</body>
</html>