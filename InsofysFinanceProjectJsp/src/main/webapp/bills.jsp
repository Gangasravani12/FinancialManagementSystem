<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill form</title>
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
out.print("Welcome : "+uid);
session.setAttribute("uid",uid);
%>
    <h2>Add Bill</h2>
    <form action="Billcode.jsp" method="POST">
                
        <label for="billname">Bill Name:</label>
        <input type="text" id="billname" name="billname" required><br><br>
		<label for="desc">Item description:</label>
        <input type="text" id="desc" name="description" required><br><br>
        <!-- Date of Payment Field -->
        <label for="due">Due date:</label>
        <input type="date" id="due" name="duedate" required><br><br>
        <!-- Amount Field -->
        <label for="amount">Amount:</label>
        <input type="number" step="0.01" id="amount" name="amount" required><br><br>
        <!-- Submit Button -->
        <button type="submit">Add Bill</button>
    </form>
</center>
</body>
</html>