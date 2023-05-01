<%
session.invalidate(); %>
<%RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
		rd.include(request, response);
		%>