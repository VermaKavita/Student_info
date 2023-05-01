<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
<div>
<%@include file="database.jsp" %>
<%@include file="navbar.jsp" %>
<%
String user=(String)session.getAttribute("user");
String pwd=(String)session.getAttribute("pwd");
try{
String qr="select * from student_pro where S_Name='"+user+"' and Pwd='"+pwd+"'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next()){
	%>
	<div class="container  h-100">
<div class="row">
									<div class="mb-3">
										<label for="address" class="form-label">Student Name </label> <input
											type="text" name="name" value=<%=rs.getString("S_Name")%>
											class="form-control" aria-describedby="nameHelp" readOnly>
									</div>
									<div class="mb-3">
									<label for="name" class="form-label">Father Name </label> <input
										type="text" name="father" value=<%=rs.getString("F_Name")%> class="form-control"
										aria-describedby="nameHelp" readOnly>
								</div>
								<div class="mb-3">
									<label for="name" class="form-label">Mother Name </label> <input
										type="text" name="mother" value=<%=rs.getString("M_Name") %> class="form-control"
										aria-describedby="nameHelp" readOnly>
								</div>
								<div class="mb-3">
									<label for="name" class="form-label">Email </label> <input
										type="text" name="email" value=<%=rs.getString("Email") %> class="form-control"
										aria-describedby="nameHelp" readOnly>
								</div>
								<div class="mb-3">
									<label for="name" class="form-label">Password</label> <input
										type="text" name="pwd" value=<%=rs.getString("Pwd") %> class="form-control"
										aria-describedby="nameHelp" readOnly>
								</div>
								<div class="mb-3">
									<label for="name" class="form-label">Gender</label> <input
										type="text" name="gender" value=<%=rs.getString("Gender") %> class="form-control"
										aria-describedby="nameHelp" readOnly>
								</div>
								<div class="mb-3">
									<label for="address" class="form-label">Contact </label> <input
										type="number" name="contact" value=<%=rs.getLong("contact") %> class="form-control"
										aria-describedby="nameHelp" readOnly>
								</div>

								</div>
								</div>
	
	<%
}
else{
	out.println("no records found");
}
}catch(Exception e){
	
	out.println(e);
}
%>

</div>
</body>
</html>