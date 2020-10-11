<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import=" java.sql.*"%>
<%@ page errorPage="ExceptionPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Patient Profile</title>

	
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
	 " rel="stylesheet">
	 <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	  <link href="style.css" rel="stylesheet" >
	  <script>
	  	function openSlideMenu(){
	  		document.getElementById('menu').style.width='250px';
	  		document.getElementById('content').style.marginLeft='250px';
	  	}
	  	function closeSlideMenu(){
	  		document.getElementById('menu').style.width='0';
	  		document.getElementById('content').style.marginLeft='0';
	  	}
	  </script>
</head>
<body>
<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>
<% ResultSet rs=(ResultSet)session.getAttribute("result");
	

%>

	<div id="content">
		
			<span class="slide">
				<a href="#"onclick="openSlideMenu()">
				<i class="fas fa-bars"></i>
				</a>
			</span>
			<div id="menu" class="nav">
				<a href="#" class="close" onclick="closeSlideMenu()">
					<i class="fas fa-times"></i>
					</a>
					<a href="patientProfile.jsp">Home</a>
					<a href="patientDashboard.html">DASHBOARD</a>
					<a href="patientRequest.jsp">Book Test</a>
					<a href="retreveReport1.jsp">My Reports</a>
					<a href="patientPrescription.jsp">My Prescriptions</a>
					<a href="patientLogout.jsp">Logout</a>
			
			</div>
			<h1>HOME</h1>
					</div>
		
	<div class ="profile-card">
		
		<div class="image-container">
			<img  src="images/a.jpg" width="350" height="300">
		<div class="title">
			<h2><%= rs.getString(2) %></h2>
		</div>
		</div>
		<div class="main-container">
		
			<p><i class="fa fa-envelope info" aria-hidden="true"><br></i>Email:<%=rs.getString(1)%></p>
			
			<p><i class="fa fa-phone info" aria-hidden="true"><br></i>Phone:<%=rs.getString(3)%></p>
			<p><i class="fa fa-id-card info" aria-hidden="true"><br></i>Age:<%=rs.getInt(4)%></p>
		<hr>

		
		
		
		</div>
		
		
	</div>
<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("patientLogin.jsp");
	}

%>

</body>
</html>