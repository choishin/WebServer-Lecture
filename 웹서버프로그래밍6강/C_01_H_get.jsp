<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>

<html> 
<head> 
<title>개표결과 C_02_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</td> 
		<td width=100><a href="B_01_H.jsp">투표</td>
		<td width=100 bgcolor="#00FFFF"><a href="C_01_H.jsp">개표결과</td>
	</tr> 
</table> 
	<form method="get" action="C_02_H.jsp"> 
	기호: <input type="text" name="tupyo_kiho"><br> 
			<input type="submit" value="전송"> 
	</form> 
<%
	request.setCharacterEncoding("UTF-8");
	String tupyo_kiho = request.getParameter("tupyo_kiho");
%>
<%
		try{
		Class.forName("com.mysql.cj.jdbc.Driver"); 		 
														
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		  
	     ResultSet rset = stmt.executeQuery("select "
											+"a.hubo_kiho,"
											+"a.hubo_name,"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=1),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=2),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=3),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=4),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=5),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=6),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=7),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=8),"
											+"(select count(*) from tupyo_table where tupyo_kiho="+tupyo_kiho+" and tupyo_age=9),"
											+"(select count(*) from tupyo_table where tupyo_kiho=3),"
											+"((select count(*) from tupyo_table where tupyo_kiho=3)/(select count(*) from tupyo_table))*100 "
											+"from tupyo_table as b, hubo_table as a "
											+"where a.hubo_kiho="+tupyo_kiho+" "
											+"group by a.hubo_kiho="+tupyo_kiho+";"); 

	     while (rset.next()) { 
			 String kiho = rset.getString(1);
			 int name = rset.getInt(2);
			 out.println("<h1>"+kiho+"."+name+"후보 득표 성향 분석</h1>"); 
			 int age10 = rset.getInt(3);
	    	 int age20 = rset.getInt(4);
	    	 int age30 = rset.getInt(5);
	    	 int age40 = rset.getInt(6);
	    	 int age50 = rset.getInt(7);
	    	 int age60 = rset.getInt(8);
	    	 int age70 = rset.getInt(9);
	    	 int age80 = rset.getInt(10);
	    	 int age90 = rset.getInt(11);
			 int sum = rset.getInt(12);
			 int percent = rset.getInt(13);
			 
			out.println("<li><span class='g_term'>"+"10대"+"</span><span class='g_bar' style='width:"+(age10/sum)+"%'><span>"+age10+"("+(age10/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"20대"+"</span><span class='g_bar' style='width:"+(age20/sum)+"%'><span>"+age20+"("+(age20/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"30대"+"</span><span class='g_bar' style='width:"+(age30/sum)+"%'><span>"+age30+"("+(age20/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"40대"+"</span><span class='g_bar' style='width:"+(age40/sum)+"%'><span>"+age40+"("+(age40/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"50대"+"</span><span class='g_bar' style='width:"+(age50/sum)+"%'><span>"+age50+"("+(age50/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"60대"+"</span><span class='g_bar' style='width:"+(age60/sum)+"%'><span>"+age60+"("+(age60/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"70대"+"</span><span class='g_bar' style='width:"+(age70/sum)+"%'><span>"+age70+"("+(age70/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"80대"+"</span><span class='g_bar' style='width:"+(age80/sum)+"%'><span>"+age80+"("+(age80/sum)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"90대"+"</span><span class='g_bar' style='width:"+(age90/sum)+"%'><span>"+age90+"("+(age90/sum)+"%)"+"</span></span></li>");
		}
	     rset.close();
	     stmt.close(); 
	     conn.close(); 
		}
		catch(Exception e) {
			out.println(e);
		}
%>


</body> 
</html>