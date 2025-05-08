<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/infoysdb";
    String dbUser = "root";
    String dbPassword = "root";

    // Get form parameters
    String userId = request.getParameter("userId");
    String goalName = request.getParameter("goal");
    String goalAmount = request.getParameter("goal_amount");
    String startDate = request.getParameter("start_date");
    String targetDate = request.getParameter("target_date");

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Prepare the SQL query (excluding goal_id as it is auto-incremented)
        String sql = "INSERT INTO goals (userId, goal, goal_amount, start_date, target_date) VALUES (?, ?, ?, ?, ?);";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, Integer.parseInt(userId)); // Parse userId as Integer
        preparedStatement.setString(2, goalName); // Goal name
        preparedStatement.setDouble(3, Double.parseDouble(goalAmount)); // Goal amount
        preparedStatement.setDate(4, Date.valueOf(startDate)); // Start date
        preparedStatement.setDate(5, Date.valueOf(targetDate)); // Target date

        // Execute the query
        int rowsInserted = preparedStatement.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<p>Goal added successfully!</p>");
        } else {
            out.println("<p>Failed to add the goal. Please try again.</p>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<a href="goals.jsp">Go Back to goal</a>
