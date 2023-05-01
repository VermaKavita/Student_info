<%@page import="Student_Bean.StudentBean"%>
<%@page import="Student_Dao.StudentDao"%>
<%@include file="database.jsp"%>
<%
String email=request.getParameter("email");
StudentBean sb=new StudentBean();
sb.setEmail(email);
StudentDao sd=new StudentDao();
try{
	
	int i=sd.delete(sb);
	if(i>0){
		response.sendRedirect("viewstudent.jsp");
	}
	else{
		request.getRequestDispatcher("viewstudent.jsp").include(request,response);
		out.println("<h3>can't delete</h3>");
	}
}catch(Exception e){
	request.getRequestDispatcher("viewstudent.jsp").include(request,response);
	out.println(e);
}
%>