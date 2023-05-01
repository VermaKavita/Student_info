<%@page import="Student_Bean.StudentBean"%>
<%@page import="Student_Dao.StudentDao"%>
<%@include file="database.jsp" %>
<%
String email=request.getParameter("email");
String name=request.getParameter("name");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String conn=request.getParameter("contact");
long contact=Long.parseLong(conn);
String gender=request.getParameter("gender");
StudentBean sb = new StudentBean();
sb.setName(name);
sb.setFather(father);
sb.setMother(mother);
sb.setEmail(email);
sb.setGender(gender);
sb.setContact(contact);

StudentDao sd = new StudentDao();
try {
	int i=sd.update(sb);
	if(i>0){
	request.getRequestDispatcher("adminhome.jsp").include(request, response);
	out.println("<center><h1>Updated Successfully</h1></center>");
	}
	else{
		request.getRequestDispatcher("adminhome.jsp").include(request, response);
		out.println("<center><h1>Not Updated</h1></center>");
	}
} catch (Exception e) {
	request.getRequestDispatcher("adminhome.jsp").include(request, response);
	out.println(e);
} 


%>