<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
		    
<link href="dashboard.css" rel="stylesheet" >
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
    String spe=(String)session.getAttribute("sp");
	if(s!=null){
%>
	<%
		
		Connection connection = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
            
			statement = connection.createStatement();
			String sql ="SELECT * FROM patientdatabase where status = 'unresolved' ";
			resultSet = statement.executeQuery(sql); 
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
					<a href="doctorProfile.jsp">Home</a>
					<a href="doctorDashboard.jsp">Dashboard</a>
					
					<a href="prescription.jsp">Prescription History</a>
					<a href="doctorLogout.jsp">Logout</a>
			
			</div>
			<h1>DASHBOARD</h1>
					</div>
			
      
	  <center><b>New Patient Requests</b></center>
       <div id="top">
       <center> 
        <table class="content-table" id="table">
            <tr>
                <th>Email</th>
                <th>Field</th>
                <th>Symptom1</th>
                <th>Symptom2</th>
				<th>Symptom3</th>
				<th>Other( Allergies if any)</th>
				<th>Status</th>
            </tr>
            
            <% 	
		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("field") %></td>
		<td><%=resultSet.getString("symptom1") %></td>
		<td><%=resultSet.getString("symptom2") %></td>
		<td><%=resultSet.getString("symptom3") %></td>
		<td><%=resultSet.getString("symptom4") %></td>
		<td><%=resultSet.getString("status") %></td>
		</tr>
            
            <%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
        </table>
		</center>
		
		</div>
		<br><br>
		<form action="dosage.jsp" method="get">
		<p>
		 <b>Email:</b>          <input type="text" name="email" id="email" required/><br><br>
		 <b>Field:</b>          <input type="text" name="field" id="field" required/><br><br>
		 <b>Diagnosis:</b>     <input type="text" name="diagnosis" id="diagnosis" required/><br><br>
		 <b>Prescription:</b>   <input type="text" name="prescription1" id="prescription1" required/><br><br>
				<input type="text" name="prescription2" id="prescription2"><br><br>
				<input type="text" name="prescription3" id="prescription3"><br><br>
		  <b>Dosage:</b>	<input type="text" name="dosage" id="dosage" required/><br><br>
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
                   		 document.getElementById("email").value = this.cells[0].innerHTML;
                         document.getElementById("field").value = this.cells[1].innerHTML;
                     };
                }
    
         </script>
         
        
        <%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("doctorLogin.jsp");
	}

%>
        
    </body>
</html>