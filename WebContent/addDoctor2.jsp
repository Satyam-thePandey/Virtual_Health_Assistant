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
			String command = "INSERT INTO vmedico2 (email,name,age,phone_no,specialisation,password) VALUES ('"+email+"','"+name+"','"+age+"','"+phone+"','"+specialisation+"','"+password+"')";
			statement.executeUpdate(command);
			
					
			out.println("Data is successfully inserted!");
			response.sendRedirect("addDoctor.jsp"); 
		}
		
		catch(Exception e)
		{
			
		out.print(e);
		
		e.printStackTrace();
		}
		 
		%>
			<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("adminLogin.jsp");
	}

%>
</body>
</html>