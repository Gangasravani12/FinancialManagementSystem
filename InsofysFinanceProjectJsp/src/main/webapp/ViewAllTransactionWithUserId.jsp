<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
int userId=(Integer)session.getAttribute("uid");
out.print("The User Id is="+userId);

    // Database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/infosysdb";
    String dbUser = "root";
    String dbPassword = "root";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query to fetch transaction data with user details
      /*  String sql = "SELECT t.transaction_id, t.goal, t.paymentType, t.dateOfPayment, t.amount, " +
                     "u.uid, u.name, u.email " +
                     "FROM transaction t " +
                     "JOIN users u ON t.userId = u.uid"; */
                     PreparedStatement ps=conn.prepareStatement("select *from transaction where userId=userId");
                    // ps.setInt(1,userId);

        // Execute query and get result set
        rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Transactions with User Info</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>All Transactions with User Information</h2>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>User ID</th>
            <th>Goal</th>
            <th>Payment Type</th>
            <th>Date of Payment</th>
            <th>Amount</th>
        </tr>

        <% 
            // Loop through the result set and display each transaction with user details
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getInt("transaction_id") %></td>
            <td><%= rs.getInt("userId") %></td>
            <td><%= rs.getString("goal") %></td>
            <td><%= rs.getString("paymentType") %></td>
            <td><%= rs.getDate("dateOfPayment") %></td>
            <td><%= rs.getBigDecimal("amount") %></td>
        </tr>
        <% 
            } 
        %>
    </table>
</body>
</html>

<%
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        // Close resources
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
    