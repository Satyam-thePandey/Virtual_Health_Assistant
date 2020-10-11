

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


@MultipartConfig(maxFileSize = 169999999)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		
		try {
			String email = request.getParameter("email");
			String test = request.getParameter("test");
			String date1 = request.getParameter("date1");
			
			String status = "resolved";
			Part filePart = request.getPart("report");
			//System.out.println("Hello"+" "+name+" "+filePart);
			InputStream inputStream = null;
			
			if(filePart != null) {
				long fileSize = filePart.getSize();
				String fileContent = filePart.getContentType();
				inputStream = filePart.getInputStream();
				
			}
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connObj = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
            PreparedStatement prepStmt = connObj.prepareStatement("UPDATE labtest SET STATUS=?, REPORT =? WHERE Email=? AND Test=? AND date1=?");
            prepStmt.setString(1, status);
           
           /* prepStmt.setString(3, status);
            prepStmt.setString(4, date1);*/
            prepStmt.setBlob(2, inputStream);
            prepStmt.setString(3, email);
            prepStmt.setString(4, test);
            prepStmt.setString(5, date1);
            
            int returCode = prepStmt.executeUpdate();
            if(returCode == 0) {
            	request.setAttribute("Message", "Error Inserting File");
            	getServletContext().getRequestDispatcher("/failure.jsp").forward(request,response);
            	
            }else {
            	request.setAttribute("Message", "Your record inserted sucessfully");
            	getServletContext().getRequestDispatcher("/technician.jsp").forward(request,response);
            	
            }
            
			
			
			
			
		}catch(Exception exe) {
			System.out.print(exe);
			
			
			
		}
		
		
		
	}

}
