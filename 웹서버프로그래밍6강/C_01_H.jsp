<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<html> 
<head> 
<title>개표결과 C_02_H.jsp </title> 
	<style>
        /* UI Object 가로 */
        .h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:12px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
        .h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
        .h_graph .g_term{position:absolute;top:0;left:-60px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:left}
        .h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
        .h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
		
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
		.title {
				margin-left: 50px;
		}
		.main {
				margin-left: 50px;
		}
</style>
</head> 
<body LINK= "#767676" VLINK="#767676"> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100 bgcolor="#ddd"><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
<div class="title">
<h1 style="font-weight:bold;color:#767676">후보별 득표 결과</h1> 
</div>
<table cellspacing=3 width=600 border=0>
	<tr style="margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:12px;font-family:Tahoma, Geneva, sans-serif;list-style:none">
		<td style="margin:0 10px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:12px;font-family:Tahoma, Geneva, sans-serif;list-style:none" width=74><p align=center>이름</p></td> 
		<td style="margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:12px;font-family:Tahoma, Geneva, sans-serif;list-style:none" width=900><p align=center>인기도</p></td>
	</tr> 
</table> 
	<div class="main">
		<div class="h_graph">
		 <ul>
 <%
		Class.forName("com.mysql.cj.jdbc.Driver"); 		 
														
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		  
	     ResultSet rset = stmt.executeQuery("select *, (select count(*) from tupyo_table as b where a.hubo_kiho=b.tupyo_kiho),((select count(*) from tupyo_table as b where a.hubo_kiho=b.tupyo_kiho)/(select count(*) from tupyo_table)) from hubo_table as a;"); 
		 
%>
<%		
	   while (rset.next()) { 
		String hubo_kiho = rset.getString(1);
	    String hubo_name = rset.getString(2);
	
		int sum = rset.getInt(3);
		Double percent_parse = rset.getDouble(4);
		Double percent = Double.parseDouble(String.format("%.2f",percent_parse));
		
		out.println("<li><span class='g_term'>"
		+"<a href='http://192.168.23.98:8080/C_02_H.jsp?tupyo_kiho="+hubo_kiho+"'>"+hubo_kiho+" "+hubo_name+"</a></span><span class='g_bar' style='width:"+percent*100+"%'><span>"+sum+"("+percent*100+"%)"+"</span></span></li>");
	  }
		
		 out.println("</div>");
	     rset.close();
	     stmt.close(); 
	     conn.close(); 
%>
</ul>
</div>
</body> 
</html>