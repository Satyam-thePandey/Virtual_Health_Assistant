<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.*"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta charset="ISO-8859-1">
<title>Doctor List</title>
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
<body>
	    
<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>
<%			
		
		String status;
		Connection connection = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
            
			statement = connection.createStatement();
			String sql ="SELECT test,status,date1 FROM labtest WHERE email='"+s+"' AND status='resolved'";
			resultSet = statement.executeQuery(sql);
			
			if(resultSet.next() ){
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
			<h1>My Reports</h1>
					</div>

	 <center><b>Lab Report</b></center>
	       <div id="top">
	       <center> 
	        <table class="content-table" id="myTable" >
	            <tr>
	                <th>Test Name</th>
	                <th>Status</th>
	                 <th>Date</th>
	                
	                
					
					
	            </tr>
	            <tr >
			<td><%=resultSet.getString("test") %></td>
			<td><%=resultSet.getString("status") %></td>
			<td><%=resultSet.getString("date1") %></td>
			
			
			</tr>
	            
	            <% 	}
				else{
					%>
					<h1><center><b>NO RECORD FOUND!</b></center></h1>
					<% 
				}
			while(resultSet.next()){
			%>
			<tr >
			<td><%=resultSet.getString("test") %></td>
			<td><%=resultSet.getString("status") %></td>
			<td><%=resultSet.getString("date1") %></td>
			
			
			</tr>
	            
	            <%
			}
	            connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
	        </table>

		<form action="retreveReport.jsp" method="get">
				<input type="text" name="test" id="test" >
				<input type="text" name="date1" id="date1" >
				<input type="submit" value="View/Download">
		
		</form>
		<br><br>
		
		 <script>
    
                var table = document.getElementById('myTable');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("test").value = this.cells[0].innerHTML;
                         document.getElementById("date1").value = this.cells[2].innerHTML;
                        
                          
                        
                    };
                }
    
         </script>


<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("patientLogin.jsp");
	}

%>
</body>
</html>