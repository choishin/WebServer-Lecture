<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	String startNumber = request.getParameter("getstartNumber"); 
	String amount = request.getParameter("getAmount");
	int startNumberParse= Integer.parseInt(startNumber);
	int amountParse= Integer.parseInt(amount);
	
%>

<HTML> 
<HEAD>
<TITLE> 요청한 페이지 </TITLE> 
<link rel="stylesheet" href="style.css">
</HEAD> 
<BODY> 

<%@ page contentType = "text/html; charset=UTF-8" %> 
<%@ page import = "java.io.BufferedReader" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileReader" %>
<%@ page import = "java.io.IOException" %>

	<%  try{
		BufferedReader br = null;
		File file = new File("/var/lib/tomcat9/webapps/ROOT/12_04_07_E_무료와이파이정보(utf-8).txt");
		br = new BufferedReader (new FileReader (file));

		String readtxt;
		if((readtxt= br.readLine()) == null){
			out.println("빈 파일입니다.");
			return; 
		}
		String[] field_name= readtxt.split("\t");
		double lat = 37.3860521; 
		double Ing = 127.1214038;
		
		int fromPT = startNumberParse;
		int cntPT = amountParse;
		int LineCnt = 1;
		double min = Double.MAX_VALUE; 
		double max = Double.MIN_VALUE;

		String temp1name ="", temp2name ="";  //가장가까운거리와 먼거리의 이름을 넣어줄 변수 지정, 초기화
		String temp1address ="", temp2address ="";   //가장가까운거리와 먼거리의 주소를 넣어줄 변수 지정, 초기화
		String temp1lat = "", temp1lng = "";  //위도경도
		String temp2lat = "", temp2lng = ""; //위도경도
		out.println("<table style=&quot;box-sizing:border-box;border:1px solid gray; border-collapse:collapse;&quot>");
		out.println("<tr style =&quot;border:1px solid gray&quot;>");
		out.println("<td style =&quot;border:1px solid gray&quot;>"+"처리횟수"+"</td>"); 
		out.println("<td style =&quot;border:1px solid gray&quot;>"+"지번주소"+"</td>");
		out.println("<td style =&quot;border:1px solid gray&quot;>"+"위도"+"</td>"); 
		out.println("<td style =&quot;border:1px solid gray&quot;>"+"경도"+"</td>");
		out.println("<td style =&quot;border:1px solid gray&quot;>"+"현재지점과의 거리"+"</td>");
		out.println("</tr>");
			
			while((readtxt= br.readLine()) !=null){ 
			String[] field = readtxt.split("\t"); 
			
			if (LineCnt >= fromPT && LineCnt <fromPT+cntPT)  {
			out.println("<tr style =&quot;border:1px solid gray&quot;>");
			out.println("<td style =&quot;border:1px solid gray&quot;>"+LineCnt+"</td>"); 
			out.println("<td style =&quot;border:1px solid gray&quot;>"+field[9]+"</td>");
			out.println("<td style =&quot;border:1px solid gray&quot;>"+field[13]+"</td>"); 
			out.println("<td style =&quot;border:1px solid gray&quot;>"+field[14]+"</td>");
			double dist=Math.sqrt (Math.pow(Double.parseDouble(field[13])-lat, 2) //거리구하기 : 피타고라스의 정리 
					+ Math.pow(Double.parseDouble(field[14])-Ing,2)); //해당위치에서 이곳의 위도를 뺀값과, 경도를 뺀값을 각각 제곱한 값의 루트값
			out.println("<td style =&quot;border:1px solid gray&quot;>"+dist+"</td>"); 
			}
			LineCnt++;
		}
		br.close();
		out.println("</table>");
		}
		catch(IOException e) {
			out.println("error");
		}	
%>
<br>
<br>
<br>
<div class ="container">
<center>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=1&getAmount=10" target="main">&lt;&lt;</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=1&getAmount=10" target="main">1</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=11&getAmount=10" target="main">2</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=21&getAmount=10" target="main">3</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=31&getAmount=10" target="main">4</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=41&getAmount=10" target="main">5</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=51&getAmount=10" target="main">6</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=61&getAmount=10" target="main">7</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=71&getAmount=10" target="main">8</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=81&getAmount=10" target="main">9</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=91&getAmount=10" target="main">10</a>
<a href="http://192.168.23.98:8080/requestPage.jsp?getstartNumber=7000&getAmount=10" target="main">&gt;&gt;</a>
</center>
</div>
</BODY>
</HTML>
</BODY>
</HTML>