<%-- 
    Document   : logout
    Created on : Feb 4, 2018, 11:13:35 AM
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
            session.invalidate();
            response.sendRedirect("mainPage.html");
            %>
    </body>
</html>
