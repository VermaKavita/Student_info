 <%@include file="database.jsp" %>
                    <%
                    String username=request.getParameter("username");
                    String password=request.getParameter("password");    
                    if((username.equals("admin")) && (password.equals("12345"))){
        	response.sendRedirect("adminhome.jsp");
        }
                    try{
                    String qr="select * from student_login where S_Name='"+username+"' and Pwd='"+password+"'";
                    Statement st=con.createStatement();
                   	ResultSet rs= st.executeQuery(qr);
                   	if(rs.next()){
                   		session.setAttribute("user",rs.getString("S_name"));
                   		session.setAttribute("pwd",rs.getString("pwd"));
                   		response.sendRedirect("studentHomePage.jsp");
                   	}
                   	else{
                   		response.sendRedirect("index.jsp");
                   	}}catch(Exception e){
                   		request.getRequestDispatcher("index.jsp").include(request,response);
                   		out.println("something went wrong");
                   	}
                    
                    %>