<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Finance Management System</title>
<style>
body{
background: linear-gradient(to right, black, #4B0082);
}
.header{
	display: flex;
	padding: 5px;
	justify-content: center;
	align-items:center;
	gap: 250px;
	
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
	padding: 5px;
	transfrom: scale(1);
}
.but{
border-radius: 10px;
background-color: blue;
color: white;
padding: 15px;
transition: transform 0.3s ease,color 0.3s ease;
}
.but: hover{
	transfrom: scale(1);
}
</style>
</head>
<body>
<div class="header">
<div>
<h1>DS Finance</h1>
</div>
<div>
<a href="login.jsp">Login</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="sinup.jsp">Sing Up For Free</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</div>
<hr>
<center>
<h2 style="color: white;">Simplified Finanical <br> Tracking <br> Application </h2>
<p style="color: white;">Welcome,You're on the right path.Get started with the DS Finance and <br> take control of your expenses today.</p><br><br>
<a href="sinup.jsp" class="but">Sing Up For Free</a>
</center>
</body>
</html>