<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>
<%@page import="Student_Bean.StudentBean"%>
<%@page import="java.util.List"%>
<jsp:useBean id="rd" class="Student_Dao.StudentDao"></jsp:useBean>
<style>
a{
text-decoration:none;
color:white;
}
</style>
<div>
<table class='table table-primary table-responsive table-striped table-hover text-center'>
<%
request.getRequestDispatcher("adminhome.jsp").include(request,response);
	String pn=request.getParameter("pno");
	int pno=Integer.parseInt(pn);
	int total=5;
	if(pno==1)
	{
		pno=pno-1;
	}
	else
	{
		pno=pno-1;
		pno=total*pno;
	}
	List<StudentBean> list=rd.showByPage(pno, total);
	
	out.println("<tr><th>Student Name</th><th>Father Name</th><th>Mother Name</th><th>Email</th><th>Gender</th><th>Contact</th><th>Photo</th></tr>");
for (StudentBean i : list) {
			%>	
			<tr>
			<td><%=i.getName() %></td>
			<td><%=i.getFather() %></td>
			<td><%=i.getMother() %></td>
			<td><%=i.getEmail() %></td>
			<td><%=i.getGender() %></td>
			<td><%=i.getContact() %></td>
			</tr>
			<%
	}
	%>
	</table></div>
	<center><img src="GO!1.jpg" height="50px"/>
	<%
	int s=rd.show().size();
	int c=1;
	for(int i=1;i<=s;i=i+5){
		%>
		<a href="View.jsp?pno=<%=c %>"><%=c %></a>
		<%
		c++;
	}
	%>
	<img src="GO!1.jpg" height="50px"/></center>