<%-- 
    Document   : Appointment
    Created on : Jan 24, 2018, 1:52:42 PM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        function select_DW()
        {
            
            var dat=document.getElementById("Sdisease").value;
            
            var d = new Date(dat);
var n = d.getDay();
var days = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
  document.getElementById("day").value=days[n+1];
        }
        function Validate()
        {
            var alphaExp = /^[a-zA-Z ]+$/;
	var numExp = /^[0-9-]+$/;
         var emp = document.forms["topForm"]["firstname"];
	var len = document.forms["topForm"]["contact"];
        var emp1 = document.forms["topForm"]["usr_day"];
        var val=document.getElementById("day");
        
         var str=document.getElementById("my_val").value;
                var ary=str.split(",");
                 
            for(a in ary)
                   {
                       if(ary[a].toString()===val.value)
                    {
                        alert("Wrong appointment selected");
                        emp1.style.backgroundColor = "red";
		emp1.focus();
                        return false;
                    }
                }    
                
	 if (emp1.value== "") {
	
        alert("Day must be filled out");
		emp1.style.backgroundColor = "red";
		emp1.focus();
        return false;
    }
        if (emp.value== "") {
	
        alert("Name must be filled out");
		emp.style.backgroundColor = "red";
		emp.focus();
        return false;
    }
	if(!(emp.value.match(alphaExp)))  //to check only for alphabets match
	{
	alert("Name should only have alphabets");
		emp.style.backgroundColor = "red";
		emp.focus();
        return false;
	}
        
        if (!(num1.value.match(numExp))) {   //to check for number match
	
        alert("Wrong contact format");
		num1.style.backgroundColor = "red";
		num1.focus();
        return false;
    }
                   
    }
           
       
        </script>
<style>
#body_div{
    background: url(images/41.jpg) no-repeat;
	background-size: cover;
    min-height: 100vh;
    color: white;
	background-position:center;
	padding-top: 30px;	
}

#form_div {
	width: 720px;
    margin: auto;
    padding: 30px 30px 20px;
    box-sizing: border-box;
    background-color: rgba(0, 0, 0, 0.31);
	text-align:center;
}
input[type=text]{
    width: 45%;
    padding: 12px 20px;
	padding-left:80px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
    background-position: 10px 10px; 
	background-color: rgba(255, 255, 255, 0.63);
}
input[type=text]:focus {
    border: 3px solid #555;
}
input:focus {
    background-color: 		#808080;
}
#Sdisease:focus {
    background-color: 		#808080;
	    border: 3px solid #555;
}
#Sdisease{
width: 45%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
    background-position: 10px 10px; 
	background-color: rgba(255, 255, 255, 0.63);
}

#Confirm_Appoint
{
 width: 35%;
    padding: 10px;
    background: #2196F3;
    color: white;
    font-size: 17px;
    border: none;
    cursor: pointer;
	float:left;
}
#Confirm_Appoint:hover {
    background: 	#008B8B;
}
.heading {
    text-align: center;
	    margin-bottom: 20px;
		letter-spacing: 1px;
}
</style>
</head>
<body>
<div id="body_div">
<div id="form_div"> 
<form name="topForm" action="Add_Appoint.jsp" >
 <fieldset>
 <div class="heading">
				<h2>Please Fill Appointment Details</h2>
				
</div>
     <%

int id=Integer.parseInt(request.getParameter("D_id"));
pkg3.TimingsDAO tim=new pkg3.TimingsDAO();
       String rslt=tim.getDays(id);
pkg3.DoctorDAO dObj=new pkg3.DoctorDAO();
pkg3.Doctor gDoc=new pkg3.Doctor();
gDoc=dObj.getDoctor(id);
session.setAttribute("D_id",id) ;
String spec=gDoc.getD_spec();
String loc=gDoc.getD_location();

     %>
<br>
  <input type="text" name="firstname" placeholder="Patient Name" required ><br>
  <input type="text" name="contact" placeholder="Contact Number" required><br>
  illness Related Body Part<br>
  <input type="text" name="disease" placeholder="Contact Number" value="<%=spec%>" ><br>
  <br>

  Arrival Date<br>
  <input id="Sdisease" type="date" name="dateToday" placeholder="Date" onblur="select_DW()" ><br>
    
   Arrival Day<br>
  <input  id= "day" type="text" name="usr_day" placeholder="Contact Number"><br>
   Visiting Location<br>
  <input type="text" name="location" placeholder="Doctor's Location" value="<%=loc%>" readonly><br><br><br><br>
   <input type="hidden" name="my_val" id="my_val" value="<%= rslt%>"/>
  <button type="submit" id="Confirm_Appoint" onclick="return Validate()">Make an Appointment</i></button>
   </fieldset>
  
</form></div></div>
</body>
</html>
