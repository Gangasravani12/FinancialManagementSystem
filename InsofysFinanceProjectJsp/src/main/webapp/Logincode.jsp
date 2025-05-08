<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<%
try {
    String name = request.getParameter("uname");
    String password = request.getParameter("password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infoysdb", "root", "root");

    // Check if the user exists with the provided username and password
    PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE name = ? AND password = ?");
    ps.setString(1, name);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // If user exists, redirect to success page
        // Retrieve the uid
        int uid = rs.getInt("uid");

        // Set uid in the session
        session.setAttribute("uid", uid);
        response.sendRedirect("dash.jsp");
    } else {
        // If no match is found, display an error message
        out.print("Invalid username or password. Please try again.");
    }

} catch(Exception ex) {
    out.print(ex);
}

%>
</body>
</html>