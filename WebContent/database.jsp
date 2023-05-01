<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement" %>
<%@page import= "java.sql.SQLException"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advance","root","kavita");
%>