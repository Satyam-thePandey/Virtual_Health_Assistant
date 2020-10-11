<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<link href="login.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet">
</head>

<body>
    <%
	String s=(String)session.getAttribute("msg");
	if(s!=null){
%>
<b><%=s%></b>
<% s=null;
	}
%>


<hr>
<div class="signin">
<form action='doctorLoginProcess.jsp' method='post' >
	<h2 style="color: white">DOCTOR LOGIN</h2>
	Email ID:<input type='email' name='email' required/><br><br>
	Password:<input type='password' name='password'  required/><br><br>
<input type="submit" value="Log In" /><br>
	<br>
	
<div id="container">
<a href="#" style="margin-right:0px; font-size:13px; font-family: Tahoma ,Geneva, sans-serif;">
Reset password</a>
<a href="#" style="margin-right:0px; font-size:13px; font-family: Tahoma ,Geneva, sans-serif;">
Forgot password</a><br><br><br><br><br><br>

</div>
</form>
</div>

</body>
</html>