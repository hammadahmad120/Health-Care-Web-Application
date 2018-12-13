<%-- 
    Document   : Update_timings
    Created on : Feb 4, 2018, 3:33:48 AM
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
       pkg3.TimingsDAO DAOtim=new pkg3.TimingsDAO();
       DAOtim.Delete_Timings(d_id);
        String sun=request.getParameter("sun");
       String mon=request.getParameter("mon");
         String tue=request.getParameter("tue");
           String wed=request.getParameter("wed");
             String thurs=request.getParameter("thurs");
               String fri=request.getParameter("fri");
        String sat=request.getParameter("sat");

if(sun.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Sunday");
     else
     DAOtim.Insert_Timings(d_id, sun, "Sunday");

if(mon.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Monday");
     else
     DAOtim.Insert_Timings(d_id, mon, "Monday");
if(tue.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Tuesday");
     else
     DAOtim.Insert_Timings(d_id, tue, "Tuesday");
if(wed.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Wednesday");
     else
     DAOtim.Insert_Timings(d_id, wed, "Wednesday");

if(thurs.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Thursday");
     else
     DAOtim.Insert_Timings(d_id, thurs, "Thursday");
if(fri.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Friday");
     else
     DAOtim.Insert_Timings(d_id, fri, "Friday");
if(sat.equals(""))
    DAOtim.Insert_Timings(d_id, "0", "Saturday");
     else
     DAOtim.Insert_Timings(d_id, sat, "Saturday");
 out.println("<h1 align=center> Timings Updated Successfully.<h1>") ;
                %>
     <br><a size="5" href='D_functions.html' >Main Page</a>  
    </body>
</html>
