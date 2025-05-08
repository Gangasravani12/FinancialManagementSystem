<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transcation</title>
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
    <h2>Transaction Form</h2>
    <form action="TransactionCode.jsp" method="POST">
        <!-- User ID Field -->
        <label for="userId">User ID:</label>
        <input type="number" name="userId" value="<%=uid %>" required><br><br>

        <!-- Goal Field -->
        <label for="goal">Goal:</label>
        <input type="text" id="goal" name="goal" required><br><br>

        <!-- Payment Type Field -->
        <label for="paymentType">Payment Type:</label>
        <select id="paymentType" name="paymentType" required>
            <option value="Credit">Credit</option>
            <option value="Debit">Debit</option>
            <option value="Transfer">Transfer</option>
        </select><br><br>

        <!-- Date of Payment Field -->
        <label for="dateOfPayment">Date of Payment:</label>
        <input type="date" id="dateOfPayment" name="dateOfPayment" required><br><br>
		<!-- Card_id in the cards table to do the the transaction for the specific account -->
		<label for="card">Card number</label>
		<input type="text" step="0.01" id="card" name="card_num" required><br><br>
        <!-- Amount Field -->
        <label for="amount">Amount:</label>
        <input type="number" step="0.01" id="amount" name="amount" required><br><br>

        <!-- Submit Button -->
        <button type="submit">Submit Transaction</button>
    </form>
</center>
</body>
</html>