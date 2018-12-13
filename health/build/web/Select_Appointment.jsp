
<%@page import=" java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Select Appointment</title>
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
	background-image: url('images/searchicon.png');
    background-position: 10px 10px; 
}
input[type=text]:focus {
    border: 3px solid #555;
}
input:focus {
    background-color: #4169E1;
}
.images{
 background: url(s5.jpg) no-repeat;
	background-size: cover;
    min-height: 100vh;
    color: white;
	background-position:center;
	padding-top: 30px;
}
#bio_data{
color:	#808080;

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
    float: left;
    width: 33%;
    padding: 10px;
    height: auto;
    margin:2px;
	background-color:		#B0C4DE;
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
<button class="dropbtn" onclick="window.location.href='Doctor.jsp'">Sign in/ Join</button>
<ul>
  <li><a onclick="window.location.href='view_expertise.jsp'" >Expertise</a></li>
  <li><a href="ContactUs.html">Contact</a></li>
  <li><a href="AboutUs.html">About</a></li>
</ul>
<h1 id="feeling"> Here The Best Doctors For You.<h1>
</div>

<div class="images">
<div class="row">

<%
String dis;
String loc;
dis=request.getParameter("disease");
loc=request.getParameter("location");
pkg3.DoctorDAO dObj=new pkg3.DoctorDAO();
 ArrayList lst=dObj.getList(dis,loc);
 if(lst.size()==0)
 {
     out.println("<h1 align=center>No Results Found.<h1><br><br><br><br><br><br>") ;
 }
     
 pkg3.Doctor doc=new pkg3.Doctor();
%>

<%for(int i=0;i<lst.size();i++)
{

	doc=(pkg3.Doctor)lst.get(i);
%>
<hr>
  <div class="column">
      <form action="Appointment.jsp">
 
   <h2 id="bio_data" name="D_name" style="color:#483D8B;"><%=doc.getD_name() %></h2>
   <input type="number" name="D_id" value="<%=doc.getD_id()%>" readonly ><br>
    <h3 id="bio_data" name="D_spec"><i class="fa fa-briefcase" style="font-size:20px;"></i> <%=doc.getD_spec() %></h3>
	<h3 id="bio_data" name="D_city"><i class="fa fa-map-marker" style="font-size:20px;"></i> <%=doc.getD_city() %> </h3>
	<h3 id="bio_data" name="D_location"><i  class="fa fa-address-card" style="font-size:20px;"></i> <%=doc.getD_location() %> </h3>
	<h3 id="bio_data" name="D_contact"><i  class="fa fa-phone" style="font-size:20px;"></i> <%=doc.getD_contact() %> </h3>
        <h3 id="bio_data" name="D_charges"><i  class="" style="font-size:30px;"></i> Appointment charges: Rs. <%=doc.getD_charges() %> </h3>
	<button class="dropbtn">Get Appointment</button>
      </form>
        <%
pkg3.TimingsDAO tObj=new pkg3.TimingsDAO();
ArrayList lst1=tObj.getList(doc.getD_id());
//session.setAttribute("lst",lst1);
pkg3.Timings tim=new pkg3.Timings();

%>	
  </div>
  <div class="column">
    <table id ="t01" style="width:50%">
<caption style="color:#483D8B;font-size:20px;"><b>Availability Time<b></caption>
  <thead>
  <tr>
    <th>Day</th>
    <th>Timing</th> 
  </tr>
  </thead>
  <tbody>
  <%for(int j=0;j<lst1.size();j++)
{

	tim=(pkg3.Timings)lst1.get(j);
%>
  
  <tr>
    <td><%=tim.getDay() %></td>
    <td><%=tim.getTime() %></td> 
  </tr>
  <%} %>
   
   </tbody>
</table>
  <br><br><br><br><br><br><br>
   
  </div>
  
  </div>
 
  <% }%>
  
  
</body>
</head>

</html>