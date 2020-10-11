<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
	 " rel="stylesheet">
	 <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	 
	   <link href="dashboard.css" rel="stylesheet" >
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
	String succ=(String)session.getAttribute("success");
	if(succ!=null){
%>
<b><%=succ%></b>
<% succ=null;
	}
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
			<h1>Book Test</h1>
					</div>
<div id="top">
	<form action="labTest.jsp" method="get">
	<label for="test"><b>Test Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
        <select id="test" name="test" >
           <option value="">-- Test Name --</option> 
  	<option>Lipid_Profile</option> 
  	<option>Thyroid_Profile_Total</option> 
   	<option>Glycosylated_Hemoglobin (HbA1c)</option>
   	<option>Glucose-Fasting_Blood </option> 
   	<option>Complete_Blood_Count</option>
   	<option>Liver_Function_Test</option> 
   	<option>Kidney_Function_Test</option> 
   	<option>Vitamin_D_Profile</option>
   	<option>Vitamin_B12</option> 
   	<option>Urine_Routine_Examination </option> 
        </select>
        </br></br></br>
         <div>
			<label for="date"><b>Date:</b></label>
                    <input type="date" onload="getDate()" class="form-control" id="date" 
                      name="date" >
		</div>
    <script >
       function getDate() {
    	   var today = new Date();
    	   var dd = today.getDate();
    	   var mm = today.getMonth()+1; //January is 0!
    	   var yyyy = today.getFullYear();

    	   if(dd<10) {
    	       dd = '0'+dd
    	   } 

    	   if(mm<10) {
    	       mm = '0'+mm
    	   } 

    	   today = yyyy + '/' + mm + '/' + dd;
    	   console.log(today);
    	   document.getElementById("date").value = today;
    	 }


    	 window.onload = function() {
    	   getDate();
    	 };
		</script>	 
		
     <br>
		<input type="submit" value ="SUBMIT"></input>
		</form>
		
		</div>

</body>
</html>