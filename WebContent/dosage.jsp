<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
		%>
		
		 <%	
		String email=request.getParameter("email");
		 String field=request.getParameter("field");
			
		String diagnosis=request.getParameter("diagnosis");
		String prescription1=request.getParameter("prescription1");
		String prescription2=request.getParameter("prescription2");
		String prescription3=request.getParameter("prescription3");
		String dosage=request.getParameter("dosage");
		String does=request.getParameter("does");
		
		
		

		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
			Statement statement = connection.createStatement();
			String command = "INSERT into dosage(email,diagnosis,prescription1,prescription2,prescription3,dosage,does)values('"+email+"','"+diagnosis+"','"+prescription1+"','"+prescription2+"','"+prescription3+"','"+dosage+"','"+does+"')";
			statement.executeUpdate(command);
			
					
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		out.println("notb");
		e.printStackTrace();
		}
		
		try
		{	
			Connection connection = null;
        	Class.forName("oracle.jdbc.driver.OracleDriver");
       		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
			Statement statement = connection.createStatement();
			String command = "UPDATE patientdatabase SET status = 'resolved' WHERE email ='"+email+"' AND field='"+field+"'";
			statement.executeUpdate(command);
			
					
			out.println("Data is successfully inserted!");
			response.sendRedirect("doctorDashboard.jsp");
		}
		catch(Exception e)
		{
		System.out.print(e);
		out.println("notb");
		e.printStackTrace();
		}
		
		%>
		
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
              
<link href="dashboard.css" rel="stylesheet" >
          
      <style>
			.content-table{
				border-collapse: collapse;
				margin: 25px 0;
				font-size: 0.9em;
				min-width:400px;
				border-radius: 5px 5px 0 0;
				overflow: hidden;
				box-shadow: 0 0 20px rgba(0,0,0,0.15);
				
			}
			.content-table thead tr{
				background-color: #009879;
				color: #ffffff;
				text-align: left;
				font-weight: bold;
			}
		.content-table th,
		.content-table td{
			padding: 12px 15px;
		}
		.content-table tbody tr{
			border-bottom: 1px solid #dddddd;
		}
		.content-table tbody tr:nth-of-type(even) {
				background-color: #f3f3f3;
				}
				.content-table tbody tr:last-of-type {
				border-bottom: 2px solid #009879;
			}
		</style>
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
					<a href="doctorProfile.jsp">Home</a>
					<a href="doctorDashboard.jsp">Dashboard</a>
					<a href="fetchRecords.jsp">New Requests</a>
					<a href="prescription.jsp">Prescription History</a>
					<a href="doctorLogout.jsp">Logout</a>
			
			</div>
			<h1>DASHBOARD</h1>
					</div>
	
	
		</div>
		<br><br>
		<form action="dosage.jsp" method="get">
		<p>
		 <b>Email</b>          <input type="text" name="email" id="email"><br><br>
		 <b>Diagnosis:</b>     <input type="text" name="diagnosis" id="diagnosis"><br><br>
		 <b>Prescription:</b>   <input type="text" name="presciption1" id="presciption1"><br><br>
				<input type="text" name="presciption2" id="presciption2"><br><br>
				<input type="text" name="presciption3" id="presciption3"><br><br>
		  <b>Dosage:</b>	<input type="text" name="dosage" id="dosage"><br><br>
		<b> Do's & Don't:</b> <textarea id="does" name="does" rows="4" cols="50">
		</textarea>
		 
		<b>	<input type="submit" value="UPDATE"></b>
		 </p>
        
		
        </form>
        <script>
    
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("email").value = this.cells[0].innerHTML;
                        
                    };
                }
    
         </script>
      
         
    </body>
</html>