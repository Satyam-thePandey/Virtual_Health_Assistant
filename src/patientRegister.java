import java.sql.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
public class patientRegister extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res)throws IOException{
		PrintWriter out=null;
		try{
		res.setContentType("text/html");
		out=res.getWriter();
		String e=req.getParameter("email");
		String p=req.getParameter("password");
		String n=req.getParameter("name");
		String ph=req.getParameter("phone");
		int a=Integer.parseInt (req.getParameter("age"));
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vmedico","vmedico");
		Statement st=con.createStatement();
		int x=st.executeUpdate("insert into vmedico1  values ('"+e+"','"+n+"','"+ph+"',"+a+",'"+p+"')");
		
		if(x!=0){
			RequestDispatcher rd= req.getRequestDispatcher("patientSuccess.html");
			rd.forward(req,res);
		}
		else{
			res.sendRedirect("ExceptionPage.jsp");
		}
		}
		catch(java.sql.SQLIntegrityConstraintViolationException ex){
			res.sendRedirect("patientError.html");
		}
		catch(Exception ex){
			out.println(ex);
			out.close();
		}
	
}
}
