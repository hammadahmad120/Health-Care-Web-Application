<%-- 
    Document   : changePass
    Created on : Feb 5, 2018, 12:31:34 AM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usr=request.getParameter("patient_id");
            String Opass=request.getParameter("patient_Opassword");
            String Npass=request.getParameter("patient_Npassword");
            pkg3.LoginDAO log=new pkg3.LoginDAO();
            if(log.Check_Login(usr, Opass))
            {
            log.Update_Login(usr,Npass);
             out.println("<h1 align=center>Your Password updated Successfully.</h1>") ;
            %>
            <br><a size="5" href='D_functions.html' >Main Page</a> 
            <%
            }
            else
            {
                %>
                <script>
 	alert("Invalid username or password");
 	</script>
        <%
            }
        %>
    </body>
</html>
