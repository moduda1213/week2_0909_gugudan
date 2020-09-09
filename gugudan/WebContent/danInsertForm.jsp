<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구구단 입력</title>
</head>
<body>
	<h1>구구단 입력</h1>
	
	<div>
		<a href ="./index.jsp">구구단 홈으로</a>
		<a href="./danList.jsp">구구단 목록</a>
	</div>
	
	<form method = "post" action ="danInsertAction.jsp">
		<div>
			<input type ="text" name = "danNum">
			<span>*</span>
			<input type ="text" name ="danIdx">
			<button type ="submit">구구단 입력</button>
		</div>
	</form>
</body>
</html>