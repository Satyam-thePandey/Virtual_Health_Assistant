<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
    
    <%	
    	String s=(String)session.getAttribute("e");
		String test=request.getParameter("test");
		String date=request.getParameter("date");
		String status= "unresolved";
		
		

		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
			Statement statement = connection.createStatement();
			String command = "INSERT into labtest(email,test,date1,status)values('"+s+"','"+test+"','"+date+"','"+status+"')";
            statement.executeUpdate(command);
            session.setAttribute("success","Request Successful!!");
			response.sendRedirect("patientRequest.jsp");
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>