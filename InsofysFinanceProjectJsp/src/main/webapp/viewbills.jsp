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
<center>
<h1>DS Finance</h1>
</center>
<hr>
<center>
<%
    String dbUrl = "jdbc:mysql://localhost:3306/infoysdb";
    String dbUser = "root";
    String dbPassword = "root";
    Integer uid = (Integer) session.getAttribute("uid");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        String sql = "SELECT uid, item_description, due_date, amount ,status FROM bill WHERE uid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, uid);

        rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Bills</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th{ padding: 8px 12px; border: 1px solid #ddd; text-align: left; color: white }
        td { padding: 8px 12px; border: 1px solid #ddd; text-align: left; color: white }
    </style>
</head>
<body>
    <h2>Your bills</h2>
    <table>
        <tr>
            <th>UID</th>
            <th>Item Description</th>
            <th>Due Date</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>

        <% 
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getInt("uid") %></td>
            <td><%= rs.getString("item_description") %></td>
            <td><%= rs.getDate("due_date") %></td>
            <td><%= rs.getBigDecimal("amount") %></td>
            <td><%= rs.getString("status") %></td>
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
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
<br><br><br>
<a href="ViewAllTansaction.jsp">Track your bills records</a>
</center>
