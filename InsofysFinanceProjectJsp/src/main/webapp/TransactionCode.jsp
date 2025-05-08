<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	justify-content: center; transition: transform 0.3s ease,color 0.3s ease;
}

a:hover{
	color: white;
	border-radius: 10px;
	background-color: lightgray;
	opacity: 0.7;
	padding: 8px;
	transfrom: scale(1);
}
</style>
<center>
<h1 >DS Finance</h1>
</center>
<hr>
<center>
<%
    // Database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/infoysdb";
    String dbUser = "root";
    String dbPassword = "root";

    // Retrieve form parameters
    String userId = request.getParameter("userId");
    String cardnum = request.getParameter("card_num").trim();  // Trim spaces from input
    String goal = request.getParameter("goal");
    String paymentType = request.getParameter("paymentType");
    String dateOfPayment = request.getParameter("dateOfPayment");
    float amount = Float.parseFloat(request.getParameter("amount"));

    float currentBalance = 0; // To store the card's current balance

    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmtSelect = null;
    PreparedStatement pstmtUpdate = null;

    try {
        // Load JDBC driver and establish a connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Retrieve the current balance from the cards table for the given card_num
        String sqlSelect = "SELECT amount FROM cards WHERE TRIM(card_num) = ?";
        pstmtSelect = conn.prepareStatement(sqlSelect);
        pstmtSelect.setString(1, cardnum);
        ResultSet rs = pstmtSelect.executeQuery();

        if (rs.next()) {
            currentBalance = rs.getFloat("amount");  // Get the current balance
        } else {
            out.println("<h3>Error: Card number not found.</h3>");
            return;
        }

        // Calculate the new balance based on payment type
        if ("Credit".equalsIgnoreCase(paymentType)) {
            currentBalance += amount;  // Add amount for Credit
        } else if ("Debit".equalsIgnoreCase(paymentType) || "Transfer".equalsIgnoreCase(paymentType)) {
            if (currentBalance >= amount) {
                currentBalance -= amount;  // Subtract amount for Debit/Transfer if balance is sufficient
            } else {
                out.println("<h3>Error: Insufficient balance for the transaction.</h3>");
                return;
            }
        } else {
            out.println("<h3>Error: Invalid payment type.</h3>");
            return;
        }

        // Insert the transaction into the transaction table
        String sqlInsert = "INSERT INTO transaction (userId, goal, paymentType, dateOfPayment, amount, card_num) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sqlInsert);
        pstmt.setInt(1, Integer.parseInt(userId));
        pstmt.setString(2, goal);
        pstmt.setString(3, paymentType);
        pstmt.setDate(4, java.sql.Date.valueOf(dateOfPayment));
        pstmt.setBigDecimal(5, new java.math.BigDecimal(amount));
        pstmt.setString(6, cardnum);  // Insert card number as string

        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<h3>Transaction saved successfully!</h3>");
        } else {
            out.println("<h3>Error: Transaction not saved.</h3>");
            return;
        }

        // Update the new balance in the cards table
        String sqlUpdate = "UPDATE cards SET amount = ? WHERE TRIM(card_num) = ?";
        pstmtUpdate = conn.prepareStatement(sqlUpdate);
        pstmtUpdate.setFloat(1, currentBalance);
        pstmtUpdate.setString(2, cardnum);  // Update using card number as string

        int rowsUpdated = pstmtUpdate.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<h3>Card balance updated successfully!</h3>");
        } else {
            out.println("<h3>Error: Failed to update card balance.</h3>");
        }

    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        // Close resources
        if (pstmtSelect != null) pstmtSelect.close();
        if (pstmt != null) pstmt.close();
        if (pstmtUpdate != null) pstmtUpdate.close();
        if (conn != null) conn.close();
    }
%>
<a href="ViewAllTansaction.jsp";>View your transactions</a>
</center>
