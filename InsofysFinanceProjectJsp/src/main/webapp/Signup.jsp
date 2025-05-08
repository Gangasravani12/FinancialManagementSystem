<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACCOUNT</title>
</head>
<body>
<%
try{
	String name=request.getParameter("uname");
	String password = request.getParameter("password");
    String email = request.getParameter("mail");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infoysdb", "root", "root");

    // Skip uid column so it auto-increments
    PreparedStatement ps = con.prepareStatement("INSERT INTO users(name, password, email, gender, address) VALUES(?,?,?,?,?)");

    ps.setString(1, name);
    ps.setString(2, password);
    ps.setString(3, email);
    ps.setString(4, gender);
    ps.setString(5, address);

    int i = ps.executeUpdate();
    if (i > 0) {
        response.sendRedirect("success.jsp");
    } else {
        out.print("User Registration Failed");
    }
}
catch(Exception ex){
	out.print(ex);
}
%>
</body>
</html>