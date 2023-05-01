<%@page import="Student_Bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="Student_Dao.StudentDao"%>
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
</head>
<body>
<%@include file="database.jsp" %>
<%
try{
	StudentDao sd=new StudentDao();
	List<StudentBean> list = sd.show();
	RequestDispatcher r = request.getRequestDispatcher("adminhome.jsp");
	r.include(request, response);
	if(list.isEmpty())
	{
		out.println("no product found");
	}else{
		%><div><%
	out.println("<center><button class='btn btn-secondary'>Student Details</button></center>");
	out.println("<table class='table table-primary table-responsive table-striped table-hover text-center'>");
	out.println(
			"<tr><th>Student Name</th><th>Father Name</th><th>Mother Name</th><th>Email</th><th>Gender</th><th>Contact</th><th colspan=2>Action</th></tr>");

	for (StudentBean i : list) {
				
			out.println("<tr>");
			out.println("<td>");
			out.println(i.getName());
			out.println("</td>");
			out.println("<td>");
			out.println(i.getFather());
			out.println("</td>");
			out.println("<td>");
			out.println(i.getMother());
			out.println("</td>");
			out.println("<td>");
			out.println(i.getEmail());
			out.println("</td>");
			out.println("<td>");
			out.println(i.getGender());
			out.println("</td>");
			out.println("<td>");
			out.println(i.getContact());
			out.println("</td>");
			out.println("<td>");
			out.println("<a href='DeleteStu.jsp?email=" + i.getEmail() + "'>Delete</a>");
			out.println("</td>");
			out.println("<td>");
			out.println("<a href='UpdateStu.jsp?email=" + i.getEmail() + "&father=" + i.getFather() + "&mother="+ i.getMother() +"&name="
					+ i.getName() + "&gender=" + i.getGender() + "&contact=" + i.getContact() +"'>Update</a>");
			out.println("</td>");
			out.println("</tr>");
		}
	}
		out.println("</table>");
		%></div><%
		con.close();

}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>