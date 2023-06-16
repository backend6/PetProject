<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@include file="/WEB-INF/views/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #FFCD4A;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	margin-top: 100px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	width: 95%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	width: 95%;
	padding: 10px;
	background-color: #FFB600;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #FFCD4A;
}

.error-message {
	color: #ff0000;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Login</h2>
		<form action="/login" method="POST">
			<div class="form-group">
				<label for="username">아 이 디 :</label> <input type="text"
					id="username" name="username" required>
					
			</div>
			<div class="form-group">
				<label for="password">비 밀 번 호 :</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="form-group">
				<input type="submit" value="Login">
			</div>
			<div class="error-message">
			
			</div>
				<div class="additional-links">
		<div>
		<a href="${myctx}/register">회원가입</a>
		
		</div>
		
		<a href="${myctx}/forgot-id">아이디</a>
		<a> 또는 </a>
		<a href="${myctx}/forgot-password">비밀번호</a>
		<a>찾기</a>
	</div>
			
		</form>
	</div>
</body>
</html>