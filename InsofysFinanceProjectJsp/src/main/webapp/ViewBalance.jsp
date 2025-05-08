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
</style>
<center>
<h1>DS Finance</h1>
</center>
<hr>
<%
    // Database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/infoysdb";
    String dbUser = "root";
    String dbPassword = "root";

    // Get the logged-in user ID from the session
    int uid = (int) session.getAttribute("uid");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load JDBC driver and establish a connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query to fetch balance data for the logged-in user
        String sql = "SELECT  uid, card_num, card_name, expire_date, cvv, amount FROM cards WHERE uid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, uid);

        // Execute query and get result set
        rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Balance</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th { padding: 8px 12px; border: 1px solid #ddd; text-align: left; color: white;  }
        td { padding: 8px 12px; border: 1px solid #ddd; text-align: left; color: white;  }
        
    </style>
</head>
<body>
	<center>
	<h2>Your Account Balance</h2>
	</center>
    
    <table>
        <tr>
            <th>CARD NUMBER</th>
            <th>CARD NAME</th>
            <th>EXPIRE DATE</th>
            <th>CVV</th>
            <th>Amount</th>
        </tr>

        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("card_num") %></td>
            <td><%= rs.getString("card_name") %></td>
            <td><%= rs.getString("expire_date") %></td>
            <td><%= rs.getString("cvv") %></td>
            <td><%= rs.getBigDecimal("amount") %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>

<%
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
