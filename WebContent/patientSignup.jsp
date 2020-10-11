<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="login.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet">

<style>
#msg{
	visibility: hidden;
	min-width: 250px;
	background-color: yellow;
	color: #000;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	right: 30%;
	top: 30px;
	font-size: 17px;
	margin-right: 30px;
}
#msg.show{
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
@-webkit-keyframes fadein{
	from{top:0; opacity:0;}
	to{top: 30px; opacity: 1;}
}
@keyframes fadein{
	from{top:0; opacity:0;}
	to{top:0;opacity: 0;}
}
@-webkit-keyframes fadeout{
	from{top:30px; opacity:1;}
	to{top: 0; opacity: 0;}
}
@keyframes fadeout{
	from{top:30px; opacity:1;}
	to{top:0;opacity: 0;}
}
		

</style>



</head>
<body>
<div class="signup">
	<form action='patientRegister' method='post' >
	<h2 style="color: #fff;">Sign Up</h2>
	Email ID:<input type='email' name='email' required/><br><br>
	Name:<input type='text' name='name' required/><br><br>
	Phone:<input type='text' name='phone' required/><br><br>
	Age:<input type='number' name='age' required/><br><br>
	Password:<input type='password' name='password' required/><br><br>
	<!-- Image Link: <input type="file" name="file"><br><br> -->
	<input type='submit' value='Sign up' onclick="myFunction()" ><br><br>
		<div id="msg">Please fill all the entries
		!!!</div>
		<script >
			function myFunction(){
			var x= document.getElementById("msg");
			x.className="show";
			setTimeout(function(){x.className=
				x.className.replace("show","");},3000);
			}
		</script>
			Already have account?<a href="patientLogin.jsp" style="text-decoration: none;
			font-family: 'Play', sans-serif; color:yellow;">&nbsp; Log In</a>
	</form>



</div>
</body>
</html>