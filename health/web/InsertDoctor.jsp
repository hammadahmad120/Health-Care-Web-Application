<%-- 
    Document   : InsertDoctor
    Created on : Feb 4, 2018, 12:47:28 AM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.* ,java.sql.* , javax.servlet.* " %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        <%
            
           String dusr=request.getParameter("doctor_id");
            String dpass=request.getParameter("doctor_password");
            String dname=request.getParameter("firstname");
            String cont=request.getParameter("contact");
            String spec=request.getParameter("relatedTo");
            String city1=request.getParameter("city");
            String loc1=request.getParameter("location");
            int charge=Integer.parseInt(request.getParameter("charge"));
            
            
             String sun=request.getParameter("sun");
       String mon=request.getParameter("mon");
         String tue=request.getParameter("tue");
           String wed=request.getParameter("wed");
             String thurs=request.getParameter("thurs");
               String fri=request.getParameter("fri");
        String sat=request.getParameter("sat");
        
        pkg3.LoginDAO dl=new pkg3.LoginDAO();
        
   if(dl.Check_Username(dusr))
 {

 	%>	
 	<script>
 	alert("Username Already exist");
 	</script>
 <%	
response.sendRedirect("Doctor.jsp");
  }
 else
 {
      pkg3.Doctor doc=new pkg3.Doctor();
doc.setD_name(dname);
doc.setD_spec(spec);
doc.setD_city(city1);
doc.setD_location(loc1);
doc.setD_username(dusr);
doc.setD_contact(cont);
doc.setD_charges(charge);
pkg3.DoctorDAO DAOdoc=new pkg3.DoctorDAO();
DAOdoc.Insert_Doctor(doc);
int d_id=DAOdoc.Get_id();
pkg3.LoginDAO DAOlog=new pkg3.LoginDAO();
DAOlog.Insert_Login(dusr, dpass);

pkg3.TimingsDAO DAOtim=new pkg3.TimingsDAO();

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
out.println("<h1 align=center>Your Login Created and Timings Saved.<h1>") ;
     
  }
        
   
            %>
    <br><a size="5" href='mainPage.html' >Home Page</a>
    </body>
</html>
