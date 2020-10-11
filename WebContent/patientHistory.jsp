<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
		%>
		<!DOCTYPE html>
		<html>
		<head>
		 <script>
	  	function openSlideMenu(){
	  		document.getElementById('menu').style.width='250px';
	  		document.getElementById('content').style.marginLeft='250px';
	  	}
	  	function closeSlideMenu(){
	  		document.getElementById('menu').style.width='0';
	  		document.getElementById('content').style.marginLeft='0';
	  	}
	  </script>
		<style>
			.content-table{
				border-collapse: collapse;
				margin: 25px 0;
				font-size: 0.9em;
				min-width:400px;
				border-radius: 5px 5px 0 0;
				overflow: hidden;
				box-shadow: 0 0 20px rgba(0,0,0,0.15);
				
			}
			.content-table thead tr{
				background-color: #009879;
				color: #ffffff;
				text-align: left;
				font-weight: bold;
			}
		.content-table th,
		.content-table td{
			padding: 12px 15px;
		}
		.content-table tbody tr{
			border-bottom: 1px solid #dddddd;
		}
		.content-table tbody tr:nth-of-type(even) {
				background-color: #f3f3f3;
				}
				.content-table tbody tr:last-of-type {
				border-bottom: 2px solid #009879;
			}
		</style>

  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
	 " rel="stylesheet">
	 <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	  <link href="style.css" rel="stylesheet" >

<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link href="dashboard.css" rel="stylesheet" >
 
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
	 " rel="stylesheet">
	 <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	  <link href="style.css" rel="stylesheet" >
<script>
            function random_function()
            {
                var a=document.getElementById("disease").value;
                if(a==="Bone and joints")
                {
                    var arr=["Joint_stiffness","Decreased_range_of_motion","Decreased_joint_function","Bumps_on_small_finger_joints","Fatigue_and_whole-body_symptoms","Unexplained_back_pain","Leg-length_discrepancy"];
                }
                else if(a==="Brain and Nerves")
                {
                    var arr=["Memory_loss","Impaired_mental_ability","Lack_of_coordination","Muscle_rigidity","Tremors_and_seizures","Muscle_wasting","Slurred_speech","Loss_of_feeling","New_language_impairment"];
                }
                else if(a==="Cancer")
                {
                    var arr=["Fatigue","Hoarseness","Difficulty_swallowing","Persistent_cough_or_trouble_breathing","Unexplained_bleeding","Unexplained_bruising","Skin_changes","Changes_in_bowel","Changes_bladder_habits","Weight changes"];
                }
                else if(a==="Child")
                {
                    var arr=["Sore_Throat","Ear_Pain","Urinary_Tract_Infection","Skin_Infection","Common_Cold","Pain","Bacterial Sinusitis","Cough"];
                }
                else if(a==="Dental")
                {
                    var arr=["chronic_bad_breath","tender_areas_in_the_mouth","ulcers_or_sores","bleeding_or_swollen_gums","chronic_bad_breath","sudden_sensitivity","pain_or_toothache","loose_teeth","receding_gums","clicking_of_the_jaw","frequent_dry_mouth"];
                }
                else if(a==="Diabetes_Management")
                {
                    var arr=["Increased_thirst","Frequent_urination","Extreme_hunger","Unexplained_weight_loss","Fatigue","Irritability","Blurred_vision","Slow-healing_sores"];
                }
                else if(a==="Digestive_Issue")
                {
                    var arr=["Bleeding","Bloating","Constipation","Diarrhea","Diarrhea","Incontinence","Nausea_and_vomiting","Pain_in_the_belly","Swallowing_problems","Weight_gain/loss"];
                }
                          
             
                var string="";
             
                for(i=0;i<arr.length;i++)
                {
                    string=string+"<option value="+arr[i]+">"+arr[i]+"</option>";
                }
                document.getElementById("symptom1").innerHTML=string;
				document.getElementById("symptom2").innerHTML=string;
				document.getElementById("symptom3").innerHTML=string;
                
               
            }
            
            
           
        </script>
    </head>
		<body>
		
	<div id="content">
		
			<span class="slide">
				<a href="#"onclick="openSlideMenu()">
				<i class="fas fa-bars"></i>
				</a>
			</span>
			<div id="menu" class="nav">
				<a href="#" class="close" onclick="closeSlideMenu()">
					<i class="fas fa-times"></i>
					</a>
				<a href="patientProfile.jsp">Home</a>
					<a href="patientDashboard.html">DASHBOARD</a>
					
					<a href="patientPrescription.jsp">My Prescriptions</a>
					<a href="patientLogout.jsp">Logout</a>
			
			</div>
			<h1>DASHBOARD</h1>
					</div>
		<div id="top">
	<form action="patientDatabase.jsp" method="get">
	<label for="disease"><b>Field:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
        <select id="disease" name="disease" onchange="random_function()">
           <option value="">-- Disease --</option> 
  	<option>Bone and joints</option> 
  	<option>Brain and Nerves</option> 
   	<option>Cancer</option>
   	<option>Child</option> 
   	<option>Dental</option>
   	<option>Diabetes_Management</option> 
   	<option>Digestive_Issue</option> 
        </select>
        
        <div>
			<label for="symptom1"><b>Symptom1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
           <select input type="text" id="symptom1" name="symptom1" onchange="random_function1()">
        </select>
		</div>
		
		 <div>
			<label for="symptom2"><b>Symptom2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
           <select input type="text" id="symptom2" name="symptom2" onchange="random_function2()">
        </select>
		</div>
		
		 <div>
			<label for="symptom3"><b>Symptom3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
           <select input type="text" id="symptom3" name="symptom3" onchange="random_function3()">
        </select>
		</div>
		<br>
		<div>
		<label for="symptom4"><b>Other(Mention Allergies if any):</b><br></label>
		<textarea id="symptom4" name="symptom4" rows="4" cols="50">
		</textarea><br>
		</div>
		
    
        </br></br>
        
	
	
		<input type="submit" value="Submit"></input>
		</form>
		</div>

	    
<%
	String s=(String)session.getAttribute("e");
	if(s!=null){
%>
   
		
		<%
		
		Connection connection = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vmedico", "vmedico");
            
			statement = connection.createStatement();
			String sql ="SELECT * FROM patientDatabase where email = '"+s+"'";
			resultSet = statement.executeQuery(sql);%>
			<div id="bottom">
			<center>	<b><h1>Patient History</h1></b>
		<table class="content-table">
		<tr>
		<th style="width:130px">Email</th>
		<th style="width:130px">Disease</th>
		<th style="width:130px">Symptom1</th>
		<th style="width:130px">Symptom2</th>
		<th style="width:130px">Symptom3</th>
		<th style="width:130px">Other(Mention Allergies if any):</th>
		<th style="width:130px">status</th>
		
		</tr>
		<% 	
		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString("email") %></td>
		<td><%=resultSet.getString("field") %></td>
		<td><%=resultSet.getString("symptom1") %></td>
		<td><%=resultSet.getString("symptom2") %></td>
		<td><%=resultSet.getString("symptom3") %></td>
		<td><%=resultSet.getString("symptom4") %></td>
		<td><%=resultSet.getString("status") %></td>
		</tr>
		
		
		<%
		}
		connection.close();
		} catch (Exception e) {
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
		</table>
		</center>
		</div>
		</body>
		</html>	