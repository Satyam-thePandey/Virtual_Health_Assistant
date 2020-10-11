<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>
<!DOCTYPE html>
<html>
<head>
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
	  <style type="text/css">
	update:link, update:visited {
			  background-color: #f44338;
			  color: white;
			  padding: 14px 25px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			}

update:hover, update:active {
  background-color: red;</style>
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
					<a href="adminHome.html">Home</a>
					<a href="viewDoctor.jsp">View Doctor</a>
					<a href="addDoctor.jsp">Add Doctor</a>
					<a href="doctorLogout.jsp">Logout</a>
			
			</div>
			<h1>View Doctor</h1>
					</div>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

<%
		
		Connection connection = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
            
			statement = connection.createStatement();
			String sql ="SELECT * FROM vmedico2";
			resultSet = statement.executeQuery(sql);
			
			if(resultSet.next() ){
			%>
	


 <center><b>Fetch Doctor Records</b></center>
       <div id="top">
       <center> 
        <table class="content-table" id="myTable" >
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Age</th>
				<th>Phone No.</th>
				<th>Specialisation</th>
				<th>Password</th>
				
            </tr>
            <tr>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("age") %></td>
		<td><%=resultSet.getString("phone_no") %></td>
		<td><%=resultSet.getString("specialisation") %></td>
		<td><%=resultSet.getString("password") %></td>
		
		</tr>
            
            <% 	}
			else{
				%>
				<h1><center><b>NO RECORD FOUND!</b></center></h1>
				<% 
			}
		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("age") %></td>
		<td><%=resultSet.getString("phone_no") %></td>
		<td><%=resultSet.getString("specialisation") %></td>
		<td><%=resultSet.getString("password") %></td>
		
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
		<div class="update" > <a href="updateDoctor.jsp">
         Update or Delete Doctor
      </a></div>
		<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
		<script>
    
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                          document.getElementById("email").value = this.cells[0].innerHTML;
                        
                         document.getElementById("name").value = this.cells[1].innerHTML;
						  document.getElementById("age").value = this.cells[2].innerHTML;
                         document.getElementById("phone").value = this.cells[3].innerHTML;
						  document.getElementById("specialisation").value = this.cells[4].innerHTML;
                         document.getElementById("password").value = this.cells[5].innerHTML;
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