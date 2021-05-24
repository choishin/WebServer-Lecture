<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="Read_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<%
		Class.forName("com.mysql.cj.jdbc.Driver"); 		 
														
	     Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.98:3306/kopoctc","root" , "kopoctc");  
	     Statement stmt = conn.createStatement(); 		  
	     ResultSet rset = stmt.executeQuery("select a.hubo_kiho, a.hubo_name, count(b.tupyo_kiho) as sum,(select count(b.tupyo_kiho)/count(tupyo_kiho) from tupyo_table)*100 from tupyo_table as b, hubo_table as a where a.hubo_kiho=b.tupyo_kiho group by a.hubo_kiho;"); 
		 
%>
<html> 
<head> 
<title>개표결과 C_02_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1> 
	<tr> 
		<td width=100><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100 bgcolor="#00FFFF"><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 

<h1>후보별 득표 결과</h1> 
<table cellspacing=3 width=600 border=0>
	<tr style="margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none">
		<td style="margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none" width=40><p align=center>이름</p></td> 
		<td style="margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none" width=500><p align=center>인기도</p></td>
	</tr> 
</table> 
	<style>
        /* UI Object 가로 */
        .h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
        .h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
        .h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
        .h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
        .h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
	</style>
		<div class="h_graph">
		 <ul>
<%
		while (rset.next()) { 
		String hubo_kiho = rset.getString(1);
	    String hubo_name = rset.getString(2);
		int sum = rset.getInt(3);
		int percent = rset.getInt(4);
		out.println("<li><span class='g_term'><a href='C_02_H.jsp'>"+hubo_kiho+" "+hubo_name+"</a></span><span class='g_bar' style='width:"+percent+"%'><span>"+sum+"("+percent+"%)"+"</span></span></li>");
		}
	     rset.close();
	     stmt.close(); 
	     conn.close(); 
%>
</ul>
</div>
</body> 
</html>