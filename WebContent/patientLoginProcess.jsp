<%@ page import=" java.sql.*"%>
<%@ page errorPage="ExceptionPage.jsp"%>
<%
		String e=request.getParameter("email");
		String p=request.getParameter("password");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vmedico","vmedico");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from vmedico1 where email='"+e+"'and password='"+p+"'");
		if(rs.next()){
				session.setAttribute("e",e);
				session.setAttribute("result",rs);
				response.sendRedirect("patientProfile.jsp");
		}
		else{
			session.setAttribute("msg","Wrong Entries!!!");
			response.sendRedirect("patientLogin.jsp");
		}

%>