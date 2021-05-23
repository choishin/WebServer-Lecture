<html> 
<head> 
<SCRIPT LANGUAGE="JavaScript"> 
<!-- function submitForm(mode){
fm.action = "gongji_write.jsp?key=INSERT"; 
fm.submit(); 
}
</SCRIPT> 
</head> 
<body> 
<FORM METHOD=POST name='fm'>
<table width=650 border=1 cellspacing=0 cellpadding=5> 
<tr>
<td><b> </b></td> 
<td>177 (insert)<input type=hidden name=id value='INSERT'></td>
<tr>
<td><b>A </b></td> 
<td><input type=text name=title size=70 maxlength=70 ></td>
<tr>
<td><b> AF</b></td> 
<td>2018-03-25</td>
<tr>
<td><b>L8 </b></td> 
<td><textarea style="width:500px; height: 250px;' name=content cols=70 row=600></textarea></td>
</tr> 
</table> 
<table width=650>
<tr>
<td width=600></td> 
<td><input type=button value="|" OnClick="location.href='gongji_list.jsp'"</td> 
<td><input type=button value="47" OnClick="submitForm('write')"></td>
</tr> 
</table> 
</FORM> 
</body> 
</html>
