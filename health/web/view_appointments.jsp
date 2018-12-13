<%-- 
    Document   : view_appointments
    Created on : Feb 3, 2018, 11:57:22 PM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>View Appointments</title>
<!--link for special icons in footer-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url(https://fonts.googleapis.com/css?family=Shrikhand);
#top_back{
width:100%;
height:330px;
background:						#6495ED;
border:0px;
padding:0px;
}
#nameStyle{
color: 	#000080;
font-family: 'Shrikhand';
font-style: italic;
font-size: 80px;
margin-top:5px;
padding-top:5px;
text-align:center;

}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:				#191970;
	height:80px;
	 text-align: center;
}

li {
    float: left;
	margin-right:40px;
	 text-align: center;
	 font-family: 'Shrikhand';
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
	height:80px;
	font-family: 'Shrikhand';
	
}

li a:hover:not(.active) {
    background-color: 	#6A5ACD;
}

.active {
    background-color: 			#6A5ACD;
}
.dropbtn{
float:right;
margin-right:30px;
margin-top:20px;
background-color: #191970;
    color: white;
    
    font-size: 16px;
	padding-top:16px;
	padding-bottom:30px;
    border: none;
    cursor: pointer;
	width:200px;
	height:40px;
	text-align:center;
	font-family: 'Shrikhand';
}
.dropbtn:hover {
    background-color: 	#6A5ACD;
}
#feeling
{
 text-align:center;
 color:#191970;
 font-size:60px;
 font-family: 'Shrikhand';
}
input[type=text]{
    width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
	background-image: url('searchicon.png');
    background-position: 10px 10px; 
}
input[type=text]:focus {
    border: 3px solid #555;
}
input:focus {
    background-color: #4169E1;
}
.images{
 background: url(images/s2.jpg) no-repeat;
	background-size: cover;
    min-height: 100vh;
    color: white;
	background-position:center;
	padding-top: 30px;
}
#bio_data{
color:	#DCDCDC;
font-size:20px;
font-family: 'Shrikhand';
padding-left:100px;

}

table, th, td {
    border-bottom: 1px solid black;
    border-collapse: collapse;
    padding: 5px;
	text-align:center;
}
th{background-color: #483D8B;color: white;}
tr:hover {background-color:#f5f5f5;}

#t01 tr:nth-child(even) {
    background-color: #eee;
}
#t01 tr:nth-child(odd) {
   background-color:#fff;
}
thead {color:green;}
tbody {color:blue;}

#footer1
{
 height:100px;
    color: #483D8B;
    background-color: 			#4169E1;
}

/* Create two equal columns that floats next to each other */
.column {
    
    width: 33%;
    padding: 10px;
    height: auto;
    margin:2px;
	 background-color: rgba(0, 0, 0, 0.31);
	text-align:center;
	margin-left:400px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
	
   
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
    .column {
        width: 100%;
    }




</style>
</head>

<body style="background-color:#F0F8FF">
<div id="top_back">
<span>
<img src="images\logoHealth.jpg" style="height:80px;width:80px; padding-top:10px;padding-left:20px;"></span>
<span id="nameStyle">Health Care</span>
<button class="dropbtn" onclick="window.location.href='logout.jsp'">LogOut</button>
<ul>
  <li><a onclick="window.location.href='view_expertise.jsp'" >Expertise</a></li>
  <li><a href="ContactUs.html">Contact</a></li>
  <li><a href="AboutUs.html">About</a></li>
</ul>
<h1 id="feeling"> Your Appointments List.<h1>
</div>

<div class="images">
    <%
        int d_id=(int)session.getAttribute("Did") ;
        pkg3.PatientAppointmentDAO obj=new pkg3.PatientAppointmentDAO();
         ArrayList lst=obj.getAppointments(d_id);
         pkg3.PatientAppointment apt=new pkg3.PatientAppointment();
         
       for(int i=0;i<lst.size();i++)
{

	apt=(pkg3.PatientAppointment)lst.get(i);
%>
    
<div class="row">
<hr>
  <div class="column">
   <h2 id="bio_data" name="D_name" style="color:#DCDCDC;">Patient Name: <%= apt.getP_name() %></h2>
   <h2 id="bio_data" name="D_name" style="color:#DCDCDC;">Illness: <%= apt.getP_disease() %></h2>
	<h3 id="bio_data" name="D_city"><i class="fa fa-map-marker" style="font-size:20px;"></i> <%= apt.getL_name() %> </h3>
	<h3 id="bio_data" name="D_contact"><i  class="fa fa-phone" style="font-size:20px;"></i> <%= apt.getP_contact() %> </h3>
	<h3 id="bio_data" name="D_location"><i  class="fa fa-sun-o" aria-hidden="true" style="font-size:20px;"></i> <%= apt.getP_apt_day() %></h3>
	<h3 id="bio_data" name="D_location"><i  class="fa fa-calendar" aria-hidden="true" style="font-size:20px;"></i> <%= apt.getP_apt_date() %> </h3>
	
	
	
  </div>
<br><br>
  </div>
  
  <hr>
  <% } %>
  
<footer>
<div id="footer1">
<img src="images\logoHealth.jpg" style="height:80px;width:80px; padding-top:10px;padding-left:20px;"></span>
<span id="nameStyle">Health Care</span>
<span style="font-size:20px; padding-top:10px;" >    Need Help? Visit our Knowledge Base</span>
<i class="fa fa-cloud"></i>
<i class="fa fa-heart"></i>
<i class="fa fa-car"></i>
<i class="fa fa-file"></i>
<i class="fa fa-bars"></i>
</div>
</footer>

</body>
</head>

</html>
