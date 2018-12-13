<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, java.lang.* ,java.sql.* , javax.servlet.* " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
String usr;
String pass;
usr=request.getParameter("doctor_id");
pass=request.getParameter("patient_password");

pkg3.LoginDAO dl=new pkg3.LoginDAO();
pkg3.DoctorDAO obj=new pkg3.DoctorDAO();
int id=obj.Get_Session_id(usr);

%>
<%=usr%>
<%=pass%>
<%
try
{
 if(dl.Check_Login(usr,pass))
 {

 	session.setAttribute("user",usr);
 	session.setAttribute("password",pass);
        session.setAttribute("Did", id);
 	response.sendRedirect("D_functions.html");
 	
 	%>
 <% }
 else
 {
 	%>	
 	<script>
 	alert("Invalid username or password");
 	</script>
 <%	
 }
}
catch(Exception e)
{
	e.printStackTrace();
	%>
	
	
	<%= 7+4 %>
<%	
}

%>
</body>
</html>