<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<style>
body{
background: lightgray;
}
.container{
border-radius: 10px;
height: 80%;
width: 80%;
box-shadow: 10px 10px 10px gray;
display: flex;
justify-content: center;
background-color: black;
align-items: center;
margin: 5% auto;
font-family: cursive;
}
.right{
justify-content: center;
align-items: center;
height: 50%;
width: 50%;
padding: 10px;
color: white;
background-color: black;
}
.left{
justify-content: center;
align-items: center;
padding: 15px;
height: 50%;
width: 50%;
background-color: white;
}
input{
border: 2px solid white;
border-radius: 10px;
background-color: lightgray;
text-align: center;
padding: 10px;
font-family: cursive;
}
a{
background-color: lightgray; 
text-align: center; 
text-decoration: none; 
color: black; 
padding: 15px;
border-radius: 20px;
width: 50px;
}
</style>
</head>
<body>
<center>
<div class="container">
<div class="left">
<h1>Sign In</h1>
<form action="Logincode.jsp" method="post">
<input type="text" name="uname" placeholder="Enter your name"><p></p>
<input type="password" name="password" placeholder="Enter password"><p></p>
<p>Already have an account?</p>
<input style="width: 50%; border-radius: 20px;" type="submit" value="SIGN IN">
</form>
</div>
<div class="right">
<h1>Hello...!</h1>
<p>Enter your personal details and start <br> your journey with us</p><br><br>
<a href="sinup.jsp">SIGN UP</a>
</div>
</div>
</center>
</body>
</html>