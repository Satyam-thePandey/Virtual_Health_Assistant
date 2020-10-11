<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");

		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String phone=request.getParameter("phone");
		String specialisation=request.getParameter("specialisation");
		String password=request.getParameter("password");
		
		
		

		
	   

		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
			Statement statement = connection.createStatement();
			String command = "UPDATE vmedico2 SET name='"+name+"',phone_no='"+phone+"',password='"+password+"',specialisation='"+specialisation+"',age='"+age+"' WHERE email='"+email+"'";
			statement.executeUpdate(command);
			
					
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		out.println("notb");
		e.printStackTrace();
		}
		response.sendRedirect("updateDoctor.jsp");  
		%>
</body>
</html>