<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check accounts</title>
<style>
body{
background: linear-gradient(to right, black, #4B0082);
color: white;
}
h1{
	color:white;
	font-family: 'Pacifico', cursive;
	transition: transform 0.3s ease, color 0.3s ease;
}
h1:hover{
	color: blue;
	transform: scale(1.5);
}
a{
	color: white;
	font-family: Georgia;
	text-decoration: none;
	justify-content: center;
	transition: transform 0.3s ease,color 0.3s ease;
}
a:hover{
	color: black;
	border-radius: 10px;
	background-color: lightgray;
	opacity: 0.7;
	padding: 8px;
	transfrom: scale(1);
}
</style>
</head>
<body>
<center>
<h1>DS Finance</h1>
</center>
<hr>
<center>
<h3>Do you want to see your accounts <br> so please click the below button!</h3><br><br>
<a href="ViewBalance.jsp">View your accounts</a>
</center>
</body>
</html>