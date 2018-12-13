<%-- 
    Document   : expertise
    Created on : Feb 4, 2018, 3:59:06 AM
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
        int d_id=(int)session.getAttribute("Did") ;
        String rel=request.getParameter("relatedTo");
        String com=request.getParameter("message");
       pkg3.ExpertiseDAO DAOexp=new pkg3.ExpertiseDAO();
       DAOexp.Insert_Expertise(d_id, rel, com);
       out.println("<h1 align=center>Your Expert Advice Saved.<h1>") ;
       %>
        <br><a size="5" href='D_functions.html' >Main Page</a> 
    </body>
</html>
