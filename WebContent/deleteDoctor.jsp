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
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>
  
<%
String email=request.getParameter("email2");

		
		

		
	   

		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
			Statement statement = connection.createStatement();
			String command = "DELETE FROM vmedico2 WHERE email='"+email+"'";
			statement.executeUpdate(command);
			
					
			out.println("Data is deleted !");
		}
		catch(Exception e)
		{
		System.out.print(e);
		
		e.printStackTrace();
		}
		response.sendRedirect("viewDoctor.jsp");  
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