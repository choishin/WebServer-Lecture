<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>

<html> 
<head> 
<title>개표결과 C_02_H.jsp </title> 
<style>
        /* UI Object 가로 */
        .h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:12px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
        .h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
        .h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
        .h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
        .h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
</style>	
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
		<td width=100)><a href="A_01_H.jsp">후보등록</td> 
		<td width=100)><a href="B_01_H.jsp">투표</td>
		<td width=100) bgcolor="#ddd"><a href="C_01_H.jsp">개표결과</td>
	</tr> 
</table> 

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
			 String name = rset.getString(2);
			 out.println("<div class ='title'>");
			 out.println("<h2 style='font-weight:bold;color:#767676'>"+kiho+"."+name+"후보 득표 성향 분석</h2>"); 
			 out.println("</div>");
			 int age10 = rset.getInt(3);
	    	 int age20 = rset.getInt(4);
	    	 int age30 = rset.getInt(5);
	    	 int age40 = rset.getInt(6);
	    	 int age50 = rset.getInt(7);
	    	 int age60 = rset.getInt(8);
	    	 int age70 = rset.getInt(9);
	    	 int age80 = rset.getInt(10);
	    	 int age90 = rset.getInt(11);
			 double sum = rset.getDouble(12);
			 double percent = rset.getDouble(13);
			 
			 Double age10_percent= Double.parseDouble(String.format("%.2f",age10/sum));
			 Double age20_percent= Double.parseDouble(String.format("%.2f",age20/sum));
			 Double age30_percent= Double.parseDouble(String.format("%.2f",age30/sum));
			 Double age40_percent= Double.parseDouble(String.format("%.2f",age40/sum));
			 Double age50_percent= Double.parseDouble(String.format("%.2f",age50/sum));
			 Double age60_percent= Double.parseDouble(String.format("%.2f",age60/sum));
			 Double age70_percent= Double.parseDouble(String.format("%.2f",age70/sum));
			 Double age80_percent= Double.parseDouble(String.format("%.2f",age80/sum));
			 Double age90_percent= Double.parseDouble(String.format("%.2f",age90/sum));

%>
	<div class="main">
		<div class="h_graph">
		 <ul>
<%			 
			out.println("<li><span class='g_term'>"+"10대"+"</span><span class='g_bar' style='width:"+(age10_percent*100)+"%'><span>"+age10+"("+(age10_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"20대"+"</span><span class='g_bar' style='width:"+(age20_percent*100)+"%'><span>"+age20+"("+(age20_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"30대"+"</span><span class='g_bar' style='width:"+(age30_percent*100)+"%'><span>"+age30+"("+(age20_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"40대"+"</span><span class='g_bar' style='width:"+(age40_percent*100)+"%'><span>"+age40+"("+(age40_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"50대"+"</span><span class='g_bar' style='width:"+(age50_percent*100)+"%'><span>"+age50+"("+(age50_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"60대"+"</span><span class='g_bar' style='width:"+(age60_percent*100)+"%'><span>"+age60+"("+(age60_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"70대"+"</span><span class='g_bar' style='width:"+(age70_percent*100)+"%'><span>"+age70+"("+(age70_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"80대"+"</span><span class='g_bar' style='width:"+(age80_percent*100)+"%'><span>"+age80+"("+(age80_percent*100)+"%)"+"</span></span></li>");
			out.println("<li><span class='g_term'>"+"90대"+"</span><span class='g_bar' style='width:"+(age90_percent*100)+"%'><span>"+age90+"("+(age90_percent*100)+"%)"+"</span></span></li>");
		}
			 rset.close();
			 stmt.close(); 
			 conn.close(); 
		
%>
</ul>
</div>
</div>
<%
		}catch(Exception e) {
			out.println(e);
		}
%>


</body> 
</html>