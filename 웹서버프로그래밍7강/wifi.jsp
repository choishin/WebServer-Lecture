<%@page language="java" %>
<%@page import="java.sql.*, javax.sql.*, java.io.*, java.net.URL" %>
<%@page contentType="text/html; charset=utf-8" %>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8");%>
<%! 
	private int countLines(String filename) throws IOException {
		File targetFile = new File(filename);
		BufferedReader br = new BufferedReader(new FileReader(targetFile));
		String readtxt;
		int LineCnt=0;

		while((readtxt=br.readLine())!=null) {
			String[] field = readtxt.split("\t");
			LineCnt++;
		}

		return LineCnt;
	}
%>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	</HEAD>
	<BODY>
		<h1 align=center>
			<b>와이파이</b>
		</h1>
		<%
			try{
				// 총 게시글 수 - 파일 헤더
				int totalContents = countLines("/var/lib/tomcat9/webapps/ROOT/wifi.txt") - 2; 
				// default = 0, Contents가 출력되기 시작하는 위치
				String fromPT = "0";

				if (request.getParameter("from")==null) {
					fromPT = "0";
				} else if (Integer.parseInt(request.getParameter("from"))<0) {
					fromPT = "0";
				} else {
					fromPT = request.getParameter("from");
				}

				// default = 0, 한 페이지에 출력될 게시글 수
				String cntPT = "10";

				if (request.getParameter("cnt")==null) {
					cntPT = "10";
				} else if (request.getParameter("cnt").equals("0")) {
					cntPT = "10";
				} else {
					cntPT = request.getParameter("cnt");
				}
				
				for (int i=0; i<fromPT.length(); i++) {
					char ch = fromPT.charAt(i);

					if (ch<'0' || ch>'9') {
						throw new Exception();
					}
				}
				
				for (int i=0; i<cntPT.length(); i++) {
					char ch = cntPT.charAt(i);

					if (ch<'0' || ch>'9') {
						throw new Exception();
					}
				}
				
				if (Integer.parseInt(fromPT)>totalContents) {
					fromPT = Integer.toString(totalContents-(totalContents%Integer.parseInt(cntPT)));
				}
				
				File targetFile = new File("/var/lib/tomcat9/webapps/ROOT/wifi.txt");
				BufferedReader br = new BufferedReader(new FileReader(targetFile));
				String readtxt = br.readLine();
				
				if (readtxt==null) {
					System.out.println("빈 파일입니다.");
					return;
				}
				
				String[] field_name=readtxt.split("\t");			
				double lat=37.3860521, lng=127.1214038;
				// 게시글의 번호
				int LineCnt=0;

				out.println(
							"<table border='1' style='margin:auto;'>" +
								"<tr>" + 
									"<td align=center> 번호 </td>" + 
									"<td width=490 align=center>" + field_name[9]  + "</td>" +
									"<td width=100 align=center>" + field_name[13] + "</td>" +
									"<td width=100 align=center>" + field_name[14] + "</td>" +
									"<td width=85 align=center> 거리 </td>" + 
								"</tr>"
							);
				
				while ((readtxt=br.readLine())!=null) {
					// print되지 않아도 게시글 번호는 계속 카운트
					if (LineCnt<Integer.parseInt(fromPT)) {
						LineCnt++; 
						continue;
					}
					
					if (LineCnt>Integer.parseInt(fromPT)+(Integer.parseInt(cntPT))-1) {
						break;
					}
					
					String[] field = readtxt.split("\t");
					// 지번주소가 없다면 대체 값 대입
					if (field[9].length()==0) {
						field[9] = field [10];							
						
						if (field[10].length()==0) {
							field[9] = field[11];
						}
					}
					
					double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13])-lat,2) +
								  Math.pow(Double.parseDouble(field[14])-lng, 2));
					dist = Math.round(dist*1000000)/1000000.0;

					/***************************
					 * field[9] : 지번주소
					 * field[13]: 위도
					 * field[14]: 경도
					 ***************************/
					out.println(
								"<tr>" + 
									"<td align=center>" + LineCnt  + "</td>" +
									"<td align=left>  " + field[9] + "</td>" +
									"<td align=center>" + field[13]+ "</td>" +
									"<td align=center>" + field[14]+ "</td>" +
									"<td align=center>" + dist     + "</td>" +
								"</tr>"
								);
					LineCnt++;
				}
				
				out.println("</table>");
				out.println("<br><br><br>");
				br.close();
				// default = 1, 현재 페이지 수
				int pageNum = ((LineCnt-1) / Integer.parseInt(cntPT))+1;
				// 한 화면에 출력될 페이지의 갯수
				int printPage = 10;
				// 한 화면에 출력될 페이지 중 '시작' 페이지 수
				int startPage = ((pageNum - 1)/10) * 10 + 1;
				// 한 화면에 출력될 페이지 중 '마지막' 페이지 수
				int endPage = startPage + printPage - 1;
				// 총 페이지 수
				int totalPage = totalContents / Integer.parseInt(cntPT);
				// 남은 게시글 수가 한 화면에 출력해야 할 게시글 수보다 작더라도 페이지 수는 1만큼 늘어나야 함
				if (totalContents>Integer.parseInt(cntPT)*totalPage) {
					totalPage++;
				}
				// 현재 페이지 수가 총 페이지 수보다 큰 경우 현재 페이지를 총 페이지 번호로 치환
				if (pageNum>totalPage) {
					pageNum = totalPage;
				}
				
				/***************************
				 * ◀◀: 첫 페이지로 이동
				 * ◀  : 이전 페이지로 이동
				 **************************/
				out.println(
							"<div align=center>" + 
								"<a href='wifi.jsp?from=0&cnt="+cntPT+"'>" + 
									" ◀◀ " + 
								"</a>" +
								"<a href='wifi.jsp?from="+(pageNum - 2)*Integer.parseInt(cntPT)+"&cnt="+cntPT+"'>" +
									" ◀ "   + 
								"</a>"
							);
				
				if (Integer.parseInt(cntPT)==1) {
					for (int i=startPage; i<=endPage; i++) {
						if (endPage>totalPage) {
							endPage = totalPage;
							endPage++;
						}
						
						out.println("<a href='wifi.jsp?from="+((i-1)*Integer.parseInt(cntPT))+"&cnt="+cntPT+"'>");
						// 현재 페이지 표시
						if (i==LineCnt) {
							out.println(
										"<span style='color:red'>" + 
											"<b>["+i+"]</b>" + 
										"</span>"
										);
						} else {
							out.println("["+i+"]");
						}
						
						out.println("</a>");
					}
				} else {
					for (int i=startPage; i<=endPage; i++) {
						if (endPage>totalPage ) {
							endPage = totalPage;
						}							//마지막 페이지는 항상 10만을 출력하진 않도록 합니다.

                        out.println("<a href='wifi.jsp?from="+((i-1)*Integer.parseInt(cntPT))+"&cnt="+cntPT+"'>");
						// 현재 페이지 표시
						if (i==pageNum) {
							out.println(
										"<span style='color:red'>" + 
											"<b>["+i+"]</b>" + 
										"</span>"
										);
						} else {
							out.println("["+i+"]");
						}
						
						out.println("</a>");
					}	
				}

                /***************************
				 * ▶  : 다음 페이지로 이동
				 * ▶▶: 끝 페이지로 이동
				 **************************/
                out.println(
                                "<a href='wifi.jsp?from="+(pageNum)*Integer.parseInt(cntPT)+"&cnt="+cntPT+"'>" + 
                                    " ▶ " + 
                                "</a>" +
                                "<a href='wifi.jsp?from="+(totalPage)*Integer.parseInt(cntPT)+"&cnt="+cntPT+"'>" + 
                                    " ▶▶ " + 
                                " </a>" + 
                            "</div>"
                            );
				
				// for debuging
				// out.println("pageNum : " + pageNum);
				// out.println("fromPT : " + Integer.parseInt(fromPT));
				// out.println("나머지 : " + LineCnt % (Integer.parseInt(cntPT)));
			} catch(Exception e) {
				//out.print("<script>window.location='http://192.168.56.1:8080/wifi.jsp?from=0&cnt=10'</script>");
				out.print(e);
			}
		%>
	</BODY>
</HTML>