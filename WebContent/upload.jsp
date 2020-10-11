<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/IR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>	
<center>
	<h1>Upload</h1>
	<form method="post" action ="FileuploadServlet" enctype="multipart/form-data">
	<table>
	<tr>
	<td>name</td>
	<td><input type="text" name="name" /></td>
	</tr>
	
	
	<tr>
	<td>photo</td>
	<td><input type="file" name="photo" /></td>
	</tr>
	<td>
	<input type="submit" value="save" />
</td>
	</table>
	
	</form>


</center>

</body>
</html>