<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import =  "java.util.ArrayList"%>
    <%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
    <%
    ArrayList < String > arrayList = new ArrayList < String > ();
	
	Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
	try{
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
        
		statement = connection.createStatement();
		String sql ="SELECT email FROM dosage";
		resultSet = statement.executeQuery(sql); 
		
	
	while (resultSet.next()) {
		arrayList.add(resultSet.getString("email"));
	}
    
    %>
    
<!DOCTYPE html>
<html>
    
    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GETTING STARTED WITH BRACKETS</title>
        <meta name="description" content="An interactive getting started guide for Brackets.">
        <link rel="stylesheet" href="main.css">
        <script src="https://smtpjs.com/v3/smtp.js">
</script>
        <script>
        var jsArray = [];
        <%for(int i=0;i<arrayList.size();i++){%>
            jsArray.push("<%= arrayList.get(i)%>");
        <%}%>
      
       			
            setInterval(sendEmail,1000)
            function sendEmail(){
               // var user
               
                var i;
           
               
            	  
            	  
             
               
               for(i=0;i<jsArray.length;i++){
                
                Email.send({
    Host : "smtp.gmail.com",
    Username : "satyampandeyth15@gmail.com",
    Password : "Satyam@123",
    To : jsArray[i],
    From : "satyampandeyth15@gmail.com",
    Subject : "Medicine Reminder",
    Body : "It's Medicine time...Please take your medicine."
                
                })
               }
            }
        
        </script>
        <%
		
            connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
   <style>body{
				margin: 0;
				padding: 0;
				font-family: arial;
			}

			.container{
				position: absolute;
				left: 0;
				top: 0;
				width: 100%;
				height: 100vh;
				animation: animate 16s ease-in-out infinite;
				background-size: cover;
			}

			.outer{
				position: absolute;
				left: 0;
				top: 0;
				width: 100%;
				height: 100vh;
				background: rgba(0,0,0,0.5)
			}

			.details{
				position: absolute;
				left: 47%;
				top: 10%;
				transform: translate(-50%, -50%);
				text-align: center;
			}

			.details h1{
				font-size: 4em;
				color: #fff;
			}

			.details h2{
				text-transform: capitalize;
				color: #fff;
			}

			.details h2 span:nth-child(1){
				color: red;
			}

			.details h2 span:nth-child(2){
				color: yellow;
			}

			.details1 {
			margin-left: 50px;
			margin-top: 150px;
			
			}
			.details2 {
			margin-left: 500px;
			margin-top: -150px;
			
			}
			.details3 {
			margin-left: 950px;
			margin-top: -150px;
			
			}
			.details4 {
			margin-left: 500px;
			margin-top: 50px;
			
			}
			@keyframes animate{
				0%,100%{
					background-image: url(images/1.jpg);
				}
				25%{
					background-image: url(images/2.jpg);
				}
				50%{
					background-image: url(images/3.jpg);
				}
				75%{
					background-image: url(images/4.jpg);
				}
			}
			</style>
	</head>
	<body>
		<div class="container">
			<div class="outer">
				<div class="details">
				<h1><center>Login As</center></h1></div>


<div class="details1">
 <a href="patientLogin.jsp">
         <img alt="Patient" src="images/patient.jpg"
         width="200" height="150">
      </a>
		
 
</div>

   <div class="details2">

 <a href="doctorLogin.jsp">
 <img alt="Doctor" src="images/doctor.jpg"
         width="200" height="150">
      </a>
       </div>

 <div class="details3">
 <a href="adminLogin.jsp">
 <img alt="Admin" src="images/admin.png"
         width="200" height="150">
      </a>
        </div>
        
 <div class="details4">
 <a href="techLogin.jsp">
 <img alt="Admin" src="images/medlab.png"
         width="200" height="150">
      </a>
        </div>
 <!--        
 <div class="details5">
 <a href="mailer.jsp">
 <img alt="Admin" src="images/medlab.png"
         width="200" height="150">
      </a>
        </div> -->

		</div>
	</body>