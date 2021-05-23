<html> 
<head>
<SCRIPT LANGUAGE="JavaScript"> 
<!-- function submitForm(mode){ 
if(mode == "write"){
fm.action = "gongji_write.jsp"; 
} 
else if(mode == "delete"){
fm.action = "gongji_delete.jsp";
fm.submito;
</SCRIPT> 
</head> 
<body> 
<FORM METHOD=POST name='fm'> 
<table width=650 border=1 cellspacing=0 cellpadding=5>
<td><b> </b></td> 
<td><input type=text name=id size=70 maxlength=70 value=1 readonly></td>
<td><b> </b></td> 
<td><input type=text name=title size=70 maxlength=70 value="81"></td>
<td><b> </b></td> 
<td>2012-01-14</td>
<tr>
<td><b> </b></td> 
<td><textarea style='width:500px; height: 250px;' name=content cols=70 row=600 >LH1</textarea> </td>
</tr> 
</table> 
<table width=650>
<tr>
<td width=600></td> 
<td><input type=button value="|^" OnClick="location.href='gongji_list.jsp"></td> 
<td><input type=button value="47" OnClick="submitForm ('write')"></td> 
<td><input type=button value="4 " OnClick="submitForm('delete')"></td>
</table> 
</FORM> 
</body> 
</html>
