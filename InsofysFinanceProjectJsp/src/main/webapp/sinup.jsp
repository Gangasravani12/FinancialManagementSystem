<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<style>
body{
background: lightgray;
}
.container{
border-radius: 10px;
height: 80%;
width: 80%;
background-color: black;
box-shadow: 10px 10px 10px gray;
display: flex;
justify-content: center;
align-items: center;
margin: 2% auto;
font-family: cursive;
}
.left{
justify-content: center;
align-items: center;
height: 50%;
width: 50%;
padding: 10px;
color: white;
}
.right{
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
<div class="container">
<div class="left">
<center>
<h1>Welcome <br> Back!</h1>
<p>To keep connected with us please log <br> in with your personal info</p><br><br>
<a style="" href="login.jsp">SIGN IN</a>
</center>
</div>
<div class="right">
<center>
<h1>Create <br> Account</h1>
<form action="Signup.jsp" method="post">
<input type="text" name="uname" placeholder="Enter your name"><p></p>
<input type="password" name="password" placeholder="Enter password"><p></p>
<input type="email" name="mail" placeholder="Enter your email id"><p></p>
<input type="radio" name="gender" value="male">Male
<input type="radio" name="gender" value="female">Female<p></p>
<input type="text" name="address" placeholder="Enter address"><p></p>
<input style="width: 50%; border-radius: 20px;" type="submit" value="SIGN UP">
</form>
</center>
</div>
</div>
</body>
</html>