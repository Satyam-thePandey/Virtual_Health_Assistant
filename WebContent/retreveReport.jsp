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
</head>
<body>
	    
<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>

<%			
		String test=request.getParameter("test");
		
		Connection connection = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
            
			statement = connection.createStatement();
			String sql ="SELECT * FROM labtest WHERE email='"+s+"' AND test='"+test+"'";
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next() ){
				Blob blob = resultSet.getBlob("report");
				byte byteArray[] = blob.getBytes(1, (int) blob.length());
				response.setContentType("application/pdf");
				OutputStream os = response.getOutputStream();
				os.write(byteArray);
				os.flush();
				os.close();
			
		
		}
            connection.close();
		} catch (Exception e) {
			System.out.print(e);
		e.printStackTrace();
		}
		%>

<%
	}
	else{
		session.setAttribute("msg","Please Login First!!!");
		response.sendRedirect("patientLogin.jsp");
	}

%>


</body>
</html>