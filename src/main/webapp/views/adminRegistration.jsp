<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/adminStore" method="post">
<input type="text" name="username" placeholder="username"><br>
<input type="password" name="password" placeholder="password">
<button type="submit">submit</button>
<h2>${msg }</h2>
</form>
</body>
</html>
