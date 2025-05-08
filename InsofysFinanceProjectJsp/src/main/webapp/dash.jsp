<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
body{
background: linear-gradient(to right, black, #4B0082);
color: white;
}
.container{
display: flex;
gap: 200px;
padding: 15px;
margin: auto;
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
.div12{
	width: 200%;
	background-color: lightgray;
	box-shadow: 5px 5px 5px gray;
	padding: 15px;
	color: black;
	
}
</style>
</head>
<body>
<center>
<h1>DS Finance</h1>
</center>
<hr></hr>
<div class="container">
<div class="div2">
<a href="dash.jsp">DashBoard</a> <p></p>
<a href="balance.jsp">Balances</a> <p></p>
<a href="transaction.jsp">Transaction</a> <p></p>
<a href="bills.jsp">Bills</a> <p></p>
<a href="expenses.jsp">Expenses</a> <p></p>
<a href="goals.jsp">Goals</a> <p></p>
</div>
<div class="div1">
<div class="div12">
<%
int uid=(Integer)session.getAttribute("uid");
out.print("Welcome : "+uid);
session.setAttribute("uid",uid);
%>
</div>
<br><br>
<div>
<a href="addaccount.jsp">Add Account</a>
</div>
</div>
</body>
</html>