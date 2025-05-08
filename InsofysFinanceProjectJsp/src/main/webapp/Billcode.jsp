<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.time.*" %> <!-- Import for LocalDate -->
<%@ page import="java.time.temporal.ChronoUnit" %> <!-- Import for ChronoUnit -->
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
    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/infoysdb"; // Replace with your database name
    String dbUser = "root"; // Replace with your MySQL username
    String dbPass = "root"; // Replace with your MySQL password

    // Retrieve parameters from the request
    String billName = request.getParameter("billname");
    String description = request.getParameter("description");
    String dueDate = request.getParameter("duedate"); // Assume format: yyyy-MM-dd
    BigDecimal amount = new BigDecimal(request.getParameter("amount")); // Convert to BigDecimal
    Integer uid = (Integer) session.getAttribute("uid");

    if (uid == null) {
        out.println("<h2>Error: User is not logged in.</h2>");
    } else {
        Connection conn = null;
        PreparedStatement checkTransactionStmt = null;
        PreparedStatement insertBillStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Default status
            String status = "Unpaid";

            // Check if a matching transaction exists
            String checkTransactionQuery = "SELECT 1 FROM transaction WHERE userId = ? AND goal = ? AND amount = ? LIMIT 1";
            checkTransactionStmt = conn.prepareStatement(checkTransactionQuery);
            checkTransactionStmt.setInt(1, uid);
            checkTransactionStmt.setString(2, billName);
            checkTransactionStmt.setBigDecimal(3, amount);

            ResultSet transactionResultSet = checkTransactionStmt.executeQuery();

            if (transactionResultSet.next()) {
                // Matching transaction exists, mark as Paid
                status = "Paid";
            }

            // Insert the bill into the database
            String insertBillQuery = "INSERT INTO bill (bill_name, item_description, due_date, amount, uid, status) VALUES (?, ?, ?, ?, ?, ?)";
            insertBillStmt = conn.prepareStatement(insertBillQuery);
            insertBillStmt.setString(1, billName);
            insertBillStmt.setString(2, description);
            insertBillStmt.setString(3, dueDate);
            insertBillStmt.setBigDecimal(4, amount);
            insertBillStmt.setInt(5, uid);
            insertBillStmt.setString(6, status);

            int rowsInserted = insertBillStmt.executeUpdate();
            if (rowsInserted > 0) {
                LocalDate currentDate = LocalDate.now();
                LocalDate billDueDate = LocalDate.parse(dueDate);
                long daysToDue = ChronoUnit.DAYS.between(currentDate, billDueDate);

                if (daysToDue >= 0 && daysToDue <= 3) {
                    out.println("<h2>Reminder: The bill \"" + billName + "\" is due in " + daysToDue + " days!</h2>");
                }

                if ("Paid".equals(status)) {
                    out.println("<h2>The bill \"" + billName + "\" has already been paid..</h2>");
                } else {
                    out.println("<h2>Bill \"" + billName + "\" added successfully...</h2>");
                }
            } else {
                out.println("<h2>Failed to add the bill. Please try again.</h2>");
            }
        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
            out.println("<h2>Database error: " + sqlEx.getMessage() + "</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Unexpected error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources
            try {
                if (checkTransactionStmt != null) checkTransactionStmt.close();
                if (insertBillStmt != null) insertBillStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>
<a href="viewbills.jsp">View your Bill</a>&nbsp;&nbsp;&nbsp;
<a href="dash.jsp">Back to Home</a>
</center>