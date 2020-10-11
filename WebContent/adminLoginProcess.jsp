<%@ page import=" java.sql.*"%>
<%@ page errorPage="ExceptionPage.jsp"%>
<%
		String e=request.getParameter("email");
		String p=request.getParameter("password");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vmedico","vmedico");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from vmedico3 where email='"+e+"'and password='"+p+"'");
		if(rs.next()){
				session=request.getSession();
				session.setAttribute("e",e);
				session.setAttribute("result",rs);
				response.sendRedirect("adminHome.html");
		}
		else{
			session.setAttribute("msg","Wrong Entries!!!");
			response.sendRedirect("adminLogin.jsp");
		}

%>