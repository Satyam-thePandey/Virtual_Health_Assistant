<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ehealth</title>

		<link href="dashboard.css" rel="stylesheet" >
		<link href="style.css" rel="stylesheet" >
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
			
input[type=text] {
  width: 50%;
  padding: 6px 10px;
  margin:  0;
  margin-left: 100px;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
   background-color: #f8f8f8;
}

input[type=text]:focus {
  border: 3px solid #555;
}
		</style> <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
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
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

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
					<a href="technician.jsp">Home</a>
					<a href="technicianLogout.jsp">Logout</a>
			
			</div>
			<h1>HOME</h1>
					</div>
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
			String sql ="SELECT * FROM labtest where status = 'unresolved'";
			resultSet = statement.executeQuery(sql);
			
			if(resultSet.next() ){
			%>
	


 <center><b>Request for Test</b></center>
       <div id="top">
       <center> 
        <table class="content-table" id="myTable" >
            <tr>
                <th>Email</th>
                <th>Test</th>
                <th>Status</th>
				<th>Date</th>
				
				
            </tr>
            <tr>
		<td><%=resultSet.getString("email") %></td>
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
		<tr>
		<td><%=resultSet.getString("email") %></td>
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
        <form method="post" action ="FileuploadServlet" enctype="multipart/form-data">
		<p>
		 <b>Email</b>     <input type="text" name="email" id="email" /required><br><br>
		 <b>Test:</b>     <input type="text" name="test" id="test"><br><br>
		 <b>Date:</b>     <input type="text" name="date1" id="date1"><br><br>
		  
		
		<b> Report:</b>  <input type="file" name="report" id="report"><br><br>
		 
		<b>	<input type="submit" value="UPDATE"></b>
		 </p>
        
		
        </form>
        <script>
    
                var table = document.getElementById('myTable');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("email").value = this.cells[0].innerHTML;
                         document.getElementById("test").value = this.cells[1].innerHTML;
                         document.getElementById("date1").value = this.cells[3].innerHTML;
                          
                        
                    };
                }
    
         </script>
		</center>
		
		</div>
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
		<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("adminLogin.jsp");
	}

%>
</body>
</html>