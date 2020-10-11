import java.sql.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
public class adminLoginProcess extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response)throws IOException{
		PrintWriter out=null;
		try{
		response.setContentType("text/html");
		out=response.getWriter();
		
		String e=request.getParameter("email");
		String p=request.getParameter("password");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vmedico","vmedico");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from vmedico3 where email='"+e+"'and password='"+p+"'");
		if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("e",e);
				session.setAttribute("result",rs);
				response.sendRedirect("adminHome.html");
		}
		else{
			HttpSession session=request.getSession();
			session.setAttribute("msg","Wrong Entries!!!");
			response.sendRedirect("adminLogin.jsp");
		}
		}
		catch(java.sql.SQLIntegrityConstraintViolationException ex){
			response.sendRedirect("patientError.html");
		}
		catch(Exception ex){
			out.println(ex);
			out.close();
		}
	
}
}
