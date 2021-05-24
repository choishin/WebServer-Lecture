<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page contentType="text/html; charset=utf-8" %> 
<html>
<head>
</head>
<body>
	<input type="text" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"/>
	 <input type="submit" value="입력">
	<script>
	function characterCheck(obj){
	// 허용하고 싶은 특수문자가 있다면 여기서 삭제하면 됨 
	var regExp = /[\{\}\\?.,;(\)*~~\'!^-_+<>!\#$%&\'\"\\\(\=]/gi;
		if( regExp.test(obj.value) ) { 
			alert("특수문자는 입력하실수 없습니다."); 
			obj.value = obj.value.substring(0, obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
			}
	}
	</script>
</body>
</html>