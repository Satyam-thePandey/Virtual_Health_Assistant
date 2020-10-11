<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
    
<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>
    <%	
   		
		String disease=request.getParameter("disease");
		String symptom1=request.getParameter("symptom1");
		String symptom2=request.getParameter("symptom2");
		String symptom3=request.getParameter("symptom3");
		String symptom4=request.getParameter("symptom4");
		String status= "unresolved";
		
		

		try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
			Statement statement = connection.createStatement();
			String command = "INSERT into patientDatabase(email,field,symptom1,symptom2,symptom3,symptom4,status)values('"+s+"','"+disease+"','"+symptom1+"','"+symptom2+"','"+symptom3+"','"+symptom4+"','"+status+"')";
            statement.executeUpdate(command);
			out.println("Data is successfully inserted!");
			response.sendRedirect("patientDashboard.html");
		}
		catch(Exception ex)
		{
		System.out.print(ex);
		out.println("ex");
		ex.printStackTrace();
		}
		%>
		<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("patientLogin.jsp");
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