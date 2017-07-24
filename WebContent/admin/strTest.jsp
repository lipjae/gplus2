<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var a="가나다라마,바사,아자,차카,타파";
var b=a.substring(0,a.indexOf("바사")-1);
var d=a.substring(a.indexOf("바사")+"바사".length);
var e=b+d;
console.log(b);
console.log(d);
console.log(e);

</script>
</body>
</html>