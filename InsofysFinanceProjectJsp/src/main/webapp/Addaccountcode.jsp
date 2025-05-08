<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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
	color: black;
	padding: 15px;
	border: 2px solid white;
border-radius: 10px;
background-color: lightgray;
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
    // Retrieve form data
    String card_number = request.getParameter("cno");
    String card_name = request.getParameter("cname");
    String expire_date = request.getParameter("expdate");
    String cvv = request.getParameter("cvv");
    String amount = request.getParameter("amount");

    // Retrieve UID from session (assuming user is logged in and UID is stored in session)
    Integer uid = (Integer) session.getAttribute("uid");

    if (uid == null) {
        out.println("<h2>Error: User is not logged in.</h2>");
    } else {
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/infoysdb"; // replace with your database name
        String dbUser = "root"; // replace with your MySQL username
        String dbPass = "root"; // replace with your MySQL password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Insert data into the cards table with UID
            String sql = "INSERT INTO cards (uid, card_num, card_name, expire_date, cvv, amount) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setInt(1, uid); // Set UID from session
            pstmt.setString(2, card_number);
            pstmt.setString(3, card_name);
            pstmt.setString(4, expire_date);
            pstmt.setString(5, cvv);
            pstmt.setDouble(6, Double.parseDouble(amount));

            // Execute the update
            int rowsInserted = pstmt.executeUpdate();

            // Output success message
            if (rowsInserted > 0) {
                out.println("<h2>Account added successfully!</h2>");
                
            } else {
                out.println("<h2>Failed to add account. Please try again.</h2>");
            }

        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
            out.println("<h2>Database error: " + sqlEx.getMessage() + "</h2>");
        } catch (NumberFormatException nfe) {
            out.println("<h2>Invalid input for amount. Please enter a valid number.</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Unexpected error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>
<br><br>
<a href="addaccount.jsp">Back to Add Account</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="welcome.jsp">Back to Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="balance.jsp">Check your account</a>
</center>
