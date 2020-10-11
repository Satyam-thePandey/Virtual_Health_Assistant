<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
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
					<a href="patientProfile.jsp">Home</a>
					<a href="patientDashboard.html">DASHBOARD</a>
					<a href="patientRequest.jsp">Book Test</a>
					<a href="retreveReport1.jsp">My Reports</a>
					<a href="patientPrescription.jsp">My Prescriptions</a>
					<a href="patientLogout.jsp">Logout</a>
			
			</div>
			<h1>Prescription History</h1>
					</div>
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
          



<%
	String s=(String)session.getAttribute("e");
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
			String sql ="SELECT * FROM dosage where email = '"+s+"'";
			resultSet = statement.executeQuery(sql); 
			%>
	
	
			
      
	  <center><b>Prescription:</b></center>
       
       <center> 
        <table class="content-table" id="table">
            <tr>
                <th>Email</th>
                 
                
                
                <th>Diagnosis</th>
                <th>Prescription</th>
				<th>Prescription</th>
				<th>Prescription</th>
				<th>Dosage</th>
				<th>Do's & Don't</th>
            </tr>
            
            <% 	
		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString("email") %></td>
		
		
		<td><%=resultSet.getString("diagnosis") %></td>
		<td><%=resultSet.getString("prescription1") %></td>
		<td><%=resultSet.getString("prescription2") %></td>
		<td><%=resultSet.getString("prescription3") %></td>
		<td><%=resultSet.getString("dosage") %></td>
		<td><%=resultSet.getString("does") %></td>
		</tr>
            
            <%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
			</div>
<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("patientLogin.jsp");
	}

%>
        </table>
		</center>

        
    </body>
</html>>