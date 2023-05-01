<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script language="javascript">
function validate(form){
	if(document.f.contact.value>9999999999){
		alert('please enter valid number');
		return false;
	}
	if(document.f.father.value=="")
		{ 
		alert('enter father name');
		return false;
	} 
	if(document.f.mother.value==""){
		alert('enter mother name');
		return false;
	}
	if((document.f.email.value=="") || (document.f.pwd.value=="")){
		alert('fill email details');
		return false;
	}
	if((document.f.contact.value=="") || (document.f.contact.value<1000000000)){
		alert('fill valid no');
		return false;
	}
	if(document.f.gender.value==""){
		alert('enter gender');
		return false;
	}
	return true;
}
</script>
<style>
div{
background-image:url(GO!.jpg);
color:white;
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body>

<%request.getRequestDispatcher("adminhome.jsp").include(request,response); %>
	<div class="container  h-100">
		<div class="row">
			<form action="uploadServlet" name=f	method="post" onSubmit="return validate(this)" enctype = "multipart/form-data">
				<div class="mb-3">
					<label for="address" class="form-label">Student Name </label> <input
						type="text" name="name" class="form-control"
						aria-describedby="nameHelp" >
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">Father Name </label> <input
						type="text" name="father" class="form-control"
						aria-describedby="nameHelp" >
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">Mother Name </label> <input
						type="text" name="mother" class="form-control"
						aria-describedby="nameHelp" >
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">Email </label> <input
						type="text" name="email" class="form-control"
						aria-describedby="nameHelp" >
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">Password</label> <input
						type="text" name="pwd" class="form-control"
						aria-describedby="nameHelp" >
				</div>
				<div class="mb-3">
					<label for="address" class="form-label">image </label> <input
						type="file" name="photo" class="form-control"
						aria-describedby="nameHelp" ><input type="submit" value="Check"/>				
				</div>
				<div class="mb-3">
					<label for="gender" class="form-label">Gender</label> <select
						name="gender" aria-describedby="nameHelp" class="form-control">
						<option ></option>
						<option name="gender" value="M">Male</option>
						<option name="gender" value="F" >Female</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="address" class="form-label">Contact </label> <input
						type="number" name="contact" class="form-control"
						aria-describedby="nameHelp" >
				</div>
				<div class="mb-3">
					<input type="submit" name="submit" class="btn btn-info btn-md"
						value="Register">
				</div>
			</form>
		</div>
	</div>
</body>
</html>