
<%
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String father=request.getParameter("father");
		String mother=request.getParameter("mother");
		String conn=request.getParameter("contact");
		String gender=request.getParameter("gender");
		request.getRequestDispatcher("UPDATE.jsp").include(request, response);
		out.println("<center><button class='btn btn-info'>Accountant Details</button></center>");
		out.println("<form action='UPDATE.jsp'><table class='table table-primary table-striped table-hover'>");
		out.println("<tr><th>Student Name</th><th>Father Name</th><th>Mother Name</th><th>Email</th><td>Gender</td><td>Contact</td><td colspan=2>Action</td></tr>");
			out.println("<tr>");
			out.println("<td>");
			out.println("<input type='text'name='name' value='"+name+"'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text'name='father' value='"+father+"'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text'name='mother'  value='"+mother+"'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' readOnly name='email' value='"+email+"'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text'name='gender' value='"+gender+"'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text'name='contact' value='"+conn+"'>");	
			out.println("</td>");
			out.println("<td>");
			out.println("<button>Update</button>");		
			out.println("</td>");
			out.println("</tr>");
			out.println("</table></form>");
%>