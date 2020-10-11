<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ehealth</title>
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
</head>
<body>
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
			String sql ="SELECT * FROM vmedico1";
			resultSet = statement.executeQuery(sql); 
			%>
	
 <%
 		if(resultSet.next() ){
 %>

 <center><b>Fetch Patient Records</b></center>
       <div id="top">
       <center> 
        <table class="content-table" id="table">
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Phone</th>
				<th>Password</th>
				<th>Age</th>
				
            </tr>
            <tr>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("phone") %></td>
		<td><%=resultSet.getString("password") %></td>
		<td><%=resultSet.getString("age") %></td>
		
		</tr>
            
            <% 	
 		} else{
 			%>
 			<h1><center><b>NO RECORD FOUND</b></center></h1>
 			<% 
 		}
		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("phone") %></td>
		<td><%=resultSet.getString("password") %></td>
		<td><%=resultSet.getString("age") %></td>
		
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

<form action="update.jsp" method="get">


 		<b>Email:</b><input type="text" name="email" id="email" readonly><br><br>
 		<b>Name:</b><input type="text" name="name" id="name"><br><br>
       <b>Phone:</b> <input type="text" name="phone" id="phone"><br><br>
        <b>Password:</b><input type="text" name="password" id="password"><br><br>
       <b>Age:</b> <input type="text" name="age" id="age"><br><br>
       
		<input type="submit" value="UPDATE"></b>
		</form>
		
		
		<form action="deletePatient.jsp" method="get">
		 <input type="hidden" name="email2" id="email2" ><br>
		
		<input type="submit" value="DELETE"></b>
		</form>
		
		
		

<script>
    
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("email").value = this.cells[0].innerHTML;
                         document.getElementById("email2").value = this.cells[0].innerHTML;
                         document.getElementById("name").value = this.cells[1].innerHTML;
                         document.getElementById("phone").value = this.cells[2].innerHTML;
                         document.getElementById("password").value = this.cells[3].innerHTML;
                         document.getElementById("age").value = this.cells[4].innerHTML;
                    };
                }
    
         </script>
         	<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("adminLogin.jsp");
	}

%>
</body>
</html>