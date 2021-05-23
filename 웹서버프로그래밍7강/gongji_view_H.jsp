<html> 
<head>
<SCRIPT LANGUAGE="JavaScript"> 
<!-- function submitForm(mode){ 
if(mode == "write"){
fm.action = "gongji_write.jsp"; 
} else if(mode == "delete"){
fm.action = "gongji_delete.jsp";
fm.submit();
//--> 
</SCRIPT> 
</head> 
<body> 
<FORM METHOD=POST name='fm'> 
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
<td><b>번호</b></td>
<td>1</td>
</tr>
<tr>
<td><b>제목</b></td>
<td> 공지사항 1 </td>
</tr>
<tr>
<td><b>일자</b></td>
<td>2018-01-14</td>
</tr>
<tr>
<td><b>내용</b></td> 
<td>공지사항내용1</td>
</tr> 
</table> 
<table width=650>
<tr>
<td width=600></td> 
<td><input type=button value="목록" OnClick="location.href='gongji_list.jsp"></td> 
<td><input type=button value="48" OnClick="location.href='gongji_update.jsp?key=1'></td>
</tr> 
</table> 
</FORM> 
</body> 
</html>
