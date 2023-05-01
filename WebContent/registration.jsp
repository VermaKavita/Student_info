<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head> 
<body>


<%@include file="database.jsp" %>
<jsp:useBean id="sb" class="Student_Bean.StudentBean"></jsp:useBean>
<jsp:setProperty property="*" name="sb"/>
<jsp:useBean id="sdao" class="Student_Dao.StudentDao"></jsp:useBean>
<%
if((sb.getEmail().equals(""))|| (sb.getMother().equals("")) ||(sb.getName().equals(""))|| (sb.getPwd().equals(""))){
	response.sendRedirect("register_st.jsp");
}
try{
int i=sdao.addStudent(sb);
if(i>0){
	request.getRequestDispatcher("adminhome.jsp").include(request,response);
	out.println("Registered");
}else{
	request.getRequestDispatcher("adminhome.jsp").include(request,response);
	out.println("not registered");
}
}catch(Exception e){
	out.println(e);
}
%>

</body>
</html>