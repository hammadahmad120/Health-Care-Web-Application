<%-- 
    Document   : Add_Appoint
    Created on : Feb 3, 2018, 8:29:12 AM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            int id=(int)session.getAttribute("D_id");
            String Odate=request.getParameter("dateToday");
            String pname=request.getParameter("firstname");
            String cont=request.getParameter("contact");
            String dis=request.getParameter("disease");
            String day=request.getParameter("usr_day");
            String loc1=request.getParameter("location");
            pkg3.PatientAppointment obj=new pkg3.PatientAppointment();
            obj.setP_name(pname);
            obj.setP_contact(cont);
           obj.setP_disease(dis);
           obj.setP_apt_date(Odate);
           obj.setP_apt_day(day);
           obj.setD_id(id);
           obj.setL_name(loc1);
           pkg3.PatientAppointmentDAO Dobj=new pkg3.PatientAppointmentDAO();
            Dobj.Insert_PatientAppointment(obj);
            
            
            //String token[]=Odate.split("/");
            //String result=token[2]+"-"+token[1]+"-"+token[0];
            out.println("<h1 align=center>Your Appointment Is Saved.</h1>") ;
            
            
        %>
        <br><a size="5" href='mainPage.html' >Home Page</a>
    </body>
</html>
