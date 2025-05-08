<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add account</title>
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
<%
int uid=(Integer)session.getAttribute("uid");

%>
<table border="1">
<caption>Add Account</caption>
<form action="Addaccountcode.jsp" method="post">
<tr>
<td></td>
<td><input type="text" value=<%=uid %> name="uid"></td>
</tr>


<tr>
<td>
Card Number:
</td>
<td><input type="text" name="cno"></td>
</tr>

<tr>
<td>
Card Name:
</td>
<td><input type="text" name="cname"></td>
</tr>
<tr>
<td>
Expire Date:
</td>
<td><input type="text" name="expdate"></td>
</tr>

<tr>
<td>
CVV:
</td>
<td><input type="text" name="cvv"></td>
</tr>

<tr>
<td>
Amount:
</td>
<td><input type="text" name="amount"></td>
</tr>

<tr>
<td>
</td>
<td><input type="submit" value="Add account"></td>
</tr>
</form>
</table>
<br><br>
<a href="dash.jsp">Back to home</a>
</center>
</body>
</html>