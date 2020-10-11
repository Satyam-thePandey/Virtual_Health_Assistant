<%@ page import="java.sql.*" %>

<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>

<HTML>
<head>
<meta charset="ISO-8859-1">
<title>Doctor List</title>
<link href="dashboard.css" rel="stylesheet" >
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
         <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
	 " rel="stylesheet">
	 <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	  <link href="style.css" rel="stylesheet" >
	  
</head>
    <BODY >
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
					<a href="adminHome.html">Home</a>
					<a href="viewDoctor.jsp">View Doctor</a>
					
					<a href="addDoctor.jsp">Add Doctor</a>
					<a href="doctorLogout.jsp">Logout</a>
			
			</div>
			<h1>Add Doctor</h1>
					</div>
        

   <h2 align="center">Add Doctor</h2>
        <form name="form1" action="addDoctor2.jsp" onsubmit="return validateForm()" method="post">
                
                Email:<input type="text" name="email" id="email"><br><br>
 				Name:<input type="text" name="name" id="name"><br><br>
				Age:<input type="text" name="age" id="age"><br><br>
       			Phone:<input type="text" name="phone" id="phone"><br><br>
				
               Field:<select id="specialisation" name="specialisation" >
               <option value=""></option> 
  	           <option>Bone and joints</option> 
           	   <option>Brain and Nerves</option> 
               <option>Cancer</option>
   	           <option>Child</option> 
   	           <option>Dental</option>
   	           <option>Diabetes_Management</option> 
   	           <option>Digestive_Issue</option> 
                </select>
        <br><br>
        	    Password<input type="text" name="password" id="password"><br><br>
                
                       
            <center><input align="center" type="submit" value="ADD DOCTOR"/></center>
        </form>
        
        
        <script>
function validateForm() {
  var email = document.forms["form1"]["email"].value;
  var name = document.forms["form1"]["name"].value;
  var age = document.forms["form1"]["age"].value;
  var phone = document.forms["form1"]["phone"].value;
  var specialisation = document.forms["form1"]["specialisation"].value;
  var password = document.forms["form1"]["password"].value;
  if (email == "") {
    alert("Email must be filled out");
    return false;
  }
  if (name == "") {
	    alert("Name must be filled out");
	    return false;
	  }
  if (age == "") {
	    alert("Age must be filled out");
	    return false;
	  }
  if (phone == "") {
	    alert("Phone must be filled out");
	    return false;
	  }
  if (specialisation == "") {
	    alert("specialisation must be filled out");
	    return false;
	  }
  if (password == "") {
	    alert("Password must be filled out");
	    return false;
	  }
}
</script>

	<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("adminLogin.jsp");
	}

%>
    </BODY>
</HTML>